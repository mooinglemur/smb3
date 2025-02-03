.ifdef X16

.macpack longbranch

.include "../inc/x16.inc"

.export sta_PAPU_CTL1       ; $4000
.export stx_PAPU_CTL1
.export sta_PAPU_RAMP1      ; $4001
.export sty_PAPU_RAMP1
.export sta_PAPU_FT1        ; $4002
.export sta_PAPU_FT1_x
.export sta_PAPU_CT1        ; $4003
.export sta_PAPU_CT1_x
.export sta_PAPU_CTL2       ; $4004
.export stx_PAPU_CTL2
.export sta_PAPU_RAMP2      ; $4005
.export stx_PAPU_RAMP2
.export sty_PAPU_RAMP2
.export sta_PAPU_FT2        ; $4006
.export sta_PAPU_CT2        ; $4007
.export stx_PAPU_CT2
.export sta_PAPU_TCR1       ; $4008
.export sta_PAPU_TFREQ1     ; $400A
.export sta_PAPU_TFREQ2     ; $400B
.export sta_PAPU_NCTL1      ; $400C
.export sta_PAPU_NFREQ1     ; $400E
.export stx_PAPU_NFREQ1
.export sta_PAPU_NFREQ2     ; $400F
.export sta_PAPU_EN         ; $4015
.export stx_PAPU_EN
.export sta_FRAMECTR_CTL    ; $4017

.export sta_PAPU_MODADDR
.export sta_PAPU_MODCTL
.export sta_PAPU_MODLEN

.export APU_reset
.export APU_tick

.export dmcbank
.export dmcptr_l
.export dmcptr_h

.segment "NESPORT"

; APU state struct, one for each channel
.struct SQState
	Duty                    .byte
	Volume                  .byte
	Envelope                .byte
	Decay                   .byte
	EnvStart                .byte
	EnvCounter              .byte
	SweepEnabled            .byte
	SweepPeriod             .byte
	SweepCounter            .byte
	SweepNegate             .byte
	SweepShift              .byte
	SweepMute               .byte
	SweepReload             .byte
	Period                  .word
	LengthCounter           .byte
	LengthMute              .byte
	ConstantVolume          .byte
	.union
		LengthCounterHalt   .byte
		EnvLoop             .byte
	.endunion
	Enabled                 .byte
	PhaseReset              .byte
.endstruct

.struct TriState
	Period              .word
	LengthCounter       .byte
	LengthMute          .byte
	LinearCounter       .byte
	LinearCounterSetup  .byte
	LinearCounterReload .byte
	LinearMute          .byte
	.union
		LengthCounterHalt   .byte
		ControlFlag         .byte
	.endunion
	Enabled             .byte
.endstruct

.struct NoiState
	Decay                   .byte
	Volume                  .byte
	Period                  .byte
	EnvStart                .byte
	EnvCounter              .byte
	Envelope                .byte
	LoopNoise               .byte
	LengthCounter           .byte
	LengthMute              .byte
	ConstantVolume          .byte
	.union
		LengthCounterHalt   .byte
		EnvLoop             .byte
	.endunion
	Enabled                 .byte
.endstruct

.proc APU_reset
	ldx #<(end_vars-vars)
loop:
	stz vars-1,x
	dex
	bne loop
	rts
.endproc

.proc APU_tick
	; clock the chip
	lda qclock
	sec
	sbc qclocks_per_frame
	sta qclock
	; this function will clear the L/R channels of the square (pulse) wave channels
	; if there was a prior write on the square wave channel's period high byte.
	;
	; This effectively does a phase reset on the pulse wave, and emulates the behavior
	; of the NES APU.
	;
	; In SMB3, this is evident when the sound effect played at the end of the level
	; when it's converting the remaining timer value to score.
	;
	; Then at least one VERA audio clock must elapse before setting the volume again,
	; which is 1/48828.125 seconds, or roughly 20.5µs.  This would equate to 164 CPU
	; clock cycles.  As of the writing of this comment, about 3000 cycles elapse in
	; between the return of this function and the output code below, so we're in good shape.
	jsr sq12_phase_reset
clock_loop:
	lda clock_count
	and #$01
	bne this_every_clock
this_every_other_clock:
	; Square
	ldx #$00
	jsr sq_sweep
	jsr sq_lc
	ldx #.sizeof(SQState)
	jsr sq_sweep
	jsr sq_lc
	jsr tri_lc
	jsr noi_lc
this_every_clock:
	; Square
	ldx #$00
	jsr sq_env
	ldx #.sizeof(SQState)
	jsr sq_env
	jsr tri_lin
	jsr noi_env
