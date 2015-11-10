	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

@	int fib(int n){
@		int first = 0;
@		int second = 1;
@		int tmp;
@		while(n--){
@			tmp = first + second;
@			first = second;
@			second = tmp;
@		}
@		return first;
@	}

fibonacci:
	push {r3,r4,r5,lr}
	mov r3, #0					@ r3 = first
	mov r4, #1					@ r4 = second
loop:
	add r5,r3,r4				@ tmp = first + second
	mov r3,r4					@ first = second
	mov r4,r5					@ second = sum	
	subs r0, r0, #1				@ r0 = r0 - 1
	bge loop					@ if x > 0, jump to loop

	mov r0,r3					@ return result
	pop {r3,r4,r5,pc}

	.size fibonacci, .-fibonacci
	.end