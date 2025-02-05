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

	sir1 dd 1,2,3 
	sir2 dd 0,0,0 

.code
start:
	mov eax, 0
	
	lea esi, sir1
	lea edi, sir2
	
	;iau din primul sir si pun in stiva
	push [esi]
	add esi, 4
	push [esi]
	add esi, 4
	push [esi]
	
	;scot de pe stiva si pun in al doilea sir
	pop [edi]
	add edi, 4
	pop [edi]
	add edi, 4
	pop [edi]
	
	;terminarea programului
	push 0
	call exit

end start