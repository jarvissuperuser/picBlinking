;PROJECT 1
;210348549 - ttmugadza
;THIS PROGRAM IS DESIGNED TO DEMOSTRATE
;THE EFFECT OF 3 LOOP DELAY
;---------------------------------------
	org	0
	movlw	d'7'
	movwf	1fh
	bsf	3,5
	clrf	6	;PORT AS OUTPUT
	clrf	5	;PORT AS OUTPUT
	bcf	3,5

main:
	bsf	5,0

	bsf	6,0	;LED 1 ON RB0
	call	delay
	bcf	6,0	;LED 1 OFF AFTER SECOND
	call	delay

	bsf	6,1	;LED 2 ON RB1
	call	delay
	bcf	6,1
	call	delay

	bsf	6,2
	call	delay
	bcf	6,2
	call	delay

	bsf	6,3
	call	delay
	bcf	6,3
	call	delay

	goto	main

delay:			;DELAY FUNCTION 3LOOP
	movlw	d'5'
	movwf	22h

loop3:
	movlw	d'255'
	movwf	21h

loop2:
	movlw	d'255'
	movwf	20h

loop1:
	decfsz	20h,1
	goto	loop1
	decfsz	21h,1
	goto	loop2
	decfsz	22h,1
	goto	loop3
	return
