;;! target = "x86_64"

(module
    (func (result i64)
        (f64.const 1.0)
        (i64.trunc_f64_u)
    )
)
;;      	 55                   	push	rbp
;;      	 4889e5               	mov	rbp, rsp
;;      	 4c8b5f08             	mov	r11, qword ptr [rdi + 8]
;;      	 4d8b1b               	mov	r11, qword ptr [r11]
;;      	 4981c310000000       	add	r11, 0x10
;;      	 4939e3               	cmp	r11, rsp
;;      	 0f8773000000         	ja	0x8e
;;   1b:	 4989fe               	mov	r14, rdi
;;      	 4883ec10             	sub	rsp, 0x10
;;      	 48897c2408           	mov	qword ptr [rsp + 8], rdi
;;      	 48893424             	mov	qword ptr [rsp], rsi
;;      	 f20f100d65000000     	movsd	xmm1, qword ptr [rip + 0x65]
;;      	 49bb000000000000e043 	
;; 				movabs	r11, 0x43e0000000000000
;;      	 664d0f6efb           	movq	xmm15, r11
;;      	 66410f2ecf           	ucomisd	xmm1, xmm15
;;      	 0f8317000000         	jae	0x64
;;      	 0f8a3d000000         	jp	0x90
;;   53:	 f2480f2cc1           	cvttsd2si	rax, xmm1
;;      	 4883f800             	cmp	rax, 0
;;      	 0f8d26000000         	jge	0x88
;;   62:	 0f0b                 	ud2	
;;      	 0f28c1               	movaps	xmm0, xmm1
;;      	 f2410f5cc7           	subsd	xmm0, xmm15
;;      	 f2480f2cc0           	cvttsd2si	rax, xmm0
;;      	 4883f800             	cmp	rax, 0
;;      	 0f8c17000000         	jl	0x92
;;   7b:	 49bb0000000000000080 	
;; 				movabs	r11, 0x8000000000000000
;;      	 4c01d8               	add	rax, r11
;;      	 4883c410             	add	rsp, 0x10
;;      	 5d                   	pop	rbp
;;      	 c3                   	ret	
;;   8e:	 0f0b                 	ud2	
;;   90:	 0f0b                 	ud2	
;;   92:	 0f0b                 	ud2	
;;   94:	 0000                 	add	byte ptr [rax], al
;;   96:	 0000                 	add	byte ptr [rax], al
;;   98:	 0000                 	add	byte ptr [rax], al
;;   9a:	 0000                 	add	byte ptr [rax], al
;;   9c:	 0000                 	add	byte ptr [rax], al
