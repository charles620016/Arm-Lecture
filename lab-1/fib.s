	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

@	int fib(int n, int a, int b){
@	    if (0 == n) return a;
@	    if (1 == n) return b;
@   	 return fib(n-1, b, a+b);
@	}

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	@ r0 = n, r1 = a, r2 = b
	push {lr}
	
	@ Compare r0 wtih 1
	@ if(r0 <= 0) goto .L3 (which returns 0)
	cmp r0, #0
	ble	.L3
	
	sub r0, r0, #1				@ n = n - 1
	add r3, r1, r2				@ temp = a + b
	mov r1, r2					@ a = b
	mov r2, r3					@ b = temp
	bl	fibonacci				@ Recursive call to fibonacci with R4 - 1 as parameter
	
	pop {pc}					@EPILOG
	@ END CODE MODIFICATION
.L3:
	mov r0, r1					@ R0 = 0
	pop {pc}					@ EPILOG

	.size fibonacci, .-fibonacci
	.end