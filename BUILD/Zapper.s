;
; File generated by cc65 v 2.15
;
	.fopt		compiler,"cc65 v 2.15"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_pal_bg
	.import		_pal_spr
	.import		_ppu_wait_nmi
	.import		_ppu_off
	.import		_ppu_on_all
	.import		_ppu_mask
	.import		_oam_clear
	.import		_oam_meta_spr
	.import		_sfx_play
	.import		_bank_spr
	.import		_rand8
	.import		_vram_adr
	.import		_vram_unrle
	.import		_set_vram_buffer
	.import		_one_vram_buffer
	.import		_clear_vram_buffer
	.import		_zap_shoot
	.import		_zap_read
	.export		_pad2_zapper
	.export		_zapper_ready
	.export		_sprid
	.export		_hit_detected
	.export		_score1000
	.export		_score100
	.export		_score10
	.export		_score1
	.export		_star_active
	.export		_star_color
	.export		_star_x
	.export		_star_y
	.export		_star_x_speed
	.export		_star_y_speed
	.export		_star_wait
	.export		_temp1
	.export		_temp2
	.export		_move_star
	.export		_adjust_score
	.export		_new_star
	.export		_draw_box
	.export		_draw_star
	.export		_Zap_Test
	.export		_StarDark
	.export		_StarLight
	.export		_WhiteBox
	.export		_pal1
	.export		_pal2
	.export		_main

.segment	"RODATA"

_Zap_Test:
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$41
	.byte	$5A
	.byte	$41
	.byte	$50
	.byte	$50
	.byte	$45
	.byte	$52
	.byte	$00
	.byte	$54
	.byte	$45
	.byte	$53
	.byte	$54
	.byte	$00
	.byte	$01
	.byte	$34
	.byte	$53
	.byte	$43
	.byte	$4F
	.byte	$52
	.byte	$45
	.byte	$3A
	.byte	$00
	.byte	$30
	.byte	$01
	.byte	$03
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$74
	.byte	$00
	.byte	$01
	.byte	$00
_StarDark:
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$08
	.byte	$00
	.byte	$01
	.byte	$40
	.byte	$00
	.byte	$08
	.byte	$11
	.byte	$00
	.byte	$08
	.byte	$08
	.byte	$11
	.byte	$40
	.byte	$80
_StarLight:
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$00
	.byte	$08
	.byte	$00
	.byte	$02
	.byte	$40
	.byte	$00
	.byte	$08
	.byte	$12
	.byte	$00
	.byte	$08
	.byte	$08
	.byte	$12
	.byte	$40
	.byte	$80
_WhiteBox:
	.byte	$FC
	.byte	$FC
	.byte	$00
	.byte	$00
	.byte	$04
	.byte	$FC
	.byte	$00
	.byte	$00
	.byte	$0C
	.byte	$FC
	.byte	$00
	.byte	$00
	.byte	$FC
	.byte	$04
	.byte	$00
	.byte	$00
	.byte	$04
	.byte	$04
	.byte	$00
	.byte	$00
	.byte	$0C
	.byte	$04
	.byte	$00
	.byte	$00
	.byte	$FC
	.byte	$0C
	.byte	$00
	.byte	$00
	.byte	$04
	.byte	$0C
	.byte	$00
	.byte	$00
	.byte	$0C
	.byte	$0C
	.byte	$00
	.byte	$00
	.byte	$80
_pal1:
	.byte	$0F
	.byte	$00
	.byte	$10
	.byte	$30
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_pal2:
	.byte	$0F
	.byte	$12
	.byte	$22
	.byte	$30
	.byte	$0F
	.byte	$15
	.byte	$25
	.byte	$30
	.byte	$0F
	.byte	$17
	.byte	$27
	.byte	$30
	.byte	$0F
	.byte	$19
	.byte	$29
	.byte	$30

.segment	"BSS"

.segment	"ZEROPAGE"
_pad2_zapper:
	.res	1,$00
