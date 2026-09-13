	.att_syntax
	.file	"module_linked"
	.section	".text.main$async_dispatch_0_elementwise_16x2_i64xf32xf32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_0_elementwise_16x2_i64xf32xf32,@function
main$async_dispatch_0_elementwise_16x2_i64xf32xf32:
.Lfunc_begin0:
	.file	1 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_0.mlir"
	.loc	1 1 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp0:
	.loc	1 11 8 prologue_end
	movq	32(%rsi), %rdx
	xorl	%esi, %esi
	movq	(%rdx), %rax
	.loc	1 12 8
	movq	8(%rdx), %rcx
	.loc	1 14 8
	movq	16(%rdx), %rdx
	.loc	1 0 8 is_stmt 0
.Ltmp1:
	.p2align	4
.LBB0_1:
	.loc	1 19 8 is_stmt 1
	movq	(%rcx,%rsi,8), %rdi
	vmovsd	(%rax,%rsi,8), %xmm1
	.loc	1 23 10
	leaq	(%rdi,%rdi), %r8
	movq	%rdi, %r9
	.loc	1 24 10
	vmovss	402240(%rax,%rdi,8), %xmm0
	.loc	1 23 10
	shldq	$1, %r8, %r9
	sarq	$63, %r8
	incq	%r9
	shrq	%r9
	addq	%r9, %r8
	.loc	1 24 10
	vinsertps	$16, 402244(%rax,%r8,8), %xmm0, %xmm0
	vaddps	%xmm0, %xmm1, %xmm0
	.loc	1 19 8
	vmovlps	%xmm0, (%rdx,%rsi,8)
	incq	%rsi
	cmpq	$16, %rsi
	jne	.LBB0_1
	.loc	1 28 8
	xorl	%eax, %eax
	.loc	1 28 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp2:
.Lfunc_end0:
	.size	main$async_dispatch_0_elementwise_16x2_i64xf32xf32, .Lfunc_end0-main$async_dispatch_0_elementwise_16x2_i64xf32xf32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI1_0:
	.long	0x3f000000
	.section	".text.main$async_dispatch_1_reduction_16x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_1_reduction_16x2_f32,@function
main$async_dispatch_1_reduction_16x2_f32:
.Lfunc_begin1:
	.file	2 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_1.mlir"
	.loc	2 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp3:
	.loc	2 11 8 prologue_end
	movq	24(%rsi), %rax
	movq	32(%rsi), %rcx
	vxorps	%xmm2, %xmm2, %xmm2
	movl	(%rax), %esi
	.loc	2 12 8
	movl	4(%rax), %eax
	.loc	2 19 8
	andl	$-4, %esi
	.loc	2 20 8
	andl	$-4, %eax
	.loc	2 19 8
	addq	(%rcx), %rsi
	.loc	2 20 8
	addq	8(%rcx), %rax
	.loc	2 25 8
	movl	(%rdx), %ecx
	shlq	$4, %rcx
	vmovsd	(%rcx,%rsi), %xmm0
	vmovsd	8(%rcx,%rsi), %xmm1
	.loc	2 27 10
	vaddss	%xmm2, %xmm0, %xmm3
	vaddss	%xmm2, %xmm1, %xmm2
	vmovshdup	%xmm0, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm4, %xmm2, %xmm2
	vinsertps	$16, %xmm2, %xmm3, %xmm2
	.loc	2 32 10
	vmulps	.LCPI1_0(%rip){1to4}, %xmm2, %xmm2
	vbroadcastss	%xmm2, %xmm3
	vmovshdup	%xmm2, %xmm2
	.loc	2 33 10
	vsubps	%xmm2, %xmm1, %xmm1
	vsubps	%xmm3, %xmm0, %xmm0
	vmovlps	%xmm0, (%rcx,%rax)
	vmovlps	%xmm1, 8(%rcx,%rax)
	.loc	2 37 8
	xorl	%eax, %eax
	.loc	2 37 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp4:
.Lfunc_end1:
	.size	main$async_dispatch_1_reduction_16x2_f32, .Lfunc_end1-main$async_dispatch_1_reduction_16x2_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI2_0:
	.long	0x3f000000
.LCPI2_1:
	.long	0x3727c5ac
.LCPI2_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_2_reduction_16x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_2_reduction_16x2_f32,@function
main$async_dispatch_2_reduction_16x2_f32:
.Lfunc_begin2:
	.file	3 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_2.mlir"
	.loc	3 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp5:
	.loc	3 16 8 prologue_end
	movq	32(%rsi), %rax
	.loc	3 22 8
	movl	(%rdx), %ecx
	vxorps	%xmm3, %xmm3, %xmm3
	.loc	3 16 8
	movq	(%rax), %rsi
	.loc	3 22 8
	shlq	$4, %rcx
	.loc	3 17 8
	movq	8(%rax), %rax
	.loc	3 22 8
	vmovsd	128(%rsi,%rcx), %xmm0
	vmovsd	136(%rsi,%rcx), %xmm1
	.loc	3 25 10
	vmulps	%xmm0, %xmm0, %xmm2
	vaddss	%xmm3, %xmm2, %xmm4
	vmovshdup	%xmm2, %xmm2
	vaddss	%xmm2, %xmm4, %xmm2
	vmulps	%xmm1, %xmm1, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovshdup	%xmm4, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	.loc	3 35 10
	vxorps	%xmm4, %xmm4, %xmm4
	.loc	3 25 10
	vinsertps	$16, %xmm3, %xmm2, %xmm2
	.loc	3 30 10
	vmulps	.LCPI2_0(%rip){1to4}, %xmm2, %xmm2
	.loc	3 32 10
	vbroadcastss	.LCPI2_2(%rip), %xmm3
	.loc	3 31 10
	vaddps	.LCPI2_1(%rip){1to4}, %xmm2, %xmm2
	.loc	3 32 10
	vsqrtps	%xmm2, %xmm2
	vdivps	%xmm2, %xmm3, %xmm2
	vbroadcastss	%xmm2, %xmm3
	vmovshdup	%xmm2, %xmm2
	.loc	3 35 10
	vfmadd213ps	%xmm4, %xmm1, %xmm2
	vfmadd213ps	%xmm4, %xmm0, %xmm3
	vmovlps	%xmm3, 256(%rax,%rcx)
	vmovlps	%xmm2, 264(%rax,%rcx)
	.loc	3 39 8
	xorl	%eax, %eax
	.loc	3 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp6:
.Lfunc_end2:
	.size	main$async_dispatch_2_reduction_16x2_f32, .Lfunc_end2-main$async_dispatch_2_reduction_16x2_f32
	.cfi_endproc

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI3_0:
	.long	0xbcbf04b3
	.long	0xbcc90d38
	.long	0xbbf78b2e
	.long	0xbbf96d56
	.long	0xbcc4555f
	.long	0xbcabdd72
	.zero	4
	.zero	4
.LCPI3_1:
	.long	0xbb90d7d5
	.long	0x3c56bdcb
	.long	0xbc7684a5
	.long	0xba95968b
	.long	0x3d1d1a51
	.long	0xbc897141
	.zero	4
	.zero	4
	.section	".text.main$async_dispatch_3_matmul_16x6x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_3_matmul_16x6x2_f32,@function
main$async_dispatch_3_matmul_16x6x2_f32:
.Lfunc_begin3:
	.file	4 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_3.mlir"
	.loc	4 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp7:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.loc	4 14 8 prologue_end
	movq	32(%rsi), %rax
	.loc	4 19 8
	movl	(%rdx), %r14d
	vmovaps	.LCPI3_0(%rip), %ymm0
	vxorps	%xmm1, %xmm1, %xmm1
	.loc	4 14 8
	movq	(%rax), %rsi
	.loc	4 19 8
	leaq	(,%r14,8), %r10
	.loc	4 22 10
	leaq	6(,%r14,8), %rdx
	leaq	7(,%r14,8), %rcx
	leaq	(%r14,%r14,2), %r15
	leaq	1(,%r14,8), %rbx
	leaq	2(,%r14,8), %r11
	leaq	3(,%r14,8), %r9
	leaq	4(,%r14,8), %r8
	leaq	5(,%r14,8), %rdi
	shlq	$6, %r14
	.loc	4 15 8
	movq	8(%rax), %rax
	.loc	4 22 10
	shlq	$6, %r15
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rcx,%rcx,2), %rcx
	vbroadcastss	256(%rsi,%r14), %ymm2
	vbroadcastss	264(%rsi,%r10,8), %ymm3
	vbroadcastss	272(%rsi,%r10,8), %ymm4
	vbroadcastss	280(%rsi,%r10,8), %ymm5
	vbroadcastss	288(%rsi,%r10,8), %ymm6
	vbroadcastss	296(%rsi,%r10,8), %ymm7
	vbroadcastss	304(%rsi,%r10,8), %ymm8
	vfmadd132ps	%ymm0, %ymm1, %ymm2
	vfmadd132ps	%ymm0, %ymm1, %ymm3
	vfmadd132ps	%ymm0, %ymm1, %ymm4
	vfmadd132ps	%ymm0, %ymm1, %ymm5
	vfmadd132ps	%ymm0, %ymm1, %ymm6
	vfmadd132ps	%ymm0, %ymm1, %ymm7
	vfmadd132ps	%ymm0, %ymm1, %ymm8
	vfmadd132ps	312(%rsi,%r10,8){1to8}, %ymm1, %ymm0
	vmovaps	.LCPI3_1(%rip), %ymm1
	vfmadd231ps	260(%rsi,%r14){1to8}, %ymm1, %ymm2
	vfmadd231ps	268(%rsi,%r10,8){1to8}, %ymm1, %ymm3
	vfmadd231ps	276(%rsi,%r10,8){1to8}, %ymm1, %ymm4
	vfmadd231ps	284(%rsi,%r10,8){1to8}, %ymm1, %ymm5
	vfmadd231ps	292(%rsi,%r10,8){1to8}, %ymm1, %ymm6
	vfmadd231ps	300(%rsi,%r10,8){1to8}, %ymm1, %ymm7
	vfmadd231ps	308(%rsi,%r10,8){1to8}, %ymm1, %ymm8
	vfmadd231ps	316(%rsi,%r10,8){1to8}, %ymm1, %ymm0
	leaq	(%rbx,%rbx,2), %rsi
	leaq	(%r11,%r11,2), %r10
	vextractf128	$1, %ymm2, %xmm1
	vmovaps	%xmm2, 384(%rax,%r15)
	vextractf128	$1, %ymm3, %xmm2
	vmovlps	%xmm1, 400(%rax,%r15)
	vmovlps	%xmm2, 400(%rax,%rsi,8)
	vmovups	%xmm3, 384(%rax,%rsi,8)
	vextractf128	$1, %ymm4, %xmm3
	leaq	(%r9,%r9,2), %rsi
	vextractf128	$1, %ymm5, %xmm2
	vmovaps	%xmm4, 384(%rax,%r10,8)
	vmovlps	%xmm3, 400(%rax,%r10,8)
	vmovlps	%xmm2, 400(%rax,%rsi,8)
	vmovups	%xmm5, 384(%rax,%rsi,8)
	leaq	(%r8,%r8,2), %rsi
	vextractf128	$1, %ymm6, %xmm3
	vextractf128	$1, %ymm7, %xmm2
	vmovlps	%xmm3, 400(%rax,%rsi,8)
	vmovaps	%xmm6, 384(%rax,%rsi,8)
	leaq	(%rdi,%rdi,2), %rsi
	vextractf128	$1, %ymm8, %xmm3
	vmovlps	%xmm2, 400(%rax,%rsi,8)
	vextractf128	$1, %ymm0, %xmm2
	vmovups	%xmm7, 384(%rax,%rsi,8)
	vmovlps	%xmm3, 400(%rax,%rdx,8)
	vmovaps	%xmm8, 384(%rax,%rdx,8)
	vmovups	%xmm0, 384(%rax,%rcx,8)
	vmovlps	%xmm2, 400(%rax,%rcx,8)
	.loc	4 26 8
	xorl	%eax, %eax
	.loc	4 26 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp8:
.Lfunc_end3:
	.size	main$async_dispatch_3_matmul_16x6x2_f32, .Lfunc_end3-main$async_dispatch_3_matmul_16x6x2_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI4_0:
	.long	0x3fb8aa3b
.LCPI4_1:
	.long	0x7fffffff
.LCPI4_2:
	.long	0xff7fffff
.LCPI4_3:
	.long	0x3f317218
.LCPI4_4:
	.long	0xc2af999a
.LCPI4_5:
	.long	0x42b1999a
.LCPI4_6:
	.long	0x3f000000
.LCPI4_7:
	.long	0xc2fe0000
.LCPI4_8:
	.long	0x42fe0000
.LCPI4_9:
	.long	0xbf318000
.LCPI4_10:
	.long	0x395e8083
.LCPI4_11:
	.long	0x3ab743ce
.LCPI4_12:
	.long	0x39506967
.LCPI4_13:
	.long	0x3c088908
.LCPI4_14:
	.long	0x3d2aa9c1
.LCPI4_15:
	.long	0x3e2aaaaa
.LCPI4_16:
	.long	0x3f800000
	.section	".text.main$async_dispatch_4_attention_2x16x16","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_4_attention_2x16x16,@function
main$async_dispatch_4_attention_2x16x16:
.Lfunc_begin4:
	.file	5 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_4.mlir"
	.loc	5 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp9:
	.loc	5 13 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	5 21 8
	movl	(%rdx), %eax
	vmovss	.LCPI4_0(%rip), %xmm1
	vbroadcastss	.LCPI4_3(%rip), %zmm10
	vbroadcastss	.LCPI4_4(%rip), %zmm11
	vbroadcastss	.LCPI4_5(%rip), %zmm12
	vbroadcastss	.LCPI4_7(%rip), %zmm13
	vbroadcastss	.LCPI4_8(%rip), %zmm15
	vbroadcastss	.LCPI4_10(%rip), %zmm16
	vbroadcastss	.LCPI4_11(%rip), %zmm17
	vbroadcastss	.LCPI4_13(%rip), %zmm18
	.loc	5 13 8
	movq	(%rcx), %rsi
	.loc	5 21 8
	movl	%eax, %edx
	addl	%eax, %eax
	shrl	$3, %edx
	.loc	5 14 8
	movq	8(%rcx), %r8
	.loc	5 21 8
	andl	$14, %eax
	leaq	1(%rax), %rdi
	leaq	(%rax,%rax,2), %r10
	leaq	(%rdi,%rdi,2), %r11
	shll	$6, %edi
	vmovss	392(%rsi,%rdx,4), %xmm2
	vmovss	488(%rsi,%rdx,4), %xmm3
	vmovss	584(%rsi,%rdx,4), %xmm4
	vmovss	680(%rsi,%rdx,4), %xmm5
	.loc	5 13 8
	leaq	(%rsi,%rdx,4), %r9
	.loc	5 21 8
	vinsertps	$16, 704(%rsi,%rdx,4), %xmm5, %xmm5
	vinsertps	$16, 608(%rsi,%rdx,4), %xmm4, %xmm4
	vinsertps	$16, 512(%rsi,%rdx,4), %xmm3, %xmm3
	vinsertps	$16, 416(%rsi,%rdx,4), %xmm2, %xmm2
	vinsertps	$32, 728(%rsi,%rdx,4), %xmm5, %xmm5
	vinsertps	$32, 632(%rsi,%rdx,4), %xmm4, %xmm4
	vinsertps	$32, 536(%rsi,%rdx,4), %xmm3, %xmm3
	vinsertps	$32, 440(%rsi,%rdx,4), %xmm2, %xmm2
	vmulss	384(%r9,%r11,8), %xmm1, %xmm0
	vmulss	384(%r9,%r10,8), %xmm1, %xmm1
	movl	%eax, %r9d
	shll	$6, %r9d
	vinsertps	$48, 752(%rsi,%rdx,4), %xmm5, %xmm5
	vinsertps	$48, 656(%rsi,%rdx,4), %xmm4, %xmm4
	vinsertps	$48, 560(%rsi,%rdx,4), %xmm3, %xmm3
	vinsertps	$48, 464(%rsi,%rdx,4), %xmm2, %xmm2
	vinsertf128	$1, %xmm3, %ymm2, %ymm2
	vinsertf128	$1, %xmm5, %ymm4, %ymm4
	vxorps	%xmm3, %xmm3, %xmm3
	vbroadcastss	%xmm0, %zmm0
	vbroadcastss	%xmm1, %zmm1
	vinsertf64x4	$1, %ymm4, %zmm2, %zmm2
	vfmadd213ps	%zmm3, %zmm2, %zmm1
	vfmadd213ps	%zmm3, %zmm2, %zmm0
	vbroadcastss	.LCPI4_0(%rip), %zmm2
	vfmadd231ps	(%r8,%r9), %zmm2, %zmm1
	vfmadd231ps	(%r8,%rdi), %zmm2, %zmm0
	vextractf64x4	$1, %zmm1, %ymm3
	vcmpunordps	%ymm1, %ymm1, %k1
	vmaxps	%ymm3, %ymm1, %ymm4
	vpbroadcastd	.LCPI4_1(%rip), %ymm3
	vpternlogd	$224, %ymm3, %ymm1, %ymm4
	vmovaps	%ymm1, %ymm4 {%k1}
	vextractf128	$1, %ymm4, %xmm5
	vcmpunordps	%xmm4, %xmm4, %k1
	vmaxps	%xmm5, %xmm4, %xmm5
	vpternlogd	$224, %xmm3, %xmm4, %xmm5
	vmovaps	%xmm4, %xmm5 {%k1}
	vmovshdup	%xmm5, %xmm4
	vcmpunordss	%xmm5, %xmm5, %k1
	vshufpd	$1, %xmm5, %xmm5, %xmm6
	vmaxss	%xmm4, %xmm5, %xmm4
	vpternlogd	$224, %xmm3, %xmm5, %xmm4
	vmovss	%xmm5, %xmm4, %xmm4 {%k1}
	vmaxss	%xmm6, %xmm4, %xmm6
	vcmpunordss	%xmm4, %xmm4, %k1
	vpternlogd	$224, %xmm3, %xmm4, %xmm6
	vmovss	%xmm4, %xmm6, %xmm6 {%k1}
	vshufps	$255, %xmm5, %xmm5, %xmm4
	vmovss	.LCPI4_2(%rip), %xmm5
	vmaxss	%xmm4, %xmm6, %xmm4
	vcmpunordss	%xmm6, %xmm6, %k1
	vpternlogd	$224, %xmm3, %xmm6, %xmm4
	vmovss	%xmm6, %xmm4, %xmm4 {%k1}
	vextractf64x4	$1, %zmm0, %ymm6
	vcmpunordps	%ymm0, %ymm0, %k1
	vmaxps	%ymm6, %ymm0, %ymm6
	vpternlogd	$224, %ymm3, %ymm0, %ymm6
	vmaxss	%xmm4, %xmm5, %xmm4
	vmovaps	%ymm0, %ymm6 {%k1}
	vextractf128	$1, %ymm6, %xmm7
	vcmpunordps	%xmm6, %xmm6, %k1
	vbroadcastss	%xmm4, %zmm9
	vmaxps	%xmm7, %xmm6, %xmm7
	vsubps	%zmm9, %zmm1, %zmm1
	vpternlogd	$224, %xmm3, %xmm6, %xmm7
	vmovaps	%xmm6, %xmm7 {%k1}
	vmovshdup	%xmm7, %xmm6
	vcmpunordss	%xmm7, %xmm7, %k1
	vshufpd	$1, %xmm7, %xmm7, %xmm8
	vmaxss	%xmm6, %xmm7, %xmm6
	vmulps	%zmm10, %zmm1, %zmm1
	vpternlogd	$224, %xmm3, %xmm7, %xmm6
	vmovss	%xmm7, %xmm6, %xmm6 {%k1}
	vmaxps	%zmm1, %zmm11, %zmm1
	vmaxss	%xmm8, %xmm6, %xmm8
	vcmpunordss	%xmm6, %xmm6, %k1
	vpternlogd	$224, %xmm3, %xmm6, %xmm8
	vmovss	%xmm6, %xmm8, %xmm8 {%k1}
	vshufps	$255, %xmm7, %xmm7, %xmm6
	vmaxss	%xmm6, %xmm8, %xmm6
	vcmpunordss	%xmm8, %xmm8, %k1
	vpternlogd	$224, %xmm3, %xmm8, %xmm6
	vmovss	%xmm8, %xmm6, %xmm6 {%k1}
	vmaxss	%xmm6, %xmm5, %xmm3
	vbroadcastss	%xmm3, %zmm8
	vbroadcastss	.LCPI4_2(%rip), %xmm3
	vinsertps	$16, %xmm8, %xmm9, %xmm4
	vsubps	%zmm8, %zmm0, %zmm0
	vminps	%zmm1, %zmm12, %zmm8
	vmovaps	%zmm2, %zmm1
	vmulps	%zmm10, %zmm0, %zmm0
	vmaxps	%zmm0, %zmm11, %zmm0
	vsubps	%xmm4, %xmm3, %xmm3
	vmovaps	%xmm2, %xmm4
	vminps	%zmm0, %zmm12, %zmm0
	vmulps	%xmm3, %xmm10, %xmm3
	vmaxps	%xmm3, %xmm11, %xmm3
	vbroadcastss	.LCPI4_15(%rip), %zmm11
	vminps	%xmm3, %xmm12, %xmm5
	vbroadcastss	.LCPI4_6(%rip), %zmm3
	vfmadd213ps	%xmm3, %xmm5, %xmm4
	vfmadd213ps	%zmm3, %zmm8, %zmm1
	vfmadd213ps	%zmm3, %zmm0, %zmm2
	vroundps	$9, %xmm4, %xmm6
	vbroadcastss	.LCPI4_9(%rip), %zmm4
	vrndscaleps	$9, %zmm1, %zmm1
	vrndscaleps	$9, %zmm2, %zmm2
	vmaxps	%zmm2, %zmm13, %zmm2
	vmaxps	%xmm6, %xmm13, %xmm6
	vmaxps	%zmm1, %zmm13, %zmm1
	vminps	%zmm1, %zmm15, %zmm9
	vminps	%xmm6, %xmm15, %xmm7
	vminps	%zmm2, %zmm15, %zmm2
	vbroadcastss	.LCPI4_12(%rip), %zmm6
	vbroadcastss	.LCPI4_14(%rip), %zmm1
	vcvttps2dq	%zmm9, %zmm13
	vfmadd231ps	%xmm4, %xmm7, %xmm5
	vfmadd231ps	%zmm4, %zmm9, %zmm8
	vfmadd213ps	%zmm0, %zmm2, %zmm4
	vmovaps	%xmm18, %xmm0
	vfmadd231ps	%zmm16, %zmm2, %zmm4
	vfmadd231ps	%xmm16, %xmm7, %xmm5
	vfmadd231ps	%zmm16, %zmm9, %zmm8
	vcvttps2dq	%zmm2, %zmm2
	vmovaps	%xmm6, %xmm14
	vmovaps	%zmm6, %zmm10
	vfmadd213ps	%zmm17, %zmm8, %zmm10
	vfmadd213ps	%zmm17, %zmm4, %zmm6
	vfmadd213ps	%xmm17, %xmm5, %xmm14
	vmulps	%zmm4, %zmm4, %zmm22
	vpslld	$23, %zmm2, %zmm2
	vfmadd213ps	%zmm18, %zmm8, %zmm10
	vfmadd213ps	%zmm18, %zmm4, %zmm6
	vfmadd231ps	%xmm14, %xmm5, %xmm0
	vfmadd213ps	%zmm1, %zmm8, %zmm10
	vfmadd213ps	%zmm1, %zmm4, %zmm6
	vfmadd231ps	%xmm0, %xmm5, %xmm1
	vmovaps	%xmm11, %xmm0
	vfmadd231ps	%xmm1, %xmm5, %xmm0
	vmulps	%xmm5, %xmm5, %xmm1
	vfmadd213ps	%zmm11, %zmm8, %zmm10
	vfmadd213ps	%zmm11, %zmm4, %zmm6
	vfmadd213ps	%xmm3, %xmm5, %xmm0
	vfmadd213ps	%zmm3, %zmm4, %zmm6
	vfmadd213ps	%zmm3, %zmm8, %zmm10
	vmulps	%zmm8, %zmm8, %zmm3
	vfmadd213ps	%xmm5, %xmm0, %xmm1
	vbroadcastss	.LCPI4_16(%rip), %zmm0
	vcvttps2dq	%xmm7, %xmm5
	vpbroadcastd	.LCPI4_16(%rip), %zmm7
	vfmadd213ps	%zmm8, %zmm10, %zmm3
	vfmadd213ps	%zmm4, %zmm6, %zmm22
	vpslld	$23, %xmm5, %xmm5
	vpaddd	%xmm7, %xmm5, %xmm5
	vpaddd	%zmm7, %zmm2, %zmm2
	vaddps	%xmm0, %xmm1, %xmm1
	vaddps	%zmm0, %zmm22, %zmm4
	vaddps	%zmm0, %zmm3, %zmm3
	vmulps	%xmm5, %xmm1, %xmm1
	vxorps	%xmm5, %xmm5, %xmm5
	vmulps	%zmm2, %zmm4, %zmm2
	vmulps	%xmm5, %xmm1, %xmm1
	vpslld	$23, %zmm13, %zmm5
	vextractf64x4	$1, %zmm2, %ymm15
	vshufpd	$1, %xmm2, %xmm2, %xmm10
	vextractf128	$1, %ymm2, %xmm8
	vextractf32x4	$2, %zmm2, %xmm9
	vpaddd	%zmm7, %zmm5, %zmm5
	vmulps	%zmm5, %zmm3, %zmm3
	vshufpd	$1, %xmm15, %xmm15, %xmm18
	vextractf32x4	$1, %ymm15, %xmm19
	vshufpd	$1, %xmm8, %xmm8, %xmm11
	vinsertps	$28, %xmm2, %xmm3, %xmm12
	vfmadd132ps	400(%rsi,%rdx,4){1to4}, %xmm1, %xmm12
	vextractf64x4	$1, %zmm3, %ymm16
	vinsertps	$76, %xmm3, %xmm2, %xmm14
	vshufpd	$1, %xmm3, %xmm3, %xmm6
	vextractf128	$1, %ymm3, %xmm4
	vunpcklps	%zmm2, %zmm3, %zmm13
	vextractf32x4	$2, %zmm3, %xmm5
	vextractf32x4	$2, %zmm13, %xmm13
	vshufpd	$1, %xmm16, %xmm16, %xmm17
	vextractf32x4	$1, %ymm16, %xmm20
	vinsertps	$204, %xmm16, %xmm18, %xmm18
	vpermpd	$255, %ymm16, %ymm16
	vshufpd	$1, %xmm4, %xmm4, %xmm7
	vinsertps	$156, %xmm15, %xmm17, %xmm17
	vpermpd	$255, %ymm15, %ymm15
	vfmadd231ps	424(%rsi,%rdx,4){1to4}, %xmm14, %xmm12
	vinsertps	$28, %xmm19, %xmm20, %xmm21
	vinsertps	$76, %xmm20, %xmm19, %xmm19
	vinsertps	$204, %xmm3, %xmm10, %xmm14
	vinsertps	$28, %xmm15, %xmm16, %xmm20
	vinsertps	$76, %xmm16, %xmm15, %xmm15
	vinsertps	$156, %xmm2, %xmm6, %xmm16
	vfmadd231ps	448(%rsi,%rdx,4){1to4}, %xmm16, %xmm12
	vinsertps	$28, %xmm8, %xmm4, %xmm16
	vfmadd231ps	472(%rsi,%rdx,4){1to4}, %xmm14, %xmm12
	vinsertps	$76, %xmm4, %xmm8, %xmm14
	vfmadd231ps	496(%rsi,%rdx,4){1to4}, %xmm16, %xmm12
	vinsertps	$156, %xmm8, %xmm7, %xmm16
	vfmadd231ps	520(%rsi,%rdx,4){1to4}, %xmm14, %xmm12
	vinsertps	$204, %xmm4, %xmm11, %xmm14
	vfmadd231ps	544(%rsi,%rdx,4){1to4}, %xmm16, %xmm12
	vinsertps	$76, %xmm5, %xmm9, %xmm16
	vfmadd231ps	568(%rsi,%rdx,4){1to4}, %xmm14, %xmm12
	vmovshdup	%xmm3, %xmm14
	vfmadd231ps	592(%rsi,%rdx,4){1to4}, %xmm13, %xmm12
	vaddss	%xmm3, %xmm1, %xmm13
	vmovshdup	%xmm1, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	%xmm14, %xmm13, %xmm13
	vfmadd231ps	616(%rsi,%rdx,4){1to4}, %xmm16, %xmm12
	vaddss	%xmm6, %xmm13, %xmm6
	vshufps	$255, %xmm3, %xmm3, %xmm13
	vextractf32x4	$3, %zmm3, %xmm3
	vfmadd231ps	640(%rsi,%rdx,4){1to4}, %xmm17, %xmm12
	vaddss	%xmm6, %xmm13, %xmm6
	vmovshdup	%xmm4, %xmm13
	vaddss	%xmm4, %xmm6, %xmm6
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vfmadd231ps	664(%rsi,%rdx,4){1to4}, %xmm18, %xmm12
	vaddss	%xmm6, %xmm13, %xmm6
	vfmadd231ps	688(%rsi,%rdx,4){1to4}, %xmm21, %xmm12
	vaddss	%xmm7, %xmm6, %xmm6
	vfmadd231ps	712(%rsi,%rdx,4){1to4}, %xmm19, %xmm12
	vaddss	%xmm4, %xmm6, %xmm4
	vmovshdup	%xmm5, %xmm6
	vaddss	%xmm5, %xmm4, %xmm4
	vfmadd231ps	736(%rsi,%rdx,4){1to4}, %xmm20, %xmm12
	vaddss	%xmm6, %xmm4, %xmm4
	vshufpd	$1, %xmm5, %xmm5, %xmm6
	vshufps	$255, %xmm5, %xmm5, %xmm5
	vfmadd231ps	760(%rsi,%rdx,4){1to4}, %xmm15, %xmm12
	shlq	$6, %rdx
	.loc	5 15 8
	addq	16(%rcx), %rdx
	.loc	5 21 8
	vaddss	%xmm6, %xmm4, %xmm4
	vaddss	%xmm5, %xmm4, %xmm4
	vmovshdup	%xmm3, %xmm5
	vaddss	%xmm3, %xmm4, %xmm4
	vaddss	%xmm5, %xmm4, %xmm4
	vshufpd	$1, %xmm3, %xmm3, %xmm5
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm5, %xmm4, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovshdup	%xmm2, %xmm4
	vaddss	%xmm4, %xmm1, %xmm1
	vshufps	$255, %xmm2, %xmm2, %xmm4
	vextractf32x4	$3, %zmm2, %xmm2
	vaddss	%xmm1, %xmm10, %xmm1
	vaddss	%xmm4, %xmm1, %xmm1
	vmovshdup	%xmm8, %xmm4
	vaddss	%xmm1, %xmm8, %xmm1
	vaddss	%xmm4, %xmm1, %xmm1
	vshufps	$255, %xmm8, %xmm8, %xmm4
	vaddss	%xmm1, %xmm11, %xmm1
	vaddss	%xmm4, %xmm1, %xmm1
	vmovshdup	%xmm9, %xmm4
	vaddss	%xmm1, %xmm9, %xmm1
	vaddss	%xmm4, %xmm1, %xmm1
	vshufpd	$1, %xmm9, %xmm9, %xmm4
	vaddss	%xmm4, %xmm1, %xmm1
	vshufps	$255, %xmm9, %xmm9, %xmm4
	vaddss	%xmm4, %xmm1, %xmm1
	vmovshdup	%xmm2, %xmm4
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	%xmm4, %xmm1, %xmm1
	vshufpd	$1, %xmm2, %xmm2, %xmm4
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm4, %xmm1, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	vinsertps	$16, %xmm1, %xmm3, %xmm1
	vdivps	%xmm1, %xmm0, %xmm0
	vmulps	%xmm0, %xmm12, %xmm0
	vmovlps	%xmm0, 128(%rdx,%rax,4)
	.loc	5 26 8
	xorl	%eax, %eax
	.loc	5 26 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp10:
