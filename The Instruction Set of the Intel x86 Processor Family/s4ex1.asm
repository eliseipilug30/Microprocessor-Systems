.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declararea datelor
.data
;de data aceasta nu am date in memorie

.code
start:
	;initializez pe ax si bx cu valori oarecare
	mov eax,0
	mov ebx,0
	mov ecx,0
	mov edx,0
	
	mov ax, 2
	mov bx, 12
	
	;pastrez vechea valoare a lui ax in dx
	mov dx, ax

	;ax*7 = ax*8 - ax
	;ax*8 = ax << 3 (ax deplasat aritmetic la stanga cu 3 pozitii)
	mov cl, 3
	sal ax, cl
	
	;ax=ax*7
	sub ax, dx
	
	;pastrez vechea valoare a lui bx in dx
	mov dx, bx
	
	;bx*2
	sal bx, 1

	;ax = ax-bx*2
	sub ax, bx
	
	mov bx, dx
	;bx/8 = bx >> 3 (deplasare la dreapta cu 3 pozitii)
	sar bx, cl
	
	sub ax, bx

	;terminarea programului
	push 0
	call exit

end start