clock_end:
	inc clock_count
	lda qclock
	clc
	adc #$05 
	sta qclock
	bmi clock_loop
apu_out:
	;jmp dmc

	VERA_SET_ADDR Vera::VRAM_psg, 1

	; Square 1
	ldx sq1+SQState::Period
	ldy sq1+SQState::Period+1
	jsr apu2vera
	; VERA frequency
	stx Vera::Reg::Data0
	sty Vera::Reg::Data0
	ldx #0
	jsr sq_get_output_level ; stores value in y
	lda voltbl,y
	; Volume (includes L+R stereo)
	sta Vera::Reg::Data0
	; Duty Cycle (includes 0 for pulse)
	ldy sq1+SQState::Duty
	lda pultbl,y
	sta Vera::Reg::Data0

	; Square 2
	ldx sq2+SQState::Period
	ldy sq2+SQState::Period+1
	jsr apu2vera
	; VERA frequency
	stx Vera::Reg::Data0
	sty Vera::Reg::Data0

	ldx #.sizeof(SQState)
	jsr sq_get_output_level ; stores value in y
	lda voltbl,y
	; Volume (includes L+R stereo)
	sta Vera::Reg::Data0
	; Duty Cycle (includes 0 for pulse)
	ldy sq2+SQState::Duty
	lda pultbl,y
	sta Vera::Reg::Data0

	; Triangle
	lda tri+TriState::Period
	asl
	tax
	lda tri+TriState::Period+1
	rol
	tay 
	jsr apu2vera
	; VERA frequency
	stx Vera::Reg::Data0
	sty Vera::Reg::Data0
	stx tmp0
	sty tmp1

	jsr tri_get_output_level ; stores value in y
	lda voltbl,y
	; Volume (includes L+R stero)
	sta Vera::Reg::Data0
	; Waveform (includes 2 for triangle)
	;lda #$80
	lda #$83 ; dirty triangle PWM
	sta Vera::Reg::Data0

	; Noise
	lda noi+NoiState::Period
	asl
	tax
	; VERA frequency
	lda noitbl,x
	sta Vera::Reg::Data0
	lda noitbl+1,x
	sta Vera::Reg::Data0

	jsr noi_get_output_level ; stores value in y
	lda voltbl,y
	; Volume (includes L+R stero)
	sta Vera::Reg::Data0
	; Waveform (includes 3 for noise)
	lda #$c0
	sta Vera::Reg::Data0

dmc:
	; DPCM channel
	lda dmc_enabled
	beq end

	lda dmc_restart
	jne dmc_setup ; get out of here and don't come back

	lda dmc_playing
	beq end

	; DPCM channel is currently playing something, continue on this frame
	jmp dmc_loop

end:
	rts




; Private subroutines of APU_tick

apu2vera:
; Reads the values of tmp0-tmp1 as apu freq (divisor)
; Loads the conversion constant dividend "300274" to tmp2-tmp4
; Uses tmp5-tmp6 to store the remainder
; Output is in dividend (ZPX16_2-3)
;
; Runs a reasonably fast 24bit/16bit division routine
; but there may be room for improvement since we don't use all 24 bits
; in the dividend (but rather 19), and similarly we don't use all 16 bits in the
; divisor input (but rather 11).  
; Does that mean we could save 5 iterations with a little pre-ROL?
; nes apu freq = 300274.060421 / vera psg freq
; vera psg freq = 300274.060421 / nes apu freq

	divisor = tmp0
	dividend = tmp2
	remainder = tmp5

	stx divisor
	sty divisor+1

	lda #<300274
	sta dividend
	lda #>300274
	sta dividend+1
	lda #^300274
	sta dividend+2

	stz remainder
	stz remainder+1
	ldx #24 ; dividend bit count
apu2vera_divloop:
	asl dividend
	rol dividend+1
	rol dividend+2
	rol remainder
	rol remainder+1
	lda remainder
	sec
	sbc divisor 
	tay
	lda remainder+1
	sbc divisor+1
	bcc apu2vera_skip
	sta remainder+1
	sty remainder
	inc dividend
apu2vera_skip:
	dex
	bne apu2vera_divloop
	ldx dividend
	ldy dividend+1
	rts


noi_env:
	lda noi+NoiState::EnvStart
	beq noi_env_cont
	stz noi+NoiState::EnvStart
	lda noi+NoiState::Envelope
	sta noi+NoiState::EnvCounter
	bra noi_env_resetdecay
