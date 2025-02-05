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

.code
start:
	;aici se scrie codul
	MOV AX,5
	MOV BX,10
	MOV CX,7
	MUL CX
	MOV CX,AX
	MOV AX,2
	MUL BX
	SUB CX,AX
	MOV AX,BX
	MOV BX,8
	DIV BX
	SUB CX,AX
	MOV AX,CX
	;terminarea programului
	push 0
	call exit
end start