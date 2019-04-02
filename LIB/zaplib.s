;written by Doug Fraker 2019
;NES zapper gun code


.export _zap_shoot, _zap_read




;from NESDEV WIKI
;7  bit  0
;---- ----
;xxxT WxxS
;   | |  |
;   | |  +- Serial data (Vs.)
;   | +---- Light sense (0: detected; 1: not detected) (NES/FC)
;   +------ Trigger (0: released; 1: pulled) (NES/FC)


;assumed that dpmc errors won't happen
;usually zappers are in controller port 2
;but this can do either port
;in value = 0 or 1, which port
;out value = 0 or 1, 1 if zapper trigger pulled

_zap_shoot:
	tay
	ldx #1
	stx CTRL_PORT1
	dex ;#0
	stx CTRL_PORT1
	
	lda CTRL_PORT1,y
	and #$10
	beq @exit
	ldx #1 ;x is 0 otherwise
	
@exit:
	txa
	ldx #0
	rts
	
	
	
;in value = 0 or 1, which port
;out value = 0 or 1, whether it detected light
;please, only display 1 white box per frame
	
_zap_read:	
	tay
	ldx <FRAME_CNT1 ;ticks up during nmi code
	
@loop:
	lda #1
	sta CTRL_PORT1
	lda #0
	sta CTRL_PORT1
	lda CTRL_PORT1,y
	and #$08
	beq @hit_yes ;0 = light, 8 = no light
	cpx <FRAME_CNT1
	beq @loop 
	
@hit_no: ;ran past the frame and into the next nmi
	lda #0
	tax
	rts
	
@hit_yes:
	lda #1
	ldx #0
	rts
	

	
	
	
	