noi_env_cont:
	dec noi+NoiState::EnvCounter
	bpl noi_env_end
	lda noi+NoiState::Envelope
	sta noi+NoiState::EnvCounter
	lda noi+NoiState::Decay
	beq noi_env_zero
	dec noi+NoiState::Decay
	bra noi_env_end
noi_env_zero:
	lda noi+NoiState::EnvLoop
	bne noi_env_resetdecay
	lda #$00
	bra noi_env_setdecay
noi_env_resetdecay:
	lda #$0F
noi_env_setdecay:
	sta noi+NoiState::Decay
noi_env_end:
	rts


noi_get_output_level:
	lda noi+NoiState::LengthMute
	bne noi_get_output_level_muted
	lda noi+NoiState::Enabled
	beq noi_get_output_level_muted
	lda noi+NoiState::ConstantVolume
	bne noi_get_output_level_constant
noi_get_output_level_envelope:
	ldy noi+NoiState::Decay
	bra noi_get_output_level_end
noi_get_output_level_constant:
	ldy noi+NoiState::Volume
	bra noi_get_output_level_end
noi_get_output_level_muted:
	ldy #$00
noi_get_output_level_end:
	rts


noi_lc:
	lda noi+NoiState::LengthCounterHalt
	bne noi_lc_end
	lda noi+NoiState::LengthCounter
	beq noi_lc_zero
	dec noi+NoiState::LengthCounter
	bra noi_lc_end
noi_lc_zero:
	stz noi+NoiState::LengthCounter
	lda #$01
	sta noi+NoiState::LengthMute
noi_lc_end:
	rts



sq_env:
	lda sq+SQState::EnvStart,x
	beq sq_env_cont
	lda #$00
	sta sq+SQState::EnvStart,x
	lda sq+SQState::Envelope,x
	sta sq+SQState::EnvCounter,x
	bra sq_env_resetdecay
sq_env_cont:
	dec sq+SQState::EnvCounter,x
	bpl sq_env_end
	lda sq+SQState::Envelope,x
	sta sq+SQState::EnvCounter,x
	lda sq+SQState::Decay,x
	beq sq_env_zero
	dec sq+SQState::Decay,x
	bra sq_env_end
sq_env_zero:
	lda sq+SQState::EnvLoop,x
	bne sq_env_resetdecay
	lda #$00
	bra sq_env_setdecay
sq_env_resetdecay:
	lda #$0F
sq_env_setdecay:
	sta sq+SQState::Decay,x
sq_env_end:
	rts


sq_get_output_level:
	lda sq+SQState::SweepMute,x
	bne sq_get_output_level_muted
	lda sq+SQState::LengthMute,x
	bne sq_get_output_level_muted
	lda sq+SQState::Enabled,x
	beq sq_get_output_level_muted
	lda sq+SQState::ConstantVolume,x
	bne sq_get_output_level_constant
sq_get_output_level_envelope:
	ldy sq+SQState::Decay,x
	bra sq_get_output_level_end
sq_get_output_level_constant:
	ldy sq+SQState::Volume,x
	bra sq_get_output_level_end
sq_get_output_level_muted:
	ldy #$00
sq_get_output_level_end:
	rts




sq_lc:
	lda sq+SQState::LengthCounterHalt,x
	bne sq_lc_end
	lda sq+SQState::LengthCounter,x
	beq sq_lc_zero
	dec sq+SQState::LengthCounter,x
	bra sq_lc_end
sq_lc_zero:
	lda #$00
	sta sq+SQState::LengthCounter,x
	lda #$01
	sta sq+SQState::LengthMute,x
sq_lc_end:
	rts





sq_sweep:
	lda sq+SQState::SweepReload,x
	beq sq_no_reload
	lda #0
	sta sq+SQState::SweepReload,x
	jmp sq_do_sweep
sq_no_reload:
	lda sq+SQState::SweepCounter,x
	beq sq_do_sweep
	dec sq+SQState::SweepCounter,x
	jmp sq_sweep_end
sq_do_sweep:
	lda sq+SQState::SweepPeriod,x
	sta sq+SQState::SweepCounter,x
	lda sq+SQState::Period,x
	sta tmp0
	lda sq+SQState::Period+1,x
	sta tmp1
	ldy sq+SQState::SweepShift,x
	beq :++ ; Skip the shift if it's zero
	:
		lsr tmp1
		ror tmp0
		dey
		bne :-
	:
	lda sq+SQState::SweepNegate,x
	beq sq_sweep_add
