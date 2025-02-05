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

	m1 db 1,2,3
	   db 4,5,6
	m2 db 7,8,9
	   db 10,11,12		 

.code
start:

	mov eax, 0 ;in ax se vor pastra sumele elementelor de pe aceeasi 
                  ;pozitie
	
	mov esi, 0 ;pentru parcurgerea coloanelor
	mov ebx, 0 ;pentru parcurgerea liniilor	
	
	lea edi,m1
	;suma prima linie
	add al, m1[esi+ebx]
	add al, m2[esi+ebx]
	mov m1[esi+ebx], al ;rezultatul se pastreaza in matricea m1
	
	mov al, 0
	inc si
	add al, m1[esi+ebx]
	add al, m2[esi+ebx]
	mov m1[esi+ebx], al

	mov al, 0
	inc si
	add al, m1[esi+ebx]
	add al, m2[esi+ebx]
	mov m1[esi+ebx], al

	;suma a doua linie
	mov al, 0
	mov si, 0
	;bx se aduna cu 3 
	add bx, 3
	add al, m1[esi+ebx]
	add al, m2[esi+ebx]
	mov m1[esi+ebx], al

	mov al, 0
	inc si
	add al, m1[esi+ebx]
	add al, m2[esi+ebx]
	mov m1[esi+ebx], al

	mov al, 0
	inc si
	add al, m1[esi+ebx]
	add al, m2[esi+ebx]
	mov m1[esi+ebx], al

	;terminarea programului
	push 0
	call exit

end start