.Lfunc_end4:
	.size	main$async_dispatch_4_attention_2x16x16, .Lfunc_end4-main$async_dispatch_4_attention_2x16x16
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI5_0:
	.long	0xbaaa60fb
	.long	0xba9ec114
.LCPI5_1:
	.long	0xbd6a01d2
	.long	0xbcbffc29
	.section	".text.main$async_dispatch_5_matmul_16x2x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_5_matmul_16x2x2_f32,@function
main$async_dispatch_5_matmul_16x2x2_f32:
.Lfunc_begin5:
	.file	6 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_5.mlir"
	.loc	6 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp11:
	.loc	6 15 8 prologue_end
	movq	32(%rsi), %rax
	.loc	6 22 8
	movl	(%rdx), %edx
	vmovddup	.LCPI5_0(%rip), %xmm10
	vxorps	%xmm9, %xmm9, %xmm9
	.loc	6 15 8
	movq	(%rax), %rsi
	.loc	6 22 8
	leaq	(,%rdx,8), %rcx
	.loc	6 23 8
	movq	%rdx, %rdi
	shlq	$5, %rdx
	shlq	$6, %rdi
	.loc	6 17 8
	movq	8(%rax), %rax
	vbroadcastss	128(%rsi,%rdx), %xmm8
	vbroadcastss	132(%rsi,%rcx,4), %xmm11
	vbroadcastss	136(%rsi,%rcx,4), %xmm12
	vbroadcastss	140(%rsi,%rcx,4), %xmm13
	vbroadcastss	144(%rsi,%rcx,4), %xmm14
	vbroadcastss	148(%rsi,%rcx,4), %xmm15
	vbroadcastss	152(%rsi,%rcx,4), %xmm16
	.loc	6 23 8
	vmovsd	(%rsi,%rdi), %xmm0
	vmovsd	8(%rsi,%rcx,8), %xmm1
	vmovsd	16(%rsi,%rcx,8), %xmm2
	vmovsd	24(%rsi,%rcx,8), %xmm3
	vmovsd	32(%rsi,%rcx,8), %xmm4
	vmovsd	40(%rsi,%rcx,8), %xmm5
	vmovsd	48(%rsi,%rcx,8), %xmm6
	vmovsd	56(%rsi,%rcx,8), %xmm7
	vfmadd132ps	%xmm10, %xmm9, %xmm8
	vfmadd132ps	%xmm10, %xmm9, %xmm11
	vfmadd132ps	%xmm10, %xmm9, %xmm12
	vfmadd132ps	%xmm10, %xmm9, %xmm13
	vfmadd132ps	%xmm10, %xmm9, %xmm14
	vfmadd132ps	%xmm10, %xmm9, %xmm15
	vfmadd132ps	%xmm10, %xmm9, %xmm16
	vfmadd132ps	156(%rsi,%rcx,4){1to4}, %xmm9, %xmm10
	vmovddup	.LCPI5_1(%rip), %xmm9
	vfmadd231ps	192(%rsi,%rdx){1to4}, %xmm9, %xmm8
	vfmadd231ps	196(%rsi,%rdx){1to4}, %xmm9, %xmm11
	vfmadd231ps	200(%rsi,%rdx){1to4}, %xmm9, %xmm12
	vfmadd231ps	204(%rsi,%rdx){1to4}, %xmm9, %xmm13
	vfmadd231ps	208(%rsi,%rdx){1to4}, %xmm9, %xmm14
	vfmadd231ps	212(%rsi,%rdx){1to4}, %xmm9, %xmm15
	vfmadd231ps	216(%rsi,%rdx){1to4}, %xmm9, %xmm16
	vfmadd231ps	220(%rsi,%rdx){1to4}, %xmm9, %xmm10
	.loc	6 26 10
	vaddps	%xmm0, %xmm8, %xmm0
	vaddps	%xmm1, %xmm11, %xmm1
	vaddps	%xmm2, %xmm12, %xmm2
	vaddps	%xmm3, %xmm13, %xmm3
	vaddps	%xmm4, %xmm14, %xmm4
	vaddps	%xmm5, %xmm15, %xmm5
	vaddps	%xmm16, %xmm6, %xmm6
	vaddps	%xmm7, %xmm10, %xmm7
	vmovlps	%xmm0, 256(%rax,%rdi)
	vmovlps	%xmm1, 264(%rax,%rcx,8)
	vmovlps	%xmm2, 272(%rax,%rcx,8)
	vmovlps	%xmm3, 280(%rax,%rcx,8)
	vmovlps	%xmm4, 288(%rax,%rcx,8)
	vmovlps	%xmm5, 296(%rax,%rcx,8)
	vmovlps	%xmm6, 304(%rax,%rcx,8)
	vmovlps	%xmm7, 312(%rax,%rcx,8)
	.loc	6 30 8
	xorl	%eax, %eax
	.loc	6 30 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp12:
.Lfunc_end5:
	.size	main$async_dispatch_5_matmul_16x2x2_f32, .Lfunc_end5-main$async_dispatch_5_matmul_16x2x2_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI6_0:
	.long	0x3f000000
.LCPI6_1:
	.long	0x3727c5ac
.LCPI6_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_7_reduction_16x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_7_reduction_16x2_f32,@function
main$async_dispatch_7_reduction_16x2_f32:
.Lfunc_begin6:
	.file	7 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_7.mlir"
	.loc	7 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp13:
	.loc	7 16 8 prologue_end
	movq	32(%rsi), %rax
	.loc	7 22 8
	movl	(%rdx), %ecx
	vxorps	%xmm3, %xmm3, %xmm3
	.loc	7 16 8
	movq	(%rax), %rsi
	.loc	7 22 8
	shlq	$4, %rcx
	.loc	7 17 8
	movq	8(%rax), %rax
	.loc	7 22 8
	vmovsd	(%rsi,%rcx), %xmm0
	vmovsd	8(%rsi,%rcx), %xmm1
	.loc	7 25 10
	vmulps	%xmm0, %xmm0, %xmm2
	vaddss	%xmm3, %xmm2, %xmm4
	vmovshdup	%xmm2, %xmm2
	vaddss	%xmm2, %xmm4, %xmm2
	vmulps	%xmm1, %xmm1, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovshdup	%xmm4, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	.loc	7 35 10
	vxorps	%xmm4, %xmm4, %xmm4
	.loc	7 25 10
	vinsertps	$16, %xmm3, %xmm2, %xmm2
	.loc	7 30 10
	vmulps	.LCPI6_0(%rip){1to4}, %xmm2, %xmm2
	.loc	7 32 10
	vbroadcastss	.LCPI6_2(%rip), %xmm3
	.loc	7 31 10
	vaddps	.LCPI6_1(%rip){1to4}, %xmm2, %xmm2
	.loc	7 32 10
	vsqrtps	%xmm2, %xmm2
	vdivps	%xmm2, %xmm3, %xmm2
	vbroadcastss	%xmm2, %xmm3
	vmovshdup	%xmm2, %xmm2
	.loc	7 35 10
	vfmadd213ps	%xmm4, %xmm1, %xmm2
	vfmadd213ps	%xmm4, %xmm0, %xmm3
	vmovlps	%xmm3, 128(%rax,%rcx)
	vmovlps	%xmm2, 136(%rax,%rcx)
	.loc	7 39 8
	xorl	%eax, %eax
	.loc	7 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp14:
.Lfunc_end6:
	.size	main$async_dispatch_7_reduction_16x2_f32, .Lfunc_end6-main$async_dispatch_7_reduction_16x2_f32
	.cfi_endproc

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI7_0:
	.long	0x3c2972d7
	.long	0xbc662e0f
	.long	0xbba75974
	.long	0x3c739878
	.long	0x3bd53b21
	.long	0xbbaae5e2
	.long	0x3c8cf8da
	.long	0x3c413c1c
.LCPI7_1:
	.long	0x3b8085d5
	.long	0x3c976601
	.long	0x3c418114
	.long	0x3cd22a82
	.long	0xbc943ccf
	.long	0xbca723f7
	.long	0xbceafd90
	.long	0xbb1cef32
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI7_2:
	.long	0x3d372713
.LCPI7_3:
	.long	0x3f4c4229
.LCPI7_4:
	.long	0x40fff644
.LCPI7_5:
	.long	0xc0fff644
.LCPI7_6:
	.long	0x7fffffff
.LCPI7_7:
	.long	0x39d1b717
.LCPI7_8:
	.long	0x2a61337e
.LCPI7_9:
	.long	0xa59f25c0
.LCPI7_10:
	.long	0xaebd37ff
.LCPI7_11:
	.long	0x335c0041
.LCPI7_12:
	.long	0x3779434a
.LCPI7_13:
	.long	0x3a270ded
.LCPI7_14:
	.long	0x3ba059dc
.LCPI7_15:
	.long	0x38f895d6
.LCPI7_16:
	.long	0x35a0d3d8
.LCPI7_17:
	.long	0x3b14aa05
.LCPI7_18:
	.long	0x3ba059dd
.LCPI7_19:
	.long	0x3f800000
.LCPI7_20:
	.long	0x3f000000
	.section	".text.main$async_dispatch_8_matmul_16x8x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_8_matmul_16x8x2_f32,@function
main$async_dispatch_8_matmul_16x8x2_f32:
.Lfunc_begin7:
	.file	8 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_8.mlir"
	.loc	8 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-32, %rsp
	subq	$384, %rsp