sq_sweep_subtract: ; pitch goes up
	cpx #1 ; SQ1 subtracts one extra (one's complement), so we clear carry for SQ1
	lda sq+SQState::Period,x
	sbc tmp0
	sta tmp0
	lda sq+SQState::Period+1,x
	sbc tmp1
	sta tmp1
	bpl :+ ; if we underflowed, treat as 0.  Happens w/ negative sweep, 0 shift
	stz tmp0
	stz tmp1
:   jmp sq_sweep_overflow_chk
sq_sweep_add: ; pitch goes down
	clc
	lda sq+SQState::Period,x
	adc tmp0
	sta tmp0
	lda sq+SQState::Period+1,x
	adc tmp1
	sta tmp1
sq_sweep_overflow_chk:
	lda #0 ; Clear mute flag
	sta sq+SQState::SweepMute,x
	lda tmp1
	bit #%11111000
	beq sq_sweep_enable_chk
	lda #1
	sta sq+SQState::SweepMute,x
sq_sweep_enable_chk:
	lda sq+SQState::SweepEnabled,x
	beq sq_sweep_end
	lda sq+SQState::SweepMute,x
	bne sq_sweep_end
sq_sweep_apply:
	lda tmp0
	sta sq+SQState::Period,x
	lda tmp1
	sta sq+SQState::Period+1,x
sq_sweep_end:
	rts


tri_get_output_level:
	ldy #$0C
	lda tri+TriState::LengthMute
	bne tri_get_output_level_muted
	lda tri+TriState::LinearMute
	bne tri_get_output_level_muted
	lda tri+TriState::Enabled
	beq tri_get_output_level_muted
	bra tri_get_output_level_end
tri_get_output_level_muted:
	ldy #$00
tri_get_output_level_end:
	rts



tri_lin:
	lda tri+TriState::LinearCounterReload
	beq tri_lin_noload
	stz tri+TriState::LinearMute
	lda tri+TriState::LinearCounterSetup
	beq :+
	dec ; this seems to solve random issues with hanging triangles but it might be clipping regular notes too
:	sta tri+TriState::LinearCounter
	bra tri_lin_loaded
tri_lin_noload:
	lda tri+TriState::ControlFlag
	bne tri_lin_loaded
	dec tri+TriState::LinearCounter
tri_lin_loaded:
	lda tri+TriState::LinearCounter
	bne tri_lin_ack
tri_lin_zero:
	lda #1
	sta tri+TriState::LinearMute
tri_lin_ack:
	lda tri+TriState::ControlFlag
	bne tri_lin_end
	stz tri+TriState::LinearCounterReload
tri_lin_end:
	rts


tri_lc:
	lda tri+TriState::LengthCounter
	beq tri_lc_zero
	lda tri+TriState::LengthCounterHalt
	bne tri_lc_end
	dec tri+TriState::LengthCounter
	bra tri_lc_end
tri_lc_zero:
	lda #1
	sta tri+TriState::LengthMute
tri_lc_end:
	rts

sq12_phase_reset:
	VERA_SET_ADDR ((Vera::VRAM_psg)+2), 3
	lda sq1+SQState::PhaseReset
	beq @1
	stz Vera::Reg::Data0
	stz sq1+SQState::PhaseReset
	bra @2
@1:	lda Vera::Reg::Data0
@2:	lda sq2+SQState::PhaseReset
	beq @3
	stz Vera::Reg::Data0
	stz sq2+SQState::PhaseReset
@3:
	rts

.endproc

.proc lda_PAPU_EN
	php
	sei
	stz tmp0

	lda dmc_enabled
	cmp #0
	rol tmp0
	lda noi+NoiState::LengthCounter
	cmp #0
	rol tmp0
	lda tri+TriState::LengthCounter
	cmp #0
	rol tmp0
	lda sq2+SQState::LengthCounter
	cmp #0
	rol tmp0
	lda sq1+SQState::LengthCounter
	cmp #0
	rol tmp0

	plp
	lda tmp0

	rts
.endproc

.proc sta_FRAMECTR_CTL
	php
	pha
	and #$80
	beq mode1
mode0:
	lda #20
	bra end
mode1:
	lda #16
	bra end
end:
	sta qclocks_per_frame
	pla
	plp
	rts
.endproc


.proc r_4000
	; set volume and envelope
	pha
	and #$0F
	sta sq+SQState::Volume,y
	sta sq+SQState::Envelope,y
	pla
	pha
	; constant volume flag
	and #$10
	cmp #$10
	lda #0
	rol
	sta sq+SQState::ConstantVolume,y
	; length counter halt
	pla
	pha
	and #$20
	cmp #$20
	lda #0
	rol
	sta sq+SQState::LengthCounterHalt,y
	; duty cycle
	pla
	rol
	rol
	rol
	and #$03
	sta sq+SQState::Duty,y
	rts
