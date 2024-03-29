 .MODEL SMALL
 .CODE
 org 100h
start:
 mov ax,012h ;VGA mode
 int 10h ;640 x 480 16 colors.
 mov ax,0A000h
 mov es,ax ;ES points to the video memory.
 mov dx,03C4h ;dx = indexregister
 mov ax,0F02h ;INDEX = MASK MAP, 
 out dx,ax ;write all the bitplanes.
 mov di,0 ;DI pointer in the video memory.
 mov cx,38400 ;(640 * 480)/8 = 38400
 mov ax,0FFh ;write to every pixel.
 rep stosb ;fill the screen
 call pause
 mov ah,4ch ;go back 
 int 21h ; to DOS.
 
 pause proc
	push ax dx
	; set cursor position
	xor bh, bh
	; mov dx, 1700h
	; call setCursor
	; lea dx, pausedMsg
	; call printMessage
	mov ah, 0
	int 16h
	pop dx ax
	ret
pause endp
 
 END start