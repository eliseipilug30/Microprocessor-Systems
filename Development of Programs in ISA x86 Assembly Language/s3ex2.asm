;suma a 6 valori din memorie

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

var1 DB 10
var2 DB 1
var3 DB 12
var4 DB 25
var5 DB 3
var6 DB 5
	
.code
start:

	mov eax, 0
	mov al, var1
	add al, var2
	add al, var3
	add al, var4
	add al, var5
	add al, var6

	;terminarea programului
	push 0
	call exit

end start