.endproc

.proc r_4001
	; sweep shift
	pha
	and #$07
	sta sq+SQState::SweepShift,y
	pla
	pha
	and #$08
	cmp #$08
	lda #0
	rol
	sta sq+SQState::SweepNegate,y
	pla
	pha
	lsr
	lsr
	lsr
	lsr
	and #$07
	sta sq+SQState::SweepPeriod,y
	pla
	rol
	rol
	and #1
	sta sq+SQState::SweepEnabled,y
	lda #1
	sta sq+SQState::SweepReload,y
	rts
.endproc

.proc r_4002
	sta sq+SQState::Period,y
	rts
.endproc

.proc r_4003
	pha
	and #$07
	sta sq+SQState::Period+1,y
	lda #$80
	sta sq+SQState::PhaseReset,y
	pla
	lsr
	lsr
	lsr
	tax
	lda lentbl,x
	sta sq+SQState::LengthCounter,y
	lda #0
	sta sq+SQState::LengthMute,y
	lda #1
	sta sq+SQState::EnvStart,y
	lda sq+SQState::Enabled,y
	bne :+ ; if channel is disabled, force lengthcounter to 0
		lda #0
		sta sq+SQState::LengthCounter,y
	:
	rts
.endproc

.proc r_4008
	pha
	and #$7F
	sta tri+TriState::LinearCounterSetup
	pla
	and #$80
	sta tri+TriState::ControlFlag
	rts
.endproc

.proc r_400A
	sta tri+TriState::Period
	rts
.endproc

.proc r_400B
	pha
	and #$07
	sta tri+TriState::Period+1
	pla
	lsr
	lsr
	lsr
	tax
	lda lentbl,x
	sta tri+TriState::LengthCounter
	lda #1
	sta tri+TriState::LinearCounterReload
	stz tri+TriState::LengthMute
	rts
.endproc

.proc r_400C
	; set volume and envelope
	pha
	and #$0F
	sta noi+NoiState::Volume
	sta noi+NoiState::Envelope
	pla
	pha
	; constant volume flag
	and #$10
	cmp #$10
	lda #0
	rol
	sta noi+NoiState::ConstantVolume
	; length counter halt
	pla
	and #$20
	cmp #$20
	lda #0
	rol
	sta noi+NoiState::LengthCounterHalt
	rts
.endproc

.proc r_400E
	pha
	and #$0F
	sta noi+NoiState::Period
	pla
	rol
	rol
	and #$01
	sta noi+NoiState::LoopNoise
	rts
.endproc

.proc r_400F
	lsr
	lsr
	lsr
	tax
	lda lentbl,x
	sta noi+NoiState::LengthCounter
	stz noi+NoiState::LengthMute
	lda #1
	sta noi+NoiState::EnvStart
	lda noi+NoiState::Enabled
	bne :+ ; if channel is disabled, force lengthcounter to 0
		stz noi+NoiState::LengthCounter
	:
	rts
.endproc

.proc sta_PAPU_CTL1
	php
	pha
	phy
	ldy #0
	jsr r_4000
	ply
	pla
	plp
	rts
.endproc

.proc stx_PAPU_CTL1
	php
	pha
	phy
	txa
	ldy #0
	jsr r_4000
	ply
	pla
	plp
	rts
.endproc

.proc sta_PAPU_RAMP1
	php
	pha
	phy
	ldy #0
	jsr r_4001
	ply
	pla
	plp
	rts
.endproc

.proc sty_PAPU_RAMP1
	php
	pha
	phy
	tya
	ldy #0
	jsr r_4001
	ply
	pla
	plp
	rts
.endproc

.proc sta_PAPU_FT1
	php
	pha
	phx
	phy
	ldy #0
	jsr r_4002
	ply
	plx
	pla
	plp
	rts
.endproc

.proc sta_PAPU_FT1_x
	php
	pha
	phx
	phy
	cpx #0
	beq ft1
	cpx #4
	beq ft2
	cpx #8
	beq tr1
panic:
	stp
ft1:
	ldy #0
	jsr r_4002
end:
	ply
	plx
	pla
	plp
	rts
ft2:
	ldy #.sizeof(SQState)
	jsr r_4002
	bra end
tr1:
	jsr r_400A
	bra end
.endproc

.proc sta_PAPU_CT1
	php
	pha
	phx
	phy
	ldy #0
	jsr r_4003
	ply
	plx
	pla
	plp
	rts
.endproc

.proc sta_PAPU_CT1_x
	php
	pha
	phx
	phy
	cpx #0
	beq ct1
	cpx #4
	beq ct2
	cpx #8
	beq t2