_zapper_ready:
	.res	1,$00
_sprid:
	.res	1,$00
_hit_detected:
	.res	1,$00
_score1000:
	.res	1,$00
_score100:
	.res	1,$00
_score10:
	.res	1,$00
_score1:
	.res	1,$00
_star_active:
	.res	1,$00
_star_color:
	.res	1,$00
_star_x:
	.res	2,$00
_star_y:
	.res	2,$00
_star_x_speed:
	.res	2,$00
_star_y_speed:
	.res	2,$00
_star_wait:
	.res	1,$00
_temp1:
	.res	1,$00
_temp2:
	.res	1,$00
.segment	"BSS"

; ---------------------------------------------------------------
; void __near__ move_star (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_move_star: near

.segment	"CODE"

;
; star_y_speed += 0x0010;
;
	lda     #$10
	clc
	adc     _star_y_speed
	sta     _star_y_speed
	bcc     L00DE
	inc     _star_y_speed+1
;
; if((star_y_speed < 0x8000) && (star_y_speed > 0x0400)) star_y_speed = 0x0400;
;
L00DE:	ldx     _star_y_speed+1
	cpx     #$80
	bcs     L00DF
	lda     _star_y_speed
	cmp     #$01
	lda     _star_y_speed+1
	sbc     #$04
	bcc     L00DF
	ldx     #$04
	lda     #$00
	sta     _star_y_speed
	stx     _star_y_speed+1
;
; star_x += star_x_speed;
;
L00DF:	lda     _star_x_speed
	clc
	adc     _star_x
	sta     _star_x
	lda     _star_x_speed+1
	adc     _star_x+1
	sta     _star_x+1
;
; if(star_x >= 0xf000) star_active = 0;
;
	lda     _star_x
	cmp     #$00
	lda     _star_x+1
	sbc     #$F0
	bcc     L00E9
	lda     #$00
	sta     _star_active
;
; star_y += star_y_speed;
;
L00E9:	lda     _star_y_speed
	clc
	adc     _star_y
	sta     _star_y
	lda     _star_y_speed+1
	adc     _star_y+1
	sta     _star_y+1
;
; if(star_y >= 0xe000) star_active = 0;
;
	lda     _star_y
	cmp     #$00
	lda     _star_y+1
	sbc     #$E0
	bcc     L00EF
	lda     #$00
	sta     _star_active
;
; }
;
L00EF:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ adjust_score (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_adjust_score: near

.segment	"CODE"

;
; if(score1 >= 10){
;
	lda     _score1
	cmp     #$0A
	bcc     L0174
;
; score1 = 0;
;
	lda     #$00
	sta     _score1
;
; ++score10;
;
	inc     _score10
;
; if(score10 >= 10){
;
	lda     _score10
	cmp     #$0A
	bcc     L0174
;
; score10 = 0;
;
	lda     #$00
	sta     _score10
;
; ++score100;
;
	inc     _score100
;
; if(score100 >= 10){
;
	lda     _score100
	cmp     #$0A
	bcc     L0174
;
; score100 = 0;
;
	lda     #$00
	sta     _score100
;
; ++score1000;
;
	inc     _score1000
;
; if(score1000 >= 10){ // maximum 9999
;
L0174:	lda     _score1000
	cmp     #$0A
	bcc     L0175
;
; score1000 = 9;
;
	lda     #$09
	sta     _score1000
;
; score100 = 9;
;
	sta     _score100
;
; score10 = 9;
;
	sta     _score10
;
; score1 = 9;
;
	sta     _score1
;
; temp1 = score1000 + 0x30;
;
L0175:	lda     _score1000
	clc
	adc     #$30
	sta     _temp1
;
; one_vram_buffer(temp1, NTADR_A(9,4));
;
	jsr     pusha
	ldx     #$20
	lda     #$89
	jsr     _one_vram_buffer
;
; temp1 = score100 + 0x30;
;
	lda     _score100
	clc
	adc     #$30
	sta     _temp1
;
; one_vram_buffer(temp1, NTADR_A(10,4));
;
	jsr     pusha
	ldx     #$20
	lda     #$8A
	jsr     _one_vram_buffer
;
; temp1 = score10 + 0x30;
;
	lda     _score10
	clc
	adc     #$30
	sta     _temp1
;
; one_vram_buffer(temp1, NTADR_A(11,4));
;
	jsr     pusha
	ldx     #$20
	lda     #$8B
	jsr     _one_vram_buffer
;
; temp1 = score1 + 0x30;
;
	lda     _score1
	clc
	adc     #$30
	sta     _temp1
;
; one_vram_buffer(temp1, NTADR_A(12,4));
;
	jsr     pusha
	ldx     #$20
	lda     #$8C
	jmp     _one_vram_buffer

.endproc

; ---------------------------------------------------------------
; void __near__ new_star (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_new_star: near

.segment	"CODE"

;
; star_active = 1;
;
	lda     #$01
	sta     _star_active
;
; star_color = (star_color + 1) & 1; // 0 or 1
;
	lda     _star_color
	clc
	adc     #$01
	and     #$01
	sta     _star_color
;
; temp1 = rand8();
;
	jsr     _rand8
	sta     _temp1
;
; star_x = (temp1 << 7) + 0x4000; // should give 0x4000-0xbf80
;
	ldx     #$00
	lda     _temp1
	jsr     aslax4
	jsr     aslax3
	sta     _star_x
	txa
	clc
	adc     #$40
	sta     _star_x+1
;
; star_y = 0xd000; // int
;
	ldx     #$D0
	lda     #$00
	sta     _star_y
	stx     _star_y+1
;
; temp1 = rand8();
;
	jsr     _rand8
	sta     _temp1
;
; star_x_speed = ((temp1 & 0x1f) - 0x0f) << 4;
;
	ldx     #$00
	and     #$1F
	sec
	sbc     #$0F
	bcs     L014D
	dex
L014D:	jsr     shlax4
	sta     _star_x_speed
	stx     _star_x_speed+1
;
; star_y_speed = 0xfc00;
;
	ldx     #$FC
	lda     #$00
	sta     _star_y_speed
	stx     _star_y_speed+1
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ draw_box (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_draw_box: near

.segment	"CODE"

;
; temp1 = high_byte(star_x);
;
	lda     _star_x+1
	sta     _temp1
;
; temp2 = high_byte(star_y);
;
	lda     _star_y+1
	sta     _temp2
;
; sprid = oam_meta_spr(temp1, temp2, sprid, WhiteBox);
;
	jsr     decsp3
	lda     _temp1
	ldy     #$02
	sta     (sp),y
	lda     _temp2
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_WhiteBox)
	ldx     #>(_WhiteBox)
	jsr     _oam_meta_spr
	sta     _sprid
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ draw_star (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_draw_star: near

.segment	"CODE"

;
; temp1 = high_byte(star_x);
;
	lda     _star_x+1
	sta     _temp1
;
; temp2 = high_byte(star_y);
;
	lda     _star_y+1
	sta     _temp2
;
; if(star_color == 0){
;
	lda     _star_color
	bne     L0164
;
; sprid = oam_meta_spr(temp1, temp2, sprid, StarDark);
;
	jsr     decsp3
	lda     _temp1
	ldy     #$02
	sta     (sp),y
	lda     _temp2
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_StarDark)
	ldx     #>(_StarDark)
;
; else{
;
	jmp     L0177
;
; sprid = oam_meta_spr(temp1, temp2, sprid, StarLight);
;
L0164:	jsr     decsp3
	lda     _temp1
	ldy     #$02
	sta     (sp),y
	lda     _temp2
	dey
	sta     (sp),y
	lda     _sprid
	dey
	sta     (sp),y
	lda     #<(_StarLight)
	ldx     #>(_StarLight)
L0177:	jsr     _oam_meta_spr
	sta     _sprid
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; ppu_off(); // screen off
;
	jsr     _ppu_off
;
; pal_bg(pal1); // load the palette
;
	lda     #<(_pal1)
	ldx     #>(_pal1)
	jsr     _pal_bg
;
; pal_spr(pal2); // load the palette
;
	lda     #<(_pal2)
	ldx     #>(_pal2)
	jsr     _pal_spr
;
; bank_spr(1); // sprites use the 2nd tileset
;
	lda     #$01
	jsr     _bank_spr
;
; vram_adr(NAMETABLE_A);
;
	ldx     #$20
	lda     #$00
	jsr     _vram_adr
;
; vram_unrle(Zap_Test);
;
	lda     #<(_Zap_Test)
	ldx     #>(_Zap_Test)
	jsr     _vram_unrle
;
; ppu_wait_nmi(); // wait
;
	jsr     _ppu_wait_nmi
;
; set_vram_buffer(); // points ppu update to vram_buffer, do this at least once
;
	jsr     _set_vram_buffer
;
; clear_vram_buffer();
;
	jsr     _clear_vram_buffer
;
; ppu_on_all(); // turn on screen
;
	jsr     _ppu_on_all
;
; ppu_wait_nmi(); // wait till beginning of the frame
;
L00A6:	jsr     _ppu_wait_nmi
;
; clear_vram_buffer();
;
	jsr     _clear_vram_buffer
;
; oam_clear();
;
	jsr     _oam_clear
;
; sprid = 0;
;
	lda     #$00
	sta     _sprid
;
; zapper_ready = pad2_zapper^1; // XOR last frame, make sure not held down still
;
	lda     _pad2_zapper
	eor     #$01
	sta     _zapper_ready
;
; pad2_zapper = zap_shoot(1); // controller slot 2
;
	lda     #$01
	jsr     _zap_shoot
	sta     _pad2_zapper
;
; if(star_active){
;
	lda     _star_active
	beq     L00B4
;
; move_star();
;
	jsr     _move_star
;
; draw_star();
;
	jsr     _draw_star
;
; if((pad2_zapper)&&(zapper_ready)){
;
	lda     _pad2_zapper
	beq     L00A6
	lda     _zapper_ready
	beq     L00A6
;
; sfx_play(0,0);
;
	lda     #$00
	jsr     pusha
	jsr     _sfx_play
;
; oam_clear();
;
	jsr     _oam_clear
;
; draw_box(); // redraw the star as a box
;
	jsr     _draw_box
;
; ppu_mask(0x16); // BG off, won't happen till NEXT frame
;
	lda     #$16
	jsr     _ppu_mask
;
; ppu_wait_nmi(); // wait till the top of the next frame
;
	jsr     _ppu_wait_nmi
;
; oam_clear(); // clear the NEXT frame
;
	jsr     _oam_clear
;
; draw_star(); // draw a star on the NEXT frame
;
	jsr     _draw_star
;
; ppu_mask(0x1e); // bg on, won't happen till NEXT frame
;
	lda     #$1E
	jsr     _ppu_mask
;
; hit_detected = zap_read(1); // look for light in zapper, port 2
;
	lda     #$01
	jsr     _zap_read
	sta     _hit_detected
;
; if(hit_detected){
;
	lda     _hit_detected
	beq     L00A6
;
; ++score1;
;
	inc     _score1
;
; adjust_score();
;
	jsr     _adjust_score
;
; star_active = 0;
;
	lda     #$00
	sta     _star_active
;
; star_wait = 20; // to time the next spawn
;
	lda     #$14
	sta     _star_wait
;
; else if(star_wait){
;
	jmp     L00A6
L00B4:	lda     _star_wait
	beq     L00D6
;
; --star_wait;
;
	dec     _star_wait
;
; else{
;
	jmp     L00A6
;
; new_star();
;
L00D6:	jsr     _new_star
;
; while (1){
;
	jmp     L00A6

.endproc

