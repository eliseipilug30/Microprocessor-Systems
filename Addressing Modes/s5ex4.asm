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

	sir1 db '1','*','A','a','B','2','3','#','x','a','1','E','e','/'
	sir2 db 10 dup(0)
	sir3 db 10 dup(0)
	
.code
start:
	mov eax, 0
	mov ecx, 0

	mov cx,14
	lea esi,sir1
	lea edi,sir2
	lea ebx,sir3
	
et:
	mov al,[esi]
	cmp al,'0'
	jb urm
	cmp al,'9'
	ja litera
	
	mov [ebx],al
	inc ebx
	jmp urm
	
litera:
	cmp al,'a'
	jb urm
	cmp al,'z'
	ja urm
	mov [edi],al
	inc edi

urm:
	inc esi
	loop et
	
	;terminarea programului
	push 0
	call exit

end start