panic:
	stp
ct1:
	ldy #0
	jsr r_4003
end:
	ply
	plx
	pla
	plp
	rts
ct2:
	ldy #.sizeof(SQState)
	jsr r_4003
	bra end
t2:
	jsr r_400B
	bra end
.endproc

.proc sta_PAPU_CTL2
	php
	pha
	phy
	ldy #.sizeof(SQState)
	jsr r_4000
	ply
	pla
	plp
	rts
.endproc

.proc stx_PAPU_CTL2
	php
	pha
	phy
	txa
	ldy #.sizeof(SQState)
	jsr r_4000
	ply
	pla
	plp
	rts
.endproc

.proc sta_PAPU_RAMP2
	php
	pha
	phy
	ldy #.sizeof(SQState)
	jsr r_4001
	ply
	pla
	plp
	rts
.endproc

.proc stx_PAPU_RAMP2
	php
	pha
	phy
	txa
	ldy #.sizeof(SQState)
	jsr r_4001
	ply
	pla
	plp
	rts
.endproc

.proc sty_PAPU_RAMP2
	php
	pha
	phy
	tya
	ldy #.sizeof(SQState)
	jsr r_4001
	ply
	pla
	plp
	rts
.endproc

.proc sta_PAPU_FT2
	php
	pha
	phx
	phy
	ldy #.sizeof(SQState)
	jsr r_4002
	ply
	plx
	pla
	plp
	rts
.endproc

.proc sta_PAPU_CT2
	php
	pha
	phx
	phy
	ldy #.sizeof(SQState)
	jsr r_4003
	ply
	plx
	pla
	plp
	rts
.endproc

.proc stx_PAPU_CT2
	php
	pha
	phx
	phy
	txa
	ldy #.sizeof(SQState)
	jsr r_4003
	ply
	plx
	pla
	plp
	rts
.endproc

.proc sta_PAPU_TCR1
	php
	pha
	jsr r_4008
	pla
	plp
	rts
.endproc

.proc sta_PAPU_TFREQ1
	jmp r_400A
.endproc

.proc sta_PAPU_TFREQ2
	php
	pha
	phx
	jsr r_400B
	plx
	pla
	plp
	rts
.endproc

.proc sta_PAPU_NCTL1
	php
	pha
	jsr r_400C
	pla
	plp
	rts
.endproc

.proc sta_PAPU_NFREQ1
	php
	pha
	jsr r_400E
	pla
	plp
	rts
.endproc

.proc stx_PAPU_NFREQ1
	php
	pha
	txa
	jsr r_400E
	pla
	plp
	rts
.endproc

.proc sta_PAPU_NFREQ2
	php
	pha
	phx
	jsr r_400F
	plx
	pla
	plp
	rts
.endproc

.proc sta_PAPU_EN
	php
	sei
	pha
	sta tmp0
sq1_chk:
	and #1
	beq sq1_off
	lda #1
	sta sq1+SQState::Enabled
	bra sq2_chk
sq1_off:
	stz sq1+SQState::Enabled
	stz sq1+SQState::LengthCounter
sq2_chk:
	lda tmp0
	and #2
	beq sq2_off
	lda #1
	sta sq2+SQState::Enabled
	bra tri_chk
sq2_off:
	stz sq2+SQState::Enabled
	stz sq2+SQState::LengthCounter
tri_chk:
	lda tmp0
	and #4
	beq tri_off
	lda #1
	sta tri+TriState::Enabled
	bra noi_chk
tri_off:
	stz tri+TriState::Enabled
	stz tri+TriState::LengthCounter
noi_chk:
	lda tmp0
	and #8
	beq noi_off
	lda #1
	sta noi+NoiState::Enabled
	bra dmc_chk
noi_off:
	stz noi+NoiState::Enabled
	stz noi+NoiState::LengthCounter
dmc_chk:
	lda tmp0
	and #$10
	beq dmc_off
	lda #$80
	sta dmc_enabled
	bra end
dmc_off:
	stz dmc_enabled
end:
	pla
	plp
	rts
.endproc

.proc stx_PAPU_EN
	php
	pha
	phx
	txa
	jsr sta_PAPU_EN
	plx
	pla
	plp
	rts
.endproc

.proc sta_PAPU_MODCTL
	php
	pha
	and #$0f
	sta dmc_rate
	pla
	plp
	rts
.endproc

.proc sta_PAPU_MODADDR
	php
	pha
	sta dmc_idx
	sec
	ror dmc_restart
	pla
	plp
	rts