.Ltmp15:
	.loc	8 19 8 prologue_end
	movq	32(%rsi), %rax
	.loc	8 24 8
	movl	(%rdx), %ecx
	vmovaps	.LCPI7_0(%rip), %ymm1
	vxorps	%xmm0, %xmm0, %xmm0
	.loc	8 29 10
	vbroadcastss	.LCPI7_2(%rip), %ymm16
	.loc	8 31 10
	vbroadcastss	.LCPI7_3(%rip), %ymm17
	.loc	8 32 10
	vbroadcastss	.LCPI7_5(%rip), %ymm28
	.loc	8 19 8
	movq	(%rax), %rsi
	movq	%rcx, %rdi
	shlq	$6, %rdi
	.loc	8 24 8
	leaq	(,%rcx,8), %rdx
	.loc	8 20 8
	movq	8(%rax), %rax
	.loc	8 35 10
	leaq	4(,%rcx,8), %r8
	leaq	5(,%rcx,8), %r9
	leaq	6(,%rcx,8), %r10
	leaq	7(,%rcx,8), %r11
	shlq	$5, %r8
	shlq	$5, %r9
	shlq	$5, %r10
	shlq	$5, %r11
	vbroadcastss	128(%rsi,%rdi), %ymm2
	vbroadcastss	144(%rsi,%rdx,8), %ymm4
	vbroadcastss	152(%rsi,%rdx,8), %ymm5
	vbroadcastss	160(%rsi,%rdx,8), %ymm6
	vbroadcastss	168(%rsi,%rdx,8), %ymm7
	vbroadcastss	176(%rsi,%rdx,8), %ymm8
	vfmadd132ps	%ymm1, %ymm0, %ymm2
	vfmadd132ps	%ymm1, %ymm0, %ymm4
	vfmadd132ps	%ymm1, %ymm0, %ymm5
	vfmadd132ps	%ymm1, %ymm0, %ymm6
	vfmadd132ps	%ymm1, %ymm0, %ymm7
	vfmadd132ps	%ymm1, %ymm0, %ymm8
	vmovaps	%ymm2, %ymm3
	vbroadcastss	136(%rsi,%rdx,8), %ymm2
	vfmadd132ps	%ymm1, %ymm0, %ymm2
	vfmadd132ps	184(%rsi,%rdx,8){1to8}, %ymm0, %ymm1
	vmovaps	.LCPI7_1(%rip), %ymm0
	vfmadd231ps	140(%rsi,%rdx,8){1to8}, %ymm0, %ymm2
	vfmadd231ps	132(%rsi,%rdi){1to8}, %ymm0, %ymm3
	vfmadd231ps	148(%rsi,%rdx,8){1to8}, %ymm0, %ymm4
	vfmadd231ps	156(%rsi,%rdx,8){1to8}, %ymm0, %ymm5
	vfmadd231ps	164(%rsi,%rdx,8){1to8}, %ymm0, %ymm6
	vfmadd231ps	172(%rsi,%rdx,8){1to8}, %ymm0, %ymm7
	vfmadd231ps	180(%rsi,%rdx,8){1to8}, %ymm0, %ymm8
	leaq	3(,%rcx,8), %rdi
	shlq	$5, %rdi
	vfmadd231ps	188(%rsi,%rdx,8){1to8}, %ymm0, %ymm1
	leaq	1(,%rcx,8), %rdx
	leaq	2(,%rcx,8), %rsi
	shlq	$8, %rcx
	shlq	$5, %rdx
	shlq	$5, %rsi
	.loc	8 28 10
	vmulps	%ymm2, %ymm2, %ymm9
	vmulps	%ymm3, %ymm3, %ymm0
	vmulps	%ymm4, %ymm4, %ymm10
	vmulps	%ymm5, %ymm5, %ymm11
	vmulps	%ymm6, %ymm6, %ymm12
	vmulps	%ymm7, %ymm7, %ymm13
	vmulps	%ymm8, %ymm8, %ymm14
	vmovaps	%ymm2, 160(%rsp)
	vmovaps	%ymm3, 128(%rsp)
	vmovaps	%ymm4, 192(%rsp)
	vmovaps	%ymm5, 224(%rsp)
	vmovaps	%ymm6, 256(%rsp)
	vmovaps	%ymm7, 288(%rsp)
	vmovaps	%ymm8, 320(%rsp)
	vmulps	%ymm2, %ymm9, %ymm9
	vmulps	%ymm1, %ymm1, %ymm15
	vmulps	%ymm0, %ymm3, %ymm0
	vmulps	%ymm4, %ymm10, %ymm10
	vmulps	%ymm5, %ymm11, %ymm11
	vmulps	%ymm6, %ymm12, %ymm12
	vmulps	%ymm7, %ymm13, %ymm13
	vmulps	%ymm14, %ymm8, %ymm14
	vmovaps	%ymm1, 96(%rsp)
	.loc	8 30 10
	vfmadd213ps	%ymm2, %ymm16, %ymm9
	.loc	8 28 10
	vmulps	%ymm1, %ymm15, %ymm15
	.loc	8 30 10
	vfmadd213ps	%ymm3, %ymm16, %ymm0
	vfmadd213ps	%ymm4, %ymm16, %ymm10
	vfmadd213ps	%ymm5, %ymm16, %ymm11
	vfmadd213ps	%ymm6, %ymm16, %ymm12
	vfmadd213ps	%ymm7, %ymm16, %ymm13
	vfmadd213ps	%ymm8, %ymm16, %ymm14
	vfmadd213ps	%ymm1, %ymm16, %ymm15
	.loc	8 31 10
	vmulps	%ymm17, %ymm9, %ymm16
	.loc	8 32 10
	vbroadcastss	.LCPI7_4(%rip), %ymm9
	.loc	8 31 10
	vmulps	%ymm17, %ymm11, %ymm19
	vmulps	%ymm17, %ymm12, %ymm20
	vmulps	%ymm17, %ymm10, %ymm18
	vmulps	%ymm17, %ymm13, %ymm21
	vmulps	%ymm17, %ymm14, %ymm22
	vmulps	%ymm17, %ymm0, %ymm0
	vmulps	%ymm17, %ymm15, %ymm17
	.loc	8 32 10
	vminps	%ymm16, %ymm9, %ymm11
	vminps	%ymm18, %ymm9, %ymm12
	vminps	%ymm19, %ymm9, %ymm23
	vminps	%ymm20, %ymm9, %ymm24
	vminps	%ymm0, %ymm9, %ymm10
	vminps	%ymm22, %ymm9, %ymm26
	vminps	%ymm17, %ymm9, %ymm27
	vminps	%ymm21, %ymm9, %ymm25
	vbroadcastss	.LCPI7_18(%rip), %ymm9
	vmaxps	%ymm11, %ymm28, %ymm14
	vmaxps	%ymm12, %ymm28, %ymm13
	vmaxps	%ymm23, %ymm28, %ymm12
	vbroadcastss	.LCPI7_6(%rip), %ymm23
	vmaxps	%ymm24, %ymm28, %ymm11
	vbroadcastss	.LCPI7_7(%rip), %ymm24
	vmaxps	%ymm27, %ymm28, %ymm1
	vmaxps	%ymm10, %ymm28, %ymm15
	vmaxps	%ymm26, %ymm28, %ymm2
	vmaxps	%ymm25, %ymm28, %ymm10
	vmulps	%ymm15, %ymm15, %ymm30
	vmulps	%ymm14, %ymm14, %ymm29
	vmulps	%ymm13, %ymm13, %ymm28
	vmulps	%ymm12, %ymm12, %ymm27
	vmulps	%ymm11, %ymm11, %ymm26
	vmulps	%ymm2, %ymm2, %ymm25
	vmulps	%ymm1, %ymm1, %ymm31
	vmovaps	%ymm1, 32(%rsp)
	vbroadcastss	.LCPI7_13(%rip), %ymm1
	vmovaps	%ymm2, 64(%rsp)
	vandps	%ymm23, %ymm0, %ymm0
	vandps	%ymm23, %ymm16, %ymm16
	vandps	%ymm23, %ymm22, %ymm22
	vandps	%ymm23, %ymm18, %ymm18
	vandps	%ymm23, %ymm19, %ymm19
	vandps	%ymm23, %ymm20, %ymm20
	vandps	%ymm23, %ymm21, %ymm21
	vandps	%ymm23, %ymm17, %ymm17
	vcmpltps	%ymm24, %ymm0, %k1
	vcmpltps	%ymm24, %ymm16, %k7
	vbroadcastss	.LCPI7_9(%rip), %ymm16
	vbroadcastss	.LCPI7_8(%rip), %ymm0
	vcmpltps	%ymm24, %ymm22, %k2
	vcmpltps	%ymm24, %ymm18, %k6
	vcmpltps	%ymm24, %ymm19, %k5
	vcmpltps	%ymm24, %ymm20, %k4
	vcmpltps	%ymm24, %ymm21, %k3
	kmovw	%k2, 28(%rsp)
	vcmpltps	%ymm24, %ymm17, %k2
	vmulps	%ymm10, %ymm10, %ymm24
	kmovw	%k2, 30(%rsp)
	vmovaps	%ymm16, %ymm17
	vmovaps	%ymm16, %ymm18
	vmovaps	%ymm16, %ymm19
	vmovaps	%ymm16, %ymm20
	vmovaps	%ymm16, %ymm21
	vmovaps	%ymm16, %ymm22
	vmovaps	%ymm16, %ymm23
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI7_10(%rip), %ymm0
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI7_11(%rip), %ymm0
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI7_12(%rip), %ymm0
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI7_14(%rip), %ymm0
	vfmadd213ps	%ymm1, %ymm30, %ymm17
	vfmadd213ps	%ymm1, %ymm29, %ymm18
	vfmadd213ps	%ymm1, %ymm28, %ymm19
	vfmadd213ps	%ymm1, %ymm27, %ymm20
	vfmadd213ps	%ymm1, %ymm26, %ymm21
	vfmadd213ps	%ymm1, %ymm24, %ymm22
	vfmadd213ps	%ymm1, %ymm25, %ymm23
	vfmadd213ps	%ymm1, %ymm31, %ymm16
	vbroadcastss	.LCPI7_15(%rip), %ymm1
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI7_16(%rip), %ymm0
	vmovaps	%ymm0, %ymm2
	vmovaps	%ymm0, %ymm3
	vmovaps	%ymm0, %ymm4
	vmovaps	%ymm0, %ymm5
	vmovaps	%ymm0, %ymm6
	vmovaps	%ymm0, %ymm7
	vmovaps	%ymm0, %ymm8
	vfmadd213ps	%ymm1, %ymm30, %ymm2
	vfmadd213ps	%ymm1, %ymm29, %ymm3
	vfmadd213ps	%ymm1, %ymm28, %ymm4
	vfmadd213ps	%ymm1, %ymm27, %ymm5
	vfmadd213ps	%ymm1, %ymm26, %ymm6
	vfmadd213ps	%ymm1, %ymm24, %ymm7
	vfmadd213ps	%ymm1, %ymm25, %ymm8
	vfmadd213ps	%ymm1, %ymm31, %ymm0
	vbroadcastss	.LCPI7_17(%rip), %ymm1
	vfmadd213ps	%ymm1, %ymm30, %ymm2
	vfmadd213ps	%ymm1, %ymm29, %ymm3
	vfmadd213ps	%ymm1, %ymm28, %ymm4
	vfmadd213ps	%ymm1, %ymm27, %ymm5
	vfmadd213ps	%ymm1, %ymm26, %ymm6
	vfmadd213ps	%ymm1, %ymm24, %ymm7
	vfmadd213ps	%ymm1, %ymm25, %ymm8
	vfmadd213ps	%ymm1, %ymm31, %ymm0
	vmulps	%ymm17, %ymm15, %ymm1
	vmovaps	64(%rsp), %ymm17
	vfmadd213ps	%ymm9, %ymm30, %ymm2
	vfmadd213ps	%ymm9, %ymm29, %ymm3
	vfmadd213ps	%ymm9, %ymm28, %ymm4
	vfmadd213ps	%ymm9, %ymm27, %ymm5
	vfmadd213ps	%ymm9, %ymm26, %ymm6
	vfmadd213ps	%ymm9, %ymm24, %ymm7
	vfmadd213ps	%ymm9, %ymm25, %ymm8
	vfmadd213ps	%ymm9, %ymm31, %ymm0
	vmovaps	32(%rsp), %ymm9
	vdivps	%ymm2, %ymm1, %ymm1
	vmulps	%ymm18, %ymm14, %ymm2
	vdivps	%ymm3, %ymm2, %ymm2
	vmulps	%ymm19, %ymm13, %ymm3
	vdivps	%ymm4, %ymm3, %ymm3
	vmulps	%ymm20, %ymm12, %ymm4
	vdivps	%ymm5, %ymm4, %ymm4
	vmulps	%ymm21, %ymm11, %ymm5
	vmovaps	%ymm15, %ymm1 {%k1}
	kmovw	28(%rsp), %k1
	vdivps	%ymm6, %ymm5, %ymm5
	vmulps	%ymm22, %ymm10, %ymm6
	vmovaps	%ymm14, %ymm2 {%k7}
	vdivps	%ymm7, %ymm6, %ymm6
	vmulps	%ymm23, %ymm17, %ymm7
	vmovaps	%ymm13, %ymm3 {%k6}
	vdivps	%ymm8, %ymm7, %ymm7
	vmulps	%ymm16, %ymm9, %ymm8
	vmovaps	%ymm12, %ymm4 {%k5}
	vdivps	%ymm0, %ymm8, %ymm0
	.loc	8 33 10
	vbroadcastss	.LCPI7_19(%rip), %ymm8
	.loc	8 32 10
	vmovaps	%ymm11, %ymm5 {%k4}
	vmovaps	%ymm10, %ymm6 {%k3}
	vmovaps	%ymm17, %ymm7 {%k1}
	kmovw	30(%rsp), %k1
	.loc	8 33 10
	vaddps	%ymm1, %ymm8, %ymm1
	vaddps	%ymm2, %ymm8, %ymm2
	vaddps	%ymm3, %ymm8, %ymm3
	vaddps	%ymm4, %ymm8, %ymm4
	vaddps	%ymm5, %ymm8, %ymm5
	vaddps	%ymm6, %ymm8, %ymm6
	vaddps	%ymm7, %ymm8, %ymm7
	.loc	8 32 10
	vmovaps	%ymm9, %ymm0 {%k1}
	.loc	8 33 10
	vaddps	%ymm0, %ymm8, %ymm0
	.loc	8 34 10
	vbroadcastss	.LCPI7_20(%rip), %ymm8
	vmulps	160(%rsp), %ymm8, %ymm11
	vmulps	192(%rsp), %ymm8, %ymm10
	vmulps	128(%rsp), %ymm8, %ymm9
	.loc	8 35 10
	vmulps	%ymm2, %ymm11, %ymm2
	vmulps	%ymm3, %ymm10, %ymm3
	.loc	8 34 10
	vmulps	224(%rsp), %ymm8, %ymm11
	vmulps	256(%rsp), %ymm8, %ymm10
	.loc	8 35 10
	vmulps	%ymm1, %ymm9, %ymm1
	vmovaps	%ymm1, 384(%rax,%rcx)
	vmovaps	%ymm2, 384(%rax,%rdx)
	vmovaps	%ymm3, 384(%rax,%rsi)
	vmulps	%ymm4, %ymm11, %ymm4
	vmulps	%ymm5, %ymm10, %ymm5
	.loc	8 34 10
	vmulps	288(%rsp), %ymm8, %ymm11
	vmulps	320(%rsp), %ymm8, %ymm10
	vmulps	96(%rsp), %ymm8, %ymm8
	.loc	8 35 10
	vmovaps	%ymm4, 384(%rax,%rdi)
	vmovaps	%ymm5, 384(%rax,%r8)
	vmulps	%ymm6, %ymm11, %ymm6
	vmulps	%ymm7, %ymm10, %ymm7
	vmulps	%ymm0, %ymm8, %ymm0
	vmovaps	%ymm6, 384(%rax,%r9)
	vmovaps	%ymm7, 384(%rax,%r10)
	vmovaps	%ymm0, 384(%rax,%r11)
	.loc	8 39 8
	xorl	%eax, %eax
	movq	%rbp, %rsp
	.loc	8 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp16:
.Lfunc_end7:
	.size	main$async_dispatch_8_matmul_16x8x2_f32, .Lfunc_end7-main$async_dispatch_8_matmul_16x8x2_f32
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI8_0:
	.long	0xbd1e8022
	.long	0x3cd74f7d
.LCPI8_1:
	.long	0xbb891937
	.long	0x3c173f0d
.LCPI8_2:
	.long	0xba8ae506
	.long	0x3cc38d50
.LCPI8_3:
	.long	0x3c0bfa72
	.long	0x3a2c0c09
.LCPI8_4:
	.long	0xbb37ce39
	.long	0x3d87d595
.LCPI8_5:
	.long	0xbb980b18
	.long	0x3d32ba10
.LCPI8_6:
	.long	0x3caf0a37
	.long	0x3b886ff4
.LCPI8_7:
	.long	0x3c86589d
	.long	0x3c471ded
	.section	".text.main$async_dispatch_9_matmul_16x2x8_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_9_matmul_16x2x8_f32,@function
