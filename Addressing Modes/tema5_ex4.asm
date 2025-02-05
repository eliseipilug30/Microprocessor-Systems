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
sir DB '1','A','a','2','3','x'
sir1 DB '1','2','3'
sir2 DB 'A','a','x'
	
.code
start:
        mov eax, 0
		mov ecx, 0
		mov cx, 6
		
		
        lea edi, sir
	    lea esi, sir1
		lea ebx, sir2
et:		
     mov al, [esi]
	 cmp al,'0'
	 jb urm
	 cmp al, '9'
	 ja litera
	 
	 mov [sir1+ecx],al
	 inc ecx
	 jmp urm
	 
litera: 
     cmp al, 'a'
	 jl urm
	 cmp al, 'z'
	 jg urm
	  
	 mov [sir2+ edx], al
	 inc edx

urm: 
     inc ebx
	 jmp start
	


	;terminarea programului
	push 0
	call exit
	
end start