.endproc

.proc sta_PAPU_MODLEN
	sta dmc_len
	rts
.endproc

.proc dmc_setup
	ldy dmc_idx
	cpy #9
	bcs invalid

	lda dmcbank,y
	sta dmc_curbank
	lda dmcptr_l,y
	sta dmc_curptr_l
	lda dmcptr_h,y
	sta dmc_curptr_h
	lda #$80
	sta dmc_playing
	lda dmc_len
	lsr
	sta dmc_remain_h
	lda #0
	ror
	clc
	adc #8
	sta dmc_remain_l
	lda #$0C
	sta Vera::Reg::AudioCtrl
	stz dmc_restart
	bra dmc_loop
invalid:
	stz dmc_restart
	rts
.endproc

.proc dmc_loop ; this looks a lot like ZSMKit's routine
	ldy dmc_rate
	ldx apu2pcmrate,y
	stx Vera::Reg::AudioRate
	stx RR ; allow restore of rate later in case we're doing the initial load
	dex
	lda Vera::Reg::ISR
	and #$08 ; AFLOW
	beq slow
fast:
	lda pcmrate_fast,y
	bra calc_bytes
slow:
	lda pcmrate_slow,y
calc_bytes:
	; do the << 2 base amount
	stz tmp1
	asl
	rol tmp1
	asl
	rol tmp1
	sta tmp0

	bit Vera::Reg::AudioCtrl
	bvc :+
	stz Vera::Reg::AudioRate
:	lda dmc_remain_l
	sec
	sbc tmp0
	lda dmc_remain_h
	sbc tmp1
	bcs normal_load ; borrow clear, sufficient bytes by default

	; we have fewer bytes remaining than we were going to send
	ldx dmc_remain_l
	ldy dmc_remain_h

	; say that we're done playing so we don't re-enter after
	stz dmc_playing
	bra loadit
normal_load:
	; decrement remaining
	lda dmc_remain_l
	sec
	sbc tmp0
	sta dmc_remain_l
	lda dmc_remain_h
	sbc tmp1
	sta dmc_remain_h

after_taper:
	ldx tmp0
	ldy tmp1
loadit:
	jsr _load_fifo
	lda #$80 ; this is self-mod to restore the rate in case we loaded while empty and temporarily set the rate to zero
RR = *- 1
	sta Vera::Reg::AudioRate
	rts
.endproc

voltbl:
	.byte $C0,$D3,$E0,$E5
	.byte $EA,$EE,$F1,$F3
	.byte $F6,$F8,$F9,$FA
	.byte $FC,$FD,$FE,$FF

;   0,  19, 32, 37
;   41, 45, 49, 51
;   54, 56, 57, 58
;   60, 61, 62, 63


pultbl:
	.byte $0F,$1F,$3F,$1F

lentbl:
	.byte 10,254, 20,  2, 40,  4, 80,  6, 160,  8, 60, 10, 14, 12, 26, 14
	.byte 12, 16, 24, 18, 48, 20, 96, 22, 192, 24, 72, 26, 16, 28, 32, 30

noitbl:
	.word $FFFF,$EA95,$A78F,$929D
	.word $754A,$61BE,$494E,$3AA5
	.word $2E73,$24F1,$18B1,$1278
	.word $0C50,$093A,$049D,$024E

pcmrate_fast:
	.byte $13, $15, $17, $19
	.byte $1A, $1E, $22, $24
	.byte $29, $2F, $36, $3C
	.byte $47, $5B, $69, $8D

pcmrate_slow:
	.byte $11, $12, $16, $17
	.byte $19, $1C, $21, $22
	.byte $27, $2E, $34, $3A
	.byte $45, $58, $67, $8A

apu2pcmrate:
	.byte $0B, $0C, $0E, $0F
	.byte $10, $12, $15, $16
	.byte $19, $1D, $21, $25
	.byte $2C, $38, $41, $57


vars:
sq:
sq1:
	.tag SQState
sq2:
	.tag SQState
tri:
	.tag TriState
noi:
	.tag NoiState
qclock:
	.res 1
qclocks_per_frame:
	.res 1
clock_count:
	.res 1

dmc_rate:
	.res 1
dmc_idx:
	.res 1
dmc_len:
	.res 1
dmc_restart:
	.res 1
dmc_playing:
	.res 1
dmc_enabled:
	.res 1

dmc_remain_l:
	.res 1
dmc_remain_h:
	.res 1

tmp0:
	.res 1
tmp1:
	.res 1
tmp2:
	.res 1
tmp3:
	.res 1
tmp4:
	.res 1
