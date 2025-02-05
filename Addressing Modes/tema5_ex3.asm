;sa se scrie un program care numara cati biti de 1 sunt intr-un numar intreg reprezentat pe cuvant, pastrat in memorie.
.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
nr dw 1580
.code
start:
	;aici se scrie codul
	mov eax, 0 ;nr de biti 
	mov ebx, 0
	mov ax,nr;adresa de inceput a numarului
	 ;xor eax, eax ; nr de biti de 1 = 0
	 ;verificam daca am parcurs toti bitii
	 ;cmp ecx, 0
	 
	 
	;terminarea programului
	push 0
	call exit
end start