main$async_dispatch_9_matmul_16x2x8_f32:
.Lfunc_begin8:
	.file	9 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_9.mlir"
	.loc	9 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp17:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.loc	9 15 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	9 22 8
	movl	(%rdx), %r10d
	vmovddup	.LCPI8_0(%rip), %xmm9
	vxorps	%xmm16, %xmm16, %xmm16
	.loc	9 15 8
	movq	(%rcx), %rsi
	.loc	9 23 8
	leaq	1(,%r10,8), %r15
	leaq	2(,%r10,8), %r14
	leaq	3(,%r10,8), %r11
	leaq	4(,%r10,8), %rdi
	leaq	5(,%r10,8), %rbx
	leaq	6(,%r10,8), %r9
	.loc	9 22 8
	leaq	(,%r10,8), %rax
	.loc	9 23 8
	movq	%r10, %rdx
	leaq	7(,%r10,8), %r8
	shlq	$8, %r10
	shlq	$6, %rdx
	.loc	9 17 8
	movq	8(%rcx), %rcx
	shlq	$5, %r15
	shlq	$5, %r14
	shlq	$5, %r11
	shlq	$5, %rdi
	shlq	$5, %rbx
	shlq	$5, %r9
	shlq	$5, %r8
	vbroadcastss	384(%rsi,%r10), %xmm8
	vbroadcastss	384(%rsi,%r15), %xmm10
	vbroadcastss	384(%rsi,%r14), %xmm11
	vbroadcastss	384(%rsi,%r11), %xmm12
	vbroadcastss	384(%rsi,%rdi), %xmm13
	vbroadcastss	384(%rsi,%rbx), %xmm14
	vbroadcastss	384(%rsi,%r9), %xmm15
	.loc	9 23 8
	vmovsd	256(%rsi,%rdx), %xmm0
	vmovsd	264(%rsi,%rax,8), %xmm2
	vmovsd	272(%rsi,%rax,8), %xmm1
	vmovsd	280(%rsi,%rax,8), %xmm5
	vmovsd	288(%rsi,%rax,8), %xmm3
	vmovsd	296(%rsi,%rax,8), %xmm6
	vmovsd	304(%rsi,%rax,8), %xmm4
	vmovsd	312(%rsi,%rax,8), %xmm7
	vfmadd132ps	%xmm9, %xmm16, %xmm8
	vfmadd132ps	%xmm9, %xmm16, %xmm10
	vfmadd132ps	%xmm9, %xmm16, %xmm11
	vfmadd132ps	%xmm9, %xmm16, %xmm12
	vfmadd132ps	%xmm9, %xmm16, %xmm13
	vfmadd132ps	%xmm9, %xmm16, %xmm14
	vfmadd132ps	%xmm9, %xmm16, %xmm15
	vfmadd132ps	384(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI8_1(%rip), %xmm16
	vfmadd231ps	388(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	388(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	388(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	388(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	388(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	388(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	388(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	388(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI8_2(%rip), %xmm16
	vfmadd231ps	392(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	392(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	392(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	392(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	392(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	392(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	392(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	392(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI8_3(%rip), %xmm16
	vfmadd231ps	396(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	396(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	396(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	396(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	396(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	396(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	396(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	396(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI8_4(%rip), %xmm16
	vfmadd231ps	400(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	400(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	400(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	400(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	400(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	400(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	400(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	400(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI8_5(%rip), %xmm16
	vfmadd231ps	404(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	404(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	404(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	404(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	404(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	404(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	404(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	404(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI8_6(%rip), %xmm16
	vfmadd231ps	408(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	408(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	408(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	408(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	408(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	408(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	408(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	408(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI8_7(%rip), %xmm16
	vfmadd231ps	412(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	412(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	412(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	412(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	412(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	412(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	412(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	412(%rsi,%r8){1to4}, %xmm16, %xmm9
	.loc	9 26 10
	vaddps	%xmm0, %xmm8, %xmm0
	vaddps	%xmm2, %xmm10, %xmm2
	vaddps	%xmm1, %xmm11, %xmm1
	vaddps	%xmm5, %xmm12, %xmm5
	vaddps	%xmm3, %xmm13, %xmm3
	vaddps	%xmm6, %xmm14, %xmm6
	vaddps	%xmm4, %xmm15, %xmm4
	vaddps	%xmm7, %xmm9, %xmm7
	vmovlps	%xmm0, (%rcx,%rdx)
	vmovlps	%xmm2, 8(%rcx,%rax,8)
	vmovlps	%xmm1, 16(%rcx,%rax,8)
	vmovlps	%xmm5, 24(%rcx,%rax,8)
	vmovlps	%xmm3, 32(%rcx,%rax,8)
	vmovlps	%xmm6, 40(%rcx,%rax,8)
	vmovlps	%xmm4, 48(%rcx,%rax,8)
	vmovlps	%xmm7, 56(%rcx,%rax,8)
	.loc	9 30 8
	xorl	%eax, %eax
	.loc	9 30 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp18:
.Lfunc_end8:
	.size	main$async_dispatch_9_matmul_16x2x8_f32, .Lfunc_end8-main$async_dispatch_9_matmul_16x2x8_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI9_0:
	.long	0x3f000000
.LCPI9_1:
	.long	0x3727c5ac
.LCPI9_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_11_reduction_16x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_11_reduction_16x2_f32,@function
main$async_dispatch_11_reduction_16x2_f32:
.Lfunc_begin9:
	.file	10 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_11.mlir"
	.loc	10 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp19:
	.loc	10 16 8 prologue_end
	movq	32(%rsi), %rax
	.loc	10 22 8
	movl	(%rdx), %ecx
	vxorps	%xmm3, %xmm3, %xmm3
	.loc	10 16 8
	movq	(%rax), %rsi
	.loc	10 22 8
	shlq	$4, %rcx
	.loc	10 17 8
	movq	8(%rax), %rax
	.loc	10 22 8
	vmovsd	128(%rsi,%rcx), %xmm0
	vmovsd	136(%rsi,%rcx), %xmm1
	.loc	10 25 10
	vmulps	%xmm0, %xmm0, %xmm2
	vaddss	%xmm3, %xmm2, %xmm4
	vmovshdup	%xmm2, %xmm2
	vaddss	%xmm2, %xmm4, %xmm2
	vmulps	%xmm1, %xmm1, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovshdup	%xmm4, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	.loc	10 35 10
	vxorps	%xmm4, %xmm4, %xmm4
	.loc	10 25 10
	vinsertps	$16, %xmm3, %xmm2, %xmm2
	.loc	10 30 10
	vmulps	.LCPI9_0(%rip){1to4}, %xmm2, %xmm2
	.loc	10 32 10
	vbroadcastss	.LCPI9_2(%rip), %xmm3
	.loc	10 31 10
	vaddps	.LCPI9_1(%rip){1to4}, %xmm2, %xmm2
	.loc	10 32 10
	vsqrtps	%xmm2, %xmm2
	vdivps	%xmm2, %xmm3, %xmm2
	vbroadcastss	%xmm2, %xmm3
	vmovshdup	%xmm2, %xmm2
	.loc	10 35 10
	vfmadd213ps	%xmm4, %xmm1, %xmm2
	vfmadd213ps	%xmm4, %xmm0, %xmm3
	vmovlps	%xmm3, 256(%rax,%rcx)
	vmovlps	%xmm2, 264(%rax,%rcx)
	.loc	10 39 8
	xorl	%eax, %eax
	.loc	10 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp20:
.Lfunc_end9:
	.size	main$async_dispatch_11_reduction_16x2_f32, .Lfunc_end9-main$async_dispatch_11_reduction_16x2_f32
	.cfi_endproc

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI10_0:
	.long	0x3c321ca4
	.long	0x3bde48d2
	.long	0xbbafb683
	.long	0xba8d8c60
	.long	0xbc5f907e
	.long	0x3ae8d3c2
	.zero	4
	.zero	4
.LCPI10_1:
	.long	0xbbc1226d
	.long	0xbcb5453f
	.long	0xbabfee2d
	.long	0x3c91eb33
	.long	0x3bc78172
	.long	0xbb92ac77
	.zero	4
	.zero	4
	.section	".text.main$async_dispatch_12_matmul_16x6x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_12_matmul_16x6x2_f32,@function
main$async_dispatch_12_matmul_16x6x2_f32:
.Lfunc_begin10:
	.file	11 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_12.mlir"
	.loc	11 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp21:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.loc	11 14 8 prologue_end
	movq	32(%rsi), %rax
	.loc	11 19 8
	movl	(%rdx), %r14d
	vmovaps	.LCPI10_0(%rip), %ymm0
	vxorps	%xmm1, %xmm1, %xmm1
	.loc	11 14 8
	movq	(%rax), %rsi
	.loc	11 19 8
	leaq	(,%r14,8), %r10
	.loc	11 22 10
	leaq	6(,%r14,8), %rdx
	leaq	7(,%r14,8), %rcx
	leaq	(%r14,%r14,2), %r15
	leaq	1(,%r14,8), %rbx
	leaq	2(,%r14,8), %r11
	leaq	3(,%r14,8), %r9
	leaq	4(,%r14,8), %r8
	leaq	5(,%r14,8), %rdi
	shlq	$6, %r14
	.loc	11 15 8
	movq	8(%rax), %rax
	.loc	11 22 10
	shlq	$6, %r15
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rcx,%rcx,2), %rcx
	vbroadcastss	256(%rsi,%r14), %ymm2
	vbroadcastss	264(%rsi,%r10,8), %ymm3
	vbroadcastss	272(%rsi,%r10,8), %ymm4
	vbroadcastss	280(%rsi,%r10,8), %ymm5
	vbroadcastss	288(%rsi,%r10,8), %ymm6
	vbroadcastss	296(%rsi,%r10,8), %ymm7
	vbroadcastss	304(%rsi,%r10,8), %ymm8
	vfmadd132ps	%ymm0, %ymm1, %ymm2
	vfmadd132ps	%ymm0, %ymm1, %ymm3
	vfmadd132ps	%ymm0, %ymm1, %ymm4
	vfmadd132ps	%ymm0, %ymm1, %ymm5
	vfmadd132ps	%ymm0, %ymm1, %ymm6
	vfmadd132ps	%ymm0, %ymm1, %ymm7
	vfmadd132ps	%ymm0, %ymm1, %ymm8
	vfmadd132ps	312(%rsi,%r10,8){1to8}, %ymm1, %ymm0
	vmovaps	.LCPI10_1(%rip), %ymm1
	vfmadd231ps	260(%rsi,%r14){1to8}, %ymm1, %ymm2
	vfmadd231ps	268(%rsi,%r10,8){1to8}, %ymm1, %ymm3
	vfmadd231ps	276(%rsi,%r10,8){1to8}, %ymm1, %ymm4
	vfmadd231ps	284(%rsi,%r10,8){1to8}, %ymm1, %ymm5
	vfmadd231ps	292(%rsi,%r10,8){1to8}, %ymm1, %ymm6
	vfmadd231ps	300(%rsi,%r10,8){1to8}, %ymm1, %ymm7
	vfmadd231ps	308(%rsi,%r10,8){1to8}, %ymm1, %ymm8
	vfmadd231ps	316(%rsi,%r10,8){1to8}, %ymm1, %ymm0
	leaq	(%rbx,%rbx,2), %rsi
	leaq	(%r11,%r11,2), %r10
	vextractf128	$1, %ymm2, %xmm1
	vmovaps	%xmm2, 384(%rax,%r15)
	vextractf128	$1, %ymm3, %xmm2
	vmovlps	%xmm1, 400(%rax,%r15)
	vmovlps	%xmm2, 400(%rax,%rsi,8)
	vmovups	%xmm3, 384(%rax,%rsi,8)
	vextractf128	$1, %ymm4, %xmm3
	leaq	(%r9,%r9,2), %rsi
	vextractf128	$1, %ymm5, %xmm2
	vmovaps	%xmm4, 384(%rax,%r10,8)
	vmovlps	%xmm3, 400(%rax,%r10,8)
	vmovlps	%xmm2, 400(%rax,%rsi,8)
	vmovups	%xmm5, 384(%rax,%rsi,8)
	leaq	(%r8,%r8,2), %rsi
	vextractf128	$1, %ymm6, %xmm3
	vextractf128	$1, %ymm7, %xmm2
	vmovlps	%xmm3, 400(%rax,%rsi,8)
	vmovaps	%xmm6, 384(%rax,%rsi,8)
	leaq	(%rdi,%rdi,2), %rsi
	vextractf128	$1, %ymm8, %xmm3
	vmovlps	%xmm2, 400(%rax,%rsi,8)
	vextractf128	$1, %ymm0, %xmm2
	vmovups	%xmm7, 384(%rax,%rsi,8)
	vmovlps	%xmm3, 400(%rax,%rdx,8)
	vmovaps	%xmm8, 384(%rax,%rdx,8)
	vmovups	%xmm0, 384(%rax,%rcx,8)
	vmovlps	%xmm2, 400(%rax,%rcx,8)
	.loc	11 26 8
	xorl	%eax, %eax
	.loc	11 26 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp22:
.Lfunc_end10:
	.size	main$async_dispatch_12_matmul_16x6x2_f32, .Lfunc_end10-main$async_dispatch_12_matmul_16x6x2_f32
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI11_0:
	.long	0x3bf2d4c5
	.long	0x3c29fce5
.LCPI11_1:
	.long	0x3c96c9bf
	.long	0xbcac9355
	.section	".text.main$async_dispatch_14_matmul_16x2x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_14_matmul_16x2x2_f32,@function
main$async_dispatch_14_matmul_16x2x2_f32:
.Lfunc_begin11:
	.file	12 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_14.mlir"
	.loc	12 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp23:
	.loc	12 15 8 prologue_end
	movq	32(%rsi), %rax
	.loc	12 22 8
	movl	(%rdx), %edx
	vmovddup	.LCPI11_0(%rip), %xmm10
	vxorps	%xmm9, %xmm9, %xmm9
	.loc	12 15 8
	movq	(%rax), %rsi
	.loc	12 22 8
	leaq	(,%rdx,8), %rcx
	.loc	12 23 8
	movq	%rdx, %rdi
	shlq	$5, %rdx
	shlq	$6, %rdi
	.loc	12 17 8
	movq	8(%rax), %rax
	vbroadcastss	128(%rsi,%rdx), %xmm8
	vbroadcastss	132(%rsi,%rcx,4), %xmm11
	vbroadcastss	136(%rsi,%rcx,4), %xmm12
	vbroadcastss	140(%rsi,%rcx,4), %xmm13
	vbroadcastss	144(%rsi,%rcx,4), %xmm14
	vbroadcastss	148(%rsi,%rcx,4), %xmm15
	vbroadcastss	152(%rsi,%rcx,4), %xmm16
	.loc	12 23 8
	vmovsd	(%rsi,%rdi), %xmm0
	vmovsd	8(%rsi,%rcx,8), %xmm1
	vmovsd	16(%rsi,%rcx,8), %xmm2
	vmovsd	24(%rsi,%rcx,8), %xmm3
	vmovsd	32(%rsi,%rcx,8), %xmm4
	vmovsd	40(%rsi,%rcx,8), %xmm5
	vmovsd	48(%rsi,%rcx,8), %xmm6
	vmovsd	56(%rsi,%rcx,8), %xmm7
	vfmadd132ps	%xmm10, %xmm9, %xmm8
	vfmadd132ps	%xmm10, %xmm9, %xmm11
	vfmadd132ps	%xmm10, %xmm9, %xmm12
	vfmadd132ps	%xmm10, %xmm9, %xmm13
	vfmadd132ps	%xmm10, %xmm9, %xmm14
	vfmadd132ps	%xmm10, %xmm9, %xmm15
	vfmadd132ps	%xmm10, %xmm9, %xmm16
	vfmadd132ps	156(%rsi,%rcx,4){1to4}, %xmm9, %xmm10
	vmovddup	.LCPI11_1(%rip), %xmm9
	vfmadd231ps	192(%rsi,%rdx){1to4}, %xmm9, %xmm8
	vfmadd231ps	196(%rsi,%rdx){1to4}, %xmm9, %xmm11
	vfmadd231ps	200(%rsi,%rdx){1to4}, %xmm9, %xmm12
	vfmadd231ps	204(%rsi,%rdx){1to4}, %xmm9, %xmm13
	vfmadd231ps	208(%rsi,%rdx){1to4}, %xmm9, %xmm14
	vfmadd231ps	212(%rsi,%rdx){1to4}, %xmm9, %xmm15
	vfmadd231ps	216(%rsi,%rdx){1to4}, %xmm9, %xmm16
	vfmadd231ps	220(%rsi,%rdx){1to4}, %xmm9, %xmm10
	.loc	12 26 10
	vaddps	%xmm0, %xmm8, %xmm0
	vaddps	%xmm1, %xmm11, %xmm1
	vaddps	%xmm2, %xmm12, %xmm2
	vaddps	%xmm3, %xmm13, %xmm3
	vaddps	%xmm4, %xmm14, %xmm4
	vaddps	%xmm5, %xmm15, %xmm5
	vaddps	%xmm16, %xmm6, %xmm6
	vaddps	%xmm7, %xmm10, %xmm7
	vmovlps	%xmm0, 256(%rax,%rdi)
	vmovlps	%xmm1, 264(%rax,%rcx,8)
	vmovlps	%xmm2, 272(%rax,%rcx,8)
	vmovlps	%xmm3, 280(%rax,%rcx,8)
	vmovlps	%xmm4, 288(%rax,%rcx,8)
	vmovlps	%xmm5, 296(%rax,%rcx,8)
	vmovlps	%xmm6, 304(%rax,%rcx,8)
	vmovlps	%xmm7, 312(%rax,%rcx,8)
	.loc	12 30 8
	xorl	%eax, %eax
	.loc	12 30 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp24:
.Lfunc_end11:
	.size	main$async_dispatch_14_matmul_16x2x2_f32, .Lfunc_end11-main$async_dispatch_14_matmul_16x2x2_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI12_0:
	.long	0x3f000000
.LCPI12_1:
	.long	0x3727c5ac
.LCPI12_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_16_reduction_16x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_16_reduction_16x2_f32,@function
main$async_dispatch_16_reduction_16x2_f32:
.Lfunc_begin12:
	.file	13 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_16.mlir"
	.loc	13 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp25:
	.loc	13 16 8 prologue_end
	movq	32(%rsi), %rax
	.loc	13 22 8
	movl	(%rdx), %ecx
	vxorps	%xmm3, %xmm3, %xmm3
	.loc	13 16 8
	movq	(%rax), %rsi
	.loc	13 22 8
	shlq	$4, %rcx
	.loc	13 17 8
	movq	8(%rax), %rax
	.loc	13 22 8
	vmovsd	(%rsi,%rcx), %xmm0
	vmovsd	8(%rsi,%rcx), %xmm1
	.loc	13 25 10
	vmulps	%xmm0, %xmm0, %xmm2
	vaddss	%xmm3, %xmm2, %xmm4
	vmovshdup	%xmm2, %xmm2
	vaddss	%xmm2, %xmm4, %xmm2
	vmulps	%xmm1, %xmm1, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovshdup	%xmm4, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	.loc	13 35 10
	vxorps	%xmm4, %xmm4, %xmm4
	.loc	13 25 10
	vinsertps	$16, %xmm3, %xmm2, %xmm2
	.loc	13 30 10
	vmulps	.LCPI12_0(%rip){1to4}, %xmm2, %xmm2
	.loc	13 32 10
	vbroadcastss	.LCPI12_2(%rip), %xmm3
	.loc	13 31 10
	vaddps	.LCPI12_1(%rip){1to4}, %xmm2, %xmm2
	.loc	13 32 10
	vsqrtps	%xmm2, %xmm2
	vdivps	%xmm2, %xmm3, %xmm2
	vbroadcastss	%xmm2, %xmm3
	vmovshdup	%xmm2, %xmm2
	.loc	13 35 10
	vfmadd213ps	%xmm4, %xmm1, %xmm2
	vfmadd213ps	%xmm4, %xmm0, %xmm3
	vmovlps	%xmm3, 128(%rax,%rcx)
	vmovlps	%xmm2, 136(%rax,%rcx)
	.loc	13 39 8
	xorl	%eax, %eax
	.loc	13 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp26:
.Lfunc_end12:
	.size	main$async_dispatch_16_reduction_16x2_f32, .Lfunc_end12-main$async_dispatch_16_reduction_16x2_f32
	.cfi_endproc

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI13_0:
	.long	0x3cc1be42
	.long	0x3cbed4e4
	.long	0x3c59ace6
	.long	0x3c5792a0
	.long	0xbcca42cf
	.long	0xbb03023d
	.long	0x3bc25318
	.long	0xbca5e6dc
.LCPI13_1:
	.long	0xbd15c0ba
	.long	0x3d0bacec
	.long	0xba9ef09d
	.long	0xbcaa8b30
	.long	0x3c9df0ca
	.long	0xbb99e056
	.long	0xbc5360c9
	.long	0xbd4863fb
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI13_2:
	.long	0x3d372713
.LCPI13_3:
	.long	0x3f4c4229
.LCPI13_4:
	.long	0x40fff644
.LCPI13_5:
	.long	0xc0fff644
.LCPI13_6:
	.long	0x7fffffff
.LCPI13_7:
	.long	0x39d1b717
.LCPI13_8:
	.long	0x2a61337e
.LCPI13_9:
	.long	0xa59f25c0
.LCPI13_10:
	.long	0xaebd37ff
.LCPI13_11:
	.long	0x335c0041
.LCPI13_12:
	.long	0x3779434a
.LCPI13_13:
	.long	0x3a270ded
.LCPI13_14:
	.long	0x3ba059dc
.LCPI13_15:
	.long	0x38f895d6
.LCPI13_16:
	.long	0x35a0d3d8
.LCPI13_17:
	.long	0x3b14aa05
.LCPI13_18:
	.long	0x3ba059dd
.LCPI13_19:
	.long	0x3f800000
.LCPI13_20:
	.long	0x3f000000
	.section	".text.main$async_dispatch_17_matmul_16x8x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_17_matmul_16x8x2_f32,@function
main$async_dispatch_17_matmul_16x8x2_f32:
.Lfunc_begin13:
	.file	14 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_17.mlir"
	.loc	14 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-32, %rsp
	subq	$384, %rsp
.Ltmp27:
	.loc	14 19 8 prologue_end
	movq	32(%rsi), %rax
	.loc	14 24 8
	movl	(%rdx), %ecx
	vmovaps	.LCPI13_0(%rip), %ymm1
	vxorps	%xmm0, %xmm0, %xmm0
	.loc	14 29 10
	vbroadcastss	.LCPI13_2(%rip), %ymm16
	.loc	14 31 10
	vbroadcastss	.LCPI13_3(%rip), %ymm17
	.loc	14 32 10
	vbroadcastss	.LCPI13_5(%rip), %ymm28
	.loc	14 19 8
	movq	(%rax), %rsi
	movq	%rcx, %rdi
	shlq	$6, %rdi
	.loc	14 24 8
	leaq	(,%rcx,8), %rdx
	.loc	14 20 8
	movq	8(%rax), %rax
	.loc	14 35 10
	leaq	4(,%rcx,8), %r8
	leaq	5(,%rcx,8), %r9
	leaq	6(,%rcx,8), %r10
	leaq	7(,%rcx,8), %r11
	shlq	$5, %r8
	shlq	$5, %r9
	shlq	$5, %r10
	shlq	$5, %r11
	vbroadcastss	128(%rsi,%rdi), %ymm2
	vbroadcastss	144(%rsi,%rdx,8), %ymm4
	vbroadcastss	152(%rsi,%rdx,8), %ymm5
	vbroadcastss	160(%rsi,%rdx,8), %ymm6
	vbroadcastss	168(%rsi,%rdx,8), %ymm7
	vbroadcastss	176(%rsi,%rdx,8), %ymm8
	vfmadd132ps	%ymm1, %ymm0, %ymm2
	vfmadd132ps	%ymm1, %ymm0, %ymm4
	vfmadd132ps	%ymm1, %ymm0, %ymm5
	vfmadd132ps	%ymm1, %ymm0, %ymm6
	vfmadd132ps	%ymm1, %ymm0, %ymm7
	vfmadd132ps	%ymm1, %ymm0, %ymm8
	vmovaps	%ymm2, %ymm3
	vbroadcastss	136(%rsi,%rdx,8), %ymm2
	vfmadd132ps	%ymm1, %ymm0, %ymm2
	vfmadd132ps	184(%rsi,%rdx,8){1to8}, %ymm0, %ymm1
	vmovaps	.LCPI13_1(%rip), %ymm0
	vfmadd231ps	140(%rsi,%rdx,8){1to8}, %ymm0, %ymm2
	vfmadd231ps	132(%rsi,%rdi){1to8}, %ymm0, %ymm3
	vfmadd231ps	148(%rsi,%rdx,8){1to8}, %ymm0, %ymm4
	vfmadd231ps	156(%rsi,%rdx,8){1to8}, %ymm0, %ymm5
	vfmadd231ps	164(%rsi,%rdx,8){1to8}, %ymm0, %ymm6
	vfmadd231ps	172(%rsi,%rdx,8){1to8}, %ymm0, %ymm7
	vfmadd231ps	180(%rsi,%rdx,8){1to8}, %ymm0, %ymm8
	leaq	3(,%rcx,8), %rdi
	shlq	$5, %rdi
	vfmadd231ps	188(%rsi,%rdx,8){1to8}, %ymm0, %ymm1
	leaq	1(,%rcx,8), %rdx
	leaq	2(,%rcx,8), %rsi
	shlq	$8, %rcx
	shlq	$5, %rdx
	shlq	$5, %rsi
	.loc	14 28 10
	vmulps	%ymm2, %ymm2, %ymm9
	vmulps	%ymm3, %ymm3, %ymm0
	vmulps	%ymm4, %ymm4, %ymm10
	vmulps	%ymm5, %ymm5, %ymm11
	vmulps	%ymm6, %ymm6, %ymm12
	vmulps	%ymm7, %ymm7, %ymm13
	vmulps	%ymm8, %ymm8, %ymm14
	vmovaps	%ymm2, 160(%rsp)
	vmovaps	%ymm3, 128(%rsp)
	vmovaps	%ymm4, 192(%rsp)
	vmovaps	%ymm5, 224(%rsp)
	vmovaps	%ymm6, 256(%rsp)
	vmovaps	%ymm7, 288(%rsp)
	vmovaps	%ymm8, 320(%rsp)
	vmulps	%ymm2, %ymm9, %ymm9
	vmulps	%ymm1, %ymm1, %ymm15
	vmulps	%ymm0, %ymm3, %ymm0
	vmulps	%ymm4, %ymm10, %ymm10
	vmulps	%ymm5, %ymm11, %ymm11
	vmulps	%ymm6, %ymm12, %ymm12
	vmulps	%ymm7, %ymm13, %ymm13
	vmulps	%ymm14, %ymm8, %ymm14
	vmovaps	%ymm1, 96(%rsp)
	.loc	14 30 10
	vfmadd213ps	%ymm2, %ymm16, %ymm9
	.loc	14 28 10
	vmulps	%ymm1, %ymm15, %ymm15
	.loc	14 30 10
	vfmadd213ps	%ymm3, %ymm16, %ymm0
	vfmadd213ps	%ymm4, %ymm16, %ymm10
	vfmadd213ps	%ymm5, %ymm16, %ymm11
	vfmadd213ps	%ymm6, %ymm16, %ymm12
	vfmadd213ps	%ymm7, %ymm16, %ymm13
	vfmadd213ps	%ymm8, %ymm16, %ymm14
	vfmadd213ps	%ymm1, %ymm16, %ymm15
	.loc	14 31 10
	vmulps	%ymm17, %ymm9, %ymm16
	.loc	14 32 10
	vbroadcastss	.LCPI13_4(%rip), %ymm9
	.loc	14 31 10
	vmulps	%ymm17, %ymm11, %ymm19
	vmulps	%ymm17, %ymm12, %ymm20
	vmulps	%ymm17, %ymm10, %ymm18
	vmulps	%ymm17, %ymm13, %ymm21
	vmulps	%ymm17, %ymm14, %ymm22
	vmulps	%ymm17, %ymm0, %ymm0
	vmulps	%ymm17, %ymm15, %ymm17
	.loc	14 32 10
	vminps	%ymm16, %ymm9, %ymm11
	vminps	%ymm18, %ymm9, %ymm12
	vminps	%ymm19, %ymm9, %ymm23
	vminps	%ymm20, %ymm9, %ymm24
	vminps	%ymm0, %ymm9, %ymm10
	vminps	%ymm22, %ymm9, %ymm26
	vminps	%ymm17, %ymm9, %ymm27
	vminps	%ymm21, %ymm9, %ymm25
	vbroadcastss	.LCPI13_18(%rip), %ymm9
	vmaxps	%ymm11, %ymm28, %ymm14
	vmaxps	%ymm12, %ymm28, %ymm13
	vmaxps	%ymm23, %ymm28, %ymm12
	vbroadcastss	.LCPI13_6(%rip), %ymm23
	vmaxps	%ymm24, %ymm28, %ymm11
	vbroadcastss	.LCPI13_7(%rip), %ymm24
	vmaxps	%ymm27, %ymm28, %ymm1
	vmaxps	%ymm10, %ymm28, %ymm15
	vmaxps	%ymm26, %ymm28, %ymm2
	vmaxps	%ymm25, %ymm28, %ymm10
	vmulps	%ymm15, %ymm15, %ymm30
	vmulps	%ymm14, %ymm14, %ymm29
	vmulps	%ymm13, %ymm13, %ymm28
	vmulps	%ymm12, %ymm12, %ymm27
	vmulps	%ymm11, %ymm11, %ymm26
	vmulps	%ymm2, %ymm2, %ymm25
	vmulps	%ymm1, %ymm1, %ymm31
	vmovaps	%ymm1, 32(%rsp)
	vbroadcastss	.LCPI13_13(%rip), %ymm1
	vmovaps	%ymm2, 64(%rsp)
	vandps	%ymm23, %ymm0, %ymm0
	vandps	%ymm23, %ymm16, %ymm16
	vandps	%ymm23, %ymm22, %ymm22
	vandps	%ymm23, %ymm18, %ymm18
	vandps	%ymm23, %ymm19, %ymm19
	vandps	%ymm23, %ymm20, %ymm20
	vandps	%ymm23, %ymm21, %ymm21
	vandps	%ymm23, %ymm17, %ymm17
	vcmpltps	%ymm24, %ymm0, %k1
	vcmpltps	%ymm24, %ymm16, %k7
	vbroadcastss	.LCPI13_9(%rip), %ymm16
	vbroadcastss	.LCPI13_8(%rip), %ymm0
	vcmpltps	%ymm24, %ymm22, %k2
	vcmpltps	%ymm24, %ymm18, %k6
	vcmpltps	%ymm24, %ymm19, %k5
	vcmpltps	%ymm24, %ymm20, %k4
	vcmpltps	%ymm24, %ymm21, %k3
	kmovw	%k2, 28(%rsp)
	vcmpltps	%ymm24, %ymm17, %k2
	vmulps	%ymm10, %ymm10, %ymm24
	kmovw	%k2, 30(%rsp)
	vmovaps	%ymm16, %ymm17
	vmovaps	%ymm16, %ymm18
	vmovaps	%ymm16, %ymm19
	vmovaps	%ymm16, %ymm20
	vmovaps	%ymm16, %ymm21
	vmovaps	%ymm16, %ymm22
	vmovaps	%ymm16, %ymm23
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI13_10(%rip), %ymm0
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI13_11(%rip), %ymm0
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI13_12(%rip), %ymm0
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI13_14(%rip), %ymm0
	vfmadd213ps	%ymm1, %ymm30, %ymm17
	vfmadd213ps	%ymm1, %ymm29, %ymm18
	vfmadd213ps	%ymm1, %ymm28, %ymm19
	vfmadd213ps	%ymm1, %ymm27, %ymm20
	vfmadd213ps	%ymm1, %ymm26, %ymm21
	vfmadd213ps	%ymm1, %ymm24, %ymm22
	vfmadd213ps	%ymm1, %ymm25, %ymm23
	vfmadd213ps	%ymm1, %ymm31, %ymm16
	vbroadcastss	.LCPI13_15(%rip), %ymm1
	vfmadd213ps	%ymm0, %ymm30, %ymm17
	vfmadd213ps	%ymm0, %ymm29, %ymm18
	vfmadd213ps	%ymm0, %ymm28, %ymm19
	vfmadd213ps	%ymm0, %ymm27, %ymm20
	vfmadd213ps	%ymm0, %ymm26, %ymm21
	vfmadd213ps	%ymm0, %ymm24, %ymm22
	vfmadd213ps	%ymm0, %ymm25, %ymm23
	vfmadd213ps	%ymm0, %ymm31, %ymm16
	vbroadcastss	.LCPI13_16(%rip), %ymm0
	vmovaps	%ymm0, %ymm2
	vmovaps	%ymm0, %ymm3
	vmovaps	%ymm0, %ymm4
	vmovaps	%ymm0, %ymm5
	vmovaps	%ymm0, %ymm6
	vmovaps	%ymm0, %ymm7
	vmovaps	%ymm0, %ymm8
	vfmadd213ps	%ymm1, %ymm30, %ymm2
	vfmadd213ps	%ymm1, %ymm29, %ymm3
	vfmadd213ps	%ymm1, %ymm28, %ymm4
	vfmadd213ps	%ymm1, %ymm27, %ymm5
	vfmadd213ps	%ymm1, %ymm26, %ymm6
	vfmadd213ps	%ymm1, %ymm24, %ymm7
	vfmadd213ps	%ymm1, %ymm25, %ymm8
	vfmadd213ps	%ymm1, %ymm31, %ymm0
	vbroadcastss	.LCPI13_17(%rip), %ymm1
	vfmadd213ps	%ymm1, %ymm30, %ymm2
	vfmadd213ps	%ymm1, %ymm29, %ymm3
	vfmadd213ps	%ymm1, %ymm28, %ymm4
	vfmadd213ps	%ymm1, %ymm27, %ymm5
	vfmadd213ps	%ymm1, %ymm26, %ymm6
	vfmadd213ps	%ymm1, %ymm24, %ymm7
	vfmadd213ps	%ymm1, %ymm25, %ymm8
	vfmadd213ps	%ymm1, %ymm31, %ymm0
	vmulps	%ymm17, %ymm15, %ymm1
	vmovaps	64(%rsp), %ymm17
	vfmadd213ps	%ymm9, %ymm30, %ymm2
	vfmadd213ps	%ymm9, %ymm29, %ymm3
	vfmadd213ps	%ymm9, %ymm28, %ymm4
	vfmadd213ps	%ymm9, %ymm27, %ymm5
	vfmadd213ps	%ymm9, %ymm26, %ymm6
	vfmadd213ps	%ymm9, %ymm24, %ymm7
	vfmadd213ps	%ymm9, %ymm25, %ymm8
	vfmadd213ps	%ymm9, %ymm31, %ymm0
	vmovaps	32(%rsp), %ymm9
	vdivps	%ymm2, %ymm1, %ymm1
	vmulps	%ymm18, %ymm14, %ymm2
	vdivps	%ymm3, %ymm2, %ymm2
	vmulps	%ymm19, %ymm13, %ymm3
	vdivps	%ymm4, %ymm3, %ymm3
	vmulps	%ymm20, %ymm12, %ymm4
	vdivps	%ymm5, %ymm4, %ymm4
	vmulps	%ymm21, %ymm11, %ymm5
	vmovaps	%ymm15, %ymm1 {%k1}
	kmovw	28(%rsp), %k1
	vdivps	%ymm6, %ymm5, %ymm5
	vmulps	%ymm22, %ymm10, %ymm6
	vmovaps	%ymm14, %ymm2 {%k7}
	vdivps	%ymm7, %ymm6, %ymm6
	vmulps	%ymm23, %ymm17, %ymm7
	vmovaps	%ymm13, %ymm3 {%k6}
	vdivps	%ymm8, %ymm7, %ymm7
	vmulps	%ymm16, %ymm9, %ymm8
	vmovaps	%ymm12, %ymm4 {%k5}
	vdivps	%ymm0, %ymm8, %ymm0
	.loc	14 33 10
	vbroadcastss	.LCPI13_19(%rip), %ymm8
	.loc	14 32 10
	vmovaps	%ymm11, %ymm5 {%k4}
	vmovaps	%ymm10, %ymm6 {%k3}
	vmovaps	%ymm17, %ymm7 {%k1}
	kmovw	30(%rsp), %k1
	.loc	14 33 10
	vaddps	%ymm1, %ymm8, %ymm1
	vaddps	%ymm2, %ymm8, %ymm2
	vaddps	%ymm3, %ymm8, %ymm3
	vaddps	%ymm4, %ymm8, %ymm4
	vaddps	%ymm5, %ymm8, %ymm5
	vaddps	%ymm6, %ymm8, %ymm6
	vaddps	%ymm7, %ymm8, %ymm7
	.loc	14 32 10
	vmovaps	%ymm9, %ymm0 {%k1}
	.loc	14 33 10
	vaddps	%ymm0, %ymm8, %ymm0
	.loc	14 34 10
	vbroadcastss	.LCPI13_20(%rip), %ymm8
	vmulps	160(%rsp), %ymm8, %ymm11
	vmulps	192(%rsp), %ymm8, %ymm10
	vmulps	128(%rsp), %ymm8, %ymm9
	.loc	14 35 10
	vmulps	%ymm2, %ymm11, %ymm2
	vmulps	%ymm3, %ymm10, %ymm3
	.loc	14 34 10
	vmulps	224(%rsp), %ymm8, %ymm11
	vmulps	256(%rsp), %ymm8, %ymm10
	.loc	14 35 10
	vmulps	%ymm1, %ymm9, %ymm1
	vmovaps	%ymm1, 384(%rax,%rcx)
	vmovaps	%ymm2, 384(%rax,%rdx)
	vmovaps	%ymm3, 384(%rax,%rsi)
	vmulps	%ymm4, %ymm11, %ymm4
	vmulps	%ymm5, %ymm10, %ymm5
	.loc	14 34 10
	vmulps	288(%rsp), %ymm8, %ymm11
	vmulps	320(%rsp), %ymm8, %ymm10
	vmulps	96(%rsp), %ymm8, %ymm8
	.loc	14 35 10
	vmovaps	%ymm4, 384(%rax,%rdi)
	vmovaps	%ymm5, 384(%rax,%r8)
	vmulps	%ymm6, %ymm11, %ymm6
	vmulps	%ymm7, %ymm10, %ymm7
	vmulps	%ymm0, %ymm8, %ymm0
	vmovaps	%ymm6, 384(%rax,%r9)
	vmovaps	%ymm7, 384(%rax,%r10)
	vmovaps	%ymm0, 384(%rax,%r11)
	.loc	14 39 8
	xorl	%eax, %eax
	movq	%rbp, %rsp
	.loc	14 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp28:
.Lfunc_end13:
	.size	main$async_dispatch_17_matmul_16x8x2_f32, .Lfunc_end13-main$async_dispatch_17_matmul_16x8x2_f32
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI14_0:
	.long	0x3c5e2127
	.long	0xbd066766
.LCPI14_1:
	.long	0x3a4c5c40
	.long	0xbc6d2ba9
.LCPI14_2:
	.long	0xbc6e5249
	.long	0xbc505793
.LCPI14_3:
	.long	0xbc026654
	.long	0xbc9c444f
.LCPI14_4:
	.long	0x3d1966fb
	.long	0x3c2514f6
.LCPI14_5:
	.long	0x3c1ba373
	.long	0xbc0f69dd
.LCPI14_6:
	.long	0x3c4d5cde
	.long	0xbb971cdd
.LCPI14_7:
	.long	0xbc6c4aea
	.long	0x3ae14ac1
	.section	".text.main$async_dispatch_18_matmul_16x2x8_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_18_matmul_16x2x8_f32,@function
main$async_dispatch_18_matmul_16x2x8_f32:
.Lfunc_begin14:
	.file	15 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_18.mlir"
	.loc	15 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp29:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.loc	15 15 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	15 22 8
	movl	(%rdx), %r10d
	vmovddup	.LCPI14_0(%rip), %xmm9
	vxorps	%xmm16, %xmm16, %xmm16
	.loc	15 15 8
	movq	(%rcx), %rsi
	.loc	15 23 8
	leaq	1(,%r10,8), %r15
	leaq	2(,%r10,8), %r14
	leaq	3(,%r10,8), %r11
	leaq	4(,%r10,8), %rdi
	leaq	5(,%r10,8), %rbx
	leaq	6(,%r10,8), %r9
	.loc	15 22 8
	leaq	(,%r10,8), %rax
	.loc	15 23 8
	movq	%r10, %rdx
	leaq	7(,%r10,8), %r8
	shlq	$8, %r10
	shlq	$6, %rdx
	.loc	15 17 8
	movq	8(%rcx), %rcx
	shlq	$5, %r15
	shlq	$5, %r14
	shlq	$5, %r11
	shlq	$5, %rdi
	shlq	$5, %rbx
	shlq	$5, %r9
	shlq	$5, %r8
	vbroadcastss	384(%rsi,%r10), %xmm8
	vbroadcastss	384(%rsi,%r15), %xmm10
	vbroadcastss	384(%rsi,%r14), %xmm11
	vbroadcastss	384(%rsi,%r11), %xmm12
	vbroadcastss	384(%rsi,%rdi), %xmm13
	vbroadcastss	384(%rsi,%rbx), %xmm14
	vbroadcastss	384(%rsi,%r9), %xmm15
	.loc	15 23 8
	vmovsd	256(%rsi,%rdx), %xmm0
	vmovsd	264(%rsi,%rax,8), %xmm2
	vmovsd	272(%rsi,%rax,8), %xmm1
	vmovsd	280(%rsi,%rax,8), %xmm5
	vmovsd	288(%rsi,%rax,8), %xmm3
	vmovsd	296(%rsi,%rax,8), %xmm6
	vmovsd	304(%rsi,%rax,8), %xmm4
	vmovsd	312(%rsi,%rax,8), %xmm7
	vfmadd132ps	%xmm9, %xmm16, %xmm8
	vfmadd132ps	%xmm9, %xmm16, %xmm10
	vfmadd132ps	%xmm9, %xmm16, %xmm11
	vfmadd132ps	%xmm9, %xmm16, %xmm12
	vfmadd132ps	%xmm9, %xmm16, %xmm13
	vfmadd132ps	%xmm9, %xmm16, %xmm14
	vfmadd132ps	%xmm9, %xmm16, %xmm15
	vfmadd132ps	384(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI14_1(%rip), %xmm16
	vfmadd231ps	388(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	388(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	388(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	388(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	388(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	388(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	388(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	388(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI14_2(%rip), %xmm16
	vfmadd231ps	392(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	392(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	392(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	392(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	392(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	392(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	392(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	392(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI14_3(%rip), %xmm16
	vfmadd231ps	396(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	396(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	396(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	396(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	396(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	396(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	396(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	396(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI14_4(%rip), %xmm16
	vfmadd231ps	400(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	400(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	400(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	400(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	400(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	400(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	400(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	400(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI14_5(%rip), %xmm16
	vfmadd231ps	404(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	404(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	404(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	404(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	404(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	404(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	404(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	404(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI14_6(%rip), %xmm16
	vfmadd231ps	408(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	408(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	408(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	408(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	408(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	408(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	408(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	408(%rsi,%r8){1to4}, %xmm16, %xmm9
	vmovddup	.LCPI14_7(%rip), %xmm16
	vfmadd231ps	412(%rsi,%r10){1to4}, %xmm16, %xmm8
	vfmadd231ps	412(%rsi,%r15){1to4}, %xmm16, %xmm10
	vfmadd231ps	412(%rsi,%r14){1to4}, %xmm16, %xmm11
	vfmadd231ps	412(%rsi,%r11){1to4}, %xmm16, %xmm12
	vfmadd231ps	412(%rsi,%rdi){1to4}, %xmm16, %xmm13
	vfmadd231ps	412(%rsi,%rbx){1to4}, %xmm16, %xmm14
	vfmadd231ps	412(%rsi,%r9){1to4}, %xmm16, %xmm15
	vfmadd231ps	412(%rsi,%r8){1to4}, %xmm16, %xmm9
	.loc	15 26 10
	vaddps	%xmm0, %xmm8, %xmm0
	vaddps	%xmm2, %xmm10, %xmm2
	vaddps	%xmm1, %xmm11, %xmm1
	vaddps	%xmm5, %xmm12, %xmm5
	vaddps	%xmm3, %xmm13, %xmm3
	vaddps	%xmm6, %xmm14, %xmm6
	vaddps	%xmm4, %xmm15, %xmm4
	vaddps	%xmm7, %xmm9, %xmm7
	vmovlps	%xmm0, (%rcx,%rdx)
	vmovlps	%xmm2, 8(%rcx,%rax,8)
	vmovlps	%xmm1, 16(%rcx,%rax,8)
	vmovlps	%xmm5, 24(%rcx,%rax,8)
	vmovlps	%xmm3, 32(%rcx,%rax,8)
	vmovlps	%xmm6, 40(%rcx,%rax,8)
	vmovlps	%xmm4, 48(%rcx,%rax,8)
	vmovlps	%xmm7, 56(%rcx,%rax,8)
	.loc	15 30 8
	xorl	%eax, %eax
	.loc	15 30 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp30:
.Lfunc_end14:
	.size	main$async_dispatch_18_matmul_16x2x8_f32, .Lfunc_end14-main$async_dispatch_18_matmul_16x2x8_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI15_0:
	.long	0x3f000000
.LCPI15_1:
	.long	0x3727c5ac
.LCPI15_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_20_reduction_16x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_20_reduction_16x2_f32,@function
main$async_dispatch_20_reduction_16x2_f32:
.Lfunc_begin15:
	.file	16 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_20.mlir"
	.loc	16 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp31:
	.loc	16 16 8 prologue_end
	movq	32(%rsi), %rax
	.loc	16 22 8
	movl	(%rdx), %ecx
	vxorps	%xmm3, %xmm3, %xmm3
	.loc	16 16 8
	movq	(%rax), %rsi
	.loc	16 22 8
	shlq	$4, %rcx
	.loc	16 17 8
	movq	8(%rax), %rax
	.loc	16 22 8
	vmovsd	128(%rsi,%rcx), %xmm0
	vmovsd	136(%rsi,%rcx), %xmm1
	.loc	16 25 10
	vmulps	%xmm0, %xmm0, %xmm2
	vaddss	%xmm3, %xmm2, %xmm4
	vmovshdup	%xmm2, %xmm2
	vaddss	%xmm2, %xmm4, %xmm2
	vmulps	%xmm1, %xmm1, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovshdup	%xmm4, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	.loc	16 35 10
	vxorps	%xmm4, %xmm4, %xmm4
	.loc	16 25 10
	vinsertps	$16, %xmm3, %xmm2, %xmm2
	.loc	16 30 10
	vmulps	.LCPI15_0(%rip){1to4}, %xmm2, %xmm2
	.loc	16 32 10
	vbroadcastss	.LCPI15_2(%rip), %xmm3
	.loc	16 31 10
	vaddps	.LCPI15_1(%rip){1to4}, %xmm2, %xmm2
	.loc	16 32 10
	vsqrtps	%xmm2, %xmm2
	vdivps	%xmm2, %xmm3, %xmm2
	vbroadcastss	%xmm2, %xmm3
	vmovshdup	%xmm2, %xmm2
	.loc	16 35 10
	vfmadd213ps	%xmm4, %xmm1, %xmm2
	vfmadd213ps	%xmm4, %xmm0, %xmm3
	vmovlps	%xmm3, (%rax,%rcx)
	vmovlps	%xmm2, 8(%rax,%rcx)
	.loc	16 39 8
	xorl	%eax, %eax
	.loc	16 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp32:
.Lfunc_end15:
	.size	main$async_dispatch_20_reduction_16x2_f32, .Lfunc_end15-main$async_dispatch_20_reduction_16x2_f32
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
.LCPI16_0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	15
.LCPI16_1:
	.long	16
	.long	17
	.long	18
	.long	19
	.long	20
	.long	21
	.long	22
	.long	23
	.long	24
	.long	25
	.long	26
	.long	27
	.long	28
	.zero	4
	.zero	4
	.zero	4
	.section	".text.main$async_dispatch_21_batch_matmul_1x16x50257x2_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_21_batch_matmul_1x16x50257x2_f32,@function
main$async_dispatch_21_batch_matmul_1x16x50257x2_f32:
.Lfunc_begin16:
	.file	17 "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm" "module_main$async_dispatch_21.mlir"
	.loc	17 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp33:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.loc	17 12 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	17 19 8
	movl	(%rdx), %r8d
	movl	$50257, %edi
	vmovdqa64	.LCPI16_0(%rip), %zmm0
	vmovdqa64	.LCPI16_1(%rip), %zmm1
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	17 13 8
	movq	8(%rcx), %rsi
	.loc	17 19 8
	movq	%r8, %rdx
	shlq	$6, %rdx
	movl	%r8d, -44(%rbp)
	.loc	17 12 8
	movq	(%rcx), %rax
	.loc	17 19 8
	subq	%rdx, %rdi
	movl	$64, %edx
	cmpq	$64, %rdi
	cmovlq	%rdi, %rdx
	shlq	$8, %r8
	movq	%rdx, -56(%rbp)
	xorl	%edx, %edx
	leaq	201156(%r8,%rsi), %rdi
	addq	16(%rcx), %r8
	movb	$1, %cl
	movq	%r8, -64(%rbp)
	jmp	.LBB16_1
	.loc	17 0 8 is_stmt 0
.Ltmp34:
	.p2align	4
.LBB16_4:
	.loc	17 19 8
	testb	$1, -48(%rbp)
	movl	$8, %edx
	movl	$0, %ecx
	je	.LBB16_5
.LBB16_1:
	.loc	17 0 8
	cmpl	$785, -44(%rbp)
	movl	%ecx, -48(%rbp)
	.loc	17 19 8
	ja	.LBB16_4
	.loc	17 0 8
	imulq	$201028, %rdx, %rbx
	movq	-56(%rbp), %r11
	.loc	17 19 8
	addq	-64(%rbp), %rbx
	movq	%rdx, %rcx
	orq	$1, %rcx
	movq	%rdx, %r15
	movq	%rdx, %r12
	movq	%rdx, %r13
	movq	%rdx, %r9
	movq	%rdx, %r14
	orq	$2, %r15
	orq	$3, %r12
	orq	$4, %r13
	orq	$5, %r9
	orq	$6, %r14
	xorl	%r10d, %r10d
	movq	%rcx, -72(%rbp)
	movq	%rdx, %rcx
	orq	$7, %rcx
	movq	%r11, %rsi
	.loc	17 0 8
.Ltmp35:
	.p2align	4
.LBB16_3:
	.loc	17 19 8
	subq	$29, %rsi
	movl	$29, %r8d
	cmovgeq	%r8, %r11
	movl	$536870911, %r8d
	.loc	17 9 8 is_stmt 1
	vpbroadcastd	%r11d, %zmm3
	kmovd	%r8d, %k1
	movq	-72(%rbp), %r8
	movq	%rsi, %r11
	vpcmpgtd	%zmm0, %zmm3, %k3
	vpcmpgtd	%zmm1, %zmm3, %k4
	kunpckwd	%k3, %k4, %k0
	kandd	%k1, %k0, %k0
	kandw	%k1, %k3, %k1
	kshiftrd	$16, %k0, %k2
	vmovups	%zmm2, (%rbx,%r10,4) {%k1}
	vmovups	%zmm2, 64(%rbx,%r10,4) {%k2}
	vmovups	%zmm2, 201092(%rbx,%r10,4) {%k2}
	vmovups	%zmm2, 201028(%rbx,%r10,4) {%k1}
	vmovups	%zmm2, 402120(%rbx,%r10,4) {%k2}
	vmovups	%zmm2, 402056(%rbx,%r10,4) {%k1}
	vmovups	%zmm2, 603148(%rbx,%r10,4) {%k2}
	vmovups	%zmm2, 603084(%rbx,%r10,4) {%k1}
	vmovups	%zmm2, 804176(%rbx,%r10,4) {%k2}
	vmovups	%zmm2, 804112(%rbx,%r10,4) {%k1}
	vmovups	%zmm2, 1005204(%rbx,%r10,4) {%k2}
	vmovups	%zmm2, 1005140(%rbx,%r10,4) {%k1}
	vmovups	%zmm2, 1206232(%rbx,%r10,4) {%k2}
	vmovups	%zmm2, 1206168(%rbx,%r10,4) {%k1}
	vmovups	%zmm2, 1407260(%rbx,%r10,4) {%k2}
	vmovups	%zmm2, 1407196(%rbx,%r10,4) {%k1}
	vbroadcastss	(%rax,%rdx,8), %zmm6
	.loc	17 19 8
	vmovups	-201028(%rdi,%r10,4), %zmm4 {%k1} {z}
	vmovups	-200964(%rdi,%r10,4), %zmm3 {%k2} {z}
	vbroadcastss	4(%rax,%rdx,8), %zmm22
	vmovups	64(%rdi,%r10,4), %zmm8 {%k2} {z}
	vmovups	(%rdi,%r10,4), %zmm5 {%k1} {z}
	vbroadcastss	(%rax,%r8,8), %zmm9
	vbroadcastss	(%rax,%r15,8), %zmm11
	vbroadcastss	4(%rax,%r8,8), %zmm23
	vbroadcastss	(%rax,%r13,8), %zmm15
	vbroadcastss	(%rax,%r9,8), %zmm17
	vbroadcastss	(%rax,%r12,8), %zmm13
	vbroadcastss	(%rax,%r14,8), %zmm19
	vbroadcastss	(%rax,%rcx,8), %zmm21
	vbroadcastss	4(%rax,%r12,8), %zmm24
	vmovaps	%zmm4, %zmm7
	vmovaps	%zmm4, %zmm10
	vmovaps	%zmm4, %zmm12
	vmovaps	%zmm4, %zmm16
	vmovaps	%zmm4, %zmm18
	vmovaps	%zmm4, %zmm14
	vmovaps	%zmm4, %zmm20
	vfmadd213ps	%zmm2, %zmm6, %zmm7 {%k3} {z}
	vfmadd213ps	%zmm2, %zmm3, %zmm6 {%k4} {z}
	vfmadd213ps	%zmm2, %zmm9, %zmm10 {%k3} {z}
	vfmadd213ps	%zmm2, %zmm3, %zmm9 {%k4} {z}
	vfmadd213ps	%zmm2, %zmm11, %zmm12 {%k3} {z}
	vfmadd213ps	%zmm2, %zmm3, %zmm11 {%k4} {z}
	vfmadd213ps	%zmm2, %zmm15, %zmm16 {%k3} {z}
	vfmadd213ps	%zmm2, %zmm17, %zmm18 {%k3} {z}
	vfmadd213ps	%zmm2, %zmm3, %zmm15 {%k4} {z}
	vfmadd213ps	%zmm2, %zmm3, %zmm17 {%k4} {z}
	vfmadd213ps	%zmm2, %zmm13, %zmm14 {%k3} {z}
	vfmadd213ps	%zmm2, %zmm3, %zmm13 {%k4} {z}
	vfmadd213ps	%zmm2, %zmm19, %zmm20 {%k3} {z}
	vfmadd213ps	%zmm2, %zmm3, %zmm19 {%k4} {z}
	vfmadd213ps	%zmm2, %zmm21, %zmm4 {%k3} {z}
	vfmadd213ps	%zmm2, %zmm21, %zmm3 {%k4} {z}
	vfmadd231ps	%zmm8, %zmm22, %zmm6 {%k4} {z}
	vfmadd231ps	%zmm22, %zmm5, %zmm7 {%k3} {z}
	vbroadcastss	4(%rax,%r15,8), %zmm22
	vfmadd231ps	%zmm8, %zmm23, %zmm9 {%k4} {z}
	vfmadd231ps	%zmm23, %zmm5, %zmm10 {%k3} {z}
	vbroadcastss	4(%rax,%r13,8), %zmm23
	vfmadd231ps	%zmm8, %zmm24, %zmm13 {%k4} {z}
	vfmadd231ps	%zmm24, %zmm5, %zmm14 {%k3} {z}
	vfmadd231ps	%zmm8, %zmm22, %zmm11 {%k4} {z}
	vfmadd231ps	%zmm22, %zmm5, %zmm12 {%k3} {z}
	vbroadcastss	4(%rax,%r9,8), %zmm22
	vfmadd231ps	%zmm8, %zmm23, %zmm15 {%k4} {z}
	vfmadd231ps	%zmm23, %zmm5, %zmm16 {%k3} {z}
	vbroadcastss	4(%rax,%r14,8), %zmm23
	vfmadd231ps	%zmm8, %zmm22, %zmm17 {%k4} {z}
	vfmadd231ps	%zmm22, %zmm5, %zmm18 {%k3} {z}
	vbroadcastss	4(%rax,%rcx,8), %zmm22
	vfmadd231ps	%zmm8, %zmm23, %zmm19 {%k4} {z}
	vfmadd231ps	%zmm23, %zmm5, %zmm20 {%k3} {z}
	vmovups	%zmm6, 64(%rbx,%r10,4) {%k2}
	vmovups	%zmm7, (%rbx,%r10,4) {%k1}
	vmovups	%zmm9, 201092(%rbx,%r10,4) {%k2}
	vmovups	%zmm10, 201028(%rbx,%r10,4) {%k1}
	vmovups	%zmm11, 402120(%rbx,%r10,4) {%k2}
	vmovups	%zmm12, 402056(%rbx,%r10,4) {%k1}
	vmovups	%zmm13, 603148(%rbx,%r10,4) {%k2}
	vmovups	%zmm14, 603084(%rbx,%r10,4) {%k1}
	vmovups	%zmm15, 804176(%rbx,%r10,4) {%k2}
	vmovups	%zmm16, 804112(%rbx,%r10,4) {%k1}
	vmovups	%zmm17, 1005204(%rbx,%r10,4) {%k2}
	vmovups	%zmm18, 1005140(%rbx,%r10,4) {%k1}
	vmovups	%zmm19, 1206232(%rbx,%r10,4) {%k2}
	vmovups	%zmm20, 1206168(%rbx,%r10,4) {%k1}
	vfmadd231ps	%zmm8, %zmm22, %zmm3 {%k4} {z}
	vfmadd231ps	%zmm5, %zmm22, %zmm4 {%k3} {z}
	vmovups	%zmm3, 1407260(%rbx,%r10,4) {%k2}
	vmovups	%zmm4, 1407196(%rbx,%r10,4) {%k1}
	addq	$29, %r10
	cmpq	-56(%rbp), %r10
	jl	.LBB16_3
	jmp	.LBB16_4
.LBB16_5:
	.loc	17 21 8
	xorl	%eax, %eax
	.loc	17 21 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp36:
.Lfunc_end16:
	.size	main$async_dispatch_21_batch_matmul_1x16x50257x2_f32, .Lfunc_end16-main$async_dispatch_21_batch_matmul_1x16x50257x2_f32
	.cfi_endproc

	.section	.text.iree_hal_executable_library_query,"ax",@progbits
	.globl	iree_hal_executable_library_query
	.prefalign	16
	.type	iree_hal_executable_library_query,@function
iree_hal_executable_library_query:
.Liree_hal_executable_library_query$local:
	.type	.Liree_hal_executable_library_query$local,@function
.Lfunc_begin17:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	$6, %edi
	leaq	iree_hal_executable_library_query_v0(%rip), %rcx
	cmoveq	%rcx, %rax
	retq
.Lfunc_end17:
	.size	iree_hal_executable_library_query, .Lfunc_end17-iree_hal_executable_library_query
	.size	.Liree_hal_executable_library_query$local, .Lfunc_end17-iree_hal_executable_library_query
	.cfi_endproc

	.section	.text.iree_h2f_ieee,"ax",@progbits
	.prefalign	16
	.type	iree_h2f_ieee,@function
iree_h2f_ieee:
.Lfunc_begin18:
	.cfi_startproc
	movl	%edi, %eax
	andl	$32768, %eax
	movl	%edi, %edx
	movl	%edi, %ecx
	andl	$1023, %ecx
	shll	$16, %eax
	andw	$31744, %dx
	je	.LBB18_6
	andl	$31744, %edi
	cmpl	$31744, %edi
	jne	.LBB18_5
	testw	%cx, %cx
	je	.LBB18_4
	orl	$2143289344, %eax
	vmovd	%eax, %xmm0
	retq
.LBB18_6:
	movzwl	%cx, %ecx
	orl	$864026624, %eax
	vcvtsi2ss	%ecx, %xmm15, %xmm0
	vmovd	%eax, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.LBB18_5:
	movzwl	%cx, %ecx
	movzwl	%dx, %edx
	addl	%ecx, %edx
	shll	$13, %edx
	leal	939524096(%rdx,%rax), %eax
	vmovd	%eax, %xmm0
	retq
.LBB18_4:
	orl	$2139095040, %eax
	vmovd	%eax, %xmm0
	retq
.Lfunc_end18:
	.size	iree_h2f_ieee, .Lfunc_end18-iree_h2f_ieee
	.cfi_endproc

	.section	.text.iree_f2h_ieee,"ax",@progbits
	.prefalign	16
	.type	iree_f2h_ieee,@function
iree_f2h_ieee:
.Lfunc_begin19:
	.cfi_startproc
	vmovd	%xmm0, %esi
	movl	%esi, %eax
	shrl	$16, %eax
	movl	%esi, %ecx
	andl	$2139095040, %ecx
	je	.LBB19_1
	movl	%esi, %edx
	andl	$8388607, %edx
	cmpl	$2139095040, %ecx
	jne	.LBB19_6
	testl	%edx, %edx
	je	.LBB19_4
	orl	$32767, %eax
	retq
.LBB19_1:
	movl	%ecx, %edi
.LBB19_9:
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.LBB19_6:
	movl	$31744, %edi
	cmpl	$1191182336, %ecx
	ja	.LBB19_9
	xorl	%edi, %edi
	cmpl	$947912704, %ecx
	jb	.LBB19_9
	andl	$8192, %esi
	shrl	$23, %ecx
	cmpl	$1, %esi
	sbbl	$0, %edx
	addl	$4096, %edx
	cmpl	$8388608, %edx
	movl	%edx, %esi
	sbbl	$-1, %ecx
	shrl	$13, %esi
	addl	$15360, %esi
	cmpl	$8388608, %edx
	movl	$15360, %edx
	cmovbl	%esi, %edx
	shll	$10, %ecx
	leal	-130048(%rcx,%rdx), %edi
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.LBB19_4:
	movl	$31744, %edi
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.Lfunc_end19:
	.size	iree_f2h_ieee, .Lfunc_end19-iree_f2h_ieee
	.cfi_endproc

	.section	.text.__gnu_h2f_ieee,"ax",@progbits
	.prefalign	16
	.type	__gnu_h2f_ieee,@function
__gnu_h2f_ieee:
.Lfunc_begin20:
	.cfi_startproc
	movl	%edi, %eax
	andl	$32768, %eax
	movl	%edi, %edx
	movl	%edi, %ecx
	andl	$1023, %ecx
	shll	$16, %eax
	andw	$31744, %dx
	je	.LBB20_6
	andl	$31744, %edi
	cmpl	$31744, %edi
	jne	.LBB20_5
	testw	%cx, %cx
	je	.LBB20_4
	orl	$2143289344, %eax
	vmovd	%eax, %xmm0
	retq
.LBB20_6:
	movzwl	%cx, %ecx
	orl	$864026624, %eax
	vcvtsi2ss	%ecx, %xmm15, %xmm0
	vmovd	%eax, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.LBB20_5:
	movzwl	%cx, %ecx
	movzwl	%dx, %edx
	addl	%ecx, %edx
	shll	$13, %edx
	leal	939524096(%rdx,%rax), %eax
	vmovd	%eax, %xmm0
	retq
.LBB20_4:
	orl	$2139095040, %eax
	vmovd	%eax, %xmm0
	retq
.Lfunc_end20:
	.size	__gnu_h2f_ieee, .Lfunc_end20-__gnu_h2f_ieee
	.cfi_endproc

	.section	.text.__extendhfsf2,"ax",@progbits
	.prefalign	16
	.type	__extendhfsf2,@function
__extendhfsf2:
.Lfunc_begin21:
	.cfi_startproc
	vmovd	%xmm0, %ecx
	movl	%ecx, %eax
	shll	$16, %eax
	movl	%ecx, %edx
	andl	$1023, %edx
	movl	%ecx, %esi
	andl	$-2147483648, %eax
	andl	$31744, %esi
	je	.LBB21_6
	cmpl	$31744, %esi
	jne	.LBB21_5
	testw	%dx, %dx
	je	.LBB21_4
	orl	$2143289344, %eax
	vmovd	%eax, %xmm0
	retq
.LBB21_6:
	movzwl	%dx, %ecx
	orl	$864026624, %eax
	vcvtsi2ss	%ecx, %xmm15, %xmm0
	vmovd	%eax, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.LBB21_5:
	andl	$32767, %ecx
	shll	$13, %ecx
	leal	939524096(%rcx,%rax), %eax
	vmovd	%eax, %xmm0
	retq
.LBB21_4:
	orl	$2139095040, %eax
	vmovd	%eax, %xmm0
	retq
.Lfunc_end21:
	.size	__extendhfsf2, .Lfunc_end21-__extendhfsf2
	.cfi_endproc

	.section	.text.__gnu_f2h_ieee,"ax",@progbits
	.prefalign	16
	.type	__gnu_f2h_ieee,@function
__gnu_f2h_ieee:
.Lfunc_begin22:
	.cfi_startproc
	vmovd	%xmm0, %esi
	movl	%esi, %eax
	shrl	$16, %eax
	movl	%esi, %ecx
	andl	$2139095040, %ecx
	je	.LBB22_1
	movl	%esi, %edx
	andl	$8388607, %edx
	cmpl	$2139095040, %ecx
	jne	.LBB22_6
	testl	%edx, %edx
	je	.LBB22_4
	orl	$32767, %eax
	retq
.LBB22_1:
	movl	%ecx, %edi
.LBB22_9:
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.LBB22_6:
	movl	$31744, %edi
	cmpl	$1191182336, %ecx
	ja	.LBB22_9
	xorl	%edi, %edi
	cmpl	$947912704, %ecx
	jb	.LBB22_9
	andl	$8192, %esi
	shrl	$23, %ecx
	cmpl	$1, %esi
	sbbl	$0, %edx
	addl	$4096, %edx
	cmpl	$8388608, %edx
	movl	%edx, %esi
	sbbl	$-1, %ecx
	shrl	$13, %esi
	addl	$15360, %esi
	cmpl	$8388608, %edx
	movl	$15360, %edx
	cmovbl	%esi, %edx
	shll	$10, %ecx
	leal	-130048(%rcx,%rdx), %edi
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.LBB22_4:
	movl	$31744, %edi
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.Lfunc_end22:
	.size	__gnu_f2h_ieee, .Lfunc_end22-__gnu_f2h_ieee
	.cfi_endproc

	.section	.text.__truncsfhf2,"ax",@progbits
	.prefalign	16
	.type	__truncsfhf2,@function
__truncsfhf2:
.Lfunc_begin23:
	.cfi_startproc
	vmovd	%xmm0, %esi
	movl	%esi, %eax
	shrl	$16, %eax
	movl	%esi, %ecx
	andl	$2139095040, %ecx
	je	.LBB23_1
	movl	%esi, %edx
	andl	$8388607, %edx
	cmpl	$2139095040, %ecx
	jne	.LBB23_6
	testl	%edx, %edx
	je	.LBB23_4
	orl	$32767, %eax
	movw	%ax, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	retq
.LBB23_1:
	movl	%ecx, %edi
	jmp	.LBB23_9
.LBB23_6:
	movl	$31744, %edi
	cmpl	$1191182336, %ecx
	ja	.LBB23_9
	xorl	%edi, %edi
	cmpl	$947912704, %ecx
	jb	.LBB23_9
	andl	$8192, %esi
	shrl	$23, %ecx
	cmpl	$1, %esi
	sbbl	$0, %edx
	addl	$4096, %edx
	cmpl	$8388608, %edx
	movl	%edx, %esi
	sbbl	$-1, %ecx
	shrl	$13, %esi
	addl	$15360, %esi
	cmpl	$8388608, %edx
	movl	$15360, %edx
	cmovbl	%esi, %edx
	shll	$10, %ecx
	leal	-130048(%rcx,%rdx), %edi
	jmp	.LBB23_9
.LBB23_4:
	movl	$31744, %edi
.LBB23_9:
	andl	$32768, %eax
	orl	%edi, %eax
	movw	%ax, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	retq
.Lfunc_end23:
	.size	__truncsfhf2, .Lfunc_end23-__truncsfhf2
	.cfi_endproc

	.section	.text.__extendhfdf2,"ax",@progbits
	.prefalign	16
	.type	__extendhfdf2,@function
__extendhfdf2:
.Lfunc_begin24:
	.cfi_startproc
	vmovd	%xmm0, %ecx
	movl	%ecx, %eax
	shll	$16, %eax
	movl	%ecx, %edx
	andl	$1023, %edx
	movl	%ecx, %esi
	andl	$-2147483648, %eax
	andl	$31744, %esi
	je	.LBB24_6
	cmpl	$31744, %esi
	jne	.LBB24_5
	testw	%dx, %dx
	je	.LBB24_4
	orl	$2143289344, %eax
	vmovd	%eax, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	retq
.LBB24_6:
	movzwl	%dx, %ecx
	orl	$864026624, %eax
	vcvtsi2ss	%ecx, %xmm15, %xmm0
	vmovd	%eax, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	retq
.LBB24_5:
	andl	$32767, %ecx
	shll	$13, %ecx
	leal	939524096(%rcx,%rax), %eax
	vmovd	%eax, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	retq
.LBB24_4:
	orl	$2139095040, %eax
	vmovd	%eax, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	retq
.Lfunc_end24:
	.size	__extendhfdf2, .Lfunc_end24-__extendhfdf2
	.cfi_endproc

	.section	.text.__truncdfhf2,"ax",@progbits
	.prefalign	16
	.type	__truncdfhf2,@function
__truncdfhf2:
.Lfunc_begin25:
	.cfi_startproc
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %esi
	movl	%esi, %eax
	shrl	$16, %eax
	movl	%esi, %ecx
	andl	$2139095040, %ecx
	je	.LBB25_1
	movl	%esi, %edx
	andl	$8388607, %edx
	cmpl	$2139095040, %ecx
	jne	.LBB25_6
	testl	%edx, %edx
	je	.LBB25_4
	orl	$32767, %eax
	movw	%ax, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	retq
.LBB25_1:
	movl	%ecx, %edi
	jmp	.LBB25_9
.LBB25_6:
	movl	$31744, %edi
	cmpl	$1191182336, %ecx
	ja	.LBB25_9
	xorl	%edi, %edi
	cmpl	$947912704, %ecx
	jb	.LBB25_9
	andl	$8192, %esi
	shrl	$23, %ecx
	cmpl	$1, %esi
	sbbl	$0, %edx
	addl	$4096, %edx
	cmpl	$8388608, %edx
	movl	%edx, %esi
	sbbl	$-1, %ecx
	shrl	$13, %esi
	addl	$15360, %esi
	cmpl	$8388608, %edx
	movl	$15360, %edx
	cmovbl	%esi, %edx
	shll	$10, %ecx
	leal	-130048(%rcx,%rdx), %edi
	jmp	.LBB25_9
.LBB25_4:
	movl	$31744, %edi
.LBB25_9:
	andl	$32768, %eax
	orl	%edi, %eax
	movw	%ax, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	retq
.Lfunc_end25:
	.size	__truncdfhf2, .Lfunc_end25-__truncdfhf2
	.cfi_endproc

	.section	.text.fma,"ax",@progbits
	.prefalign	16
	.type	fma,@function
fma:
.Lfunc_begin26:
	.cfi_startproc
	vfmadd213sd	%xmm2, %xmm1, %xmm0
	retq
.Lfunc_end26:
	.size	fma, .Lfunc_end26-fma
	.cfi_endproc

	.section	.text.__math_invalidf,"ax",@progbits
	.prefalign	16
	.type	__math_invalidf,@function
__math_invalidf:
.Lfunc_begin27:
	.cfi_startproc
	vsubss	%xmm0, %xmm0, %xmm0
	vdivss	%xmm0, %xmm0, %xmm0
	retq
.Lfunc_end27:
	.size	__math_invalidf, .Lfunc_end27-__math_invalidf
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	2, 0x0
.LCPI28_0:
	.long	0xf0000000
	.long	0x70000000
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI28_1:
	.long	0x70000000
	.section	.text.__math_oflowf,"ax",@progbits
	.prefalign	16
	.type	__math_oflowf,@function
__math_oflowf:
.Lfunc_begin28:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	leaq	.LCPI28_0(%rip), %rcx
	sete	%al
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	vmulss	.LCPI28_1(%rip), %xmm0, %xmm0
	retq
.Lfunc_end28:
	.size	__math_oflowf, .Lfunc_end28-__math_oflowf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI29_0:
	.long	0x80000000
	.section	.text.__math_xflowf,"ax",@progbits
	.prefalign	16
	.type	__math_xflowf,@function
__math_xflowf:
.Lfunc_begin29:
	.cfi_startproc
	vxorps	.LCPI29_0(%rip){1to4}, %xmm0, %xmm1
	testl	%edi, %edi
	sete	%al
	kmovd	%eax, %k1
	vmovss	%xmm0, %xmm1, %xmm1 {%k1}
	vmovss	%xmm1, -4(%rsp)
	vmulss	-4(%rsp), %xmm0, %xmm0
	retq
.Lfunc_end29:
	.size	__math_xflowf, .Lfunc_end29-__math_xflowf
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	2, 0x0
.LCPI30_0:
	.long	0x90000000
	.long	0x10000000
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI30_1:
	.long	0x10000000
	.section	.text.__math_uflowf,"ax",@progbits
	.prefalign	16
	.type	__math_uflowf,@function
__math_uflowf:
.Lfunc_begin30:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	leaq	.LCPI30_0(%rip), %rcx
	sete	%al
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	vmulss	.LCPI30_1(%rip), %xmm0, %xmm0
	retq
.Lfunc_end30:
	.size	__math_uflowf, .Lfunc_end30-__math_uflowf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI31_0:
	.long	0x7b800000
.LCPI31_1:
	.long	0x80000000
.LCPI31_2:
	.long	0x3f800000
	.section	.text.ceilf,"ax",@progbits
	.prefalign	16
	.type	ceilf,@function
ceilf:
.Lfunc_begin31:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	$2071, %ecx
	bextrl	%ecx, %eax, %ecx
	cmpl	$149, %ecx
	ja	.LBB31_7
	cmpl	$127, %ecx
	jb	.LBB31_4
	addl	$-127, %ecx
	movl	$8388607, %edx
	shrxl	%ecx, %edx, %edx
	testl	%eax, %edx
	je	.LBB31_7
	vaddss	.LCPI31_0(%rip), %xmm0, %xmm0
	xorl	%esi, %esi
	testl	%eax, %eax
	movl	$-8388608, %edi
	cmovsl	%esi, %edx
	sarxl	%ecx, %edi, %ecx
	addl	%eax, %edx
	andl	%ecx, %edx
	vmovss	%xmm0, -8(%rsp)
	vmovd	%edx, %xmm0
	retq
.LBB31_4:
	vaddss	.LCPI31_0(%rip), %xmm0, %xmm1
	vmovss	%xmm1, -4(%rsp)
	testl	%eax, %eax
	js	.LBB31_5
	vmovss	.LCPI31_2(%rip), %xmm1
	sete	%al
	kmovd	%eax, %k1
	vmovss	%xmm0, %xmm1, %xmm1 {%k1}
	vmovaps	%xmm1, %xmm0
.LBB31_7:
	retq
.LBB31_5:
	vmovss	.LCPI31_1(%rip), %xmm0
	retq
.Lfunc_end31:
	.size	ceilf, .Lfunc_end31-ceilf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI32_0:
	.long	0xff800000
.LCPI32_1:
	.long	0x42b17217
.LCPI32_2:
	.long	0xc2cff1b4
.LCPI32_3:
	.long	0x10000000
.LCPI32_4:
	.long	0x70000000
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI32_5:
	.quad	0x40471547652b82fe
.LCPI32_6:
	.quad	0x4338000000000000
.LCPI32_7:
	.quad	0xc338000000000000
.LCPI32_8:
	.quad	0x3ebc6af84b912394
.LCPI32_9:
	.quad	0x3f2ebfce50fac4f3
.LCPI32_10:
	.quad	0x3f962e42ff0c52d6
.LCPI32_11:
	.quad	0x3ff0000000000000
	.section	.text.expf,"ax",@progbits
	.prefalign	16
	.type	expf,@function
expf:
.Lfunc_begin32:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	$2836, %ecx
	bextrl	%ecx, %eax, %eax
	cmpl	$1067, %eax
	jae	.LBB32_1
.LBB32_8:
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	.LCPI32_5(%rip), %xmm0, %xmm0
	vmovsd	.LCPI32_8(%rip), %xmm2
	vmovsd	.LCPI32_10(%rip), %xmm4
	leaq	__exp2f_data(%rip), %rdx
	vaddsd	.LCPI32_6(%rip), %xmm0, %xmm1
	vmovq	%xmm1, %rax
	vaddsd	.LCPI32_7(%rip), %xmm1, %xmm1
	movl	%eax, %ecx
	andl	$31, %ecx
	shlq	$47, %rax
	addq	(%rdx,%rcx,8), %rax
	vsubsd	%xmm1, %xmm0, %xmm0
	vfmadd213sd	.LCPI32_9(%rip), %xmm0, %xmm2
	vfmadd213sd	.LCPI32_11(%rip), %xmm0, %xmm4
	vmovq	%rax, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm3
	vfmadd231sd	%xmm3, %xmm2, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm1
.LBB32_9:
	vmovaps	%xmm1, %xmm0
	retq
.LBB32_1:
	vmovss	.LCPI32_0(%rip), %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm0, %xmm2
	jae	.LBB32_9
	cmpl	$2040, %eax
	jae	.LBB32_3
	vucomiss	.LCPI32_1(%rip), %xmm0
	jbe	.LBB32_6
	movl	$1879048192, -8(%rsp)
	vmovss	-8(%rsp), %xmm0
	vmulss	.LCPI32_4(%rip), %xmm0, %xmm0
	retq
.LBB32_3:
	vaddss	%xmm0, %xmm0, %xmm0
	retq
.LBB32_6:
	vmovss	.LCPI32_2(%rip), %xmm1
	vucomiss	%xmm0, %xmm1
	jbe	.LBB32_8
	movl	$268435456, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	vmulss	.LCPI32_3(%rip), %xmm0, %xmm0
	retq
.Lfunc_end32:
	.size	expf, .Lfunc_end32-expf
	.cfi_endproc

	.section	.text.feclearexcept,"ax",@progbits
	.prefalign	16
	.type	feclearexcept,@function
feclearexcept:
.Lfunc_begin33:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end33:
	.size	feclearexcept, .Lfunc_end33-feclearexcept
	.cfi_endproc

	.section	.text.feraiseexcept,"ax",@progbits
	.prefalign	16
	.type	feraiseexcept,@function
feraiseexcept:
.Lfunc_begin34:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end34:
	.size	feraiseexcept, .Lfunc_end34-feraiseexcept
	.cfi_endproc

	.section	.text.fetestexcept,"ax",@progbits
	.prefalign	16
	.type	fetestexcept,@function
fetestexcept:
.Lfunc_begin35:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end35:
	.size	fetestexcept, .Lfunc_end35-fetestexcept
	.cfi_endproc

	.section	.text.fegetround,"ax",@progbits
	.prefalign	16
	.type	fegetround,@function
fegetround:
.Lfunc_begin36:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end36:
	.size	fegetround, .Lfunc_end36-fegetround
	.cfi_endproc

	.section	.text.__fesetround,"ax",@progbits
	.prefalign	16
	.type	__fesetround,@function
__fesetround:
.Lfunc_begin37:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end37:
	.size	__fesetround, .Lfunc_end37-__fesetround
	.cfi_endproc

	.section	.text.fegetenv,"ax",@progbits
	.prefalign	16
	.type	fegetenv,@function
fegetenv:
.Lfunc_begin38:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end38:
	.size	fegetenv, .Lfunc_end38-fegetenv
	.cfi_endproc

	.section	.text.fesetenv,"ax",@progbits
	.prefalign	16
	.type	fesetenv,@function
fesetenv:
.Lfunc_begin39:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end39:
	.size	fesetenv, .Lfunc_end39-fesetenv
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI40_0:
	.long	0x7b800000
.LCPI40_1:
	.long	0xbf800000
	.section	.text.floorf,"ax",@progbits
	.prefalign	16
	.type	floorf,@function
floorf:
.Lfunc_begin40:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	$2071, %ecx
	bextrl	%ecx, %eax, %ecx
	cmpl	$149, %ecx
	jbe	.LBB40_1
	retq
.LBB40_1:
	cmpl	$127, %ecx
	jb	.LBB40_4
	addl	$-127, %ecx
	movl	$8388607, %edx
	shrxl	%ecx, %edx, %edx
	testl	%eax, %edx
	je	.LBB40_6
	vaddss	.LCPI40_0(%rip), %xmm0, %xmm0
	movl	$-8388608, %esi
	sarxl	%ecx, %esi, %ecx
	movl	%eax, %esi
	sarl	$31, %esi
	andl	%edx, %esi
	addl	%eax, %esi
	andl	%ecx, %esi
	vmovss	%xmm0, -8(%rsp)
	vmovd	%esi, %xmm0
	retq
.LBB40_4:
	vaddss	.LCPI40_0(%rip), %xmm0, %xmm1
	vmovss	%xmm1, -4(%rsp)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%eax, %eax
	jns	.LBB40_5
	vucomiss	%xmm1, %xmm0
	vmovaps	%xmm0, %xmm1
	jne	.LBB40_8
	jp	.LBB40_8
.LBB40_5:
	vmovaps	%xmm1, %xmm0
.LBB40_6:
	retq
.LBB40_8:
	vmovss	.LCPI40_1(%rip), %xmm1
	vmovaps	%xmm1, %xmm0
	retq
.Lfunc_end40:
	.size	floorf, .Lfunc_end40-floorf
	.cfi_endproc

	.section	.text.fmaf,"ax",@progbits
	.prefalign	16
	.type	fmaf,@function
fmaf:
.Lfunc_begin41:
	.cfi_startproc
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movabsq	$9218868437227405312, %rdx
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm0
	vmovq	%xmm0, %rax
	movl	%eax, %ecx
	andl	$536870911, %ecx
	cmpl	$268435456, %ecx
	setne	%cl
	andnq	%rdx, %rax, %rdx
	sete	%dl
	orb	%cl, %dl
	jne	.LBB41_4
	vsubsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	jne	.LBB41_3
	jp	.LBB41_3
	vsubsd	%xmm2, %xmm0, %xmm3
	vucomisd	%xmm1, %xmm3
	jne	.LBB41_3
	jp	.LBB41_3
.LBB41_4:
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	retq
.LBB41_3:
	testq	%rax, %rax
	vsubsd	%xmm0, %xmm1, %xmm3
	vsubsd	%xmm0, %xmm2, %xmm0
	sets	%cl
	vucomisd	%xmm1, %xmm2
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	%xmm2, %xmm3, %xmm3
	vxorpd	%xmm1, %xmm1, %xmm1
	setbe	%dl
	xorb	%cl, %dl
	kmovd	%edx, %k1
	vmovsd	%xmm3, %xmm0, %xmm0 {%k1}
	vucomisd	%xmm0, %xmm1
	setbe	%dl
	xorb	%cl, %dl
	movq	%rax, %rcx
	orq	$1, %rcx
	decq	%rax
	testb	%dl, %dl
	cmovneq	%rcx, %rax
	vmovq	%rax, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	retq
.Lfunc_end41:
	.size	fmaf, .Lfunc_end41-fmaf
	.cfi_endproc

	.section	.text.fmodf,"ax",@progbits
	.prefalign	16
	.type	fmodf,@function
fmodf:
.Lfunc_begin42:
	.cfi_startproc
	vmovd	%xmm1, %edx
	movl	%edx, %esi
	addl	%edx, %esi
	je	.LBB42_2
	movl	%edx, %r8d
	vmovd	%xmm0, %eax
	movl	$2071, %edi
	andl	$2147483647, %r8d
	bextrl	%edi, %eax, %ecx
	cmpl	$2139095041, %r8d
	setb	%r8b
	cmpl	$255, %ecx
	setne	%r9b
	testb	%r9b, %r8b
	jne	.LBB42_3
.LBB42_2:
	vmulss	%xmm1, %xmm0, %xmm0
	vdivss	%xmm0, %xmm0, %xmm0
	retq
.LBB42_3:
	leal	(%rax,%rax), %r8d
	cmpl	%esi, %r8d
	jbe	.LBB42_4
	bextrl	%edi, %edx, %edi
	testl	%ecx, %ecx
	je	.LBB42_6
	movl	%eax, %esi
	andl	$8388607, %esi
	orl	$8388608, %esi
	testl	%edi, %edi
	je	.LBB42_11
.LBB42_14:
	andl	$8388607, %edx
	orl	$8388608, %edx
	cmpl	%edi, %ecx
	jg	.LBB42_16
.LBB42_21:
	movl	%esi, %edi
	subl	%edx, %edi
	jns	.LBB42_22
	jmp	.LBB42_23
.LBB42_4:
	vpxor	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm1
	sete	%al
	kmovd	%eax, %k1
	vmovss	%xmm1, %xmm0, %xmm0 {%k1}
	retq
.LBB42_6:
	movl	%eax, %esi
	xorl	%ecx, %ecx
	shll	$9, %esi
	js	.LBB42_8
	.p2align	4
.LBB42_7:
	decl	%ecx
	addl	%esi, %esi
	jns	.LBB42_7
.LBB42_8:
	movb	$1, %sil
	subb	%cl, %sil
	shlxl	%esi, %eax, %esi
	testl	%edi, %edi
	jne	.LBB42_14
.LBB42_11:
	movl	%edx, %r8d
	xorl	%edi, %edi
	shll	$9, %r8d
	js	.LBB42_13
	.p2align	4
.LBB42_12:
	decl	%edi
	addl	%r8d, %r8d
	jns	.LBB42_12
.LBB42_13:
	movb	$1, %r8b
	subb	%dil, %r8b
	shlxl	%r8d, %edx, %edx
	cmpl	%edi, %ecx
	jg	.LBB42_16
	jmp	.LBB42_21
	.p2align	4
.LBB42_19:
	addl	%esi, %esi
	decl	%ecx
	cmpl	%edi, %ecx
	jle	.LBB42_20
.LBB42_16:
	movl	%esi, %r8d
	subl	%edx, %r8d
	js	.LBB42_19
	movl	%r8d, %esi
	jne	.LBB42_19
	jmp	.LBB42_18
.LBB42_20:
	movl	%edi, %ecx
	movl	%esi, %edi
	subl	%edx, %edi
	js	.LBB42_23
.LBB42_22:
	movl	%edi, %esi
	je	.LBB42_18
.LBB42_23:
	cmpl	$8388607, %esi
	ja	.LBB42_24
	.p2align	4
.LBB42_25:
	leal	(%rsi,%rsi), %edx
	decl	%ecx
	cmpl	$4194304, %esi
	movl	%edx, %esi
	jb	.LBB42_25
	andl	$-2147483648, %eax
	testl	%ecx, %ecx
	jle	.LBB42_28
.LBB42_27:
	addl	$-8388608, %edx
	shll	$23, %ecx
	orl	%edx, %ecx
	orl	%eax, %ecx
	vmovd	%ecx, %xmm0
	retq
.LBB42_18:
	vpxor	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.LBB42_24:
	movl	%esi, %edx
	andl	$-2147483648, %eax
	testl	%ecx, %ecx
	jg	.LBB42_27
.LBB42_28:
	movb	$1, %sil
	subb	%cl, %sil
	shrxl	%esi, %edx, %ecx
	orl	%eax, %ecx
	vmovd	%ecx, %xmm0
	retq
.Lfunc_end42:
	.size	fmodf, .Lfunc_end42-fmodf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI43_0:
	.long	0x5f800000
	.section	.text.frexpf,"ax",@progbits
	.prefalign	16
	.type	frexpf,@function
frexpf:
.Lfunc_begin43:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	%eax, %ecx
	shrl	$23, %ecx
	cmpb	$-1, %cl
	je	.LBB43_7
	movzbl	%cl, %edx
	testl	%edx, %edx
	jne	.LBB43_6
	vxorps	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm0
	jne	.LBB43_4
	jnp	.LBB43_3
.LBB43_4:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	vmulss	.LCPI43_0(%rip), %xmm0, %xmm0
	movq	%rdi, %rbx
	callq	frexpf
	movl	(%rbx), %eax
	movq	%rbx, %rdi
	addl	$-64, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	movl	%eax, (%rdi)
	retq
.LBB43_6:
	andl	$-2139095041, %eax
	movzbl	%cl, %ecx
	orl	$1056964608, %eax
	addl	$-126, %ecx
	vmovd	%eax, %xmm0
	movl	%ecx, (%rdi)
.LBB43_7:
	retq
.LBB43_3:
	xorl	%eax, %eax
	movl	%eax, (%rdi)
	retq
.Lfunc_end43:
	.size	frexpf, .Lfunc_end43-frexpf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI44_0:
	.long	0x0c800000
.LCPI44_1:
	.long	0x7f000000
	.section	.text.ldexpf,"ax",@progbits
	.prefalign	16
	.type	ldexpf,@function
ldexpf:
.Lfunc_begin44:
	.cfi_startproc
	cmpl	$128, %edi
	jl	.LBB44_4
	vmulss	.LCPI44_1(%rip), %xmm0, %xmm0
	cmpl	$255, %edi
	jb	.LBB44_2
	vmulss	.LCPI44_1(%rip), %xmm0, %xmm0
	cmpl	$381, %edi
	movl	$381, %eax
	cmovbl	%edi, %eax
	addl	$-254, %eax
	jmp	.LBB44_8
.LBB44_4:
	cmpl	$-127, %edi
	jg	.LBB44_9
	vmulss	.LCPI44_0(%rip), %xmm0, %xmm0
	cmpl	$-229, %edi
	ja	.LBB44_6
	vmulss	.LCPI44_0(%rip), %xmm0, %xmm0
	cmpl	$-329, %edi
	movl	$-330, %eax
	cmovael	%edi, %eax
	addl	$204, %eax
.LBB44_8:
	movl	%eax, %edi
	jmp	.LBB44_9
.LBB44_2:
	addl	$-127, %edi
	jmp	.LBB44_9
.LBB44_6:
	addl	$102, %edi
.LBB44_9:
	shll	$23, %edi
	addl	$1065353216, %edi
	vmovd	%edi, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end44:
	.size	ldexpf, .Lfunc_end44-ldexpf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI45_0:
	.long	0x0c800000
.LCPI45_1:
	.long	0x7f000000
	.section	.text.scalbnf,"ax",@progbits
	.prefalign	16
	.type	scalbnf,@function
scalbnf:
.Lfunc_begin45:
	.cfi_startproc
	cmpl	$128, %edi
	jl	.LBB45_4
	vmulss	.LCPI45_1(%rip), %xmm0, %xmm0
	cmpl	$255, %edi
	jb	.LBB45_2
	vmulss	.LCPI45_1(%rip), %xmm0, %xmm0
	cmpl	$381, %edi
	movl	$381, %eax
	cmovbl	%edi, %eax
	addl	$-254, %eax
	jmp	.LBB45_8
.LBB45_4:
	cmpl	$-127, %edi
	jg	.LBB45_9
	vmulss	.LCPI45_0(%rip), %xmm0, %xmm0
	cmpl	$-229, %edi
	ja	.LBB45_6
	vmulss	.LCPI45_0(%rip), %xmm0, %xmm0
	cmpl	$-329, %edi
	movl	$-330, %eax
	cmovael	%edi, %eax
	addl	$204, %eax
.LBB45_8:
	movl	%eax, %edi
	jmp	.LBB45_9
.LBB45_2:
	addl	$-127, %edi
	jmp	.LBB45_9
.LBB45_6:
	addl	$102, %edi
.LBB45_9:
	shll	$23, %edi
	addl	$1065353216, %edi
	vmovd	%edi, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end45:
	.size	scalbnf, .Lfunc_end45-scalbnf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI46_0:
	.long	0x3f800000
.LCPI46_1:
	.long	0x80000000
.LCPI46_2:
	.long	0x4b000000
.LCPI46_12:
	.long	0x10000000
.LCPI46_20:
	.long	0x70000000
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI46_3:
	.quad	0xbff0000000000000
.LCPI46_4:
	.quad	0x3fd27616c9496e0b
.LCPI46_5:
	.quad	0xbfd71969a075c67a
.LCPI46_6:
	.quad	0x3fdec70a6ca7badd
.LCPI46_7:
	.quad	0xbfe7154748bef6c8
.LCPI46_8:
	.quad	0x3ff71547652ab82b
.LCPI46_9:
	.quad	0x405fffffffd1d571
.LCPI46_10:
	.quad	0xc062c00000000000
.LCPI46_11:
	.long	0x90000000
	.long	0x10000000
.LCPI46_13:
	.quad	0x42e8000000000000
.LCPI46_14:
	.quad	0xc2e8000000000000
.LCPI46_15:
	.quad	0x3fac6af84b912394
.LCPI46_16:
	.quad	0x3fcebfce50fac4f3
.LCPI46_17:
	.quad	0x3fe62e42ff0c52d6
.LCPI46_18:
	.quad	0x3ff0000000000000
.LCPI46_19:
	.long	0xf0000000
	.long	0x70000000
	.section	.text.powf,"ax",@progbits
	.prefalign	16
	.type	powf,@function
powf:
.Lfunc_begin46:
	.cfi_startproc
	vmovd	%xmm0, %edx
	vmovd	%xmm1, %ecx
	leal	-2139095040(%rdx), %eax
	cmpl	$-2130706432, %eax
	jb	.LBB46_2
	leal	16777216(%rcx,%rcx), %esi
	xorl	%eax, %eax
	cmpl	$16777216, %esi
	jbe	.LBB46_2
.LBB46_24:
	leal	-1060306944(%rdx), %ecx
	vmovsd	.LCPI46_6(%rip), %xmm5
	vmovsd	.LCPI46_4(%rip), %xmm4
	movl	%ecx, %esi
	shrl	$19, %esi
	movl	%ecx, %edi
	andl	$-8388608, %edi
	sarl	$23, %ecx
	shll	$4, %esi
	subl	%edi, %edx
	leaq	__powf_log2_data(%rip), %rdi
	movzbl	%sil, %esi
	vmovd	%edx, %xmm2
	movabsq	$9223231299366420480, %rdx
	vmovsd	(%rsi,%rdi), %xmm0
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vfmadd213sd	.LCPI46_3(%rip), %xmm0, %xmm2
	vcvtsi2sd	%ecx, %xmm15, %xmm3
	vaddsd	8(%rsi,%rdi), %xmm3, %xmm0
	movabsq	$4638426141214900225, %rsi
	vfmadd213sd	.LCPI46_7(%rip), %xmm2, %xmm5
	vfmadd231sd	.LCPI46_8(%rip), %xmm2, %xmm0
	vfmadd213sd	.LCPI46_5(%rip), %xmm2, %xmm4
	vmulsd	%xmm2, %xmm2, %xmm3
	vmulsd	%xmm3, %xmm3, %xmm6
	vfmadd231sd	%xmm5, %xmm3, %xmm0
	vfmadd231sd	%xmm6, %xmm4, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rcx
	andq	%rcx, %rdx
	cmpq	%rsi, %rdx
	jae	.LBB46_25
.LBB46_29:
	vaddsd	.LCPI46_13(%rip), %xmm0, %xmm1
	vmovsd	.LCPI46_15(%rip), %xmm2
	vmovsd	.LCPI46_17(%rip), %xmm4
	leaq	__exp2f_data(%rip), %rdx
	vmovq	%xmm1, %rcx
	vaddsd	.LCPI46_14(%rip), %xmm1, %xmm1
	addl	%ecx, %eax
	andl	$31, %ecx
	shlq	$47, %rax
	addq	(%rdx,%rcx,8), %rax
	vsubsd	%xmm1, %xmm0, %xmm0
	vfmadd213sd	.LCPI46_16(%rip), %xmm0, %xmm2
	vfmadd213sd	.LCPI46_18(%rip), %xmm0, %xmm4
	vmovq	%rax, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm3
	vfmadd231sd	%xmm3, %xmm2, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
.LBB46_30:
	retq
.LBB46_2:
	leal	(%rcx,%rcx), %eax
	leal	-1(%rax), %esi
	cmpl	$-16777217, %esi
	jae	.LBB46_3
	leal	-1(%rdx,%rdx), %eax
	cmpl	$-16777217, %eax
	jae	.LBB46_10
	xorl	%eax, %eax
	testl	%edx, %edx
	js	.LBB46_16
	cmpl	$8388607, %edx
	ja	.LBB46_24
.LBB46_23:
	vmulss	.LCPI46_2(%rip), %xmm0, %xmm0
	vmovd	%xmm0, %edx
	andl	$2147483647, %edx
	addl	$-192937984, %edx
	jmp	.LBB46_24
.LBB46_25:
	vucomisd	.LCPI46_9(%rip), %xmm0
	jbe	.LBB46_27
	xorl	%ecx, %ecx
	testl	%eax, %eax
	leaq	.LCPI46_19(%rip), %rax
	sete	%cl
	vmovss	(%rax,%rcx,4), %xmm0
	vmovss	%xmm0, -8(%rsp)
	vmovss	-8(%rsp), %xmm0
	vmulss	.LCPI46_20(%rip), %xmm0, %xmm0
	retq
.LBB46_16:
	movl	$2071, %eax
	bextrl	%eax, %ecx, %eax
	cmpl	$127, %eax
	jb	.LBB46_31
	cmpl	$150, %eax
	jbe	.LBB46_18
.LBB46_20:
	xorl	%eax, %eax
.LBB46_21:
	vmovd	%xmm0, %edx
	andl	$2147483647, %edx
	cmpl	$8388607, %edx
	ja	.LBB46_24
	jmp	.LBB46_23
.LBB46_27:
	vmovsd	.LCPI46_10(%rip), %xmm1
	vucomisd	%xmm0, %xmm1
	jb	.LBB46_29
	xorl	%ecx, %ecx
	testl	%eax, %eax
	leaq	.LCPI46_11(%rip), %rax
	sete	%cl
	vmovss	(%rax,%rcx,4), %xmm0
	vmovss	%xmm0, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	vmulss	.LCPI46_12(%rip), %xmm0, %xmm0
	retq
.LBB46_18:
	movb	$-106, %dl
	subb	%al, %dl
	bzhil	%edx, %ecx, %eax
	je	.LBB46_19
.LBB46_31:
	vsubss	%xmm0, %xmm0, %xmm0
	vdivss	%xmm0, %xmm0, %xmm0
	retq
.LBB46_19:
	movl	$1, %eax
	shlxl	%edx, %eax, %edx
	movl	$65536, %eax
	testl	%ecx, %edx
	jne	.LBB46_21
	jmp	.LBB46_20
.LBB46_3:
	vmovdqa	%xmm0, %xmm2
	vmovss	.LCPI46_0(%rip), %xmm0
	cmpl	$1065353216, %edx
	je	.LBB46_30
	testl	%eax, %eax
	je	.LBB46_30
	addl	%edx, %edx
	cmpl	$-16777215, %edx
	setb	%sil
	cmpl	$-16777215, %eax
	setb	%al
	testb	%al, %sil
	jne	.LBB46_7
	vaddss	%xmm1, %xmm2, %xmm0
	retq
.LBB46_10:
	vmulss	%xmm0, %xmm0, %xmm0
	testl	%edx, %edx
	jns	.LBB46_13
	movl	$2071, %eax
	bextrl	%eax, %ecx, %eax
	leal	-151(%rax), %edx
	cmpl	$-24, %edx
	jb	.LBB46_13
	vxorps	.LCPI46_1(%rip){1to4}, %xmm0, %xmm1
	movb	$-106, %dl
	subb	%al, %dl
	bzhil	%edx, %ecx, %eax
	movzbl	%dl, %edx
	setne	%al
	btl	%edx, %ecx
	setae	%dl
	kmovd	%eax, %k2
	kmovd	%edx, %k1
	vmovss	%xmm0, %xmm1, %xmm1 {%k2}
	vmovss	%xmm0, %xmm1, %xmm1 {%k1}
	vmovaps	%xmm1, %xmm0
.LBB46_13:
	testl	%ecx, %ecx
	jns	.LBB46_30
	vmovss	.LCPI46_0(%rip), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -12(%rsp)
	vmovss	-12(%rsp), %xmm0
	retq
.LBB46_7:
	cmpl	$2130706432, %edx
	je	.LBB46_30
	setb	%al
	testl	%ecx, %ecx
	vmulss	%xmm1, %xmm1, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	sets	%cl
	xorb	%al, %cl
	kmovd	%ecx, %k1
	vmovss	%xmm1, %xmm0, %xmm0 {%k1}
	retq
.Lfunc_end46:
	.size	powf, .Lfunc_end46-powf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI47_0:
	.long	0xcb000000
.LCPI47_1:
	.long	0x4b000000
.LCPI47_2:
	.long	0x80000000
	.section	.text.rintf,"ax",@progbits
	.prefalign	16
	.type	rintf,@function
rintf:
.Lfunc_begin47:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	%eax, %ecx
	andl	$2130706432, %ecx
	cmpl	$1249902592, %ecx
	ja	.LBB47_4
	vmovss	.LCPI47_0(%rip), %xmm2
	vmovss	.LCPI47_1(%rip), %xmm3
	testl	%eax, %eax
	setns	%cl
	kmovd	%ecx, %k1
	vaddss	%xmm2, %xmm0, %xmm1
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm3, %xmm1, %xmm1
	vaddss	%xmm2, %xmm0, %xmm0
	vmovss	%xmm0, %xmm1, %xmm1 {%k1}
	vxorps	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm1
	jne	.LBB47_2
	jp	.LBB47_2
	vmovss	.LCPI47_2(%rip), %xmm0
	testl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	setns	%al
	kmovd	%eax, %k1
	vmovss	%xmm1, %xmm0, %xmm0 {%k1}
.LBB47_4:
	retq
.LBB47_2:
	vmovaps	%xmm1, %xmm0
	retq
.Lfunc_end47:
	.size	rintf, .Lfunc_end47-rintf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI48_0:
	.long	0x7fffffff
.LCPI48_1:
	.long	0x4b000000
.LCPI48_2:
	.long	0xcb000000
.LCPI48_3:
	.long	0x3f000000
.LCPI48_4:
	.long	0xbf000000
.LCPI48_5:
	.long	0x3f800000
.LCPI48_6:
	.long	0xbf800000
.LCPI48_7:
	.long	0x80000000
	.section	.text.roundf,"ax",@progbits
	.prefalign	16
	.type	roundf,@function
roundf:
.Lfunc_begin48:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	$2071, %ecx
	bextrl	%ecx, %eax, %ecx
	cmpl	$149, %ecx
	ja	.LBB48_8
	vpandd	.LCPI48_0(%rip){1to4}, %xmm0, %xmm1
	vaddss	.LCPI48_1(%rip), %xmm1, %xmm2
	cmpl	$125, %ecx
	ja	.LBB48_3
	vxorps	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm2, -4(%rsp)
	retq
.LBB48_3:
	vaddss	.LCPI48_2(%rip), %xmm2, %xmm0
	vsubss	%xmm1, %xmm0, %xmm0
	vucomiss	.LCPI48_3(%rip), %xmm0
	jbe	.LBB48_5
	vaddss	%xmm0, %xmm1, %xmm0
	vaddss	.LCPI48_6(%rip), %xmm0, %xmm0
	jmp	.LBB48_7
.LBB48_5:
	vmovss	.LCPI48_4(%rip), %xmm2
	vucomiss	%xmm0, %xmm2
	vaddss	%xmm0, %xmm1, %xmm0
	jb	.LBB48_7
	vaddss	.LCPI48_5(%rip), %xmm0, %xmm0
.LBB48_7:
	vxorps	.LCPI48_7(%rip){1to4}, %xmm0, %xmm1
	testl	%eax, %eax
	sets	%al
	kmovd	%eax, %k1
	vmovss	%xmm1, %xmm0, %xmm0 {%k1}
.LBB48_8:
	retq
.Lfunc_end48:
	.size	roundf, .Lfunc_end48-roundf
	.cfi_endproc

	.type	__unnamed_1,@object
	.section	.rodata.__unnamed_1,"a",@progbits
__unnamed_1:
	.asciz	"module_linked"
	.size	__unnamed_1, 14

	.type	iree_hal_executable_library_query_v0_header,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_header,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_header:
	.long	6
	.zero	4
	.quad	__unnamed_1
	.long	0
	.long	0
	.size	iree_hal_executable_library_query_v0_header, 24

	.type	iree_hal_executable_library_query_v0_funcs,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_funcs,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_funcs:
	.quad	main$async_dispatch_0_elementwise_16x2_i64xf32xf32
	.quad	main$async_dispatch_1_reduction_16x2_f32
	.quad	main$async_dispatch_2_reduction_16x2_f32
	.quad	main$async_dispatch_3_matmul_16x6x2_f32
	.quad	main$async_dispatch_4_attention_2x16x16
	.quad	main$async_dispatch_5_matmul_16x2x2_f32
	.quad	main$async_dispatch_7_reduction_16x2_f32
	.quad	main$async_dispatch_8_matmul_16x8x2_f32
	.quad	main$async_dispatch_9_matmul_16x2x8_f32
	.quad	main$async_dispatch_11_reduction_16x2_f32
	.quad	main$async_dispatch_12_matmul_16x6x2_f32
	.quad	main$async_dispatch_14_matmul_16x2x2_f32
	.quad	main$async_dispatch_16_reduction_16x2_f32
	.quad	main$async_dispatch_17_matmul_16x8x2_f32
	.quad	main$async_dispatch_18_matmul_16x2x8_f32
	.quad	main$async_dispatch_20_reduction_16x2_f32
	.quad	main$async_dispatch_21_batch_matmul_1x16x50257x2_f32
	.size	iree_hal_executable_library_query_v0_funcs, 136

	.type	iree_hal_executable_library_query_v0_attrs,@object
	.section	.rodata.iree_hal_executable_library_query_v0_attrs,"a",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_attrs:
	.quad	0
	.short	0
	.byte	0
	.byte	3
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	2
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	3
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	2
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.short	0
	.byte	0
	.byte	3
	.long	1
	.long	1
	.short	1
	.short	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.size	iree_hal_executable_library_query_v0_attrs, 1088

	.type	__unnamed_2,@object
	.section	.rodata.__unnamed_2,"a",@progbits
__unnamed_2:
	.asciz	"main$async_dispatch_0_elementwise_16x2_i64xf32xf32"
	.size	__unnamed_2, 51

	.type	__unnamed_3,@object
	.section	.rodata.__unnamed_3,"a",@progbits
__unnamed_3:
	.asciz	"main$async_dispatch_1_reduction_16x2_f32"
	.size	__unnamed_3, 41

	.type	__unnamed_4,@object
	.section	.rodata.__unnamed_4,"a",@progbits
__unnamed_4:
	.asciz	"main$async_dispatch_2_reduction_16x2_f32"
	.size	__unnamed_4, 41

	.type	__unnamed_5,@object
	.section	.rodata.__unnamed_5,"a",@progbits
__unnamed_5:
	.asciz	"main$async_dispatch_3_matmul_16x6x2_f32"
	.size	__unnamed_5, 40

	.type	__unnamed_6,@object
	.section	.rodata.__unnamed_6,"a",@progbits
__unnamed_6:
	.asciz	"main$async_dispatch_4_attention_2x16x16"
	.size	__unnamed_6, 40

	.type	__unnamed_7,@object
	.section	.rodata.__unnamed_7,"a",@progbits
__unnamed_7:
	.asciz	"main$async_dispatch_5_matmul_16x2x2_f32"
	.size	__unnamed_7, 40

	.type	__unnamed_8,@object
	.section	.rodata.__unnamed_8,"a",@progbits
__unnamed_8:
	.asciz	"main$async_dispatch_7_reduction_16x2_f32"
	.size	__unnamed_8, 41

	.type	__unnamed_9,@object
	.section	.rodata.__unnamed_9,"a",@progbits
__unnamed_9:
	.asciz	"main$async_dispatch_8_matmul_16x8x2_f32"
	.size	__unnamed_9, 40

	.type	__unnamed_10,@object
	.section	.rodata.__unnamed_10,"a",@progbits
__unnamed_10:
	.asciz	"main$async_dispatch_9_matmul_16x2x8_f32"
	.size	__unnamed_10, 40

	.type	__unnamed_11,@object
	.section	.rodata.__unnamed_11,"a",@progbits
__unnamed_11:
	.asciz	"main$async_dispatch_11_reduction_16x2_f32"
	.size	__unnamed_11, 42

	.type	__unnamed_12,@object
	.section	.rodata.__unnamed_12,"a",@progbits
__unnamed_12:
	.asciz	"main$async_dispatch_12_matmul_16x6x2_f32"
	.size	__unnamed_12, 41

	.type	__unnamed_13,@object
	.section	.rodata.__unnamed_13,"a",@progbits
__unnamed_13:
	.asciz	"main$async_dispatch_14_matmul_16x2x2_f32"
	.size	__unnamed_13, 41

	.type	__unnamed_14,@object
	.section	.rodata.__unnamed_14,"a",@progbits
__unnamed_14:
	.asciz	"main$async_dispatch_16_reduction_16x2_f32"
	.size	__unnamed_14, 42

	.type	__unnamed_15,@object
	.section	.rodata.__unnamed_15,"a",@progbits
__unnamed_15:
	.asciz	"main$async_dispatch_17_matmul_16x8x2_f32"
	.size	__unnamed_15, 41

	.type	__unnamed_16,@object
	.section	.rodata.__unnamed_16,"a",@progbits
__unnamed_16:
	.asciz	"main$async_dispatch_18_matmul_16x2x8_f32"
	.size	__unnamed_16, 41

	.type	__unnamed_17,@object
	.section	.rodata.__unnamed_17,"a",@progbits
__unnamed_17:
	.asciz	"main$async_dispatch_20_reduction_16x2_f32"
	.size	__unnamed_17, 42

	.type	__unnamed_18,@object
	.section	.rodata.__unnamed_18,"a",@progbits
__unnamed_18:
	.asciz	"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32"
	.size	__unnamed_18, 53

	.type	iree_hal_executable_library_query_v0_names,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_names,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_names:
	.quad	__unnamed_2
	.quad	__unnamed_3
	.quad	__unnamed_4
	.quad	__unnamed_5
	.quad	__unnamed_6
	.quad	__unnamed_7
	.quad	__unnamed_8
	.quad	__unnamed_9
	.quad	__unnamed_10
	.quad	__unnamed_11
	.quad	__unnamed_12
	.quad	__unnamed_13
	.quad	__unnamed_14
	.quad	__unnamed_15
	.quad	__unnamed_16
	.quad	__unnamed_17
	.quad	__unnamed_18
	.size	iree_hal_executable_library_query_v0_names, 136

	.type	__unnamed_19,@object
	.section	.rodata.__unnamed_19,"a",@progbits
__unnamed_19:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_0.mlir"
	.size	__unnamed_19, 112

	.type	__unnamed_20,@object
	.section	.rodata.__unnamed_20,"a",@progbits
__unnamed_20:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_1.mlir"
	.size	__unnamed_20, 112

	.type	__unnamed_21,@object
	.section	.rodata.__unnamed_21,"a",@progbits
__unnamed_21:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_2.mlir"
	.size	__unnamed_21, 112

	.type	__unnamed_22,@object
	.section	.rodata.__unnamed_22,"a",@progbits
__unnamed_22:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_3.mlir"
	.size	__unnamed_22, 112

	.type	__unnamed_23,@object
	.section	.rodata.__unnamed_23,"a",@progbits
__unnamed_23:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_4.mlir"
	.size	__unnamed_23, 112

	.type	__unnamed_24,@object
	.section	.rodata.__unnamed_24,"a",@progbits
__unnamed_24:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_5.mlir"
	.size	__unnamed_24, 112

	.type	__unnamed_25,@object
	.section	.rodata.__unnamed_25,"a",@progbits
__unnamed_25:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_7.mlir"
	.size	__unnamed_25, 112

	.type	__unnamed_26,@object
	.section	.rodata.__unnamed_26,"a",@progbits
__unnamed_26:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_8.mlir"
	.size	__unnamed_26, 112

	.type	__unnamed_27,@object
	.section	.rodata.__unnamed_27,"a",@progbits
__unnamed_27:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_9.mlir"
	.size	__unnamed_27, 112

	.type	__unnamed_28,@object
	.section	.rodata.__unnamed_28,"a",@progbits
__unnamed_28:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_11.mlir"
	.size	__unnamed_28, 113

	.type	__unnamed_29,@object
	.section	.rodata.__unnamed_29,"a",@progbits
__unnamed_29:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_12.mlir"
	.size	__unnamed_29, 113

	.type	__unnamed_30,@object
	.section	.rodata.__unnamed_30,"a",@progbits
__unnamed_30:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_14.mlir"
	.size	__unnamed_30, 113

	.type	__unnamed_31,@object
	.section	.rodata.__unnamed_31,"a",@progbits
__unnamed_31:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_16.mlir"
	.size	__unnamed_31, 113

	.type	__unnamed_32,@object
	.section	.rodata.__unnamed_32,"a",@progbits
__unnamed_32:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_17.mlir"
	.size	__unnamed_32, 113

	.type	__unnamed_33,@object
	.section	.rodata.__unnamed_33,"a",@progbits
__unnamed_33:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_18.mlir"
	.size	__unnamed_33, 113

	.type	__unnamed_34,@object
	.section	.rodata.__unnamed_34,"a",@progbits
__unnamed_34:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_20.mlir"
	.size	__unnamed_34, 113

	.type	__unnamed_35,@object
	.section	.rodata.__unnamed_35,"a",@progbits
__unnamed_35:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_21.mlir"
	.size	__unnamed_35, 113

	.type	iree_hal_executable_library_query_v0_source_locations,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_source_locations,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_source_locations:
	.long	3
	.long	111
	.quad	__unnamed_19
	.long	3
	.long	111
	.quad	__unnamed_20
	.long	3
	.long	111
	.quad	__unnamed_21
	.long	3
	.long	111
	.quad	__unnamed_22
	.long	3
	.long	111
	.quad	__unnamed_23
	.long	3
	.long	111
	.quad	__unnamed_24
	.long	3
	.long	111
	.quad	__unnamed_25
	.long	3
	.long	111
	.quad	__unnamed_26
	.long	3
	.long	111
	.quad	__unnamed_27
	.long	3
	.long	112
	.quad	__unnamed_28
	.long	3
	.long	112
	.quad	__unnamed_29
	.long	3
	.long	112
	.quad	__unnamed_30
	.long	3
	.long	112
	.quad	__unnamed_31
	.long	3
	.long	112
	.quad	__unnamed_32
	.long	3
	.long	112
	.quad	__unnamed_33
	.long	3
	.long	112
	.quad	__unnamed_34
	.long	3
	.long	112
	.quad	__unnamed_35
	.size	iree_hal_executable_library_query_v0_source_locations, 272

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_stage_location_tables,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_stage_location_tables,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_stage_location_tables:
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations
	.size	iree_hal_executable_library_query_v0_stage_location_tables, 408

	.type	iree_hal_executable_library_query_v0,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0:
	.quad	iree_hal_executable_library_query_v0_header
	.zero	16
	.long	17
	.zero	4
	.quad	iree_hal_executable_library_query_v0_funcs
	.quad	iree_hal_executable_library_query_v0_attrs
	.quad	0
	.quad	0
	.quad	iree_hal_executable_library_query_v0_names
	.quad	0
	.quad	0
	.quad	iree_hal_executable_library_query_v0_source_locations
	.quad	iree_hal_executable_library_query_v0_stage_location_tables
	.zero	4
	.zero	4
	.zero	16
	.size	iree_hal_executable_library_query_v0, 128

	.type	__exp2f_data,@object
	.section	.rodata.__exp2f_data,"a",@progbits
	.p2align	3, 0x0
__exp2f_data:
	.quad	4607182418800017408
	.quad	4607140297302181236
	.quad	4607100335213349135
	.quad	4607062579818421073
	.quad	4607027079437701499
	.quad	4606993883449571754
	.quad	4606963042313658936
	.quad	4606934607594512097
	.quad	4606908631985796885
	.quad	4606885169335019979
	.quad	4606864274668794914
	.quad	4606846004218661165
	.quad	4606830415447468583
	.quad	4606817567076339586
	.quad	4606807519112221737
	.quad	4606800332876043653
	.quad	4606796071031487437
	.quad	4606794797614391156
	.quad	4606796578062795143
	.quad	4606801479247646227
	.quad	4606809569504174299
	.quad	4606820918663955941
	.quad	4606835598087680144
	.quad	4606853680698631517
	.quad	4606875241016906669
	.quad	4606900355194379847
	.quad	4606929101050434204
	.quad	4606961558108475497
	.quad	4606997807633245319
	.quad	4607037932668951391
	.quad	4607082018078232794
	.quad	4607130150581978432
	.quad	0x42e8000000000000
	.quad	0x3fac6af84b912394
	.quad	0x3fcebfce50fac4f3
	.quad	0x3fe62e42ff0c52d6
	.quad	0x4338000000000000
	.quad	0x40471547652b82fe
	.quad	0x3ebc6af84b912394
	.quad	0x3f2ebfce50fac4f3
	.quad	0x3f962e42ff0c52d6
	.size	__exp2f_data, 328

	.type	__powf_log2_data,@object
	.section	.rodata.__powf_log2_data,"a",@progbits
	.p2align	3, 0x0
__powf_log2_data:
	.quad	0x3ff661ec79f8f3be
	.quad	0xbfdefec65b963019
	.quad	0x3ff571ed4aaf883d
	.quad	0xbfdb0b6832d4fca4
	.quad	0x3ff49539f0f010b0
	.quad	0xbfd7418b0a1fb77b
	.quad	0x3ff3c995b0b80385
	.quad	0xbfd39de91a6dcf7b
	.quad	0x3ff30d190c8864a5
	.quad	0xbfd01d9bf3f2b631
	.quad	0x3ff25e227b0b8ea0
	.quad	0xbfc97c1d1b3b7af0
	.quad	0x3ff1bb4a4a1a343f
	.quad	0xbfc2f9e393af3c9f
	.quad	0x3ff12358f08ae5ba
	.quad	0xbfb960cbbf788d5c
	.quad	0x3ff0953f419900a7
	.quad	0xbfaa6f9db6475fce
	.quad	0x3ff0000000000000
	.quad	0x0000000000000000
	.quad	0x3fee608cfd9a47ac
	.quad	0x3fb338ca9f24f53d
	.quad	0x3feca4b31f026aa0
	.quad	0x3fc476a9543891ba
	.quad	0x3feb2036576afce6
	.quad	0x3fce840b4ac4e4d2
	.quad	0x3fe9c2d163a1aa2d
	.quad	0x3fd40645f0c6651c
	.quad	0x3fe886e6037841ed
	.quad	0x3fd88e9c2c1b9ff8
	.quad	0x3fe767dcf5534862
	.quad	0x3fdce0a44eb17bcc
	.quad	0x3fd27616c9496e0b
	.quad	0xbfd71969a075c67a
	.quad	0x3fdec70a6ca7badd
	.quad	0xbfe7154748bef6c8
	.quad	0x3ff71547652ab82b
	.size	__powf_log2_data, 296

	.section	.debug_abbrev,"",@progbits
	.byte	1
	.byte	17
	.byte	1
	.byte	37
	.byte	14
	.byte	19
	.byte	5
	.byte	3
	.byte	14
	.byte	16
	.byte	23
	.byte	27
	.byte	14
	.ascii	"\264B"
	.byte	25
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	2
	.byte	46
	.byte	0
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	110
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	3
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	62
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	4
	.byte	46
	.byte	0
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	110
	.byte	14
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	16
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0
.Ldebug_info_start0:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string1
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin0
	.long	.Lfunc_end0-.Lfunc_begin0
	.byte	2
	.quad	.Lfunc_begin0
	.long	.Lfunc_end0-.Lfunc_begin0
	.byte	1
	.byte	86
	.long	.Linfo_string19
	.long	.Linfo_string19
	.byte	1
	.byte	1
	.long	71

	.byte	3
	.long	.Linfo_string20
	.byte	5
	.byte	4
	.byte	0
.Ldebug_info_end0:
.Lcu_begin1:
	.long	.Ldebug_info_end1-.Ldebug_info_start1
.Ldebug_info_start1:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string3
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin1
	.long	.Lfunc_end1-.Lfunc_begin1
	.byte	4
	.quad	.Lfunc_begin1
	.long	.Lfunc_end1-.Lfunc_begin1
	.byte	1
	.byte	86
	.long	.Linfo_string21
	.long	.Linfo_string21
	.byte	2
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end1:
.Lcu_begin2:
	.long	.Ldebug_info_end2-.Ldebug_info_start2
.Ldebug_info_start2:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string4
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin2
	.long	.Lfunc_end2-.Lfunc_begin2
	.byte	4
	.quad	.Lfunc_begin2
	.long	.Lfunc_end2-.Lfunc_begin2
	.byte	1
	.byte	86
	.long	.Linfo_string22
	.long	.Linfo_string22
	.byte	3
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end2:
.Lcu_begin3:
	.long	.Ldebug_info_end3-.Ldebug_info_start3
.Ldebug_info_start3:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string5
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin3
	.long	.Lfunc_end3-.Lfunc_begin3
	.byte	4
	.quad	.Lfunc_begin3
	.long	.Lfunc_end3-.Lfunc_begin3
	.byte	1
	.byte	86
	.long	.Linfo_string23
	.long	.Linfo_string23
	.byte	4
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end3:
.Lcu_begin4:
	.long	.Ldebug_info_end4-.Ldebug_info_start4
.Ldebug_info_start4:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string6
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin4
	.long	.Lfunc_end4-.Lfunc_begin4
	.byte	4
	.quad	.Lfunc_begin4
	.long	.Lfunc_end4-.Lfunc_begin4
	.byte	1
	.byte	86
	.long	.Linfo_string24
	.long	.Linfo_string24
	.byte	5
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end4:
.Lcu_begin5:
	.long	.Ldebug_info_end5-.Ldebug_info_start5
.Ldebug_info_start5:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string7
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin5
	.long	.Lfunc_end5-.Lfunc_begin5
	.byte	4
	.quad	.Lfunc_begin5
	.long	.Lfunc_end5-.Lfunc_begin5
	.byte	1
	.byte	86
	.long	.Linfo_string25
	.long	.Linfo_string25
	.byte	6
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end5:
.Lcu_begin6:
	.long	.Ldebug_info_end6-.Ldebug_info_start6
.Ldebug_info_start6:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string8
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin6
	.long	.Lfunc_end6-.Lfunc_begin6
	.byte	4
	.quad	.Lfunc_begin6
	.long	.Lfunc_end6-.Lfunc_begin6
	.byte	1
	.byte	86
	.long	.Linfo_string26
	.long	.Linfo_string26
	.byte	7
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end6:
.Lcu_begin7:
	.long	.Ldebug_info_end7-.Ldebug_info_start7
.Ldebug_info_start7:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string9
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin7
	.long	.Lfunc_end7-.Lfunc_begin7
	.byte	4
	.quad	.Lfunc_begin7
	.long	.Lfunc_end7-.Lfunc_begin7
	.byte	1
	.byte	86
	.long	.Linfo_string27
	.long	.Linfo_string27
	.byte	8
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end7:
.Lcu_begin8:
	.long	.Ldebug_info_end8-.Ldebug_info_start8
.Ldebug_info_start8:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string10
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin8
	.long	.Lfunc_end8-.Lfunc_begin8
	.byte	4
	.quad	.Lfunc_begin8
	.long	.Lfunc_end8-.Lfunc_begin8
	.byte	1
	.byte	86
	.long	.Linfo_string28
	.long	.Linfo_string28
	.byte	9
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end8:
.Lcu_begin9:
	.long	.Ldebug_info_end9-.Ldebug_info_start9
.Ldebug_info_start9:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string11
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin9
	.long	.Lfunc_end9-.Lfunc_begin9
	.byte	4
	.quad	.Lfunc_begin9
	.long	.Lfunc_end9-.Lfunc_begin9
	.byte	1
	.byte	86
	.long	.Linfo_string29
	.long	.Linfo_string29
	.byte	10
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end9:
.Lcu_begin10:
	.long	.Ldebug_info_end10-.Ldebug_info_start10
.Ldebug_info_start10:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string12
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin10
	.long	.Lfunc_end10-.Lfunc_begin10
	.byte	4
	.quad	.Lfunc_begin10
	.long	.Lfunc_end10-.Lfunc_begin10
	.byte	1
	.byte	86
	.long	.Linfo_string30
	.long	.Linfo_string30
	.byte	11
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end10:
.Lcu_begin11:
	.long	.Ldebug_info_end11-.Ldebug_info_start11
.Ldebug_info_start11:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string13
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin11
	.long	.Lfunc_end11-.Lfunc_begin11
	.byte	4
	.quad	.Lfunc_begin11
	.long	.Lfunc_end11-.Lfunc_begin11
	.byte	1
	.byte	86
	.long	.Linfo_string31
	.long	.Linfo_string31
	.byte	12
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end11:
.Lcu_begin12:
	.long	.Ldebug_info_end12-.Ldebug_info_start12
.Ldebug_info_start12:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string14
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin12
	.long	.Lfunc_end12-.Lfunc_begin12
	.byte	4
	.quad	.Lfunc_begin12
	.long	.Lfunc_end12-.Lfunc_begin12
	.byte	1
	.byte	86
	.long	.Linfo_string32
	.long	.Linfo_string32
	.byte	13
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end12:
.Lcu_begin13:
	.long	.Ldebug_info_end13-.Ldebug_info_start13
.Ldebug_info_start13:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string15
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin13
	.long	.Lfunc_end13-.Lfunc_begin13
	.byte	4
	.quad	.Lfunc_begin13
	.long	.Lfunc_end13-.Lfunc_begin13
	.byte	1
	.byte	86
	.long	.Linfo_string33
	.long	.Linfo_string33
	.byte	14
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end13:
.Lcu_begin14:
	.long	.Ldebug_info_end14-.Ldebug_info_start14
.Ldebug_info_start14:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string16
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin14
	.long	.Lfunc_end14-.Lfunc_begin14
	.byte	4
	.quad	.Lfunc_begin14
	.long	.Lfunc_end14-.Lfunc_begin14
	.byte	1
	.byte	86
	.long	.Linfo_string34
	.long	.Linfo_string34
	.byte	15
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end14:
.Lcu_begin15:
	.long	.Ldebug_info_end15-.Ldebug_info_start15
.Ldebug_info_start15:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string17
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin15
	.long	.Lfunc_end15-.Lfunc_begin15
	.byte	4
	.quad	.Lfunc_begin15
	.long	.Lfunc_end15-.Lfunc_begin15
	.byte	1
	.byte	86
	.long	.Linfo_string35
	.long	.Linfo_string35
	.byte	16
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end15:
.Lcu_begin16:
	.long	.Ldebug_info_end16-.Ldebug_info_start16
.Ldebug_info_start16:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string18
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin16
	.long	.Lfunc_end16-.Lfunc_begin16
	.byte	4
	.quad	.Lfunc_begin16
	.long	.Lfunc_end16-.Lfunc_begin16
	.byte	1
	.byte	86
	.long	.Linfo_string36
	.long	.Linfo_string36
	.byte	17
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end16:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"IREE"
.Linfo_string1:
	.asciz	"module_main$async_dispatch_0.mlir"
.Linfo_string2:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm"
.Linfo_string3:
	.asciz	"module_main$async_dispatch_1.mlir"
.Linfo_string4:
	.asciz	"module_main$async_dispatch_2.mlir"
.Linfo_string5:
	.asciz	"module_main$async_dispatch_3.mlir"
.Linfo_string6:
	.asciz	"module_main$async_dispatch_4.mlir"
.Linfo_string7:
	.asciz	"module_main$async_dispatch_5.mlir"
.Linfo_string8:
	.asciz	"module_main$async_dispatch_7.mlir"
.Linfo_string9:
	.asciz	"module_main$async_dispatch_8.mlir"
.Linfo_string10:
	.asciz	"module_main$async_dispatch_9.mlir"
.Linfo_string11:
	.asciz	"module_main$async_dispatch_11.mlir"
.Linfo_string12:
	.asciz	"module_main$async_dispatch_12.mlir"
.Linfo_string13:
	.asciz	"module_main$async_dispatch_14.mlir"
.Linfo_string14:
	.asciz	"module_main$async_dispatch_16.mlir"
.Linfo_string15:
	.asciz	"module_main$async_dispatch_17.mlir"
.Linfo_string16:
	.asciz	"module_main$async_dispatch_18.mlir"
.Linfo_string17:
	.asciz	"module_main$async_dispatch_20.mlir"
.Linfo_string18:
	.asciz	"module_main$async_dispatch_21.mlir"
.Linfo_string19:
	.asciz	"main$async_dispatch_0_elementwise_16x2_i64xf32xf32"
.Linfo_string20:
	.asciz	"int"
.Linfo_string21:
	.asciz	"main$async_dispatch_1_reduction_16x2_f32"
.Linfo_string22:
	.asciz	"main$async_dispatch_2_reduction_16x2_f32"
.Linfo_string23:
	.asciz	"main$async_dispatch_3_matmul_16x6x2_f32"
.Linfo_string24:
	.asciz	"main$async_dispatch_4_attention_2x16x16"
.Linfo_string25:
	.asciz	"main$async_dispatch_5_matmul_16x2x2_f32"
.Linfo_string26:
	.asciz	"main$async_dispatch_7_reduction_16x2_f32"
.Linfo_string27:
	.asciz	"main$async_dispatch_8_matmul_16x8x2_f32"
.Linfo_string28:
	.asciz	"main$async_dispatch_9_matmul_16x2x8_f32"
.Linfo_string29:
	.asciz	"main$async_dispatch_11_reduction_16x2_f32"
.Linfo_string30:
	.asciz	"main$async_dispatch_12_matmul_16x6x2_f32"
.Linfo_string31:
	.asciz	"main$async_dispatch_14_matmul_16x2x2_f32"
.Linfo_string32:
	.asciz	"main$async_dispatch_16_reduction_16x2_f32"
.Linfo_string33:
	.asciz	"main$async_dispatch_17_matmul_16x8x2_f32"
.Linfo_string34:
	.asciz	"main$async_dispatch_18_matmul_16x2x8_f32"
.Linfo_string35:
	.asciz	"main$async_dispatch_20_reduction_16x2_f32"
.Linfo_string36:
	.asciz	"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32"
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_start0
.LpubNames_start0:
	.short	2
	.long	.Lcu_begin0
	.long	79
	.long	42
	.asciz	"main$async_dispatch_0_elementwise_16x2_i64xf32xf32"
	.long	0
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_start0
.LpubTypes_start0:
	.short	2
	.long	.Lcu_begin0
	.long	79
	.long	71
	.asciz	"int"
	.long	0
.LpubTypes_end0:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end1-.LpubNames_start1
.LpubNames_start1:
	.short	2
	.long	.Lcu_begin1
	.long	72
	.long	42
	.asciz	"main$async_dispatch_1_reduction_16x2_f32"
	.long	0
.LpubNames_end1:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end1-.LpubTypes_start1
.LpubTypes_start1:
	.short	2
	.long	.Lcu_begin1
	.long	72
	.long	0
.LpubTypes_end1:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end2-.LpubNames_start2
.LpubNames_start2:
	.short	2
	.long	.Lcu_begin2
	.long	72
	.long	42
	.asciz	"main$async_dispatch_2_reduction_16x2_f32"
	.long	0
.LpubNames_end2:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end2-.LpubTypes_start2
.LpubTypes_start2:
	.short	2
	.long	.Lcu_begin2
	.long	72
	.long	0
.LpubTypes_end2:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end3-.LpubNames_start3
.LpubNames_start3:
	.short	2
	.long	.Lcu_begin3
	.long	72
	.long	42
	.asciz	"main$async_dispatch_3_matmul_16x6x2_f32"
	.long	0
.LpubNames_end3:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end3-.LpubTypes_start3
.LpubTypes_start3:
	.short	2
	.long	.Lcu_begin3
	.long	72
	.long	0
.LpubTypes_end3:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end4-.LpubNames_start4
.LpubNames_start4:
	.short	2
	.long	.Lcu_begin4
	.long	72
	.long	42
	.asciz	"main$async_dispatch_4_attention_2x16x16"
	.long	0
.LpubNames_end4:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end4-.LpubTypes_start4
.LpubTypes_start4:
	.short	2
	.long	.Lcu_begin4
	.long	72
	.long	0
.LpubTypes_end4:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end5-.LpubNames_start5
.LpubNames_start5:
	.short	2
	.long	.Lcu_begin5
	.long	72
	.long	42
	.asciz	"main$async_dispatch_5_matmul_16x2x2_f32"
	.long	0
.LpubNames_end5:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end5-.LpubTypes_start5
.LpubTypes_start5:
	.short	2
	.long	.Lcu_begin5
	.long	72
	.long	0
.LpubTypes_end5:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end6-.LpubNames_start6
.LpubNames_start6:
	.short	2
	.long	.Lcu_begin6
	.long	72
	.long	42
	.asciz	"main$async_dispatch_7_reduction_16x2_f32"
	.long	0
.LpubNames_end6:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end6-.LpubTypes_start6
.LpubTypes_start6:
	.short	2
	.long	.Lcu_begin6
	.long	72
	.long	0
.LpubTypes_end6:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end7-.LpubNames_start7
.LpubNames_start7:
	.short	2
	.long	.Lcu_begin7
	.long	72
	.long	42
	.asciz	"main$async_dispatch_8_matmul_16x8x2_f32"
	.long	0
.LpubNames_end7:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end7-.LpubTypes_start7
.LpubTypes_start7:
	.short	2
	.long	.Lcu_begin7
	.long	72
	.long	0
.LpubTypes_end7:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end8-.LpubNames_start8
.LpubNames_start8:
	.short	2
	.long	.Lcu_begin8
	.long	72
	.long	42
	.asciz	"main$async_dispatch_9_matmul_16x2x8_f32"
	.long	0
.LpubNames_end8:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end8-.LpubTypes_start8
.LpubTypes_start8:
	.short	2
	.long	.Lcu_begin8
	.long	72
	.long	0
.LpubTypes_end8:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end9-.LpubNames_start9
.LpubNames_start9:
	.short	2
	.long	.Lcu_begin9
	.long	72
	.long	42
	.asciz	"main$async_dispatch_11_reduction_16x2_f32"
	.long	0
.LpubNames_end9:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end9-.LpubTypes_start9
.LpubTypes_start9:
	.short	2
	.long	.Lcu_begin9
	.long	72
	.long	0
.LpubTypes_end9:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end10-.LpubNames_start10
.LpubNames_start10:
	.short	2
	.long	.Lcu_begin10
	.long	72
	.long	42
	.asciz	"main$async_dispatch_12_matmul_16x6x2_f32"
	.long	0
.LpubNames_end10:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end10-.LpubTypes_start10
.LpubTypes_start10:
	.short	2
	.long	.Lcu_begin10
	.long	72
	.long	0
.LpubTypes_end10:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end11-.LpubNames_start11
.LpubNames_start11:
	.short	2
	.long	.Lcu_begin11
	.long	72
	.long	42
	.asciz	"main$async_dispatch_14_matmul_16x2x2_f32"
	.long	0
.LpubNames_end11:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end11-.LpubTypes_start11
.LpubTypes_start11:
	.short	2
	.long	.Lcu_begin11
	.long	72
	.long	0
.LpubTypes_end11:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end12-.LpubNames_start12
.LpubNames_start12:
	.short	2
	.long	.Lcu_begin12
	.long	72
	.long	42
	.asciz	"main$async_dispatch_16_reduction_16x2_f32"
	.long	0
.LpubNames_end12:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end12-.LpubTypes_start12
.LpubTypes_start12:
	.short	2
	.long	.Lcu_begin12
	.long	72
	.long	0
.LpubTypes_end12:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end13-.LpubNames_start13
.LpubNames_start13:
	.short	2
	.long	.Lcu_begin13
	.long	72
	.long	42
	.asciz	"main$async_dispatch_17_matmul_16x8x2_f32"
	.long	0
.LpubNames_end13:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end13-.LpubTypes_start13
.LpubTypes_start13:
	.short	2
	.long	.Lcu_begin13
	.long	72
	.long	0
.LpubTypes_end13:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end14-.LpubNames_start14
.LpubNames_start14:
	.short	2
	.long	.Lcu_begin14
	.long	72
	.long	42
	.asciz	"main$async_dispatch_18_matmul_16x2x8_f32"
	.long	0
.LpubNames_end14:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end14-.LpubTypes_start14
.LpubTypes_start14:
	.short	2
	.long	.Lcu_begin14
	.long	72
	.long	0
.LpubTypes_end14:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end15-.LpubNames_start15
.LpubNames_start15:
	.short	2
	.long	.Lcu_begin15
	.long	72
	.long	42
	.asciz	"main$async_dispatch_20_reduction_16x2_f32"
	.long	0
.LpubNames_end15:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end15-.LpubTypes_start15
.LpubTypes_start15:
	.short	2
	.long	.Lcu_begin15
	.long	72
	.long	0
.LpubTypes_end15:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end16-.LpubNames_start16
.LpubNames_start16:
	.short	2
	.long	.Lcu_begin16
	.long	72
	.long	42
	.asciz	"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32"
	.long	0
.LpubNames_end16:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end16-.LpubTypes_start16
.LpubTypes_start16:
	.short	2
	.long	.Lcu_begin16
	.long	72
	.long	0
.LpubTypes_end16:
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