tmp5:
	.res 1
tmp6:
	.res 1
end_vars:

.assert * - vars < 256, error, "APU vars > 255 bytes"

.segment "X16BSS"
dmcptr_l:
	.res 9
dmcptr_h:
	.res 9
dmcbank:
	.res 9

dmc_curptr_l:
	.res 1
dmc_curptr_h:
	.res 1
dmc_curbank:
	.res 1

.segment "NESPORTLOW"

; Imported from ZSound by way of ZSMKit, a very efficient FIFO filler routine
; starts at dmc_cur* and then updates their values at the end
.proc _load_fifo
	__CPX		= $e0	; opcode for cpx immediate
	__BNE		= $d0

	; self-mod the page of the LDA below to the current page of pcm_cur_h
	lda dmc_curptr_h
	sta data_page0
	sta data_page1
	sta data_page2
	sta data_page3

	; page-align
	txa             ;.A now holds the low-byte of n-bytes to copy
	ldx dmc_curptr_l   ;.X now points at the page-aligned offset
	; add the delta to bytes_left
	clc
	adc dmc_curptr_l
	sta bytes_left
	bcc :+
	iny
:	lda dmc_curbank ; load the bank we'll be reading from
	sta X16::Reg::RAMBank
	; determine whether we have > $FF bytes to copy. If $100 or more, then
	; use the full-page dynamic comparator. Else use the last-page comparator.
	cpy #0
	beq last_page   ; if 0, then use the last_page comparator.
	; self-mod the instruction at dynamic_comparator to:
	; BNE copy_byte
	lda #__BNE
	sta dynamic_comparator
	lda #.lobyte(copy_byte0-dynamic_comparator-2)
	sta dynamic_comparator+1
	; compute num-steps % 4 (the mod4 is done by shifting the 2 LSB into N and C)
	txa
enter_loop:
	ror
	ror
	bcc :+
	bmi copy_byte3  ; 18
	bra copy_byte2  ; 20
:	bmi copy_byte1  ; 19

copy_byte0:
	lda $FF00,x
	data_page0 = (*-1)
	sta Vera::Reg::AudioData
	inx
copy_byte1:
	lda $FF00,x
	data_page1 = (*-1)
	sta Vera::Reg::AudioData
	inx
copy_byte2:
	lda $FF00,x
	data_page2 = (*-1)
	sta Vera::Reg::AudioData
	inx
copy_byte3:
	lda $FF00,x
	data_page3 = (*-1)
	sta Vera::Reg::AudioData
	inx
dynamic_comparator:
	bne copy_byte0
	; the above instruction is modified to CPX #(bytes_left) on the last page of data
	bne copy_byte0  ; branch for final page's CPX result.
	cpx #0
	bne done        ; .X can only drop out of the loop on non-zero during the final page.
	; Thus X!=0 means we just finished the final page. Done.
	; advance data pointer before checking if done on a page offset of zero.
	lda data_page0
	inc
	cmp #$c0
	beq do_bankwrap
no_bankwrap:
	; update the self-mod for all 4 iterations of the unrolled loop
	sta data_page0
	sta data_page1
	sta data_page2
	sta data_page3
check_done:
	cpy #0		; .Y = high byte of "bytes_left"
	beq done	; .X must be zero as well if we're here. Thus 0 bytes left. Done.
	dey
	bne copy_byte0	; more than one page remains. Continue with full-page mode copy.
last_page:
	lda bytes_left
	beq done		; if bytes_left=0 then we're done at offset 0x00, so exit.
	; self-mod the instruction at dynamic_comparator to be:
	; CPX #(bytes_left)
	sta dynamic_comparator+1
	lda #__CPX
	sta dynamic_comparator
	; Compute the correct loop entry point with the new exit index
	; i.e. the last page will start at x == 0, but we won't necessarily
	; end on a value x % 4 == 0, so the first entry from here into
	; the 4x unrolled loop is potentially short in order to make up
	; for it.
	; Find: bytes_left - .X
	txa
	eor #$ff
	sec	; to carry in the +1 for converting 2s complement of .X
	adc bytes_left
	; .A *= -1 to align it with the loop entry jump table
	eor #$ff
	inc
	bra enter_loop

done:
	ldy X16::Reg::RAMBank
	lda #31
	sta X16::Reg::RAMBank
	lda data_page0
	sta dmc_curptr_h
	stx dmc_curptr_l
	sty dmc_curbank
	rts

do_bankwrap:
	lda #$a0
	inc X16::Reg::RAMBank
	bra no_bankwrap

bytes_left:
	.byte 0
.endproc


.endif
