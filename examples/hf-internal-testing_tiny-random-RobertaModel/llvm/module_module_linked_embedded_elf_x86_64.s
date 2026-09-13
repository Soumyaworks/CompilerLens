	.att_syntax
	.file	"module_linked"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI0_0:
	.quad	1
	.section	".text.main$async_dispatch_0_elementwise_16_i64xi32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_0_elementwise_16_i64xi32,@function
main$async_dispatch_0_elementwise_16_i64xi32:
.Lfunc_begin0:
	.file	1 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_0.mlir"
	.loc	1 1 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp0:
	.loc	1 11 8 prologue_end
	movq	32(%rsi), %rax
	.loc	1 17 10
	vpbroadcastq	.LCPI0_0(%rip), %zmm0
	.loc	1 11 8
	movq	(%rax), %rcx
	.loc	1 12 8
	movq	8(%rax), %rax
	.loc	1 17 10
	vpcmpneqq	(%rcx), %zmm0, %k0
	vpcmpneqq	64(%rcx), %zmm0, %k1
	kunpckbw	%k0, %k1, %k0
	.loc	1 18 10
	vpmovm2d	%k0, %zmm0
	vpsrld	$31, %zmm0, %zmm0
	vmovdqa64	%zmm0, (%rax)
	.loc	1 22 8
	xorl	%eax, %eax
	.loc	1 22 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp1:
.Lfunc_end0:
	.size	main$async_dispatch_0_elementwise_16_i64xi32, .Lfunc_end0-main$async_dispatch_0_elementwise_16_i64xi32
	.cfi_endproc

	.section	".text.main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store,@function
main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store:
.Lfunc_begin1:
	.file	2 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_1.mlir"
	.loc	2 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-64, %rsp
	subq	$192, %rsp
.Ltmp2:
	.loc	2 12 8 prologue_end
	movq	32(%rsi), %rax
	xorl	%edx, %edx
	movq	(%rax), %rcx
	.loc	2 13 8
	movq	8(%rax), %rax
	.loc	2 0 8 is_stmt 0
.Ltmp3:
	.p2align	4
.LBB1_1:
	.loc	2 17 8 is_stmt 1
	movslq	(%rcx,%rdx,4), %rsi
	movq	%rsi, (%rsp,%rdx,8)
	incq	%rdx
	cmpq	$16, %rdx
	jne	.LBB1_1
	.loc	2 0 8 is_stmt 0
	xorl	%ecx, %ecx
	.p2align	4
.LBB1_3:
	.loc	2 23 8 is_stmt 1
	movq	$0, 64(%rax,%rcx,8)
	incq	%rcx
	cmpq	$16, %rcx
	jne	.LBB1_3
	.loc	2 0 8 is_stmt 0
	movq	(%rsp), %rcx
	xorl	%edx, %edx
	jmp	.LBB1_5
	.p2align	4
.LBB1_7:
	.loc	2 24 8 is_stmt 1
	movq	(%rsp,%rdx,8), %rsi
	.loc	2 26 10
	addq	56(%rax,%rdx,8), %rsi
	.loc	2 24 8
	movq	%rsi, 64(%rax,%rdx,8)
	incq	%rdx
	cmpq	$16, %rdx
	je	.LBB1_9
.LBB1_5:
	.loc	2 24 8
	testq	%rdx, %rdx
	jne	.LBB1_7
	movq	%rcx, 64(%rax)
	incq	%rdx
	cmpq	$16, %rdx
	jne	.LBB1_5
.LBB1_9:
	.loc	2 30 8
	xorl	%eax, %eax
	movq	%rbp, %rsp
	.loc	2 30 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp4:
.Lfunc_end1:
	.size	main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store, .Lfunc_end1-main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store
	.cfi_endproc

	.section	".text.main$async_dispatch_2_elementwise_16_i64xi32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_2_elementwise_16_i64xi32,@function
main$async_dispatch_2_elementwise_16_i64xi32:
.Lfunc_begin2:
	.file	3 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_2.mlir"
	.loc	3 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp5:
	.loc	3 11 8 prologue_end
	movq	32(%rsi), %rax
	movq	(%rax), %rcx
	.loc	3 12 8
	movq	8(%rax), %rax
	.loc	3 15 8
	vmovdqa64	64(%rcx), %zmm0
	vmovdqa64	128(%rcx), %zmm1
	.loc	3 17 10
	vpmovqd	%zmm0, %ymm0
	vpmovqd	%zmm1, %ymm1
	vinserti64x4	$1, %ymm1, %zmm0, %zmm0
	vmovdqa64	%zmm0, 192(%rax)
	.loc	3 21 8
	xorl	%eax, %eax
	.loc	3 21 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp6:
.Lfunc_end2:
	.size	main$async_dispatch_2_elementwise_16_i64xi32, .Lfunc_end2-main$async_dispatch_2_elementwise_16_i64xi32
	.cfi_endproc

	.section	".text.main$async_dispatch_3_elementwise_16_i32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_3_elementwise_16_i32,@function
main$async_dispatch_3_elementwise_16_i32:
.Lfunc_begin3:
	.file	4 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_3.mlir"
	.loc	4 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp7:
	.loc	4 12 8 prologue_end
	movq	32(%rsi), %rax
	movq	(%rax), %rcx
	.loc	4 14 8
	movq	8(%rax), %rax
	.loc	4 18 8
	vmovdqa64	(%rcx), %zmm0
	.loc	4 20 10
	vpmulld	192(%rcx), %zmm0, %zmm0
	vmovdqa64	%zmm0, 64(%rax)
	.loc	4 24 8
	xorl	%eax, %eax
	.loc	4 24 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp8:
.Lfunc_end3:
	.size	main$async_dispatch_3_elementwise_16_i32, .Lfunc_end3-main$async_dispatch_3_elementwise_16_i32
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
.LCPI4_0:
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.quad	5
	.quad	6
	.quad	7
.LCPI4_1:
	.quad	8
	.quad	9
	.quad	10
	.quad	11
	.quad	12
	.quad	13
	.quad	14
	.quad	15
	.section	".text.main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32,@function
main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32:
.Lfunc_begin4:
	.file	5 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_4.mlir"
	.loc	5 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp9:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.loc	5 17 8 prologue_end
	movq	32(%rsi), %rax
	vmovdqa64	.LCPI4_0(%rip), %zmm0
	vmovdqa64	.LCPI4_1(%rip), %zmm1
	xorl	%r9d, %r9d
	.loc	5 18 8
	movq	8(%rax), %rdx
	.loc	5 17 8
	movq	(%rax), %rcx
	.loc	5 22 8
	movq	16(%rax), %r10
	.loc	5 23 8
	movq	24(%rax), %rax
	.loc	5 19 8
	leaq	327808(%rdx), %rsi
	.loc	5 20 8
	leaq	194816(%rdx), %rdi
	.loc	5 21 8
	leaq	129280(%rdx), %r8
	.loc	5 23 8
	subq	$-128, %rax
	movq	%rcx, -192(%rbp)
	movq	%r10, -184(%rbp)
	movq	%rdx, -216(%rbp)
	movq	%rax, -176(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%rdi, -56(%rbp)
	movq	%r8, -48(%rbp)
	.loc	5 0 8 is_stmt 0
.Ltmp10:
	.p2align	4
.LBB4_1:
	movq	-192(%rbp), %rcx
	movq	-184(%rbp), %rax
	movq	%r9, -200(%rbp)
	.loc	5 38 8 is_stmt 1
	movslq	64(%rcx,%r9,4), %rcx
	movq	(%rax,%r9,8), %rax
	shlq	$7, %r9
	addq	-176(%rbp), %r9
	movq	%rcx, -232(%rbp)
	shlq	$5, %rcx
	shlq	$5, %rax
	movq	%r9, -224(%rbp)
	movb	$1, %r9b
	addq	$32, %rcx
	vpbroadcastq	%rax, %zmm2
	vpbroadcastq	%rcx, %zmm3
	xorl	%ecx, %ecx
	.loc	5 0 8 is_stmt 0
.Ltmp11:
	.p2align	4
.LBB4_2:
	movq	-232(%rbp), %rax
	.loc	5 38 8
	vpbroadcastq	%rcx, %zmm5
	movq	%rcx, -432(%rbp)
	movl	%r9d, -164(%rbp)
	.loc	5 40 10 is_stmt 1
	vporq	%zmm0, %zmm5, %zmm4
	vporq	%zmm1, %zmm5, %zmm5
	.loc	5 42 10
	movq	329864(%rdx,%rax,8), %rax
	.loc	5 44 10
	shlq	$5, %rax
	vpbroadcastq	%rax, %zmm6
	vporq	%zmm4, %zmm6, %zmm7
	vporq	%zmm5, %zmm6, %zmm6
	vmovq	%xmm7, %rdx
	vextracti128	$1, %ymm7, %xmm8
	testq	%rdx, %rdx
	leaq	31(%rdx), %rax
	cmovnsq	%rdx, %rax
	sets	%cl
	movq	%rax, %r8
	andq	$-32, %rax
	shrq	$5, %r8
	cmpq	%rax, %rdx
	setne	%al
	andl	$16, %edx
	andb	%cl, %al
	vpextrq	$1, %xmm7, %rcx
	movq	%rdx, -160(%rbp)
	movzbl	%al, %eax
	movq	%rcx, %rdx
	subq	%rax, %r8
	leaq	31(%rcx), %rax
	shlq	$7, %r8
	addq	%rsi, %r8
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	sarq	$63, %rdx
	andl	$17, %ecx
	movq	%r8, -144(%rbp)
	shrq	$5, %rax
	movq	%rcx, -152(%rbp)
	vmovq	%xmm8, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -136(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$18, %ecx
	shrq	$5, %rax
	movq	%rcx, -128(%rbp)
	vpextrq	$1, %xmm8, %rcx
	vextracti32x4	$2, %zmm7, %xmm8
	vextracti32x4	$3, %zmm7, %xmm7
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -112(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$19, %ecx
	shrq	$5, %rax
	movq	%rcx, -120(%rbp)
	vmovq	%xmm8, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -104(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$20, %ecx
	shrq	$5, %rax
	movq	%rcx, -96(%rbp)
	vpextrq	$1, %xmm8, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -88(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$21, %ecx
	shrq	$5, %rax
	movq	%rcx, -80(%rbp)
	vmovq	%xmm7, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -72(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$22, %ecx
	shrq	$5, %rax
	movq	%rcx, -64(%rbp)
	vpextrq	$1, %xmm7, %rcx
	vextracti128	$1, %ymm6, %xmm7
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -424(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$23, %ecx
	shrq	$5, %rax
	movq	%rcx, -416(%rbp)
	vmovq	%xmm6, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -408(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$24, %ecx
	shrq	$5, %rax
	movq	%rcx, -400(%rbp)
	vpextrq	$1, %xmm6, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -392(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$25, %ecx
	shrq	$5, %rax
	movq	%rcx, -384(%rbp)
	vmovq	%xmm7, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -376(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$26, %ecx
	shrq	$5, %rax
	movq	%rcx, -368(%rbp)
	vpextrq	$1, %xmm7, %rcx
	vextracti32x4	$2, %zmm6, %xmm7
	vextracti32x4	$3, %zmm6, %xmm6
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -360(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$27, %ecx
	shrq	$5, %rax
	movq	%rcx, -352(%rbp)
	vmovq	%xmm7, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -344(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$28, %ecx
	shrq	$5, %rax
	movq	%rcx, -336(%rbp)
	vpextrq	$1, %xmm7, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -328(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$29, %ecx
	shrq	$5, %rax
	movq	%rcx, -320(%rbp)
	vmovq	%xmm6, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -312(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$30, %ecx
	shrq	$5, %rax
	movq	%rcx, -304(%rbp)
	vpextrq	$1, %xmm6, %rcx
	.loc	5 46 10
	vporq	%zmm2, %zmm4, %zmm6
	.loc	5 44 10
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	.loc	5 46 10
	vextracti128	$1, %ymm6, %xmm7
	.loc	5 44 10
	shlq	$7, %rdx
	addq	%rsi, %rdx
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	movq	%rdx, -296(%rbp)
	movq	%rcx, %rdx
	sarq	$63, %rdx
	andl	$31, %ecx
	shrq	$5, %rax
	movq	%rcx, -288(%rbp)
	addq	%rax, %rdx
	shlq	$7, %rdx
	addq	%rsi, %rdx
	movq	%rdx, -280(%rbp)
	.loc	5 46 10
	vmovq	%xmm6, %rdx
	testq	%rdx, %rdx
	leaq	31(%rdx), %rax
	cmovnsq	%rdx, %rax
	sets	%cl
	movq	%rax, %r15
	andq	$-32, %rax
	shrq	$5, %r15
	cmpq	%rax, %rdx
	setne	%al
	andl	$16, %edx
	andb	%cl, %al
	vpextrq	$1, %xmm6, %rcx
	movq	%rdx, -272(%rbp)
	movzbl	%al, %eax
	movq	%rcx, %r11
	subq	%rax, %r15
	leaq	31(%rcx), %rax
	shlq	$7, %r15
	addq	%rdi, %r15
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	sarq	$63, %r11
	andl	$17, %ecx
	shrq	$5, %rax
	movq	%rcx, -264(%rbp)
	vmovq	%xmm7, %rcx
	addq	%rax, %r11
	leaq	31(%rcx), %rax
	movq	%rcx, %r10
	shlq	$7, %r11
	addq	%rdi, %r11
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	sarq	$63, %r10
	andl	$18, %ecx
	shrq	$5, %rax
	movq	%rcx, -256(%rbp)
	vpextrq	$1, %xmm7, %rcx
	vextracti32x4	$2, %zmm6, %xmm7
	vextracti32x4	$3, %zmm6, %xmm6
	addq	%rax, %r10
	leaq	31(%rcx), %rax
	vpextrq	$1, %xmm7, %r13
	vmovq	%xmm6, %r12
	vpextrq	$1, %xmm6, %r14
	vporq	%zmm2, %zmm5, %zmm6
	.loc	5 47 10
	vporq	%zmm3, %zmm5, %zmm5
	.loc	5 46 10
	shlq	$7, %r10
	movq	%r13, %rsi
	movq	%r12, %r9
	movq	%r14, %rbx
	vmovq	%xmm6, %rdx
	vextracti128	$1, %ymm6, %xmm8
	vextracti32x4	$2, %zmm6, %xmm10
	vextracti32x4	$3, %zmm6, %xmm13
	addq	%rdi, %r10
	testq	%rcx, %rcx
	movq	%rcx, %rdi
	cmovnsq	%rcx, %rax
	andl	$19, %ecx
	sarq	$63, %rdi
	shrq	$5, %rax
	movq	%rcx, -248(%rbp)
	vmovq	%xmm7, %rcx
	addq	%rax, %rdi
	leaq	31(%rcx), %rax
	movq	%rcx, %r8
	shlq	$7, %rdi
	addq	-56(%rbp), %rdi
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	sarq	$63, %r8
	andl	$20, %ecx
	shrq	$5, %rax
	movq	%rcx, -240(%rbp)
	leaq	31(%r14), %rcx
	addq	%rax, %r8
	leaq	31(%r13), %rax
	shlq	$7, %r8
	addq	-56(%rbp), %r8
	testq	%r13, %r13
	cmovnsq	%r13, %rax
	sarq	$63, %rsi
	andl	$21, %r13d
	shrq	$5, %rax
	addq	%rax, %rsi
	leaq	31(%r12), %rax
	shlq	$7, %rsi
	addq	-56(%rbp), %rsi
	testq	%r12, %r12
	cmovnsq	%r12, %rax
	sarq	$63, %r9
	andl	$22, %r12d
	shrq	$5, %rax
	addq	%rax, %r9
	leaq	31(%rdx), %rax
	shlq	$7, %r9
	addq	-56(%rbp), %r9
	testq	%r14, %r14
	cmovnsq	%r14, %rcx
	sarq	$63, %rbx
	andl	$23, %r14d
	shrq	$5, %rcx
	addq	%rcx, %rbx
	movq	%rdx, %rcx
	shlq	$7, %rbx
	addq	-56(%rbp), %rbx
	testq	%rdx, %rdx
	cmovnsq	%rdx, %rax
	sarq	$63, %rcx
	andl	$24, %edx
	shrq	$5, %rax
	addq	%rax, %rcx
	vpextrq	$1, %xmm6, %rax
	shlq	$7, %rcx
	addq	-56(%rbp), %rcx
	testq	%rax, %rax
	.loc	5 48 10
	vmovss	(%rcx,%rdx,4), %xmm7
	.loc	5 46 10
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$25, %eax
	shrq	$5, %rcx
	addq	%rcx, %rdx
	shlq	$7, %rdx
	addq	-56(%rbp), %rdx
	.loc	5 48 10
	vinsertps	$16, (%rdx,%rax,4), %xmm7, %xmm7
	.loc	5 46 10
	vmovq	%xmm8, %rax
	testq	%rax, %rax
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$26, %eax
	shrq	$5, %rcx
	addq	%rcx, %rdx
	shlq	$7, %rdx
	addq	-56(%rbp), %rdx
	.loc	5 48 10
	vinsertps	$32, (%rdx,%rax,4), %xmm7, %xmm7
	.loc	5 46 10
	vpextrq	$1, %xmm8, %rax
	testq	%rax, %rax
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$27, %eax
	shrq	$5, %rcx
	addq	%rcx, %rdx
	shlq	$7, %rdx
	addq	-56(%rbp), %rdx
	.loc	5 48 10
	vinsertps	$48, (%rdx,%rax,4), %xmm7, %xmm7
	movq	-240(%rbp), %rax
	vmovss	(%r8,%rax,4), %xmm8
	.loc	5 46 10
	vmovq	%xmm10, %rax
	testq	%rax, %rax
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	.loc	5 48 10
	vinsertps	$16, (%rsi,%r13,4), %xmm8, %xmm8
	.loc	5 46 10
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$28, %eax
	.loc	5 48 10
	vinsertps	$32, (%r9,%r12,4), %xmm8, %xmm8
	.loc	5 46 10
	shrq	$5, %rcx
	.loc	5 48 10
	vinsertps	$48, (%rbx,%r14,4), %xmm8, %xmm8
	.loc	5 47 10
	vmovq	%xmm5, %r14
	vpextrq	$1, %xmm5, %rbx
	.loc	5 46 10
	addq	%rcx, %rdx
	movq	-336(%rbp), %rcx
	.loc	5 47 10
	movq	%r14, %r8
	.loc	5 46 10
	shlq	$7, %rdx
	addq	-56(%rbp), %rdx
	.loc	5 48 10
	vmovss	(%rdx,%rax,4), %xmm11
	movq	-272(%rbp), %rax
	movq	-328(%rbp), %rdx
	vmovss	(%r15,%rax,4), %xmm9
	movq	-264(%rbp), %rax
	vinsertps	$16, (%r11,%rax,4), %xmm9, %xmm9
	movq	-256(%rbp), %rax
	vinsertps	$32, (%r10,%rax,4), %xmm9, %xmm9
	movq	-248(%rbp), %rax
	.loc	5 47 10
	movq	%rbx, %r10
	.loc	5 48 10
	vinsertps	$48, (%rdi,%rax,4), %xmm9, %xmm9
	.loc	5 46 10
	vpextrq	$1, %xmm10, %rax
	.loc	5 48 10
	vmovss	(%rdx,%rcx,4), %xmm10
	.loc	5 46 10
	testq	%rax, %rax
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$29, %eax
	shrq	$5, %rcx
	addq	%rcx, %rdx
	movq	-312(%rbp), %rcx
	shlq	$7, %rdx
	addq	-56(%rbp), %rdx
	.loc	5 48 10
	vinsertf128	$1, %xmm8, %ymm9, %ymm8
	vinsertps	$16, (%rdx,%rax,4), %xmm11, %xmm11
	movq	-320(%rbp), %rax
	vinsertps	$16, (%rcx,%rax,4), %xmm10, %xmm10
	movq	-304(%rbp), %rax
	movq	-296(%rbp), %rcx
	vinsertps	$32, (%rcx,%rax,4), %xmm10, %xmm10
	movq	-288(%rbp), %rax
	movq	-280(%rbp), %rcx
	vinsertps	$48, (%rcx,%rax,4), %xmm10, %xmm10
	movq	-400(%rbp), %rax
	movq	-392(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm12
	movq	-384(%rbp), %rax
	movq	-376(%rbp), %rcx
	vinsertps	$16, (%rcx,%rax,4), %xmm12, %xmm12
	.loc	5 46 10
	vmovq	%xmm13, %rax
	testq	%rax, %rax
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$30, %eax
	shrq	$5, %rcx
	addq	%rcx, %rdx
	movq	-360(%rbp), %rcx
	shlq	$7, %rdx
	addq	-56(%rbp), %rdx
	.loc	5 48 10
	vinsertps	$32, (%rdx,%rax,4), %xmm11, %xmm11
	movq	-368(%rbp), %rax
	movq	-424(%rbp), %rdx
	vinsertps	$32, (%rcx,%rax,4), %xmm12, %xmm6
	movq	-352(%rbp), %rax
	movq	-344(%rbp), %rcx
	vinsertps	$48, (%rcx,%rax,4), %xmm6, %xmm6
	movq	-96(%rbp), %rax
	movq	-88(%rbp), %rcx
	vmovss	(%rcx,%rax,4), %xmm12
	movq	-80(%rbp), %rax
	movq	-72(%rbp), %rcx
	vinsertf128	$1, %xmm10, %ymm6, %ymm6
	vinsertps	$16, (%rcx,%rax,4), %xmm12, %xmm12
	movq	-64(%rbp), %rcx
	.loc	5 46 10
	vpextrq	$1, %xmm13, %rax
	.loc	5 47 10
	vporq	%zmm3, %zmm4, %zmm13
	.loc	5 46 10
	testq	%rax, %rax
	.loc	5 47 10
	vextracti128	$1, %ymm13, %xmm14
	.loc	5 48 10
	vinsertps	$32, (%rdx,%rcx,4), %xmm12, %xmm12
	.loc	5 46 10
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$31, %eax
	shrq	$5, %rcx
	addq	%rcx, %rdx
	movq	-408(%rbp), %rcx
	shlq	$7, %rdx
	addq	-56(%rbp), %rdx
	.loc	5 48 10
	vinsertps	$48, (%rdx,%rax,4), %xmm11, %xmm11
	movq	-416(%rbp), %rax
	.loc	5 47 10
	vmovq	%xmm13, %rdx
	testq	%rdx, %rdx
	.loc	5 48 10
	vinsertps	$48, (%rcx,%rax,4), %xmm12, %xmm4
	.loc	5 47 10
	leaq	31(%rdx), %rax
	sets	%cl
	cmovnsq	%rdx, %rax
	movq	%rax, %rsi
	andq	$-32, %rax
	shrq	$5, %rsi
	cmpq	%rax, %rdx
	.loc	5 48 10
	vinsertf128	$1, %xmm11, %ymm7, %ymm7
	.loc	5 47 10
	setne	%al
	andl	$16, %edx
	andb	%cl, %al
	movq	-144(%rbp), %rcx
	movq	%rdx, -96(%rbp)
	vpextrq	$1, %xmm13, %rdx
	.loc	5 48 10
	vinsertf64x4	$1, %ymm7, %zmm8, %zmm7
	.loc	5 47 10
	movzbl	%al, %eax
	subq	%rax, %rsi
	movq	-160(%rbp), %rax
	shlq	$7, %rsi
	addq	-48(%rbp), %rsi
	testq	%rdx, %rdx
	.loc	5 48 10
	vmovss	(%rcx,%rax,4), %xmm12
	.loc	5 47 10
	leaq	31(%rdx), %rax
	movq	%rdx, %rcx
	cmovnsq	%rdx, %rax
	sarq	$63, %rdx
	andl	$17, %ecx
	movq	%rsi, -88(%rbp)
	vpextrq	$1, %xmm14, %rsi
	shrq	$5, %rax
	movq	%rcx, -160(%rbp)
	movq	-136(%rbp), %rcx
	addq	%rax, %rdx
	movq	-152(%rbp), %rax
	shlq	$7, %rdx
	addq	-48(%rbp), %rdx
	.loc	5 48 10
	vinsertps	$16, (%rcx,%rax,4), %xmm12, %xmm12
	movq	%rdx, -144(%rbp)
	.loc	5 47 10
	vmovq	%xmm14, %rdx
	vextracti32x4	$2, %zmm13, %xmm14
	vextracti32x4	$3, %zmm13, %xmm13
	leaq	31(%rdx), %rax
	testq	%rdx, %rdx
	movq	%rdx, %rcx
	cmovnsq	%rdx, %rax
	andl	$18, %ecx
	sarq	$63, %rdx
	shrq	$5, %rax
	movq	%rcx, -152(%rbp)
	movq	-112(%rbp), %rcx
	addq	%rax, %rdx
	movq	-128(%rbp), %rax
	shlq	$7, %rdx
	addq	-48(%rbp), %rdx
	testq	%rsi, %rsi
	.loc	5 48 10
	vinsertps	$32, (%rcx,%rax,4), %xmm12, %xmm12
	.loc	5 47 10
	leaq	31(%rsi), %rax
	movq	-104(%rbp), %rcx
	cmovnsq	%rsi, %rax
	movq	%rdx, -136(%rbp)
	movq	%rsi, %rdx
	sarq	$63, %rdx
	andl	$19, %esi
	shrq	$5, %rax
	movq	%rsi, -128(%rbp)
	vmovq	%xmm14, %rsi
	addq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rsi, %r15
	shlq	$7, %rdx
	addq	-48(%rbp), %rdx
	testq	%rsi, %rsi
	.loc	5 48 10
	vinsertps	$48, (%rcx,%rax,4), %xmm12, %xmm12
	.loc	5 47 10
	leaq	31(%rsi), %rax
	vpextrq	$1, %xmm14, %rcx
	cmovnsq	%rsi, %rax
	sarq	$63, %r15
	andl	$20, %esi
	movq	%rdx, -120(%rbp)
	movq	%rcx, %rdx
	shrq	$5, %rax
	movq	%rsi, -80(%rbp)
	addq	%rax, %r15
	leaq	31(%rcx), %rax
	shlq	$7, %r15
	addq	-48(%rbp), %r15
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	andl	$21, %ecx
	sarq	$63, %rdx
	shrq	$5, %rax
	movq	%rcx, -112(%rbp)
	vmovq	%xmm13, %rcx
	addq	%rax, %rdx
	leaq	31(%rcx), %rax
	movq	%rcx, %r13
	shlq	$7, %rdx
	addq	-48(%rbp), %rdx
	testq	%rcx, %rcx
	.loc	5 48 10
	vinsertf128	$1, %xmm4, %ymm12, %ymm4
	.loc	5 47 10
	cmovnsq	%rcx, %rax
	andl	$22, %ecx
	sarq	$63, %r13
	shrq	$5, %rax
	movq	%rcx, -72(%rbp)
	vpextrq	$1, %xmm13, %rcx
	vextracti128	$1, %ymm5, %xmm13
	.loc	5 48 10
	vinsertf64x4	$1, %ymm6, %zmm4, %zmm4
	.loc	5 47 10
	addq	%rax, %r13
	leaq	31(%rcx), %rax
	movq	%rcx, %r12
	vmovq	%xmm13, %r11
	vpextrq	$1, %xmm13, %rdi
	vextracti32x4	$2, %zmm5, %xmm13
	vextracti32x4	$3, %zmm5, %xmm5
	shlq	$7, %r13
	addq	-48(%rbp), %r13
	testq	%rcx, %rcx
	movq	%r11, %r9
	movq	%rdi, %rsi
	.loc	5 48 10
	vaddps	%zmm7, %zmm4, %zmm4
	.loc	5 47 10
	cmovnsq	%rcx, %rax
	sarq	$63, %r12
	andl	$23, %ecx
	movq	%rdx, -104(%rbp)
	vmovq	%xmm13, %rdx
	shrq	$5, %rax
	movq	%rcx, -64(%rbp)
	movq	%rdx, %rcx
	addq	%rax, %r12
	leaq	31(%r14), %rax
	shlq	$7, %r12
	addq	-48(%rbp), %r12
	testq	%r14, %r14
	cmovnsq	%r14, %rax
	sarq	$63, %r8
	andl	$24, %r14d
	shrq	$5, %rax
	addq	%rax, %r8
	leaq	31(%rbx), %rax
	shlq	$7, %r8
	addq	-48(%rbp), %r8
	testq	%rbx, %rbx
	cmovnsq	%rbx, %rax
	sarq	$63, %r10
	andl	$25, %ebx
	shrq	$5, %rax
	addq	%rax, %r10
	leaq	31(%r11), %rax
	shlq	$7, %r10
	addq	-48(%rbp), %r10
	testq	%r11, %r11
	cmovnsq	%r11, %rax
	sarq	$63, %r9
	andl	$26, %r11d
	.loc	5 49 10
	vmovss	(%r8,%r14,4), %xmm14
	movq	-48(%rbp), %r8
	.loc	5 47 10
	shrq	$5, %rax
	addq	%rax, %r9
	leaq	31(%rdi), %rax
	shlq	$7, %r9
	addq	-48(%rbp), %r9
	testq	%rdi, %rdi
	cmovnsq	%rdi, %rax
	sarq	$63, %rsi
	andl	$27, %edi
	.loc	5 49 10
	vinsertps	$16, (%r10,%rbx,4), %xmm14, %xmm14
	.loc	5 47 10
	shrq	$5, %rax
	addq	%rax, %rsi
	leaq	31(%rdx), %rax
	shlq	$7, %rsi
	addq	-48(%rbp), %rsi
	testq	%rdx, %rdx
	cmovnsq	%rdx, %rax
	sarq	$63, %rcx
	andl	$28, %edx
	.loc	5 49 10
	vinsertps	$32, (%r9,%r11,4), %xmm14, %xmm14
	.loc	5 47 10
	shrq	$5, %rax
	addq	%rax, %rcx
	vpextrq	$1, %xmm13, %rax
	shlq	$7, %rcx
	addq	-48(%rbp), %rcx
	testq	%rax, %rax
	.loc	5 49 10
	vinsertps	$48, (%rsi,%rdi,4), %xmm14, %xmm14
	movq	-56(%rbp), %rdi
	movq	-208(%rbp), %rsi
	vmovss	(%rcx,%rdx,4), %xmm13
	.loc	5 47 10
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$29, %eax
	shrq	$5, %rcx
	addq	%rcx, %rdx
	shlq	$7, %rdx
	addq	-48(%rbp), %rdx
	.loc	5 49 10
	vinsertps	$16, (%rdx,%rax,4), %xmm13, %xmm13
	movq	-80(%rbp), %rax
	vmovss	(%r15,%rax,4), %xmm15
	.loc	5 47 10
	vmovq	%xmm5, %rax
	testq	%rax, %rax
	leaq	31(%rax), %rcx
	movq	%rax, %rdx
	cmovnsq	%rax, %rcx
	sarq	$63, %rdx
	andl	$30, %eax
	shrq	$5, %rcx
	addq	%rcx, %rdx
	movq	-104(%rbp), %rcx
	shlq	$7, %rdx
	addq	%r8, %rdx
	.loc	5 49 10
	vinsertps	$32, (%rdx,%rax,4), %xmm13, %xmm13
	movq	-112(%rbp), %rax
	movq	-144(%rbp), %rdx
	vinsertps	$16, (%rcx,%rax,4), %xmm15, %xmm15
	movq	-72(%rbp), %rax
	movq	-88(%rbp), %rcx
	vinsertps	$32, (%r13,%rax,4), %xmm15, %xmm15
	movq	-64(%rbp), %rax
	vinsertps	$48, (%r12,%rax,4), %xmm15, %xmm15
	movq	-96(%rbp), %rax
	vmovss	(%rcx,%rax,4), %xmm16
	movq	-160(%rbp), %rcx
	.loc	5 47 10
	vpextrq	$1, %xmm5, %rax
	leaq	31(%rax), %r9
	testq	%rax, %rax
	cmovnsq	%rax, %r9
	shrq	$5, %r9
	.loc	5 49 10
	vinsertps	$16, (%rdx,%rcx,4), %xmm16, %xmm5
	.loc	5 47 10
	movq	%rax, %rdx
	sarq	$63, %rdx
	andl	$31, %eax
	movq	-136(%rbp), %rcx
	addq	%r9, %rdx
	movq	-432(%rbp), %r9
	shlq	$7, %rdx
	addq	%r8, %rdx
	movq	-120(%rbp), %r8
	.loc	5 49 10
	vinsertps	$48, (%rdx,%rax,4), %xmm13, %xmm13
	movq	-152(%rbp), %rax
	movq	-216(%rbp), %rdx
	vinsertps	$32, (%rcx,%rax,4), %xmm5, %xmm5
	movq	-128(%rbp), %rax
	movq	-224(%rbp), %rcx
	vinsertf128	$1, %xmm13, %ymm14, %ymm6
	vinsertps	$48, (%r8,%rax,4), %xmm5, %xmm5
	movl	-164(%rbp), %eax
	vinsertf128	$1, %xmm15, %ymm5, %ymm5
	vinsertf64x4	$1, %ymm6, %zmm5, %zmm5
	vaddps	%zmm5, %zmm4, %zmm4
	.loc	5 38 8
	vmovaps	%zmm4, (%rcx,%r9,4)
	movl	$16, %ecx
	xorl	%r9d, %r9d
	testb	$1, %al
	jne	.LBB4_2
	.loc	5 0 8 is_stmt 0
	movq	-200(%rbp), %r9
	.loc	5 38 8
	incq	%r9
	cmpq	$16, %r9
	jne	.LBB4_1
	.loc	5 53 8 is_stmt 1
	xorl	%eax, %eax
	.loc	5 53 8 epilogue_begin is_stmt 0
	addq	$264, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp12:
.Lfunc_end4:
	.size	main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32, .Lfunc_end4-main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI5_0:
	.long	0x3d000000
	.section	".text.main$async_dispatch_5_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_5_reduction_16x32_f32,@function
main$async_dispatch_5_reduction_16x32_f32:
.Lfunc_begin5:
	.file	6 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_5.mlir"
	.loc	6 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp13:
	.loc	6 11 8 prologue_end
	movq	24(%rsi), %rcx
	movq	32(%rsi), %rsi
	.loc	6 25 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%edi, %edi
	.loc	6 11 8
	movl	(%rcx), %eax
	.loc	6 12 8
	movl	4(%rcx), %ecx
	.loc	6 19 8
	andl	$-4, %eax
	addq	(%rsi), %rax
	.loc	6 20 8
	andl	$-4, %ecx
	addq	8(%rsi), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	addq	%rax, %rsi
	.loc	6 0 8 is_stmt 0
.Ltmp14:
	.p2align	4
.LBB5_1:
	.loc	6 27 10 is_stmt 1
	vaddss	(%rsi,%rdi,4), %xmm0, %xmm1
	vmovshdup	%xmm0, %xmm0
	vaddss	128(%rsi,%rdi,4), %xmm0, %xmm0
	movl	%r9d, %r8d
	xorl	%r9d, %r9d
	vaddss	4(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	132(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	8(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	136(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	12(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	140(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	16(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	144(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	20(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	148(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	24(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	152(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	28(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	156(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	32(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	160(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	36(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	164(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	40(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	168(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	44(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	172(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	48(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	176(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	52(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	180(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	56(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	184(%rsi,%rdi,4), %xmm0, %xmm0
	vaddss	60(%rsi,%rdi,4), %xmm1, %xmm1
	vaddss	188(%rsi,%rdi,4), %xmm0, %xmm0
	movl	$16, %edi
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	6 25 8
	testb	$1, %r8b
	jne	.LBB5_1
	.loc	6 32 10
	vmulps	.LCPI5_0(%rip){1to4}, %xmm0, %xmm1
	shlq	$6, %rdx
	movb	$1, %dil
	xorl	%esi, %esi
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	6 0 10 is_stmt 0
.Ltmp15:
	.p2align	4
.LBB5_3:
	.loc	6 30 8 is_stmt 1
	orq	%rdx, %rsi
	movl	%edi, %r8d
	xorl	%edi, %edi
	vmovaps	(%rax,%rsi,4), %zmm2
	vmovaps	128(%rax,%rsi,4), %zmm3
	.loc	6 33 10
	vsubps	%zmm0, %zmm2, %zmm2
	vsubps	%zmm1, %zmm3, %zmm3
	.loc	6 30 8
	vmovaps	%zmm2, (%rcx,%rsi,4)
	vmovaps	%zmm3, 128(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r8b
	jne	.LBB5_3
	.loc	6 37 8
	xorl	%eax, %eax
	.loc	6 37 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp16:
.Lfunc_end5:
	.size	main$async_dispatch_5_reduction_16x32_f32, .Lfunc_end5-main$async_dispatch_5_reduction_16x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI6_0:
	.long	0x3d000000
.LCPI6_1:
	.long	0x2b8cbccc
.LCPI6_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_6_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_6_reduction_16x32_f32,@function
main$async_dispatch_6_reduction_16x32_f32:
.Lfunc_begin6:
	.file	7 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_6.mlir"
	.loc	7 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp17:
	.loc	7 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	7 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	7 16 8
	movq	(%rcx), %rax
	.loc	7 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	leaq	2176(%rax,%rsi), %rsi
	.loc	7 16 8
	addq	$2176, %rax
	.loc	7 0 8 is_stmt 0
.Ltmp18:
	.p2align	4
.LBB6_1:
	.loc	7 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	7 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	7 22 8
	testb	$1, %dil
	jne	.LBB6_1
	.loc	7 30 10
	vmulps	.LCPI6_0(%rip){1to4}, %xmm0, %xmm0
	.loc	7 32 10
	vbroadcastss	.LCPI6_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	7 31 10
	vaddps	.LCPI6_1(%rip){1to4}, %xmm0, %xmm0
	.loc	7 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	7 0 10 is_stmt 0
.Ltmp19:
	.p2align	4
.LBB6_3:
	.loc	7 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	7 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	7 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	7 28 8
	vmovaps	%zmm4, (%rcx,%rsi,4)
	vmovaps	%zmm5, 128(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB6_3
	.loc	7 39 8
	xorl	%eax, %eax
	.loc	7 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp20:
.Lfunc_end6:
	.size	main$async_dispatch_6_reduction_16x32_f32, .Lfunc_end6-main$async_dispatch_6_reduction_16x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_7_batch_matmul_1x16x32x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_7_batch_matmul_1x16x32x32_f32,@function
main$async_dispatch_7_batch_matmul_1x16x32x32_f32:
.Lfunc_begin7:
	.file	8 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_7.mlir"
	.loc	8 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp21:
	.loc	8 11 8 prologue_end
	movq	24(%rsi), %rcx
	movq	32(%rsi), %rsi
	.loc	8 26 8
	movl	(%rdx), %edx
	xorl	%edi, %edi
	.loc	8 11 8
	movl	(%rcx), %eax
	.loc	8 12 8
	movl	4(%rcx), %ecx
	shlq	$10, %rdx
	.loc	8 21 8
	andl	$-4, %ecx
	addq	16(%rsi), %rcx
	.loc	8 20 8
	andl	$-4, %eax
	addq	8(%rsi), %rax
	addq	%rdx, %rcx
	addq	(%rsi), %rdx
	movb	$1, %sil
	.loc	8 0 8 is_stmt 0
.Ltmp22:
	.p2align	4
.LBB7_1:
	.loc	8 26 8 is_stmt 1
	leaq	(%rax,%rdi,4), %r8
	movb	$1, %r11b
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	xorl	%r9d, %r9d
	.loc	8 0 8 is_stmt 0
.Ltmp23:
	.p2align	4
.LBB7_2:
	movl	%r11d, %r10d
	.loc	8 26 8
	movq	%r9, %r11
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm23
	movq	%r9, %r11
	orq	$1, %r11
	vfmadd231ps	(%rdx,%r9,4){1to16}, %zmm23, %zmm0
	vfmadd231ps	128(%rdx,%r9,4){1to16}, %zmm23, %zmm1
	vfmadd231ps	256(%rdx,%r9,4){1to16}, %zmm23, %zmm2
	vfmadd231ps	384(%rdx,%r9,4){1to16}, %zmm23, %zmm3
	vfmadd231ps	512(%rdx,%r9,4){1to16}, %zmm23, %zmm4
	vfmadd231ps	640(%rdx,%r9,4){1to16}, %zmm23, %zmm5
	vfmadd231ps	768(%rdx,%r9,4){1to16}, %zmm23, %zmm6
	vfmadd231ps	896(%rdx,%r9,4){1to16}, %zmm23, %zmm7
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm22
	movq	%r9, %r11
	orq	$2, %r11
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm21
	movq	%r9, %r11
	orq	$3, %r11
	vfmadd231ps	4(%rdx,%r9,4){1to16}, %zmm22, %zmm0
	vfmadd231ps	132(%rdx,%r9,4){1to16}, %zmm22, %zmm1
	vfmadd231ps	260(%rdx,%r9,4){1to16}, %zmm22, %zmm2
	vfmadd231ps	388(%rdx,%r9,4){1to16}, %zmm22, %zmm3
	vfmadd231ps	516(%rdx,%r9,4){1to16}, %zmm22, %zmm4
	vfmadd231ps	644(%rdx,%r9,4){1to16}, %zmm22, %zmm5
	vfmadd231ps	772(%rdx,%r9,4){1to16}, %zmm22, %zmm6
	vfmadd231ps	900(%rdx,%r9,4){1to16}, %zmm22, %zmm7
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm20
	movq	%r9, %r11
	orq	$4, %r11
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm19
	movq	%r9, %r11
	orq	$5, %r11
	vfmadd231ps	8(%rdx,%r9,4){1to16}, %zmm21, %zmm0
	vfmadd231ps	136(%rdx,%r9,4){1to16}, %zmm21, %zmm1
	vfmadd231ps	264(%rdx,%r9,4){1to16}, %zmm21, %zmm2
	vfmadd231ps	392(%rdx,%r9,4){1to16}, %zmm21, %zmm3
	vfmadd231ps	520(%rdx,%r9,4){1to16}, %zmm21, %zmm4
	vfmadd231ps	648(%rdx,%r9,4){1to16}, %zmm21, %zmm5
	vfmadd231ps	776(%rdx,%r9,4){1to16}, %zmm21, %zmm6
	vfmadd231ps	904(%rdx,%r9,4){1to16}, %zmm21, %zmm7
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm18
	movq	%r9, %r11
	orq	$6, %r11
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm17
	movq	%r9, %r11
	orq	$7, %r11
	vfmadd231ps	12(%rdx,%r9,4){1to16}, %zmm20, %zmm0
	vfmadd231ps	140(%rdx,%r9,4){1to16}, %zmm20, %zmm1
	vfmadd231ps	268(%rdx,%r9,4){1to16}, %zmm20, %zmm2
	vfmadd231ps	396(%rdx,%r9,4){1to16}, %zmm20, %zmm3
	vfmadd231ps	524(%rdx,%r9,4){1to16}, %zmm20, %zmm4
	vfmadd231ps	652(%rdx,%r9,4){1to16}, %zmm20, %zmm5
	vfmadd231ps	780(%rdx,%r9,4){1to16}, %zmm20, %zmm6
	vfmadd231ps	908(%rdx,%r9,4){1to16}, %zmm20, %zmm7
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm16
	movq	%r9, %r11
	orq	$8, %r11
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm15
	movq	%r9, %r11
	orq	$9, %r11
	vfmadd231ps	16(%rdx,%r9,4){1to16}, %zmm19, %zmm0
	vfmadd231ps	144(%rdx,%r9,4){1to16}, %zmm19, %zmm1
	vfmadd231ps	272(%rdx,%r9,4){1to16}, %zmm19, %zmm2
	vfmadd231ps	400(%rdx,%r9,4){1to16}, %zmm19, %zmm3
	vfmadd231ps	528(%rdx,%r9,4){1to16}, %zmm19, %zmm4
	vfmadd231ps	656(%rdx,%r9,4){1to16}, %zmm19, %zmm5
	vfmadd231ps	784(%rdx,%r9,4){1to16}, %zmm19, %zmm6
	vfmadd231ps	912(%rdx,%r9,4){1to16}, %zmm19, %zmm7
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm14
	movq	%r9, %r11
	orq	$10, %r11
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm13
	movq	%r9, %r11
	orq	$11, %r11
	vfmadd231ps	20(%rdx,%r9,4){1to16}, %zmm18, %zmm0
	vfmadd231ps	148(%rdx,%r9,4){1to16}, %zmm18, %zmm1
	vfmadd231ps	276(%rdx,%r9,4){1to16}, %zmm18, %zmm2
	vfmadd231ps	404(%rdx,%r9,4){1to16}, %zmm18, %zmm3
	vfmadd231ps	532(%rdx,%r9,4){1to16}, %zmm18, %zmm4
	vfmadd231ps	660(%rdx,%r9,4){1to16}, %zmm18, %zmm5
	vfmadd231ps	788(%rdx,%r9,4){1to16}, %zmm18, %zmm6
	vfmadd231ps	916(%rdx,%r9,4){1to16}, %zmm18, %zmm7
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm12
	movq	%r9, %r11
	orq	$12, %r11
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm11
	movq	%r9, %r11
	orq	$13, %r11
	vfmadd231ps	24(%rdx,%r9,4){1to16}, %zmm17, %zmm0
	vfmadd231ps	152(%rdx,%r9,4){1to16}, %zmm17, %zmm1
	vfmadd231ps	280(%rdx,%r9,4){1to16}, %zmm17, %zmm2
	vfmadd231ps	408(%rdx,%r9,4){1to16}, %zmm17, %zmm3
	vfmadd231ps	536(%rdx,%r9,4){1to16}, %zmm17, %zmm4
	vfmadd231ps	664(%rdx,%r9,4){1to16}, %zmm17, %zmm5
	vfmadd231ps	792(%rdx,%r9,4){1to16}, %zmm17, %zmm6
	vfmadd231ps	920(%rdx,%r9,4){1to16}, %zmm17, %zmm7
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm10
	movq	%r9, %r11
	orq	$14, %r11
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm9
	movq	%r9, %r11
	orq	$15, %r11
	vfmadd231ps	28(%rdx,%r9,4){1to16}, %zmm16, %zmm0
	vfmadd231ps	156(%rdx,%r9,4){1to16}, %zmm16, %zmm1
	vfmadd231ps	284(%rdx,%r9,4){1to16}, %zmm16, %zmm2
	vfmadd231ps	412(%rdx,%r9,4){1to16}, %zmm16, %zmm3
	vfmadd231ps	540(%rdx,%r9,4){1to16}, %zmm16, %zmm4
	vfmadd231ps	668(%rdx,%r9,4){1to16}, %zmm16, %zmm5
	vfmadd231ps	796(%rdx,%r9,4){1to16}, %zmm16, %zmm6
	vfmadd231ps	924(%rdx,%r9,4){1to16}, %zmm16, %zmm7
	shlq	$7, %r11
	vmovaps	(%r8,%r11), %zmm8
	xorl	%r11d, %r11d
	vfmadd231ps	32(%rdx,%r9,4){1to16}, %zmm15, %zmm0
	vfmadd231ps	160(%rdx,%r9,4){1to16}, %zmm15, %zmm1
	vfmadd231ps	288(%rdx,%r9,4){1to16}, %zmm15, %zmm2
	vfmadd231ps	416(%rdx,%r9,4){1to16}, %zmm15, %zmm3
	vfmadd231ps	544(%rdx,%r9,4){1to16}, %zmm15, %zmm4
	vfmadd231ps	672(%rdx,%r9,4){1to16}, %zmm15, %zmm5
	vfmadd231ps	800(%rdx,%r9,4){1to16}, %zmm15, %zmm6
	vfmadd231ps	928(%rdx,%r9,4){1to16}, %zmm15, %zmm7
	vfmadd231ps	36(%rdx,%r9,4){1to16}, %zmm14, %zmm0
	vfmadd231ps	164(%rdx,%r9,4){1to16}, %zmm14, %zmm1
	vfmadd231ps	292(%rdx,%r9,4){1to16}, %zmm14, %zmm2
	vfmadd231ps	420(%rdx,%r9,4){1to16}, %zmm14, %zmm3
	vfmadd231ps	548(%rdx,%r9,4){1to16}, %zmm14, %zmm4
	vfmadd231ps	676(%rdx,%r9,4){1to16}, %zmm14, %zmm5
	vfmadd231ps	804(%rdx,%r9,4){1to16}, %zmm14, %zmm6
	vfmadd231ps	932(%rdx,%r9,4){1to16}, %zmm14, %zmm7
	vfmadd231ps	40(%rdx,%r9,4){1to16}, %zmm13, %zmm0
	vfmadd231ps	168(%rdx,%r9,4){1to16}, %zmm13, %zmm1
	vfmadd231ps	296(%rdx,%r9,4){1to16}, %zmm13, %zmm2
	vfmadd231ps	424(%rdx,%r9,4){1to16}, %zmm13, %zmm3
	vfmadd231ps	552(%rdx,%r9,4){1to16}, %zmm13, %zmm4
	vfmadd231ps	680(%rdx,%r9,4){1to16}, %zmm13, %zmm5
	vfmadd231ps	808(%rdx,%r9,4){1to16}, %zmm13, %zmm6
	vfmadd231ps	936(%rdx,%r9,4){1to16}, %zmm13, %zmm7
	vfmadd231ps	44(%rdx,%r9,4){1to16}, %zmm12, %zmm0
	vfmadd231ps	172(%rdx,%r9,4){1to16}, %zmm12, %zmm1
	vfmadd231ps	300(%rdx,%r9,4){1to16}, %zmm12, %zmm2
	vfmadd231ps	428(%rdx,%r9,4){1to16}, %zmm12, %zmm3
	vfmadd231ps	556(%rdx,%r9,4){1to16}, %zmm12, %zmm4
	vfmadd231ps	684(%rdx,%r9,4){1to16}, %zmm12, %zmm5
	vfmadd231ps	812(%rdx,%r9,4){1to16}, %zmm12, %zmm6
	vfmadd231ps	940(%rdx,%r9,4){1to16}, %zmm12, %zmm7
	vfmadd231ps	48(%rdx,%r9,4){1to16}, %zmm11, %zmm0
	vfmadd231ps	176(%rdx,%r9,4){1to16}, %zmm11, %zmm1
	vfmadd231ps	304(%rdx,%r9,4){1to16}, %zmm11, %zmm2
	vfmadd231ps	432(%rdx,%r9,4){1to16}, %zmm11, %zmm3
	vfmadd231ps	560(%rdx,%r9,4){1to16}, %zmm11, %zmm4
	vfmadd231ps	688(%rdx,%r9,4){1to16}, %zmm11, %zmm5
	vfmadd231ps	816(%rdx,%r9,4){1to16}, %zmm11, %zmm6
	vfmadd231ps	944(%rdx,%r9,4){1to16}, %zmm11, %zmm7
	vfmadd231ps	52(%rdx,%r9,4){1to16}, %zmm10, %zmm0
	vfmadd231ps	180(%rdx,%r9,4){1to16}, %zmm10, %zmm1
	vfmadd231ps	308(%rdx,%r9,4){1to16}, %zmm10, %zmm2
	vfmadd231ps	436(%rdx,%r9,4){1to16}, %zmm10, %zmm3
	vfmadd231ps	564(%rdx,%r9,4){1to16}, %zmm10, %zmm4
	vfmadd231ps	692(%rdx,%r9,4){1to16}, %zmm10, %zmm5
	vfmadd231ps	820(%rdx,%r9,4){1to16}, %zmm10, %zmm6
	vfmadd231ps	948(%rdx,%r9,4){1to16}, %zmm10, %zmm7
	vfmadd231ps	56(%rdx,%r9,4){1to16}, %zmm9, %zmm0
	vfmadd231ps	184(%rdx,%r9,4){1to16}, %zmm9, %zmm1
	vfmadd231ps	312(%rdx,%r9,4){1to16}, %zmm9, %zmm2
	vfmadd231ps	440(%rdx,%r9,4){1to16}, %zmm9, %zmm3
	vfmadd231ps	568(%rdx,%r9,4){1to16}, %zmm9, %zmm4
	vfmadd231ps	696(%rdx,%r9,4){1to16}, %zmm9, %zmm5
	vfmadd231ps	824(%rdx,%r9,4){1to16}, %zmm9, %zmm6
	vfmadd231ps	952(%rdx,%r9,4){1to16}, %zmm9, %zmm7
	vfmadd231ps	60(%rdx,%r9,4){1to16}, %zmm8, %zmm0
	vfmadd231ps	188(%rdx,%r9,4){1to16}, %zmm8, %zmm1
	vfmadd231ps	316(%rdx,%r9,4){1to16}, %zmm8, %zmm2
	vfmadd231ps	444(%rdx,%r9,4){1to16}, %zmm8, %zmm3
	vfmadd231ps	572(%rdx,%r9,4){1to16}, %zmm8, %zmm4
	vfmadd231ps	700(%rdx,%r9,4){1to16}, %zmm8, %zmm5
	vfmadd231ps	828(%rdx,%r9,4){1to16}, %zmm8, %zmm6
	vfmadd231ps	956(%rdx,%r9,4){1to16}, %zmm8, %zmm7
	movl	$16, %r9d
	testb	$1, %r10b
	jne	.LBB7_2
	vmovaps	%zmm0, (%rcx,%rdi,4)
	vmovaps	%zmm1, 128(%rcx,%rdi,4)
	vmovaps	%zmm2, 256(%rcx,%rdi,4)
	vmovaps	%zmm3, 384(%rcx,%rdi,4)
	vmovaps	%zmm4, 512(%rcx,%rdi,4)
	vmovaps	%zmm5, 640(%rcx,%rdi,4)
	vmovaps	%zmm6, 768(%rcx,%rdi,4)
	vmovaps	%zmm7, 896(%rcx,%rdi,4)
	movl	$16, %edi
	testb	$1, %sil
	movl	$0, %esi
	jne	.LBB7_1
	.loc	8 28 8 is_stmt 1
	xorl	%eax, %eax
	.loc	8 28 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp24:
.Lfunc_end7:
	.size	main$async_dispatch_7_batch_matmul_1x16x32x32_f32, .Lfunc_end7-main$async_dispatch_7_batch_matmul_1x16x32x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_8_elementwise_transpose_16x4x8_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_8_elementwise_transpose_16x4x8_f32,@function
main$async_dispatch_8_elementwise_transpose_16x4x8_f32:
.Lfunc_begin8:
	.file	9 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_8.mlir"
	.loc	9 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp25:
	.loc	9 9 8 prologue_end
	movq	24(%rsi), %rdx
	movq	32(%rsi), %rsi
	movl	(%rdx), %eax
	.loc	9 10 8
	movl	4(%rdx), %ecx
	.loc	9 11 8
	movl	8(%rdx), %edx
	.loc	9 20 8
	andl	$-4, %eax
	.loc	9 21 8
	andl	$-4, %ecx
	.loc	9 22 8
	andl	$-4, %edx
	.loc	9 20 8
	addq	(%rsi), %rax
	.loc	9 21 8
	addq	8(%rsi), %rcx
	.loc	9 22 8
	addq	16(%rsi), %rdx
	xorl	%esi, %esi
	.loc	9 0 8 is_stmt 0
.Ltmp26:
	.p2align	4
.LBB8_1:
	movq	%rdx, %rdi
	xorl	%r8d, %r8d
	.p2align	4
.LBB8_2:
	.loc	9 26 8 is_stmt 1
	vmovaps	(%rax,%r8), %ymm0
	.loc	9 28 10
	vaddps	(%rcx,%r8), %ymm0, %ymm0
	.loc	9 26 8
	addq	$32, %r8
	vmovaps	%ymm0, (%rdi)
	addq	$512, %rdi
	cmpq	$128, %r8
	jne	.LBB8_2
	incq	%rsi
	subq	$-128, %rax
	addq	$32, %rdx
	cmpq	$16, %rsi
	jne	.LBB8_1
	.loc	9 32 8
	xorl	%eax, %eax
	.loc	9 32 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp27:
.Lfunc_end8:
	.size	main$async_dispatch_8_elementwise_transpose_16x4x8_f32, .Lfunc_end8-main$async_dispatch_8_elementwise_transpose_16x4x8_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_12_elementwise_transpose_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_12_elementwise_transpose_16x32_f32,@function
main$async_dispatch_12_elementwise_transpose_16x32_f32:
.Lfunc_begin9:
	.file	10 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_12.mlir"
	.loc	10 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp28:
	.loc	10 11 8 prologue_end
	movq	24(%rsi), %rax
	movq	32(%rsi), %rsi
	movl	$8192, %ecx
	movl	$6144, %edx
	movl	(%rax), %eax
	.loc	10 14 8
	addq	(%rsi), %rcx
	.loc	10 16 8
	addq	16(%rsi), %rdx
	.loc	10 15 8
	andl	$-4, %eax
	addq	8(%rsi), %rax
	xorl	%esi, %esi
	.loc	10 0 8 is_stmt 0
.Ltmp29:
	.p2align	4
.LBB9_1:
	movq	%rsi, %rdi
	shlq	$7, %rdi
	movb	$1, %r8b
	xorl	%r9d, %r9d
	addq	%rcx, %rdi
	.p2align	4
.LBB9_2:
	.loc	10 20 8 is_stmt 1
	vmovaps	(%rdi,%r9,4), %zmm0
	movl	%r8d, %r10d
	xorl	%r8d, %r8d
	.loc	10 22 10
	vaddps	(%rax,%r9,4), %zmm0, %zmm0
	.loc	10 20 8
	shlq	$6, %r9
	addq	%rdx, %r9
	vmovss	%xmm0, (%r9,%rsi,4)
	vextractps	$1, %xmm0, 64(%r9,%rsi,4)
	vextractps	$2, %xmm0, 128(%r9,%rsi,4)
	.loc	10 22 10
	vextracti128	$1, %ymm0, %xmm1
	.loc	10 20 8
	vextractps	$3, %xmm0, 192(%r9,%rsi,4)
	.loc	10 22 10
	vextracti32x4	$2, %zmm0, %xmm2
	vextracti32x4	$3, %zmm0, %xmm0
	.loc	10 20 8
	vmovd	%xmm1, 256(%r9,%rsi,4)
	vextractps	$1, %xmm1, 320(%r9,%rsi,4)
	vextractps	$2, %xmm1, 384(%r9,%rsi,4)
	vextractps	$3, %xmm1, 448(%r9,%rsi,4)
	vmovd	%xmm2, 512(%r9,%rsi,4)
	vextractps	$1, %xmm2, 576(%r9,%rsi,4)
	vextractps	$2, %xmm2, 640(%r9,%rsi,4)
	vextractps	$3, %xmm2, 704(%r9,%rsi,4)
	vmovd	%xmm0, 768(%r9,%rsi,4)
	vextractps	$1, %xmm0, 832(%r9,%rsi,4)
	vextractps	$2, %xmm0, 896(%r9,%rsi,4)
	vextractps	$3, %xmm0, 960(%r9,%rsi,4)
	movl	$16, %r9d
	testb	$1, %r10b
	jne	.LBB9_2
	incq	%rsi
	cmpq	$16, %rsi
	jne	.LBB9_1
	.loc	10 26 8
	xorl	%eax, %eax
	.loc	10 26 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp30:
.Lfunc_end9:
	.size	main$async_dispatch_12_elementwise_transpose_16x32_f32, .Lfunc_end9-main$async_dispatch_12_elementwise_transpose_16x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI10_0:
	.long	0x3f0293ee
.LCPI10_1:
	.long	0x3fb8aa3b
.LCPI10_10:
	.long	0x7fffffff
.LCPI10_11:
	.long	0xff7fffff
.LCPI10_12:
	.long	0x3f317218
.LCPI10_13:
	.long	0xc2af999a
.LCPI10_14:
	.long	0x42b1999a
.LCPI10_15:
	.long	0x3f000000
.LCPI10_16:
	.long	0xc2fe0000
.LCPI10_17:
	.long	0x42fe0000
.LCPI10_18:
	.long	0xbf318000
.LCPI10_19:
	.long	0x395e8083
.LCPI10_20:
	.long	0x3ab743ce
.LCPI10_21:
	.long	0x39506967
.LCPI10_22:
	.long	0x3c088908
.LCPI10_23:
	.long	0x3d2aa9c1
.LCPI10_24:
	.long	0x3e2aaaaa
.LCPI10_25:
	.long	0x3f800000
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI10_2:
	.long	7
	.long	15
	.long	23
	.long	31
.LCPI10_3:
	.long	6
	.long	14
	.long	22
	.long	30
.LCPI10_4:
	.long	5
	.long	13
	.long	21
	.long	29
.LCPI10_5:
	.long	4
	.long	12
	.long	20
	.long	28
.LCPI10_6:
	.long	3
	.long	11
	.long	19
	.long	27
.LCPI10_7:
	.long	2
	.long	10
	.long	18
	.long	26
.LCPI10_8:
	.long	1
	.long	9
	.long	17
	.long	25
.LCPI10_9:
	.long	0
	.long	8
	.long	16
	.long	24
	.section	.rodata,"a",@progbits
	.p2align	6, 0x0
.LCPI10_26:
	.zero	4
	.zero	4
	.long	14
	.long	30
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	15
	.long	31
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_27:
	.long	14
	.long	30
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	15
	.long	31
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_28:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	14
	.long	30
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	15
	.long	31
	.zero	4
	.zero	4
.LCPI10_29:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	5
	.long	30
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	13
	.long	31
	.zero	4
.LCPI10_30:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	30
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	31
.LCPI10_31:
	.zero	4
	.zero	4
	.long	12
	.long	28
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	13
	.long	29
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_32:
	.long	12
	.long	28
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	13
	.long	29
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_33:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	28
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	13
	.long	29
	.zero	4
	.zero	4
.LCPI10_34:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	5
	.long	28
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	13
	.long	29
	.zero	4
.LCPI10_35:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	28
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	29
.LCPI10_36:
	.zero	4
	.zero	4
	.long	10
	.long	26
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	11
	.long	27
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_37:
	.long	10
	.long	26
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	11
	.long	27
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_38:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	10
	.long	26
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	11
	.long	27
	.zero	4
	.zero	4
.LCPI10_39:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	5
	.long	26
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	13
	.long	27
	.zero	4
.LCPI10_40:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	26
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	27
.LCPI10_41:
	.zero	4
	.zero	4
	.long	8
	.long	24
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	9
	.long	25
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_42:
	.long	8
	.long	24
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	9
	.long	25
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_43:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	8
	.long	24
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	9
	.long	25
	.zero	4
	.zero	4
.LCPI10_44:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	5
	.long	24
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	13
	.long	25
	.zero	4
.LCPI10_45:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	24
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	25
.LCPI10_46:
	.zero	4
	.zero	4
	.long	6
	.long	22
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	7
	.long	23
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_47:
	.long	6
	.long	22
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	7
	.long	23
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_48:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	6
	.long	22
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	7
	.long	23
	.zero	4
	.zero	4
.LCPI10_49:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	5
	.long	22
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	13
	.long	23
	.zero	4
.LCPI10_50:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	22
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	23
.LCPI10_51:
	.zero	4
	.zero	4
	.long	4
	.long	20
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	5
	.long	21
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_52:
	.long	4
	.long	20
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	5
	.long	21
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_53:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	20
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	5
	.long	21
	.zero	4
	.zero	4
.LCPI10_54:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	5
	.long	20
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	13
	.long	21
	.zero	4
.LCPI10_55:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	20
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	21
.LCPI10_56:
	.zero	4
	.zero	4
	.long	2
	.long	18
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	3
	.long	19
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_57:
	.long	2
	.long	18
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	3
	.long	19
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_58:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	2
	.long	18
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	3
	.long	19
	.zero	4
	.zero	4
.LCPI10_59:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	5
	.long	18
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	13
	.long	19
	.zero	4
.LCPI10_60:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	18
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	19
.LCPI10_61:
	.zero	4
	.zero	4
	.long	0
	.long	16
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	1
	.long	17
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_62:
	.long	0
	.long	16
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	1
	.long	17
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
.LCPI10_63:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	0
	.long	16
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	1
	.long	17
	.zero	4
	.zero	4
.LCPI10_64:
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	4
	.long	5
	.long	16
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.long	12
	.long	13
	.long	17
	.zero	4
.LCPI10_65:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	16
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	13
	.long	14
	.long	17
	.section	".text.main$async_dispatch_13_attention_4x16x8x8x16","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_13_attention_4x16x8x8x16,@function
main$async_dispatch_13_attention_4x16x8x8x16:
.Lfunc_begin10:
	.file	11 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_13.mlir"
	.loc	11 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp31:
	pushq	%r14
	pushq	%rbx
	andq	$-64, %rsp
	subq	$768, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.loc	11 15 8 prologue_end
	movq	32(%rsi), %rsi
	.loc	11 25 8
	movl	(%rdx), %ecx
	vbroadcastss	.LCPI10_0(%rip), %ymm0
	vmovaps	.LCPI10_26(%rip), %zmm28
	vmovaps	.LCPI10_51(%rip), %zmm27
	vmovaps	.LCPI10_56(%rip), %zmm31
	vmovaps	.LCPI10_33(%rip), %zmm29
	vmovaps	.LCPI10_39(%rip), %zmm30
	.loc	11 15 8
	movq	(%rsi), %r9
	.loc	11 25 8
	movl	%ecx, %eax
	shrl	$2, %eax
	shll	$2, %ecx
	movq	%rax, %r10
	shlq	$9, %r10
	andl	$12, %ecx
	.loc	11 30 8
	shlq	$5, %rax
	.loc	11 25 8
	movl	%ecx, %r8d
	leal	1(%rcx), %edx
	shll	$5, %r8d
	leal	2(%rcx), %edi
	movl	%edx, %ebx
	shll	$5, %ebx
	movl	%edi, %r14d
	shll	$5, %r14d
	vmovaps	2304(%r9,%r10), %ymm8
	vmovaps	2368(%r9,%r10), %ymm9
	vmovaps	2432(%r9,%r10), %ymm11
	vmovaps	2496(%r9,%r10), %ymm13
	vmovaps	2176(%r9,%r10), %ymm6
	.loc	11 15 8
	leaq	(%r9,%r10), %r11
	.loc	11 25 8
	vmovaps	2112(%r9,%r10), %ymm5
	vmovaps	2240(%r9,%r10), %ymm7
	vinsertf64x4	$1, 2336(%r9,%r10), %zmm8, %zmm19
	vinsertf64x4	$1, 2464(%r9,%r10), %zmm11, %zmm22
	vinsertf64x4	$1, 2400(%r9,%r10), %zmm9, %zmm21
	vinsertf64x4	$1, 2528(%r9,%r10), %zmm13, %zmm23
	vinsertf64x4	$1, 2208(%r9,%r10), %zmm6, %zmm10
	vbroadcasti32x4	.LCPI10_2(%rip), %zmm6
	vmulps	4096(%r8,%r11), %ymm0, %ymm2
	leal	3(%rcx), %r8d
	vmulps	4096(%rbx,%r11), %ymm0, %ymm3
	vmulps	4096(%r14,%r11), %ymm0, %ymm4
	vinsertf64x4	$1, 2144(%r9,%r10), %zmm5, %zmm17
	vinsertf64x4	$1, 2272(%r9,%r10), %zmm7, %zmm20
	vmovaps	2048(%r9,%r10), %zmm5
	movl	%r8d, %ebx
	shll	$5, %ebx
	vmulps	4096(%rbx,%r11), %ymm0, %ymm1
	.loc	11 18 8
	movq	8(%rsi), %r11
	.loc	11 25 8
	vbroadcastss	.LCPI10_1(%rip), %zmm0
	movl	%ecx, %ebx
	shll	$6, %ebx
	.loc	11 19 8
	movq	16(%rsi), %rsi
	.loc	11 30 8
	shll	$7, %ecx
	.loc	11 25 8
	vmulps	(%r11,%rbx), %zmm0, %zmm12
	movl	%edx, %ebx
	shll	$6, %ebx
	.loc	11 30 8
	leaq	8192(%rsi,%rcx), %rcx
	shll	$7, %edx
	.loc	11 25 8
	vmulps	(%r11,%rbx), %zmm0, %zmm26
	movl	%edi, %ebx
	shll	$6, %ebx
	.loc	11 30 8
	shll	$7, %edi
	.loc	11 25 8
	vmovaps	%zmm22, %zmm8
	vmovaps	%zmm19, %zmm9
	vpermt2ps	%zmm23, %zmm6, %zmm8
	vpermt2ps	%zmm21, %zmm6, %zmm9
	vmulps	(%r11,%rbx), %zmm0, %zmm18
	movl	%r8d, %ebx
	shll	$6, %ebx
	vmovaps	%zmm19, %zmm11
	vmovaps	%zmm19, %zmm13
	vmovaps	%zmm19, %zmm14
	vmovaps	%zmm19, %zmm15
	vmovaps	%zmm19, %zmm24
	vmovaps	%zmm19, %zmm25
	vmovaps	%zmm10, %zmm7
	.loc	11 30 8
	shll	$7, %r8d
	.loc	11 25 8
	vmulps	(%r11,%rbx), %zmm0, %zmm16
	movb	$-64, %r11b
	kmovd	%r11d, %k1
	vmovapd	%zmm8, %zmm9 {%k1}
	vmovaps	%zmm10, %zmm8
	vpermt2ps	%zmm20, %zmm6, %zmm8
	vpermi2ps	%zmm17, %zmm5, %zmm6
	vblendps	$240, %ymm8, %ymm6, %ymm6
	vbroadcasti32x4	.LCPI10_3(%rip), %zmm8
	vinsertf64x4	$0, %ymm6, %zmm9, %zmm6
	vmovaps	%zmm22, %zmm9
	vpermt2ps	%zmm23, %zmm8, %zmm9
	vpermt2ps	%zmm21, %zmm8, %zmm11
	vmovapd	%zmm9, %zmm11 {%k1}
	vmovaps	%zmm10, %zmm9
	vpermt2ps	%zmm20, %zmm8, %zmm9
	vpermi2ps	%zmm17, %zmm5, %zmm8
	vblendps	$240, %ymm9, %ymm8, %ymm8
	vbroadcasti32x4	.LCPI10_4(%rip), %zmm9
	vinsertf64x4	$0, %ymm8, %zmm11, %zmm8
	vmovaps	%zmm22, %zmm11
	vpermt2ps	%zmm23, %zmm9, %zmm11
	vpermt2ps	%zmm21, %zmm9, %zmm13
	vmovapd	%zmm11, %zmm13 {%k1}
	vmovaps	%zmm10, %zmm11
	vpermt2ps	%zmm20, %zmm9, %zmm11
	vpermi2ps	%zmm17, %zmm5, %zmm9
	vblendps	$240, %ymm11, %ymm9, %ymm9
	vbroadcasti32x4	.LCPI10_5(%rip), %zmm11
	vinsertf64x4	$0, %ymm9, %zmm13, %zmm9
	vmovaps	%zmm22, %zmm13
	vpermt2ps	%zmm23, %zmm11, %zmm13
	vpermt2ps	%zmm21, %zmm11, %zmm14
	vmovapd	%zmm13, %zmm14 {%k1}
	vmovaps	%zmm10, %zmm13
	vpermt2ps	%zmm20, %zmm11, %zmm13
	vpermi2ps	%zmm17, %zmm5, %zmm11
	vblendps	$240, %ymm13, %ymm11, %ymm11
	vbroadcasti32x4	.LCPI10_6(%rip), %zmm13
	vinsertf64x4	$0, %ymm11, %zmm14, %zmm11
	vmovaps	%zmm22, %zmm14
	vpermt2ps	%zmm23, %zmm13, %zmm14
	vpermt2ps	%zmm21, %zmm13, %zmm15
	vmovapd	%zmm14, %zmm15 {%k1}
	vmovaps	%zmm10, %zmm14
	vpermt2ps	%zmm20, %zmm13, %zmm14
	vpermi2ps	%zmm17, %zmm5, %zmm13
	vblendps	$240, %ymm14, %ymm13, %ymm13
	vbroadcasti32x4	.LCPI10_7(%rip), %zmm14
	vinsertf64x4	$0, %ymm13, %zmm15, %zmm13
	vmovaps	%zmm22, %zmm15
	vpermt2ps	%zmm23, %zmm14, %zmm15
	vpermt2ps	%zmm21, %zmm14, %zmm24
	vmovapd	%zmm15, %zmm24 {%k1}
	vmovaps	%zmm10, %zmm15
	vpermt2ps	%zmm20, %zmm14, %zmm15
	vpermi2ps	%zmm17, %zmm5, %zmm14
	vblendps	$240, %ymm15, %ymm14, %ymm14
	vbroadcasti32x4	.LCPI10_8(%rip), %zmm15
	vinsertf64x4	$0, %ymm14, %zmm24, %zmm14
	vmovaps	%zmm22, %zmm24
	vpermt2ps	%zmm23, %zmm15, %zmm24
	vpermt2ps	%zmm21, %zmm15, %zmm25
	vpermt2ps	%zmm20, %zmm15, %zmm7
	vpermi2ps	%zmm17, %zmm5, %zmm15
	vblendps	$240, %ymm7, %ymm15, %ymm7
	vmovapd	%zmm24, %zmm25 {%k1}
	vmovaps	.LCPI10_61(%rip), %zmm24
	vinsertf64x4	$0, %ymm7, %zmm25, %zmm15
	vbroadcasti32x4	.LCPI10_9(%rip), %zmm7
	vmovaps	.LCPI10_47(%rip), %zmm25
	vpermt2ps	%zmm20, %zmm7, %zmm10
	vpermt2ps	%zmm17, %zmm7, %zmm5
	vpermt2ps	%zmm23, %zmm7, %zmm22
	vpermt2ps	%zmm21, %zmm7, %zmm19
	vbroadcastss	%xmm2, %zmm7
	vbroadcastss	.LCPI10_12(%rip), %zmm21
	vbroadcastss	.LCPI10_13(%rip), %zmm20
	vmovaps	6272(%r9,%r10), %zmm23
	vblendps	$240, %ymm10, %ymm5, %ymm5
	vmovapd	%zmm22, %zmm19 {%k1}
	vmovshdup	%xmm2, %xmm10
	vmovaps	.LCPI10_46(%rip), %zmm22
	vinsertf64x4	$0, %ymm5, %zmm19, %zmm5
	vbroadcastss	%xmm10, %zmm10
	vbroadcastss	.LCPI10_14(%rip), %zmm19
	vfmadd213ps	%zmm12, %zmm5, %zmm7
	vfmadd213ps	%zmm7, %zmm15, %zmm10
	vshufpd	$1, %xmm2, %xmm2, %xmm7
	vbroadcastss	%xmm7, %zmm7
	vfmadd213ps	%zmm10, %zmm14, %zmm7
	vshufps	$255, %xmm2, %xmm2, %xmm10
	vbroadcastss	%xmm10, %zmm10
	vfmadd213ps	%zmm7, %zmm13, %zmm10
	vextractf128	$1, %ymm2, %xmm7
	vbroadcastss	%xmm7, %zmm7
	vfmadd213ps	%zmm10, %zmm11, %zmm7
	vshufps	$85, %ymm2, %ymm2, %ymm10
	vshuff64x2	$85, %zmm10, %zmm10, %zmm10
	vfmadd213ps	%zmm7, %zmm9, %zmm10
	vshufps	$170, %ymm2, %ymm2, %ymm7
	vshufps	$255, %ymm2, %ymm2, %ymm2
	vshuff64x2	$85, %zmm7, %zmm7, %zmm7
	vshuff64x2	$85, %zmm2, %zmm2, %zmm2
	vfmadd213ps	%zmm10, %zmm8, %zmm7
	vmovshdup	%xmm3, %xmm10
	vbroadcastss	%xmm10, %zmm10
	vfmadd213ps	%zmm7, %zmm6, %zmm2
	vbroadcastss	%xmm3, %zmm7
	vfmadd213ps	%zmm26, %zmm5, %zmm7
	vmovaps	6336(%r9,%r10), %zmm26
	vcmpunordps	%ymm2, %ymm2, %k1
	vfmadd213ps	%zmm7, %zmm15, %zmm10
	vshufpd	$1, %xmm3, %xmm3, %xmm7
	vbroadcastss	%xmm7, %zmm7
	vfmadd213ps	%zmm10, %zmm14, %zmm7
	vshufps	$255, %xmm3, %xmm3, %xmm10
	vpermi2ps	%zmm26, %zmm23, %zmm28
	vpermi2ps	%zmm26, %zmm23, %zmm22
	vpermi2ps	%zmm26, %zmm23, %zmm27
	vpermi2ps	%zmm26, %zmm23, %zmm31
	vpermi2ps	%zmm26, %zmm23, %zmm24
	vbroadcastss	%xmm10, %zmm10
	vfmadd213ps	%zmm7, %zmm13, %zmm10
	vextractf128	$1, %ymm3, %xmm7
	vbroadcastss	%xmm7, %zmm7
	vfmadd213ps	%zmm10, %zmm11, %zmm7
	vshufps	$85, %ymm3, %ymm3, %ymm10
	vshuff64x2	$85, %zmm10, %zmm10, %zmm10
	vfmadd213ps	%zmm7, %zmm9, %zmm10
	vshufps	$170, %ymm3, %ymm3, %ymm7
	vshufps	$255, %ymm3, %ymm3, %ymm3
	vshuff64x2	$85, %zmm7, %zmm7, %zmm7
	vshuff64x2	$85, %zmm3, %zmm3, %zmm3
	vfmadd213ps	%zmm10, %zmm8, %zmm7
	vmovshdup	%xmm4, %xmm10
	vbroadcastss	%xmm10, %zmm10
	vfmadd213ps	%zmm7, %zmm6, %zmm3
	vbroadcastss	%xmm4, %zmm7
	vfmadd213ps	%zmm18, %zmm5, %zmm7
	vfmadd213ps	%zmm7, %zmm15, %zmm10
	vshufpd	$1, %xmm4, %xmm4, %xmm7
	vbroadcastss	%xmm7, %zmm7
	vfmadd213ps	%zmm10, %zmm14, %zmm7
	vshufps	$255, %xmm4, %xmm4, %xmm10
	vbroadcastss	%xmm10, %zmm10
	vfmadd213ps	%zmm7, %zmm13, %zmm10
	vextractf128	$1, %ymm4, %xmm7
	vbroadcastss	%xmm7, %zmm7
	vfmadd213ps	%zmm10, %zmm11, %zmm7
	vshufps	$85, %ymm4, %ymm4, %ymm10
	vshuff64x2	$85, %zmm10, %zmm10, %zmm10
	vfmadd213ps	%zmm7, %zmm9, %zmm10
	vshufps	$170, %ymm4, %ymm4, %ymm7
	vshufps	$255, %ymm4, %ymm4, %ymm4
	vshuff64x2	$85, %zmm7, %zmm7, %zmm7
	vshuff64x2	$85, %zmm4, %zmm4, %zmm4
	vfmadd213ps	%zmm10, %zmm8, %zmm7
	vfmadd213ps	%zmm7, %zmm6, %zmm4
	vbroadcastss	%xmm1, %zmm7
	vfmadd213ps	%zmm16, %zmm5, %zmm7
	vmovshdup	%xmm1, %xmm5
	vbroadcastss	.LCPI10_16(%rip), %zmm16
	vbroadcastss	%xmm5, %zmm5
	vfmadd213ps	%zmm7, %zmm15, %zmm5
	vshufpd	$1, %xmm1, %xmm1, %xmm7
	vbroadcastss	.LCPI10_17(%rip), %zmm15
	vbroadcastss	%xmm7, %zmm7
	vfmadd213ps	%zmm5, %zmm14, %zmm7
	vshufps	$255, %xmm1, %xmm1, %xmm5
	vbroadcastss	%xmm5, %zmm5
	vfmadd213ps	%zmm7, %zmm13, %zmm5
	vextractf128	$1, %ymm1, %xmm7
	vbroadcastss	%xmm7, %zmm7
	vfmadd213ps	%zmm5, %zmm11, %zmm7
	vshufps	$85, %ymm1, %ymm1, %ymm5
	vshuff64x2	$85, %zmm5, %zmm5, %zmm5
	vfmadd213ps	%zmm7, %zmm9, %zmm5
	vshufps	$170, %ymm1, %ymm1, %ymm7
	vshufps	$255, %ymm1, %ymm1, %ymm1
	vshuff64x2	$85, %zmm7, %zmm7, %zmm7
	vfmadd213ps	%zmm5, %zmm8, %zmm7
	vshuff64x2	$85, %zmm1, %zmm1, %zmm5
	vpbroadcastd	.LCPI10_10(%rip), %ymm1
	vfmadd213ps	%zmm7, %zmm6, %zmm5
	vextractf64x4	$1, %zmm2, %ymm6
	vmaxps	%ymm6, %ymm2, %ymm6
	vpternlogd	$224, %ymm1, %ymm2, %ymm6
	vmovaps	%ymm2, %ymm6 {%k1}
	vextractf128	$1, %ymm6, %xmm7
	vcmpunordps	%xmm6, %xmm6, %k1
	vmaxps	%xmm7, %xmm6, %xmm7
	vpternlogd	$224, %xmm1, %xmm6, %xmm7
	vmovaps	%xmm6, %xmm7 {%k1}
	vmovshdup	%xmm7, %xmm6
	vcmpunordss	%xmm7, %xmm7, %k1
	vshufpd	$1, %xmm7, %xmm7, %xmm8
	vmaxss	%xmm6, %xmm7, %xmm6
	vpternlogd	$224, %xmm1, %xmm7, %xmm6
	vmovss	%xmm7, %xmm6, %xmm6 {%k1}
	vmaxss	%xmm8, %xmm6, %xmm8
	vcmpunordss	%xmm6, %xmm6, %k1
	vpternlogd	$224, %xmm1, %xmm6, %xmm8
	vmovss	%xmm6, %xmm8, %xmm8 {%k1}
	vshufps	$255, %xmm7, %xmm7, %xmm6
	vmovss	.LCPI10_11(%rip), %xmm7
	vmaxss	%xmm6, %xmm8, %xmm6
	vcmpunordss	%xmm8, %xmm8, %k1
	vpternlogd	$224, %xmm1, %xmm8, %xmm6
	vmovss	%xmm8, %xmm6, %xmm6 {%k1}
	vextractf64x4	$1, %zmm3, %ymm8
	vcmpunordps	%ymm3, %ymm3, %k1
	vmaxps	%ymm8, %ymm3, %ymm8
	vpternlogd	$224, %ymm1, %ymm3, %ymm8
	vmaxss	%xmm6, %xmm7, %xmm6
	vmovaps	%ymm3, %ymm8 {%k1}
	vextractf128	$1, %ymm8, %xmm9
	vcmpunordps	%xmm8, %xmm8, %k1
	vbroadcastss	%xmm6, %zmm14
	vmaxps	%xmm9, %xmm8, %xmm9
	vsubps	%zmm14, %zmm2, %zmm2
	vpternlogd	$224, %xmm1, %xmm8, %xmm9
	vmovaps	%xmm8, %xmm9 {%k1}
	vmovshdup	%xmm9, %xmm8
	vcmpunordss	%xmm9, %xmm9, %k1
	vshufpd	$1, %xmm9, %xmm9, %xmm10
	vmaxss	%xmm8, %xmm9, %xmm8
	vmulps	%zmm21, %zmm2, %zmm2
	vpternlogd	$224, %xmm1, %xmm9, %xmm8
	vmovss	%xmm9, %xmm8, %xmm8 {%k1}
	vmaxps	%zmm2, %zmm20, %zmm2
	vmaxss	%xmm10, %xmm8, %xmm10
	vcmpunordss	%xmm8, %xmm8, %k1
	vpternlogd	$224, %xmm1, %xmm8, %xmm10
	vmovss	%xmm8, %xmm10, %xmm10 {%k1}
	vshufps	$255, %xmm9, %xmm9, %xmm8
	vextractf64x4	$1, %zmm4, %ymm9
	vmaxss	%xmm8, %xmm10, %xmm8
	vcmpunordss	%xmm10, %xmm10, %k1
	vmaxps	%ymm9, %ymm4, %ymm9
	vpternlogd	$224, %xmm1, %xmm10, %xmm8
	vmovss	%xmm10, %xmm8, %xmm8 {%k1}
	vcmpunordps	%ymm4, %ymm4, %k1
	vpternlogd	$224, %ymm1, %ymm4, %ymm9
	vmaxss	%xmm8, %xmm7, %xmm8
	vmovaps	%ymm4, %ymm9 {%k1}
	vextractf128	$1, %ymm9, %xmm10
	vcmpunordps	%xmm9, %xmm9, %k1
	vbroadcastss	%xmm8, %zmm13
	vbroadcastss	.LCPI10_22(%rip), %zmm8
	vmaxps	%xmm10, %xmm9, %xmm10
	vunpcklps	%xmm13, %xmm14, %xmm6
	vsubps	%zmm13, %zmm3, %zmm3
	vminps	%zmm2, %zmm19, %zmm14
	vpternlogd	$224, %xmm1, %xmm9, %xmm10
	vmovaps	%xmm9, %xmm10 {%k1}
	vmovshdup	%xmm10, %xmm9
	vcmpunordss	%xmm10, %xmm10, %k1
	vshufpd	$1, %xmm10, %xmm10, %xmm11
	vmaxss	%xmm9, %xmm10, %xmm9
	vmulps	%zmm21, %zmm3, %zmm3
	vpternlogd	$224, %xmm1, %xmm10, %xmm9
	vmovss	%xmm10, %xmm9, %xmm9 {%k1}
	vmaxps	%zmm3, %zmm20, %zmm3
	vmaxss	%xmm11, %xmm9, %xmm11
	vcmpunordss	%xmm9, %xmm9, %k1
	vminps	%zmm3, %zmm19, %zmm13
	vmovaps	%zmm0, %zmm3
	vpternlogd	$224, %xmm1, %xmm9, %xmm11
	vmovss	%xmm9, %xmm11, %xmm11 {%k1}
	vshufps	$255, %xmm10, %xmm10, %xmm9
	vextractf64x4	$1, %zmm5, %ymm10
	vmaxss	%xmm9, %xmm11, %xmm9
	vcmpunordss	%xmm11, %xmm11, %k1
	vmaxps	%ymm10, %ymm5, %ymm10
	vpternlogd	$224, %xmm1, %xmm11, %xmm9
	vmovss	%xmm11, %xmm9, %xmm9 {%k1}
	vcmpunordps	%ymm5, %ymm5, %k1
	vpternlogd	$224, %ymm1, %ymm5, %ymm10
	vmaxss	%xmm9, %xmm7, %xmm9
	vmovaps	%ymm5, %ymm10 {%k1}
	vextractf128	$1, %ymm10, %xmm11
	vcmpunordps	%xmm10, %xmm10, %k1
	vbroadcastss	%xmm9, %zmm17
	vbroadcastss	.LCPI10_20(%rip), %zmm9
	vmaxps	%xmm11, %xmm10, %xmm11
	vmovlhps	%xmm17, %xmm6, %xmm6
	vsubps	%zmm17, %zmm4, %zmm4
	vmovaps	%zmm0, %zmm17
	vpternlogd	$224, %xmm1, %xmm10, %xmm11
	vmovaps	%xmm10, %xmm11 {%k1}
	vmovshdup	%xmm11, %xmm10
	vcmpunordss	%xmm11, %xmm11, %k1
	vshufpd	$1, %xmm11, %xmm11, %xmm12
	vmaxss	%xmm10, %xmm11, %xmm10
	vmulps	%zmm21, %zmm4, %zmm4
	vpternlogd	$224, %xmm1, %xmm11, %xmm10
	vmovss	%xmm11, %xmm10, %xmm10 {%k1}
	vmaxps	%zmm4, %zmm20, %zmm4
	vmaxss	%xmm12, %xmm10, %xmm12
	vcmpunordss	%xmm10, %xmm10, %k1
	vminps	%zmm4, %zmm19, %zmm4
	vpternlogd	$224, %xmm1, %xmm10, %xmm12
	vmovss	%xmm10, %xmm12, %xmm12 {%k1}
	vshufps	$255, %xmm11, %xmm11, %xmm10
	vbroadcastss	.LCPI10_18(%rip), %zmm11
	vmaxss	%xmm10, %xmm12, %xmm10
	vcmpunordss	%xmm12, %xmm12, %k1
	vpternlogd	$224, %xmm1, %xmm12, %xmm10
	vmovss	%xmm12, %xmm10, %xmm10 {%k1}
	vbroadcastss	.LCPI10_21(%rip), %zmm12
	vmaxss	%xmm10, %xmm7, %xmm1
	vbroadcastss	.LCPI10_19(%rip), %zmm10
	vbroadcastss	%xmm1, %zmm18
	vbroadcastss	.LCPI10_11(%rip), %xmm1
	vinsertps	$48, %xmm18, %xmm6, %xmm6
	vsubps	%zmm18, %zmm5, %zmm5
	vmovaps	6144(%r9,%r10), %zmm18
	vmulps	%zmm21, %zmm5, %zmm5
	vmaxps	%zmm5, %zmm20, %zmm5
	vsubps	%xmm6, %xmm1, %xmm1
	vbroadcastss	.LCPI10_15(%rip), %zmm6
	vminps	%zmm5, %zmm19, %zmm2
	vmovaps	%zmm0, %zmm5
	vmulps	%xmm21, %xmm1, %xmm1
	vmovaps	.LCPI10_41(%rip), %zmm21
	vmaxps	%xmm1, %xmm20, %xmm1
	vmovaps	6208(%r9,%r10), %zmm20
	vminps	%xmm1, %xmm19, %xmm7
	vmovaps	%xmm0, %xmm1
	vmovaps	.LCPI10_42(%rip), %zmm19
	vfmadd213ps	%zmm6, %zmm14, %zmm3
	vfmadd213ps	%zmm6, %zmm13, %zmm5
	vfmadd213ps	%zmm6, %zmm4, %zmm17
	vfmadd213ps	%zmm6, %zmm2, %zmm0
	vfmadd213ps	%xmm6, %xmm7, %xmm1
	vpermi2ps	%zmm26, %zmm23, %zmm21
	vrndscaleps	$9, %zmm3, %zmm3
	vrndscaleps	$9, %zmm5, %zmm5
	vrndscaleps	$9, %zmm17, %zmm17
	vrndscaleps	$9, %zmm0, %zmm0
	vroundps	$9, %xmm1, %xmm1
	vpermi2ps	%zmm20, %zmm18, %zmm25
	vmaxps	%zmm5, %zmm16, %zmm5
	vmaxps	%zmm0, %zmm16, %zmm0
	vmaxps	%zmm3, %zmm16, %zmm3
	vmaxps	%zmm17, %zmm16, %zmm17
	vpermi2ps	%zmm20, %zmm18, %zmm19
	vmaxps	%xmm1, %xmm16, %xmm1
	vminps	%zmm3, %zmm15, %zmm16
	vminps	%zmm17, %zmm15, %zmm3
	vminps	%zmm5, %zmm15, %zmm5
	vminps	%zmm0, %zmm15, %zmm0
	vmovaps	.LCPI10_28(%rip), %zmm17
	vminps	%xmm1, %xmm15, %xmm1
	vmovaps	.LCPI10_32(%rip), %zmm15
	vfmadd231ps	%zmm11, %zmm16, %zmm14
	vfmadd231ps	%zmm11, %zmm5, %zmm13
	vfmadd231ps	%zmm11, %zmm3, %zmm4
	vmovaps	%zmm5, 512(%rsp)
	vmovaps	%zmm3, 576(%rsp)
	vmovaps	%zmm0, 640(%rsp)
	vmovaps	%zmm16, 448(%rsp)
	vfmadd231ps	%xmm11, %xmm1, %xmm7
	vfmadd213ps	%zmm2, %zmm0, %zmm11
	vmovaps	%xmm1, 16(%rsp)
	vmovaps	%zmm12, %zmm2
	vfmadd231ps	%zmm10, %zmm5, %zmm13
	vfmadd231ps	%zmm10, %zmm16, %zmm14
	vfmadd231ps	%zmm10, %zmm3, %zmm4
	vmovaps	%zmm12, %zmm3
	vmovaps	%xmm8, %xmm5
	vmovaps	6464(%r9,%r10), %zmm16
	vfmadd231ps	%xmm10, %xmm1, %xmm7
	vmovaps	%xmm12, %xmm1
	vfmadd231ps	%zmm10, %zmm0, %zmm11
	vmovaps	%zmm12, %zmm0
	vmovaps	.LCPI10_53(%rip), %zmm10
	vpermi2ps	%zmm20, %zmm18, %zmm15
	vfmadd213ps	%zmm9, %zmm14, %zmm0
	vfmadd213ps	%zmm9, %zmm13, %zmm2
	vfmadd213ps	%zmm9, %zmm4, %zmm3
	vfmadd213ps	%xmm9, %xmm7, %xmm1
	vfmadd213ps	%zmm9, %zmm11, %zmm12
	vmovaps	.LCPI10_49(%rip), %zmm9
	vfmadd213ps	%zmm8, %zmm14, %zmm0
	vfmadd213ps	%zmm8, %zmm13, %zmm2
	vfmadd213ps	%zmm8, %zmm4, %zmm3
	vfmadd231ps	%xmm1, %xmm7, %xmm5
	vbroadcastss	.LCPI10_23(%rip), %zmm1
	vfmadd213ps	%zmm8, %zmm11, %zmm12
	vbroadcastss	.LCPI10_24(%rip), %zmm8
	vfmadd213ps	%zmm1, %zmm14, %zmm0
	vfmadd213ps	%zmm1, %zmm13, %zmm2
	vfmadd213ps	%zmm1, %zmm4, %zmm3
	vfmadd213ps	%zmm1, %zmm11, %zmm12
	vfmadd231ps	%xmm5, %xmm7, %xmm1
	vmovaps	%xmm8, %xmm5
	vfmadd213ps	%zmm8, %zmm14, %zmm0
	vfmadd231ps	%xmm1, %xmm7, %xmm5
	vfmadd213ps	%zmm8, %zmm13, %zmm2
	vfmadd213ps	%zmm8, %zmm4, %zmm3
	vfmadd213ps	%zmm8, %zmm11, %zmm12
	vmulps	%xmm7, %xmm7, %xmm8
	vmulps	%zmm11, %zmm11, %zmm1
	vfmadd213ps	%zmm6, %zmm14, %zmm0
	vfmadd213ps	%xmm6, %xmm7, %xmm5
	vfmadd213ps	%zmm6, %zmm11, %zmm12
	vfmadd213ps	%zmm6, %zmm13, %zmm2
	vfmadd213ps	%zmm6, %zmm4, %zmm3
	vmulps	%zmm14, %zmm14, %zmm6
	vfmadd213ps	%zmm14, %zmm0, %zmm6
	vmovaps	.LCPI10_27(%rip), %zmm0
	vfmadd213ps	%xmm7, %xmm5, %xmm8
	vmulps	%zmm4, %zmm4, %zmm5
	vmulps	%zmm13, %zmm13, %zmm7
	vmovaps	.LCPI10_52(%rip), %zmm14
	vfmadd213ps	%zmm11, %zmm12, %zmm1
	vmovaps	6400(%r9,%r10), %zmm11
	vmovaps	.LCPI10_59(%rip), %zmm12
	vfmadd213ps	%zmm4, %zmm3, %zmm5
	vmovaps	.LCPI10_31(%rip), %zmm4
	vfmadd213ps	%zmm13, %zmm2, %zmm7
	vmovaps	.LCPI10_62(%rip), %zmm13
	vmovaps	.LCPI10_48(%rip), %zmm3
	vmovaps	.LCPI10_34(%rip), %zmm2
	vmovaps	%zmm1, 384(%rsp)
	vmovaps	.LCPI10_43(%rip), %zmm1
	vmovaps	%zmm5, 320(%rsp)
	vmovaps	.LCPI10_44(%rip), %zmm5
	vpermi2ps	%zmm20, %zmm18, %zmm0
	vpermi2ps	%zmm20, %zmm18, %zmm14
	vpermi2ps	%zmm16, %zmm11, %zmm17
	vpermi2ps	%zmm16, %zmm11, %zmm29
	vpermi2ps	%zmm16, %zmm11, %zmm10
	vpermi2ps	%zmm26, %zmm23, %zmm4
	vpermi2ps	%zmm20, %zmm18, %zmm13
	vpermi2ps	%zmm16, %zmm11, %zmm3
	vpermi2ps	%zmm16, %zmm11, %zmm1
	vmovaps	%zmm0, 256(%rsp)
	vmovaps	.LCPI10_36(%rip), %zmm0
	vshufpd	$170, %zmm4, %zmm15, %zmm15
	vpermi2ps	%zmm26, %zmm23, %zmm0
	vmovaps	.LCPI10_57(%rip), %zmm23
	vmovaps	.LCPI10_29(%rip), %zmm26
	vmovaps	%zmm0, 192(%rsp)
	vmovaps	.LCPI10_37(%rip), %zmm0
	vpermi2ps	%zmm20, %zmm18, %zmm23
	vpermi2ps	%zmm20, %zmm18, %zmm0
	vmovaps	.LCPI10_58(%rip), %zmm18
	vmovaps	.LCPI10_63(%rip), %zmm20
	vmovaps	%zmm0, 128(%rsp)
	vmovaps	.LCPI10_38(%rip), %zmm0
	vpermi2ps	%zmm16, %zmm11, %zmm18
	vpermi2ps	%zmm16, %zmm11, %zmm20
	vpermi2ps	%zmm16, %zmm11, %zmm0
	vmovaps	6528(%r9,%r10), %zmm16
	vpermi2ps	%zmm16, %zmm3, %zmm9
	vmovaps	.LCPI10_54(%rip), %zmm3
	vpermi2ps	%zmm16, %zmm0, %zmm30
	vbroadcastss	.LCPI10_25(%rip), %zmm0
	vpermi2ps	%zmm16, %zmm17, %zmm26
	vpbroadcastd	.LCPI10_25(%rip), %zmm17
	vpermi2ps	%zmm16, %zmm1, %zmm5
	vpermi2ps	%zmm16, %zmm29, %zmm2
	vmovaps	.LCPI10_64(%rip), %zmm29
	vpermi2ps	%zmm16, %zmm18, %zmm12
	vpermi2ps	%zmm16, %zmm10, %zmm3
	vcvttps2dq	16(%rsp), %xmm10
	vpermi2ps	%zmm16, %zmm20, %zmm29
	vaddps	%xmm0, %xmm8, %xmm8
	vaddps	%zmm0, %zmm6, %zmm6
	vpslld	$23, %xmm10, %xmm10
	vpaddd	%xmm17, %xmm10, %xmm10
	vmulps	%xmm10, %xmm8, %xmm8
	vxorps	%xmm10, %xmm10, %xmm10
	vmulps	%xmm10, %xmm8, %xmm1
	vcvttps2dq	448(%rsp), %zmm10
	vmovshdup	%xmm1, %xmm4
	vmovaps	%xmm1, 112(%rsp)
	vpslld	$23, %zmm10, %zmm8
	vmovaps	%zmm0, %zmm10
	vaddps	384(%rsp), %zmm10, %zmm10
	vpaddd	%zmm17, %zmm8, %zmm8
	vmulps	%zmm8, %zmm6, %zmm11
	vcvttps2dq	512(%rsp), %zmm8
	vaddps	%zmm0, %zmm7, %zmm6
	vmovaps	%xmm4, 512(%rsp)
	vmovshdup	%xmm11, %xmm20
	vmovaps	%xmm20, 80(%rsp)
	vpslld	$23, %zmm8, %zmm7
	vcvttps2dq	576(%rsp), %zmm8
	vpaddd	%zmm17, %zmm7, %zmm7
	vmulps	%zmm7, %zmm6, %zmm16
	vaddps	320(%rsp), %zmm0, %zmm7
	vcvttps2dq	640(%rsp), %zmm0
	vmovapd	256(%rsp), %zmm6
	vpslld	$23, %zmm8, %zmm8
	vpaddd	%zmm17, %zmm8, %zmm8
	vmulps	%zmm8, %zmm7, %zmm18
	vpslld	$23, %zmm0, %zmm8
	vmovaps	6592(%r9,%r10), %zmm0
	movb	$-52, %r9b
	vmovaps	%xmm1, %xmm7
	vpaddd	%zmm17, %zmm8, %zmm8
	kmovd	%r9d, %k1
	vmulps	%zmm8, %zmm10, %zmm17
	vshufpd	$170, %zmm28, %zmm6, %zmm10
	vshufpd	$1, %xmm11, %xmm11, %xmm6
	vmovapd	%zmm2, %zmm15 {%k1}
	vmovapd	128(%rsp), %zmm2
	vmovaps	.LCPI10_35(%rip), %zmm28
	vmovshdup	%xmm16, %xmm8
	vmovapd	%xmm6, 32(%rsp)
	vmovaps	.LCPI10_30(%rip), %zmm6
	vshufpd	$170, 192(%rsp), %zmm2, %zmm2
	vmovapd	%zmm26, %zmm10 {%k1}
	vmovaps	.LCPI10_40(%rip), %zmm26
	vmovaps	%xmm8, 96(%rsp)
	vpermi2ps	%zmm0, %zmm15, %zmm28
	vshufps	$255, %xmm16, %xmm16, %xmm15
	vpermi2ps	%zmm0, %zmm10, %zmm6
	vmovapd	%zmm30, %zmm2 {%k1}
	vmovaps	.LCPI10_45(%rip), %zmm30
	vpermi2ps	%zmm0, %zmm2, %zmm26
	vshufpd	$170, %zmm21, %zmm19, %zmm2
	vshufpd	$1, %xmm1, %xmm1, %xmm19
	vshufpd	$170, %zmm27, %zmm14, %zmm1
	vshufps	$255, %xmm7, %xmm7, %xmm27
	vmovshdup	%xmm18, %xmm21
	vmovshdup	%xmm17, %xmm14
	vshufpd	$1, %xmm16, %xmm16, %xmm10
	vmovaps	%xmm15, 64(%rsp)
	vmovapd	%zmm5, %zmm2 {%k1}
	vmovapd	%zmm3, %zmm1 {%k1}
	vbroadcastss	%xmm7, %ymm5
	vshufpd	$170, %zmm31, %zmm23, %zmm3
	vmovapd	%xmm19, 640(%rsp)
	vmovaps	%xmm21, 384(%rsp)
	vextractf32x4	$2, %zmm16, %xmm31
	vextractf32x4	$2, %zmm11, %xmm7
	vmovaps	%xmm27, 16(%rsp)
	vextractf64x4	$1, %zmm16, %ymm23
	vmovaps	%xmm14, 576(%rsp)
	vmovapd	%xmm10, 128(%rsp)
	vmovapd	%zmm12, %zmm3 {%k1}
	vbroadcastss	%xmm19, %ymm12
	vmovaps	32(%rsp), %xmm19
	vmovaps	%zmm6, 320(%rsp)
	vshufps	$255, %xmm11, %xmm11, %xmm6
	vmovaps	%xmm6, 48(%rsp)
	vmovaps	.LCPI10_50(%rip), %zmm6
	vpermi2ps	%zmm0, %zmm2, %zmm30
	vshufpd	$170, %zmm22, %zmm25, %zmm2
	vshufpd	$1, %xmm18, %xmm18, %xmm22
	vshufps	$255, %xmm18, %xmm18, %xmm25
	vmovapd	%zmm9, %zmm2 {%k1}
	vshufpd	$170, %zmm24, %zmm13, %zmm9
	vmovaps	.LCPI10_65(%rip), %zmm13
	vmovaps	%xmm25, 192(%rsp)
	vmovapd	%xmm22, 256(%rsp)
	vextractf32x4	$1, %ymm18, %xmm24
	vmovapd	%zmm29, %zmm9 {%k1}
	vextractf32x4	$2, %zmm18, %xmm29
	vpermi2ps	%zmm0, %zmm2, %zmm6
	vmovaps	.LCPI10_55(%rip), %zmm2
	vpermi2ps	%zmm0, %zmm9, %zmm13
	vbroadcastss	%xmm11, %ymm9
	vpermi2ps	%zmm0, %zmm1, %zmm2
	vmovaps	.LCPI10_60(%rip), %zmm1
	vfmadd213ps	%ymm5, %ymm13, %ymm9
	vbroadcastss	%xmm16, %ymm5
	vpermi2ps	%zmm0, %zmm3, %zmm1
	vbroadcastss	%xmm4, %ymm3
	vbroadcastss	%xmm27, %ymm0
	vshufpd	$1, %xmm17, %xmm17, %xmm4
	vextractf32x4	$2, %zmm17, %xmm27
	vmovapd	%xmm4, 448(%rsp)
	vfmadd213ps	%ymm3, %ymm13, %ymm5
	vbroadcastss	%xmm18, %ymm3
	vfmadd213ps	%ymm12, %ymm13, %ymm3
	vbroadcastss	%xmm17, %ymm12
	vfmadd213ps	%ymm0, %ymm13, %ymm12
	vextractf64x4	$1, %zmm13, %ymm0
	vbroadcastss	%xmm20, %ymm13
	vfmadd213ps	%ymm9, %ymm0, %ymm13
	vbroadcastss	%xmm8, %ymm9
	vextractf128	$1, %ymm11, %xmm8
	vfmadd213ps	%ymm5, %ymm0, %ymm9
	vbroadcastss	%xmm21, %ymm5
	vmovaps	48(%rsp), %xmm21
	vfmadd213ps	%ymm3, %ymm0, %ymm5
	vbroadcastss	%xmm14, %ymm3
	vfmadd213ps	%ymm12, %ymm0, %ymm3
	vbroadcastss	%xmm10, %ymm12
	vbroadcastss	%xmm19, %ymm0
	vextractf64x4	$1, %zmm28, %ymm10
	vfmadd213ps	%ymm9, %ymm1, %ymm12
	vbroadcastss	%xmm22, %ymm9
	vfmadd213ps	%ymm13, %ymm1, %ymm0
	vextractf32x4	$1, %ymm17, %xmm22
	vfmadd213ps	%ymm5, %ymm1, %ymm9
	vbroadcastss	%xmm4, %ymm5
	vshufps	$255, %ymm11, %ymm11, %ymm4
	vpermpd	$170, %ymm4, %ymm4
	vfmadd213ps	%ymm3, %ymm1, %ymm5
	vextractf64x4	$1, %zmm1, %ymm1
	vbroadcastss	%xmm21, %ymm3
	vfmadd213ps	%ymm0, %ymm1, %ymm3
	vbroadcastss	%xmm15, %ymm0
	vshufps	$255, %xmm17, %xmm17, %xmm15
	vfmadd213ps	%ymm12, %ymm1, %ymm0
	vbroadcastss	%xmm25, %ymm12
	vextractf32x4	$1, %ymm16, %xmm25
	vfmadd213ps	%ymm9, %ymm1, %ymm12
	vbroadcastss	%xmm15, %ymm9
	vfmadd213ps	%ymm5, %ymm1, %ymm9
	vbroadcastss	%xmm8, %ymm1
	vbroadcastss	%xmm22, %ymm5
	vfmadd213ps	%ymm3, %ymm2, %ymm1
	vbroadcastss	%xmm25, %ymm3
	vfmadd213ps	%ymm0, %ymm2, %ymm3
	vbroadcastss	%xmm24, %ymm0
	vfmadd213ps	%ymm9, %ymm2, %ymm5
	vmovshdup	%ymm11, %ymm9
	vpermpd	$170, %ymm9, %ymm9
	vfmadd213ps	%ymm12, %ymm2, %ymm0
	vextractf64x4	$1, %zmm2, %ymm2
	vextractf64x4	$1, %zmm30, %ymm12
	vfmadd213ps	%ymm1, %ymm2, %ymm9
	vmovshdup	%ymm16, %ymm1
	vpermpd	$170, %ymm1, %ymm1
	vfmadd213ps	%ymm3, %ymm2, %ymm1
	vmovshdup	%ymm18, %ymm3
	vpermpd	$170, %ymm3, %ymm3
	vfmadd213ps	%ymm0, %ymm2, %ymm3
	vmovshdup	%ymm17, %ymm0
	vpermpd	$170, %ymm0, %ymm0
	vfmadd213ps	%ymm5, %ymm2, %ymm0
	vshufps	$170, %ymm16, %ymm16, %ymm5
	vshufps	$170, %ymm11, %ymm11, %ymm2
	vpermpd	$170, %ymm5, %ymm5
	vpermpd	$170, %ymm2, %ymm2
	vfmadd213ps	%ymm1, %ymm6, %ymm5
	vshufps	$170, %ymm18, %ymm18, %ymm1
	vfmadd213ps	%ymm9, %ymm6, %ymm2
	vpermpd	$170, %ymm1, %ymm1
	vfmadd213ps	%ymm3, %ymm6, %ymm1
	vshufps	$170, %ymm17, %ymm17, %ymm3
	vpermpd	$170, %ymm3, %ymm3
	vfmadd213ps	%ymm0, %ymm6, %ymm3
	vextractf64x4	$1, %zmm6, %ymm0
	vmovaps	320(%rsp), %zmm6
	vfmadd213ps	%ymm2, %ymm0, %ymm4
	vshufps	$255, %ymm16, %ymm16, %ymm2
	vpermpd	$170, %ymm2, %ymm2
	vfmadd213ps	%ymm5, %ymm0, %ymm2
	vshufps	$255, %ymm18, %ymm18, %ymm5
	vpermpd	$170, %ymm5, %ymm9
	vextractf64x4	$1, %zmm11, %ymm5
	vfmadd213ps	%ymm1, %ymm0, %ymm9
	vshufps	$255, %ymm17, %ymm17, %ymm1
	vpermpd	$170, %ymm1, %ymm1
	vfmadd213ps	%ymm3, %ymm0, %ymm1
	vbroadcastss	%xmm31, %ymm3
	vbroadcastss	%xmm7, %ymm0
	vfmadd213ps	%ymm2, %ymm30, %ymm3
	vbroadcastss	%xmm29, %ymm2
	vfmadd213ps	%ymm4, %ymm30, %ymm0
	vextractf64x4	$1, %zmm18, %ymm4
	vfmadd213ps	%ymm9, %ymm30, %ymm2
	vbroadcastss	%xmm27, %ymm9
	vfmadd213ps	%ymm1, %ymm30, %ymm9
	vmovshdup	%xmm5, %xmm1
	vextractf32x4	$3, %zmm18, %xmm30
	vbroadcastss	%xmm1, %ymm13
	vextractf64x4	$1, %zmm17, %ymm1
	vfmadd213ps	%ymm0, %ymm12, %ymm13
	vmovshdup	%xmm23, %xmm0
	vbroadcastss	%xmm0, %ymm14
	vmovshdup	%xmm4, %xmm0
	vfmadd213ps	%ymm3, %ymm12, %ymm14
	vbroadcastss	%xmm0, %ymm3
	vfmadd213ps	%ymm2, %ymm12, %ymm3
	vmovshdup	%xmm1, %xmm2
	vbroadcastss	%xmm2, %ymm2
	vfmadd213ps	%ymm9, %ymm12, %ymm2
	vshufps	$170, %xmm5, %xmm5, %xmm9
	vshufps	$170, %xmm23, %xmm23, %xmm12
	vbroadcastss	%xmm9, %ymm9
	vbroadcastss	%xmm12, %ymm12
	vfmadd213ps	%ymm13, %ymm26, %ymm9
	vshufps	$170, %xmm4, %xmm4, %xmm13
	vfmadd213ps	%ymm14, %ymm26, %ymm12
	vshufps	$255, %xmm5, %xmm5, %xmm14
	vbroadcastss	%xmm13, %ymm13
	vbroadcastss	%xmm14, %ymm14
	vfmadd213ps	%ymm3, %ymm26, %ymm13
	vshufps	$170, %xmm1, %xmm1, %xmm3
	vbroadcastss	%xmm3, %ymm3
	vfmadd213ps	%ymm2, %ymm26, %ymm3
	vextractf64x4	$1, %zmm26, %ymm2
	vfmadd213ps	%ymm9, %ymm2, %ymm14
	vshufps	$255, %xmm23, %xmm23, %xmm9
	vbroadcastss	%xmm9, %ymm9
	vfmadd213ps	%ymm12, %ymm2, %ymm9
	vshufps	$255, %xmm4, %xmm4, %xmm12
	vbroadcastss	%xmm12, %ymm12
	vfmadd213ps	%ymm13, %ymm2, %ymm12
	vshufps	$255, %xmm1, %xmm1, %xmm13
	vbroadcastss	%xmm13, %ymm13
	vfmadd213ps	%ymm3, %ymm2, %ymm13
	vextractf32x4	$3, %zmm11, %xmm2
	vextractf32x4	$3, %zmm16, %xmm3
	vbroadcastss	%xmm2, %ymm26
	vfmadd213ps	%ymm14, %ymm28, %ymm26
	vbroadcastss	%xmm3, %ymm14
	vfmadd213ps	%ymm9, %ymm28, %ymm14
	vbroadcastss	%xmm30, %ymm9
	vfmadd213ps	%ymm12, %ymm28, %ymm9
	vextractf32x4	$3, %zmm17, %xmm12
	vbroadcastss	%xmm12, %ymm0
	vfmadd213ps	%ymm13, %ymm28, %ymm0
	vmovshdup	%ymm5, %ymm13
	vpermpd	$170, %ymm13, %ymm13
	vfmadd213ps	%ymm26, %ymm10, %ymm13
	vmovshdup	%ymm23, %ymm26
	vpermpd	$170, %ymm26, %ymm26
	vfmadd213ps	%ymm14, %ymm10, %ymm26
	vmovshdup	%ymm4, %ymm14
	vpermpd	$170, %ymm14, %ymm14
	vfmadd213ps	%ymm9, %ymm10, %ymm14
	vmovshdup	%ymm1, %ymm9
	vpermpd	$170, %ymm9, %ymm9
	vfmadd213ps	%ymm0, %ymm10, %ymm9
	vshufps	$170, %ymm5, %ymm5, %ymm0
	vshufps	$170, %ymm23, %ymm23, %ymm10
	vshufps	$255, %ymm5, %ymm5, %ymm5
	vpermpd	$170, %ymm0, %ymm0
	vpermpd	$170, %ymm10, %ymm10
	vpermpd	$170, %ymm5, %ymm20
	vmovshdup	%xmm8, %xmm5
	vfmadd213ps	%ymm13, %ymm6, %ymm0
	vshufps	$170, %ymm4, %ymm4, %ymm13
	vfmadd213ps	%ymm26, %ymm6, %ymm10
	vextractf64x4	$1, %zmm6, %ymm26
	vpermpd	$170, %ymm13, %ymm13
	vfmadd213ps	%ymm14, %ymm6, %ymm13
	vshufps	$170, %ymm1, %ymm1, %ymm14
	vshufps	$255, %ymm1, %ymm1, %ymm1
	vpermpd	$170, %ymm14, %ymm14
	vfmadd213ps	%ymm0, %ymm26, %ymm20
	vshufps	$255, %ymm23, %ymm23, %ymm0
	vpermpd	$170, %ymm0, %ymm23
	vshufps	$255, %ymm4, %ymm4, %ymm0
	vfmadd213ps	%ymm9, %ymm6, %ymm14
	vpermpd	$170, %ymm1, %ymm6
	vaddss	112(%rsp), %xmm11, %xmm1
	vpermpd	$170, %ymm0, %ymm0
	vfmadd213ps	%ymm10, %ymm26, %ymm23
	vfmadd213ps	%ymm13, %ymm26, %ymm0
	vaddss	80(%rsp), %xmm1, %xmm1
	vfmadd213ps	%ymm14, %ymm26, %ymm6
	vaddss	%xmm19, %xmm1, %xmm1
	vaddss	%xmm21, %xmm1, %xmm1
	vaddss	%xmm1, %xmm8, %xmm1
	vaddss	%xmm5, %xmm1, %xmm1
	vshufpd	$1, %xmm8, %xmm8, %xmm5
	vaddss	%xmm5, %xmm1, %xmm1
	vshufps	$255, %xmm8, %xmm8, %xmm5
	vaddss	%xmm5, %xmm1, %xmm1
	vmovshdup	%xmm7, %xmm5
	vaddss	%xmm7, %xmm1, %xmm1
	vaddss	%xmm5, %xmm1, %xmm1
	vshufpd	$1, %xmm7, %xmm7, %xmm5
	vaddss	%xmm5, %xmm1, %xmm1
	vshufps	$255, %xmm7, %xmm7, %xmm5
	vaddss	%xmm5, %xmm1, %xmm1
	vmovshdup	%xmm2, %xmm5
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	%xmm5, %xmm1, %xmm1
	vshufpd	$1, %xmm2, %xmm2, %xmm5
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm5, %xmm1, %xmm1
	vmovshdup	%xmm25, %xmm5
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	512(%rsp), %xmm16, %xmm2
	vaddss	96(%rsp), %xmm2, %xmm2
	vaddss	128(%rsp), %xmm2, %xmm2
	vaddss	64(%rsp), %xmm2, %xmm2
	vaddss	%xmm25, %xmm2, %xmm2
	vaddss	%xmm5, %xmm2, %xmm2
	vshufpd	$1, %xmm25, %xmm25, %xmm5
	vaddss	%xmm5, %xmm2, %xmm2
	vshufps	$255, %xmm25, %xmm25, %xmm5
	vaddss	%xmm5, %xmm2, %xmm2
	vmovshdup	%xmm31, %xmm5
	vaddss	%xmm31, %xmm2, %xmm2
	vaddss	%xmm5, %xmm2, %xmm2
	vshufpd	$1, %xmm31, %xmm31, %xmm5
	vaddss	%xmm5, %xmm2, %xmm2
	vshufps	$255, %xmm31, %xmm31, %xmm5
	vaddss	%xmm5, %xmm2, %xmm2
	vmovshdup	%xmm3, %xmm5
	vaddss	%xmm3, %xmm2, %xmm2
	vaddss	%xmm5, %xmm2, %xmm2
	vshufpd	$1, %xmm3, %xmm3, %xmm5
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm5, %xmm2, %xmm2
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm24, %xmm3
	vinsertps	$16, %xmm2, %xmm1, %xmm1
	vaddss	640(%rsp), %xmm18, %xmm2
	vaddss	384(%rsp), %xmm2, %xmm2
	vaddss	256(%rsp), %xmm2, %xmm2
	vaddss	192(%rsp), %xmm2, %xmm2
	vaddss	%xmm24, %xmm2, %xmm2
	vaddss	%xmm3, %xmm2, %xmm2
	vshufpd	$1, %xmm24, %xmm24, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vshufps	$255, %xmm24, %xmm24, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm29, %xmm3
	vaddss	%xmm29, %xmm2, %xmm2
	vaddss	%xmm3, %xmm2, %xmm2
	vshufpd	$1, %xmm29, %xmm29, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vshufps	$255, %xmm29, %xmm29, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm30, %xmm3
	vaddss	%xmm30, %xmm2, %xmm2
	vaddss	%xmm3, %xmm2, %xmm2
	vshufpd	$1, %xmm30, %xmm30, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vshufps	$255, %xmm30, %xmm30, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm22, %xmm3
	vinsertps	$32, %xmm2, %xmm1, %xmm1
	vaddss	16(%rsp), %xmm17, %xmm2
	vaddss	576(%rsp), %xmm2, %xmm2
	vaddss	448(%rsp), %xmm2, %xmm2
	vaddss	%xmm2, %xmm15, %xmm2
	vaddss	%xmm22, %xmm2, %xmm2
	vaddss	%xmm3, %xmm2, %xmm2
	vshufpd	$1, %xmm22, %xmm22, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vshufps	$255, %xmm22, %xmm22, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm27, %xmm3
	vaddss	%xmm27, %xmm2, %xmm2
	vaddss	%xmm3, %xmm2, %xmm2
	vshufpd	$1, %xmm27, %xmm27, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vshufps	$255, %xmm27, %xmm27, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmovshdup	%xmm12, %xmm3
	vaddss	%xmm2, %xmm12, %xmm2
	vaddss	%xmm3, %xmm2, %xmm2
	vshufpd	$1, %xmm12, %xmm12, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vshufps	$255, %xmm12, %xmm12, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vinsertps	$48, %xmm2, %xmm1, %xmm1
	vbroadcastss	.LCPI10_25(%rip), %zmm2
	vdivps	%xmm1, %xmm2, %xmm1
	vbroadcastss	%xmm1, %ymm2
	vmovshdup	%xmm1, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm5
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vbroadcastss	%xmm3, %ymm3
	vbroadcastss	%xmm5, %ymm5
	vbroadcastss	%xmm1, %ymm1
	vmulps	%ymm20, %ymm2, %ymm2
	vmulps	%ymm23, %ymm3, %ymm3
	vmulps	%ymm0, %ymm5, %ymm0
	vmulps	%ymm6, %ymm1, %ymm1
	.loc	11 30 8
	vmovaps	%ymm2, (%rax,%rcx)
	leaq	8192(%rsi,%rdx), %rcx
	vmovaps	%ymm3, (%rax,%rcx)
	leaq	8192(%rsi,%rdi), %rcx
	vmovaps	%ymm0, (%rax,%rcx)
	leaq	8192(%rsi,%r8), %rcx
	vmovaps	%ymm1, (%rax,%rcx)
	.loc	11 35 8
	xorl	%eax, %eax
	leaq	-16(%rbp), %rsp
	.loc	11 35 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp32:
.Lfunc_end10:
	.size	main$async_dispatch_13_attention_4x16x8x8x16, .Lfunc_end10-main$async_dispatch_13_attention_4x16x8x8x16
	.cfi_endproc

	.section	".text.main$async_dispatch_14_batch_matmul_1x16x32x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_14_batch_matmul_1x16x32x32_f32,@function
main$async_dispatch_14_batch_matmul_1x16x32x32_f32:
.Lfunc_begin11:
	.file	12 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_14.mlir"
	.loc	12 1 0 is_stmt 1
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
	.loc	12 15 8 prologue_end
	movq	32(%rsi), %rdi
	movl	$12288, %esi
	movb	$1, %r12b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r15d, %r15d
	.loc	12 16 8
	addq	8(%rdi), %rsi
	.loc	12 15 8
	movq	(%rdi), %rax
	.loc	12 18 8
	movq	16(%rdi), %rcx
	.loc	12 24 8
	movl	(%rdx), %edi
	movq	%rdi, %rdx
	shlq	$10, %rdi
	shlq	$8, %rdx
	movq	%rsi, -48(%rbp)
	leaq	8192(%rax,%rdi), %rdi
	.loc	12 0 8 is_stmt 0
.Ltmp34:
	.p2align	4
.LBB11_1:
	movq	-48(%rbp), %rsi
	movb	$1, %r13b
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%r9d, %r9d
	.loc	12 24 8
	leaq	(%rsi,%r15,4), %r8
	.loc	12 0 8
.Ltmp35:
	.p2align	4
.LBB11_2:
	movl	%r13d, %r10d
	.loc	12 24 8
	movq	%r9, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm24
	movq	%r9, %r13
	orq	$1, %r13
	vfmadd231ps	(%rdi,%r9,4){1to16}, %zmm24, %zmm1
	vfmadd231ps	128(%rdi,%r9,4){1to16}, %zmm24, %zmm2
	vfmadd231ps	256(%rdi,%r9,4){1to16}, %zmm24, %zmm3
	vfmadd231ps	384(%rdi,%r9,4){1to16}, %zmm24, %zmm4
	vfmadd231ps	512(%rdi,%r9,4){1to16}, %zmm24, %zmm5
	vfmadd231ps	640(%rdi,%r9,4){1to16}, %zmm24, %zmm6
	vfmadd231ps	768(%rdi,%r9,4){1to16}, %zmm24, %zmm7
	vfmadd231ps	896(%rdi,%r9,4){1to16}, %zmm24, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm23
	movq	%r9, %r13
	orq	$2, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm22
	movq	%r9, %r13
	orq	$3, %r13
	vfmadd231ps	4(%rdi,%r9,4){1to16}, %zmm23, %zmm1
	vfmadd231ps	132(%rdi,%r9,4){1to16}, %zmm23, %zmm2
	vfmadd231ps	260(%rdi,%r9,4){1to16}, %zmm23, %zmm3
	vfmadd231ps	388(%rdi,%r9,4){1to16}, %zmm23, %zmm4
	vfmadd231ps	516(%rdi,%r9,4){1to16}, %zmm23, %zmm5
	vfmadd231ps	644(%rdi,%r9,4){1to16}, %zmm23, %zmm6
	vfmadd231ps	772(%rdi,%r9,4){1to16}, %zmm23, %zmm7
	vfmadd231ps	900(%rdi,%r9,4){1to16}, %zmm23, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm21
	movq	%r9, %r13
	orq	$4, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm20
	movq	%r9, %r13
	orq	$5, %r13
	vfmadd231ps	8(%rdi,%r9,4){1to16}, %zmm22, %zmm1
	vfmadd231ps	136(%rdi,%r9,4){1to16}, %zmm22, %zmm2
	vfmadd231ps	264(%rdi,%r9,4){1to16}, %zmm22, %zmm3
	vfmadd231ps	392(%rdi,%r9,4){1to16}, %zmm22, %zmm4
	vfmadd231ps	520(%rdi,%r9,4){1to16}, %zmm22, %zmm5
	vfmadd231ps	648(%rdi,%r9,4){1to16}, %zmm22, %zmm6
	vfmadd231ps	776(%rdi,%r9,4){1to16}, %zmm22, %zmm7
	vfmadd231ps	904(%rdi,%r9,4){1to16}, %zmm22, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm19
	movq	%r9, %r13
	orq	$6, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm18
	movq	%r9, %r13
	orq	$7, %r13
	vfmadd231ps	12(%rdi,%r9,4){1to16}, %zmm21, %zmm1
	vfmadd231ps	140(%rdi,%r9,4){1to16}, %zmm21, %zmm2
	vfmadd231ps	268(%rdi,%r9,4){1to16}, %zmm21, %zmm3
	vfmadd231ps	396(%rdi,%r9,4){1to16}, %zmm21, %zmm4
	vfmadd231ps	524(%rdi,%r9,4){1to16}, %zmm21, %zmm5
	vfmadd231ps	652(%rdi,%r9,4){1to16}, %zmm21, %zmm6
	vfmadd231ps	780(%rdi,%r9,4){1to16}, %zmm21, %zmm7
	vfmadd231ps	908(%rdi,%r9,4){1to16}, %zmm21, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm17
	movq	%r9, %r13
	orq	$8, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm16
	movq	%r9, %r13
	orq	$9, %r13
	vfmadd231ps	16(%rdi,%r9,4){1to16}, %zmm20, %zmm1
	vfmadd231ps	144(%rdi,%r9,4){1to16}, %zmm20, %zmm2
	vfmadd231ps	272(%rdi,%r9,4){1to16}, %zmm20, %zmm3
	vfmadd231ps	400(%rdi,%r9,4){1to16}, %zmm20, %zmm4
	vfmadd231ps	528(%rdi,%r9,4){1to16}, %zmm20, %zmm5
	vfmadd231ps	656(%rdi,%r9,4){1to16}, %zmm20, %zmm6
	vfmadd231ps	784(%rdi,%r9,4){1to16}, %zmm20, %zmm7
	vfmadd231ps	912(%rdi,%r9,4){1to16}, %zmm20, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm15
	movq	%r9, %r13
	orq	$10, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm14
	movq	%r9, %r13
	orq	$11, %r13
	vfmadd231ps	20(%rdi,%r9,4){1to16}, %zmm19, %zmm1
	vfmadd231ps	148(%rdi,%r9,4){1to16}, %zmm19, %zmm2
	vfmadd231ps	276(%rdi,%r9,4){1to16}, %zmm19, %zmm3
	vfmadd231ps	404(%rdi,%r9,4){1to16}, %zmm19, %zmm4
	vfmadd231ps	532(%rdi,%r9,4){1to16}, %zmm19, %zmm5
	vfmadd231ps	660(%rdi,%r9,4){1to16}, %zmm19, %zmm6
	vfmadd231ps	788(%rdi,%r9,4){1to16}, %zmm19, %zmm7
	vfmadd231ps	916(%rdi,%r9,4){1to16}, %zmm19, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm13
	movq	%r9, %r13
	orq	$12, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm12
	movq	%r9, %r13
	orq	$13, %r13
	vfmadd231ps	24(%rdi,%r9,4){1to16}, %zmm18, %zmm1
	vfmadd231ps	152(%rdi,%r9,4){1to16}, %zmm18, %zmm2
	vfmadd231ps	280(%rdi,%r9,4){1to16}, %zmm18, %zmm3
	vfmadd231ps	408(%rdi,%r9,4){1to16}, %zmm18, %zmm4
	vfmadd231ps	536(%rdi,%r9,4){1to16}, %zmm18, %zmm5
	vfmadd231ps	664(%rdi,%r9,4){1to16}, %zmm18, %zmm6
	vfmadd231ps	792(%rdi,%r9,4){1to16}, %zmm18, %zmm7
	vfmadd231ps	920(%rdi,%r9,4){1to16}, %zmm18, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm11
	movq	%r9, %r13
	orq	$14, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm10
	movq	%r9, %r13
	orq	$15, %r13
	vfmadd231ps	28(%rdi,%r9,4){1to16}, %zmm17, %zmm1
	vfmadd231ps	156(%rdi,%r9,4){1to16}, %zmm17, %zmm2
	vfmadd231ps	284(%rdi,%r9,4){1to16}, %zmm17, %zmm3
	vfmadd231ps	412(%rdi,%r9,4){1to16}, %zmm17, %zmm4
	vfmadd231ps	540(%rdi,%r9,4){1to16}, %zmm17, %zmm5
	vfmadd231ps	668(%rdi,%r9,4){1to16}, %zmm17, %zmm6
	vfmadd231ps	796(%rdi,%r9,4){1to16}, %zmm17, %zmm7
	vfmadd231ps	924(%rdi,%r9,4){1to16}, %zmm17, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm9
	xorl	%r13d, %r13d
	vfmadd231ps	32(%rdi,%r9,4){1to16}, %zmm16, %zmm1
	vfmadd231ps	160(%rdi,%r9,4){1to16}, %zmm16, %zmm2
	vfmadd231ps	288(%rdi,%r9,4){1to16}, %zmm16, %zmm3
	vfmadd231ps	416(%rdi,%r9,4){1to16}, %zmm16, %zmm4
	vfmadd231ps	544(%rdi,%r9,4){1to16}, %zmm16, %zmm5
	vfmadd231ps	672(%rdi,%r9,4){1to16}, %zmm16, %zmm6
	vfmadd231ps	800(%rdi,%r9,4){1to16}, %zmm16, %zmm7
	vfmadd231ps	928(%rdi,%r9,4){1to16}, %zmm16, %zmm8
	vfmadd231ps	36(%rdi,%r9,4){1to16}, %zmm15, %zmm1
	vfmadd231ps	164(%rdi,%r9,4){1to16}, %zmm15, %zmm2
	vfmadd231ps	292(%rdi,%r9,4){1to16}, %zmm15, %zmm3
	vfmadd231ps	420(%rdi,%r9,4){1to16}, %zmm15, %zmm4
	vfmadd231ps	548(%rdi,%r9,4){1to16}, %zmm15, %zmm5
	vfmadd231ps	676(%rdi,%r9,4){1to16}, %zmm15, %zmm6
	vfmadd231ps	804(%rdi,%r9,4){1to16}, %zmm15, %zmm7
	vfmadd231ps	932(%rdi,%r9,4){1to16}, %zmm15, %zmm8
	vfmadd231ps	40(%rdi,%r9,4){1to16}, %zmm14, %zmm1
	vfmadd231ps	168(%rdi,%r9,4){1to16}, %zmm14, %zmm2
	vfmadd231ps	296(%rdi,%r9,4){1to16}, %zmm14, %zmm3
	vfmadd231ps	424(%rdi,%r9,4){1to16}, %zmm14, %zmm4
	vfmadd231ps	552(%rdi,%r9,4){1to16}, %zmm14, %zmm5
	vfmadd231ps	680(%rdi,%r9,4){1to16}, %zmm14, %zmm6
	vfmadd231ps	808(%rdi,%r9,4){1to16}, %zmm14, %zmm7
	vfmadd231ps	936(%rdi,%r9,4){1to16}, %zmm14, %zmm8
	vfmadd231ps	44(%rdi,%r9,4){1to16}, %zmm13, %zmm1
	vfmadd231ps	172(%rdi,%r9,4){1to16}, %zmm13, %zmm2
	vfmadd231ps	300(%rdi,%r9,4){1to16}, %zmm13, %zmm3
	vfmadd231ps	428(%rdi,%r9,4){1to16}, %zmm13, %zmm4
	vfmadd231ps	556(%rdi,%r9,4){1to16}, %zmm13, %zmm5
	vfmadd231ps	684(%rdi,%r9,4){1to16}, %zmm13, %zmm6
	vfmadd231ps	812(%rdi,%r9,4){1to16}, %zmm13, %zmm7
	vfmadd231ps	940(%rdi,%r9,4){1to16}, %zmm13, %zmm8
	vfmadd231ps	48(%rdi,%r9,4){1to16}, %zmm12, %zmm1
	vfmadd231ps	176(%rdi,%r9,4){1to16}, %zmm12, %zmm2
	vfmadd231ps	304(%rdi,%r9,4){1to16}, %zmm12, %zmm3
	vfmadd231ps	432(%rdi,%r9,4){1to16}, %zmm12, %zmm4
	vfmadd231ps	560(%rdi,%r9,4){1to16}, %zmm12, %zmm5
	vfmadd231ps	688(%rdi,%r9,4){1to16}, %zmm12, %zmm6
	vfmadd231ps	816(%rdi,%r9,4){1to16}, %zmm12, %zmm7
	vfmadd231ps	944(%rdi,%r9,4){1to16}, %zmm12, %zmm8
	vfmadd231ps	52(%rdi,%r9,4){1to16}, %zmm11, %zmm1
	vfmadd231ps	180(%rdi,%r9,4){1to16}, %zmm11, %zmm2
	vfmadd231ps	308(%rdi,%r9,4){1to16}, %zmm11, %zmm3
	vfmadd231ps	436(%rdi,%r9,4){1to16}, %zmm11, %zmm4
	vfmadd231ps	564(%rdi,%r9,4){1to16}, %zmm11, %zmm5
	vfmadd231ps	692(%rdi,%r9,4){1to16}, %zmm11, %zmm6
	vfmadd231ps	820(%rdi,%r9,4){1to16}, %zmm11, %zmm7
	vfmadd231ps	948(%rdi,%r9,4){1to16}, %zmm11, %zmm8
	vfmadd231ps	56(%rdi,%r9,4){1to16}, %zmm10, %zmm1
	vfmadd231ps	184(%rdi,%r9,4){1to16}, %zmm10, %zmm2
	vfmadd231ps	312(%rdi,%r9,4){1to16}, %zmm10, %zmm3
	vfmadd231ps	440(%rdi,%r9,4){1to16}, %zmm10, %zmm4
	vfmadd231ps	568(%rdi,%r9,4){1to16}, %zmm10, %zmm5
	vfmadd231ps	696(%rdi,%r9,4){1to16}, %zmm10, %zmm6
	vfmadd231ps	824(%rdi,%r9,4){1to16}, %zmm10, %zmm7
	vfmadd231ps	952(%rdi,%r9,4){1to16}, %zmm10, %zmm8
	vfmadd231ps	60(%rdi,%r9,4){1to16}, %zmm9, %zmm1
	vfmadd231ps	188(%rdi,%r9,4){1to16}, %zmm9, %zmm2
	vfmadd231ps	316(%rdi,%r9,4){1to16}, %zmm9, %zmm3
	vfmadd231ps	444(%rdi,%r9,4){1to16}, %zmm9, %zmm4
	vfmadd231ps	572(%rdi,%r9,4){1to16}, %zmm9, %zmm5
	vfmadd231ps	700(%rdi,%r9,4){1to16}, %zmm9, %zmm6
	vfmadd231ps	828(%rdi,%r9,4){1to16}, %zmm9, %zmm7
	vfmadd231ps	956(%rdi,%r9,4){1to16}, %zmm9, %zmm8
	movl	$16, %r9d
	testb	$1, %r10b
	jne	.LBB11_2
	.loc	12 25 8 is_stmt 1
	leaq	32(%rdx), %r10
	leaq	64(%rdx), %r11
	movq	%r15, %r9
	leaq	128(%rdx), %rbx
	leaq	160(%rdx), %r14
	leaq	192(%rdx), %rsi
	movq	%r15, %r13
	movq	%r15, %r8
	orq	%rdx, %r8
	.loc	12 27 10
	vaddps	%zmm0, %zmm1, %zmm1
	vaddps	%zmm0, %zmm2, %zmm2
	vaddps	%zmm0, %zmm3, %zmm3
	vaddps	%zmm0, %zmm4, %zmm4
	vaddps	%zmm0, %zmm5, %zmm5
	vaddps	%zmm0, %zmm6, %zmm6
	vaddps	%zmm0, %zmm7, %zmm7
	vaddps	%zmm0, %zmm8, %zmm8
	.loc	12 25 8
	orq	%r10, %r9
	movq	%r15, %r10
	orq	%r11, %r10
	leaq	96(%rdx), %r11
	.loc	12 28 10
	vaddps	(%rax,%r8,4), %zmm1, %zmm1
	.loc	12 25 8
	orq	%r11, %r13
	movq	%r15, %r11
	orq	%rbx, %r11
	movq	%r15, %rbx
	orq	%r14, %rbx
	movq	%r15, %r14
	orq	%rsi, %r14
	leaq	224(%rdx), %rsi
	.loc	12 28 10
	vaddps	(%rax,%r9,4), %zmm2, %zmm2
	vaddps	(%rax,%r10,4), %zmm3, %zmm3
	.loc	12 25 8
	orq	%rsi, %r15
	.loc	12 28 10
	vaddps	(%rax,%r13,4), %zmm4, %zmm4
	vaddps	(%rax,%r11,4), %zmm5, %zmm5
	vaddps	(%rax,%rbx,4), %zmm6, %zmm6
	vaddps	(%rax,%r14,4), %zmm7, %zmm7
	vaddps	(%rax,%r15,4), %zmm8, %zmm8
	.loc	12 24 8
	vmovaps	%zmm1, 2048(%rcx,%r8,4)
	vmovaps	%zmm2, 2048(%rcx,%r9,4)
	vmovaps	%zmm3, 2048(%rcx,%r10,4)
	vmovaps	%zmm4, 2048(%rcx,%r13,4)
	vmovaps	%zmm5, 2048(%rcx,%r11,4)
	vmovaps	%zmm6, 2048(%rcx,%rbx,4)
	vmovaps	%zmm7, 2048(%rcx,%r14,4)
	vmovaps	%zmm8, 2048(%rcx,%r15,4)
	movl	$16, %r15d
	testb	$1, %r12b
	movl	$0, %r12d
	jne	.LBB11_1
	.loc	12 32 8
	xorl	%eax, %eax
	.loc	12 32 8 epilogue_begin is_stmt 0
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
.Lfunc_end11:
	.size	main$async_dispatch_14_batch_matmul_1x16x32x32_f32, .Lfunc_end11-main$async_dispatch_14_batch_matmul_1x16x32x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI12_0:
	.long	0x3d000000
.LCPI12_1:
	.long	0x2b8cbccc
.LCPI12_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_16_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_16_reduction_16x32_f32,@function
main$async_dispatch_16_reduction_16x32_f32:
.Lfunc_begin12:
	.file	13 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_16.mlir"
	.loc	13 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp37:
	.loc	13 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	13 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	13 16 8
	movq	(%rcx), %rax
	.loc	13 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	addq	%rax, %rsi
	.loc	13 0 8 is_stmt 0
.Ltmp38:
	.p2align	4
.LBB12_1:
	.loc	13 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	13 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	13 22 8
	testb	$1, %dil
	jne	.LBB12_1
	.loc	13 30 10
	vmulps	.LCPI12_0(%rip){1to4}, %xmm0, %xmm0
	.loc	13 32 10
	vbroadcastss	.LCPI12_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	13 31 10
	vaddps	.LCPI12_1(%rip){1to4}, %xmm0, %xmm0
	.loc	13 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	13 0 10 is_stmt 0
.Ltmp39:
	.p2align	4
.LBB12_3:
	.loc	13 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	13 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	13 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	13 28 8
	vmovaps	%zmm4, 2048(%rcx,%rsi,4)
	vmovaps	%zmm5, 2176(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB12_3
	.loc	13 39 8
	xorl	%eax, %eax
	.loc	13 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp40:
.Lfunc_end12:
	.size	main$async_dispatch_16_reduction_16x32_f32, .Lfunc_end12-main$async_dispatch_16_reduction_16x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI13_0:
	.long	0x3fb504f3
.LCPI13_1:
	.long	0x80000000
.LCPI13_2:
	.long	0x3f4ccccd
.LCPI13_3:
	.long	0x3f905225
.LCPI13_4:
	.long	0x3f906eba
.LCPI13_5:
	.long	0xbea7bc1b
.LCPI13_6:
	.long	0xbeed51af
.LCPI13_7:
	.long	0xbebabcc4
.LCPI13_8:
	.long	0xbf05e48b
.LCPI13_9:
	.long	0x3ee590a2
.LCPI13_10:
	.long	0x3f04ec44
.LCPI13_11:
	.long	0x3df27f94
.LCPI13_12:
	.long	0x3e56c688
.LCPI13_13:
	.long	0xbdb4eee3
.LCPI13_14:
	.long	0xbe06f8ee
.LCPI13_15:
	.long	0x3d17d100
.LCPI13_16:
	.long	0x3cd3794f
.LCPI13_17:
	.long	0x3d6a78fa
.LCPI13_18:
	.long	0x3d9782a4
.LCPI13_19:
	.long	0x40000000
.LCPI13_20:
	.long	0xbb58546d
.LCPI13_21:
	.long	0x3b66a96a
.LCPI13_22:
	.long	0xc003e25f
.LCPI13_23:
	.long	0xbab94d1e
.LCPI13_24:
	.long	0x3fd0437b
.LCPI13_25:
	.long	0x3984e118
.LCPI13_26:
	.long	0xbf15590a
.LCPI13_27:
	.long	0xb78f7c49
.LCPI13_28:
	.long	0x3da853b3
.LCPI13_29:
	.long	0x3f800000
.LCPI13_30:
	.long	0x40700000
.LCPI13_31:
	.long	0x3f000000
	.section	".text.main$async_dispatch_17_batch_matmul_1x16x37x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_17_batch_matmul_1x16x37x32_f32,@function
main$async_dispatch_17_batch_matmul_1x16x37x32_f32:
.Lfunc_begin13:
	.file	14 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_17.mlir"
	.loc	14 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp41:
	.loc	14 17 8 prologue_end
	movq	32(%rsi), %rcx
	movl	$16384, %eax
	vbroadcastss	.LCPI13_15(%rip), %ymm10
	vbroadcastss	.LCPI13_17(%rip), %ymm11
	vbroadcastss	.LCPI13_19(%rip), %ymm12
	vbroadcastss	.LCPI13_20(%rip), %ymm13
	vbroadcastss	.LCPI13_21(%rip), %ymm14
	vbroadcastss	.LCPI13_22(%rip), %ymm15
	vbroadcastss	.LCPI13_23(%rip), %ymm16
	vbroadcastss	.LCPI13_24(%rip), %ymm17
	vbroadcastss	.LCPI13_25(%rip), %ymm18
	vbroadcastss	.LCPI13_26(%rip), %ymm19
	vbroadcastss	.LCPI13_27(%rip), %ymm20
	vbroadcastss	.LCPI13_28(%rip), %ymm21
	vbroadcastss	.LCPI13_29(%rip), %ymm22
	vbroadcastss	.LCPI13_30(%rip), %ymm23
	vbroadcastss	.LCPI13_31(%rip), %ymm24
	vbroadcastss	.LCPI13_1(%rip), %ymm2
	vxorps	%xmm0, %xmm0, %xmm0
	.loc	14 18 8
	addq	8(%rcx), %rax
	.loc	14 17 8
	movq	(%rcx), %rsi
	.loc	14 19 8
	movq	16(%rcx), %rdi
	.loc	14 24 8
	movl	(%rdx), %ecx
	imulq	$1184, %rcx, %rdx
	shlq	$10, %rcx
	leaq	2048(%rsi,%rcx), %rcx
	xorl	%esi, %esi
	leaq	4096(%rdi,%rdx), %rdx
	.loc	14 0 8 is_stmt 0
.Ltmp42:
	.p2align	4
.LBB13_1:
	.loc	14 24 8
	leaq	(%rax,%rsi,4), %rdi
	movb	$1, %r8b
	vxorps	%xmm25, %xmm25, %xmm25
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r9d, %r9d
	.loc	14 0 8
.Ltmp43:
	.p2align	4
.LBB13_2:
	.loc	14 24 8
	imulq	$148, %r9, %r10
	vmovss	384(%rcx,%r9,4), %xmm5
	vmovss	512(%rcx,%r9,4), %xmm6
	vmovss	256(%rcx,%r9,4), %xmm8
	vextractf128	$1, %ymm1, %xmm9
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vshufpd	$1, %xmm1, %xmm1, %xmm27
	vmovss	640(%rcx,%r9,4), %xmm7
	vbroadcastss	(%rdi,%r10), %xmm31
	movq	%r9, %r10
	orq	$1, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	896(%rcx,%r9,4), %xmm31, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$2, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	900(%rcx,%r9,4), %xmm29, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$3, %r10
	vfmadd231ps	%ymm5, %ymm31, %ymm4
	vbroadcastss	%xmm9, %ymm5
	vfmadd231ps	%ymm8, %ymm31, %ymm27
	vmovss	768(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vfmadd231ss	904(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm6, %ymm31, %ymm5
	vmovshdup	%xmm9, %xmm6
	vmovss	260(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm7, %ymm31, %ymm6
	vpermpd	$255, %ymm1, %ymm7
	vbroadcastss	(%rdi,%r10), %xmm30
	movq	%r9, %r10
	orq	$4, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	908(%rcx,%r9,4), %xmm30, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$5, %r10
	vfmadd231ps	%ymm8, %ymm31, %ymm7
	vmovss	(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vinsertps	$16, 128(%rcx,%r9,4), %xmm8, %xmm8
	vfmadd231ss	912(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm27
	vmovss	264(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$6, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	916(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd213ps	%ymm1, %ymm31, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$7, %r10
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	388(%rcx,%r9,4), %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	920(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm4
	vmovss	516(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm5
	vmovss	392(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	520(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	644(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm6
	vmovss	648(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	772(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm7
	vmovss	776(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	4(%rcx,%r9,4), %xmm9
	vinsertps	$16, 132(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm8
	vmovss	8(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$8, %r10
	vinsertps	$16, 136(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	924(%rcx,%r9,4), %xmm29, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	268(%rcx,%r9,4), %xmm3
	vmovss	272(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm27
	vmovss	396(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm27
	vmovss	276(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm4
	vmovss	524(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm27
	vmovss	400(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm5
	vmovss	652(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm4
	vmovss	528(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm6
	vmovss	780(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm5
	vmovss	404(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm7
	vmovss	12(%rcx,%r9,4), %xmm3
	vinsertps	$16, 140(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm4
	vmovss	532(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$9, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	928(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm5
	vmovss	656(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm6
	vmovss	660(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm6
	vmovss	784(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm7
	vmovss	788(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm7
	vmovss	16(%rcx,%r9,4), %xmm9
	vinsertps	$16, 144(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm8
	vmovss	20(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$10, %r10
	vinsertps	$16, 148(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	932(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm8
	vmovss	280(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$11, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	936(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm9, %ymm1, %ymm27
	vmovss	408(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm4
	vmovss	536(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm5
	vmovss	664(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm6
	vmovss	792(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm7
	vmovss	24(%rcx,%r9,4), %xmm9
	vinsertps	$16, 152(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm8
	vmovss	284(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm9
	movq	%r9, %r10
	orq	$12, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	940(%rcx,%r9,4), %xmm9, %xmm25
	vfmadd231ps	%ymm1, %ymm29, %ymm27
	vmovss	288(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm27
	vmovss	412(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm4
	vmovss	540(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm5
	vmovss	416(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm4
	vmovss	544(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm5
	vmovss	668(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm6
	vmovss	672(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm6
	vmovss	796(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm7
	vmovss	800(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm7
	vmovss	28(%rcx,%r9,4), %xmm1
	vinsertps	$16, 156(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm8
	vmovss	32(%rcx,%r9,4), %xmm1
	vinsertps	$16, 160(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm8
	vmovss	292(%rcx,%r9,4), %xmm1
	vmovss	296(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm27
	vmovss	420(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm27
	vmovss	300(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm4
	vmovss	548(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm27
	vmovss	424(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm5
	vmovss	676(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm4
	vmovss	552(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm6
	vmovss	804(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm5
	vmovss	428(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm7
	vmovss	36(%rcx,%r9,4), %xmm1
	vinsertps	$16, 164(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm4
	vmovss	556(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$13, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	944(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm5
	vmovss	680(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm6
	vmovss	684(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm6
	vmovss	808(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm7
	vmovss	812(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm7
	vmovss	40(%rcx,%r9,4), %xmm3
	vinsertps	$16, 168(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm8
	vmovss	44(%rcx,%r9,4), %xmm3
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$14, %r10
	vinsertps	$16, 172(%rcx,%r9,4), %xmm3, %xmm3
	imulq	$148, %r10, %r10
	vfmadd231ss	948(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm8
	vmovss	304(%rcx,%r9,4), %xmm3
	vmovss	312(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	432(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	560(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	688(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	816(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	48(%rcx,%r9,4), %xmm3
	vinsertps	$16, 176(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vmovss	308(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$15, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	952(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm1, %ymm26, %ymm27
	vmovss	436(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	440(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm4
	vmovss	564(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	568(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm5
	vmovss	692(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	696(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm6
	vmovss	820(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	824(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm7
	vmovss	52(%rcx,%r9,4), %xmm1
	vinsertps	$16, 180(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	56(%rcx,%r9,4), %xmm9
	vinsertps	$16, 184(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movl	%r8d, %r10d
	xorl	%r8d, %r8d
	vfmadd231ss	956(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	316(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	444(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	572(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	700(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	828(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	60(%rcx,%r9,4), %xmm3
	vinsertps	$16, 188(%rcx,%r9,4), %xmm3, %xmm3
	movl	$16, %r9d
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vbroadcastss	%xmm6, %ymm3
	vmovlhps	%xmm27, %xmm8, %xmm1
	vinsertps	$48, %xmm4, %xmm1, %xmm1
	vinsertf128	$1, %xmm5, %ymm1, %ymm1
	vblendps	$32, %ymm3, %ymm1, %ymm1
	vbroadcastsd	%xmm7, %ymm3
	vblendps	$192, %ymm3, %ymm1, %ymm1
	vbroadcastss	%xmm25, %ymm3
	vblendps	$128, %ymm3, %ymm1, %ymm1
	testb	$1, %r10b
	jne	.LBB13_2
	.loc	14 27 10 is_stmt 1
	vaddps	%ymm0, %ymm1, %ymm1
	.loc	14 28 10
	vdivps	.LCPI13_0(%rip){1to8}, %ymm1, %ymm3
	.loc	14 29 10
	vbroadcastss	.LCPI13_5(%rip), %ymm5
	vbroadcastss	.LCPI13_7(%rip), %ymm6
	vbroadcastss	.LCPI13_9(%rip), %ymm7
	vbroadcastss	.LCPI13_11(%rip), %ymm8
	vbroadcastss	.LCPI13_13(%rip), %ymm9
	vxorps	%ymm2, %ymm3, %ymm4
	vcmpltps	%ymm4, %ymm3, %k1
	vmaxps	%ymm3, %ymm4, %ymm3
	vbroadcastss	.LCPI13_3(%rip), %ymm4
	vcmpltps	.LCPI13_2(%rip){1to8}, %ymm3, %k2
	vblendmps	.LCPI13_4(%rip){1to8}, %ymm4, %ymm4 {%k2}
	vblendmps	.LCPI13_6(%rip){1to8}, %ymm5, %ymm5 {%k2}
	vblendmps	.LCPI13_8(%rip){1to8}, %ymm6, %ymm6 {%k2}
	vblendmps	.LCPI13_10(%rip){1to8}, %ymm7, %ymm7 {%k2}
	vblendmps	.LCPI13_12(%rip){1to8}, %ymm8, %ymm8 {%k2}
	vblendmps	.LCPI13_14(%rip){1to8}, %ymm9, %ymm9 {%k2}
	vblendmps	.LCPI13_16(%rip){1to8}, %ymm10, %ymm25 {%k2}
	vblendmps	.LCPI13_18(%rip){1to8}, %ymm11, %ymm26 {%k2}
	vcmpltps	%ymm12, %ymm3, %k2
	vcmpngeps	%ymm23, %ymm3, %k3
	vblendmps	%ymm8, %ymm18, %ymm8 {%k2}
	vblendmps	%ymm25, %ymm20, %ymm25 {%k2}
	vblendmps	%ymm6, %ymm16, %ymm6 {%k2}
	vblendmps	%ymm4, %ymm14, %ymm4 {%k2}
	vfmadd213ps	%ymm8, %ymm3, %ymm25
	vfmadd213ps	%ymm6, %ymm3, %ymm25
	vblendmps	%ymm26, %ymm21, %ymm6 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm0, %ymm13, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm9, %ymm19, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm7, %ymm17, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm5, %ymm15, %ymm4 {%k2}
	vmovaps	%ymm22, %ymm5
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vfmadd213ps	%ymm22, %ymm3, %ymm6
	vblendmps	%ymm0, %ymm22, %ymm3 {%k2}
	vdivps	%ymm6, %ymm25, %ymm4
	vaddps	%ymm4, %ymm3, %ymm5 {%k3}
	vxorps	%ymm2, %ymm5, %ymm5 {%k1}
	.loc	14 30 10
	vaddps	%ymm22, %ymm5, %ymm3
	.loc	14 31 10
	vmulps	%ymm24, %ymm3, %ymm3
	.loc	14 32 10
	vmulps	%ymm3, %ymm1, %ymm1
	.loc	14 24 8
	vmovss	%xmm1, (%rdx,%rsi,4)
	vextractps	$1, %xmm1, 148(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 296(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 444(%rdx,%rsi,4)
	vextracti128	$1, %ymm1, %xmm1
	vmovd	%xmm1, 592(%rdx,%rsi,4)
	vextractps	$1, %xmm1, 740(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 888(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 1036(%rdx,%rsi,4)
	incq	%rsi
	cmpq	$37, %rsi
	jne	.LBB13_1
	.loc	14 36 8
	xorl	%eax, %eax
	.loc	14 36 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp44:
.Lfunc_end13:
	.size	main$async_dispatch_17_batch_matmul_1x16x37x32_f32, .Lfunc_end13-main$async_dispatch_17_batch_matmul_1x16x37x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_18_batch_matmul_1x16x32x37_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_18_batch_matmul_1x16x32x37_f32,@function
main$async_dispatch_18_batch_matmul_1x16x32x37_f32:
.Lfunc_begin14:
	.file	15 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_18.mlir"
	.loc	15 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp45:
	.loc	15 15 8 prologue_end
	movq	32(%rsi), %r8
	.loc	15 24 8
	movl	(%rdx), %ecx
	movl	$21120, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm9, %xmm9, %xmm9
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm10, %xmm10, %xmm10
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm11, %xmm11, %xmm11
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm12, %xmm12, %xmm12
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm13, %xmm13, %xmm13
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm14, %xmm14, %xmm14
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm15, %xmm15, %xmm15
	.loc	15 15 8
	movq	(%r8), %rsi
	imulq	$1184, %rcx, %rdx
	.loc	15 18 8
	movq	16(%r8), %rax
	.loc	15 16 8
	addq	8(%r8), %rdi
	movq	$-148, %r8
	leaq	5132(%rsi,%rdx), %rdx
	.loc	15 0 8 is_stmt 0
.Ltmp46:
	.p2align	4
.LBB14_1:
	vbroadcastss	-740(%rdx,%r8), %zmm19
	.loc	15 24 8 is_stmt 1
	vmovaps	(%rdi), %zmm16
	vmovaps	64(%rdi), %zmm17
	vbroadcastss	-592(%rdx,%r8), %zmm20
	vbroadcastss	-888(%rdx,%r8), %zmm18
	subq	$-128, %rdi
	vfmadd231ps	%zmm16, %zmm19, %zmm2
	vfmadd231ps	%zmm19, %zmm17, %zmm9
	vbroadcastss	-444(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm3
	vfmadd231ps	%zmm20, %zmm17, %zmm10
	vbroadcastss	-296(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm17, %zmm18, %zmm0
	vfmadd231ps	%zmm18, %zmm16, %zmm1
	vfmadd231ps	%zmm16, %zmm19, %zmm4
	vfmadd231ps	%zmm19, %zmm17, %zmm11
	vbroadcastss	-148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm5
	vfmadd231ps	%zmm20, %zmm17, %zmm12
	vbroadcastss	(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm16, %zmm19, %zmm6
	vfmadd231ps	%zmm19, %zmm17, %zmm13
	vbroadcastss	148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm7
	vfmadd231ps	%zmm20, %zmm17, %zmm14
	addq	$4, %r8
	vfmadd231ps	%zmm16, %zmm19, %zmm8
	vfmadd231ps	%zmm17, %zmm19, %zmm15
	jne	.LBB14_1
	.loc	15 25 8
	shlq	$10, %rcx
	.loc	15 27 10
	vxorps	%xmm16, %xmm16, %xmm16
	vaddps	%zmm16, %zmm0, %zmm0
	vaddps	%zmm16, %zmm1, %zmm1
	vaddps	%zmm16, %zmm9, %zmm9
	vaddps	%zmm16, %zmm2, %zmm2
	vaddps	%zmm16, %zmm10, %zmm10
	vaddps	%zmm16, %zmm3, %zmm3
	vaddps	%zmm16, %zmm11, %zmm11
	vaddps	%zmm16, %zmm4, %zmm4
	vaddps	%zmm16, %zmm12, %zmm12
	vaddps	%zmm16, %zmm5, %zmm5
	vaddps	%zmm16, %zmm13, %zmm13
	vaddps	%zmm16, %zmm6, %zmm6
	vaddps	%zmm16, %zmm14, %zmm14
	vaddps	%zmm16, %zmm7, %zmm7
	vaddps	%zmm16, %zmm15, %zmm15
	vaddps	%zmm16, %zmm8, %zmm8
	.loc	15 28 10
	vaddps	2048(%rsi,%rcx), %zmm1, %zmm1
	vaddps	2112(%rsi,%rcx), %zmm0, %zmm0
	vaddps	2176(%rsi,%rcx), %zmm2, %zmm2
	vaddps	2240(%rsi,%rcx), %zmm9, %zmm9
	vaddps	2304(%rsi,%rcx), %zmm3, %zmm3
	vaddps	2368(%rsi,%rcx), %zmm10, %zmm10
	vaddps	2432(%rsi,%rcx), %zmm4, %zmm4
	vaddps	2496(%rsi,%rcx), %zmm11, %zmm11
	vaddps	2560(%rsi,%rcx), %zmm5, %zmm5
	vaddps	2624(%rsi,%rcx), %zmm12, %zmm12
	vaddps	2688(%rsi,%rcx), %zmm6, %zmm6
	vaddps	2752(%rsi,%rcx), %zmm13, %zmm13
	vaddps	2816(%rsi,%rcx), %zmm7, %zmm7
	vaddps	2880(%rsi,%rcx), %zmm14, %zmm14
	vaddps	2944(%rsi,%rcx), %zmm8, %zmm8
	vaddps	3008(%rsi,%rcx), %zmm15, %zmm15
	vmovaps	%zmm0, 64(%rax,%rcx)
	vmovaps	%zmm1, (%rax,%rcx)
	vmovaps	%zmm9, 192(%rax,%rcx)
	vmovaps	%zmm2, 128(%rax,%rcx)
	vmovaps	%zmm10, 320(%rax,%rcx)
	vmovaps	%zmm3, 256(%rax,%rcx)
	vmovaps	%zmm11, 448(%rax,%rcx)
	vmovaps	%zmm4, 384(%rax,%rcx)
	vmovaps	%zmm12, 576(%rax,%rcx)
	vmovaps	%zmm5, 512(%rax,%rcx)
	vmovaps	%zmm13, 704(%rax,%rcx)
	vmovaps	%zmm6, 640(%rax,%rcx)
	vmovaps	%zmm14, 832(%rax,%rcx)
	vmovaps	%zmm7, 768(%rax,%rcx)
	vmovaps	%zmm15, 960(%rax,%rcx)
	vmovaps	%zmm8, 896(%rax,%rcx)
	.loc	15 32 8
	xorl	%eax, %eax
	.loc	15 32 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp47:
.Lfunc_end14:
	.size	main$async_dispatch_18_batch_matmul_1x16x32x37_f32, .Lfunc_end14-main$async_dispatch_18_batch_matmul_1x16x32x37_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI15_0:
	.long	0x3d000000
.LCPI15_1:
	.long	0x2b8cbccc
.LCPI15_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_20_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_20_reduction_16x32_f32,@function
main$async_dispatch_20_reduction_16x32_f32:
.Lfunc_begin15:
	.file	16 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_20.mlir"
	.loc	16 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp48:
	.loc	16 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	16 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	16 16 8
	movq	(%rcx), %rax
	.loc	16 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	leaq	2048(%rax,%rsi), %rsi
	.loc	16 16 8
	addq	$2048, %rax
	.loc	16 0 8 is_stmt 0
.Ltmp49:
	.p2align	4
.LBB15_1:
	.loc	16 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	16 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	16 22 8
	testb	$1, %dil
	jne	.LBB15_1
	.loc	16 30 10
	vmulps	.LCPI15_0(%rip){1to4}, %xmm0, %xmm0
	.loc	16 32 10
	vbroadcastss	.LCPI15_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	16 31 10
	vaddps	.LCPI15_1(%rip){1to4}, %xmm0, %xmm0
	.loc	16 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	16 0 10 is_stmt 0
.Ltmp50:
	.p2align	4
.LBB15_3:
	.loc	16 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	16 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	16 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	16 28 8
	vmovaps	%zmm4, (%rcx,%rsi,4)
	vmovaps	%zmm5, 128(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB15_3
	.loc	16 39 8
	xorl	%eax, %eax
	.loc	16 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp51:
.Lfunc_end15:
	.size	main$async_dispatch_20_reduction_16x32_f32, .Lfunc_end15-main$async_dispatch_20_reduction_16x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_28_batch_matmul_1x16x32x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_28_batch_matmul_1x16x32x32_f32,@function
main$async_dispatch_28_batch_matmul_1x16x32x32_f32:
.Lfunc_begin16:
	.file	17 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_28.mlir"
	.loc	17 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp52:
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
	.loc	17 15 8 prologue_end
	movq	32(%rsi), %rdi
	movl	$38144, %esi
	movb	$1, %r12b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r15d, %r15d
	.loc	17 16 8
	addq	8(%rdi), %rsi
	.loc	17 15 8
	movq	(%rdi), %rax
	.loc	17 18 8
	movq	16(%rdi), %rcx
	.loc	17 24 8
	movl	(%rdx), %edi
	movq	%rdi, %rdx
	shlq	$10, %rdi
	shlq	$8, %rdx
	movq	%rsi, -48(%rbp)
	leaq	8192(%rax,%rdi), %rdi
	.loc	17 0 8 is_stmt 0
.Ltmp53:
	.p2align	4
.LBB16_1:
	movq	-48(%rbp), %rsi
	movb	$1, %r13b
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%r9d, %r9d
	.loc	17 24 8
	leaq	(%rsi,%r15,4), %r8
	.loc	17 0 8
.Ltmp54:
	.p2align	4
.LBB16_2:
	movl	%r13d, %r10d
	.loc	17 24 8
	movq	%r9, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm24
	movq	%r9, %r13
	orq	$1, %r13
	vfmadd231ps	(%rdi,%r9,4){1to16}, %zmm24, %zmm1
	vfmadd231ps	128(%rdi,%r9,4){1to16}, %zmm24, %zmm2
	vfmadd231ps	256(%rdi,%r9,4){1to16}, %zmm24, %zmm3
	vfmadd231ps	384(%rdi,%r9,4){1to16}, %zmm24, %zmm4
	vfmadd231ps	512(%rdi,%r9,4){1to16}, %zmm24, %zmm5
	vfmadd231ps	640(%rdi,%r9,4){1to16}, %zmm24, %zmm6
	vfmadd231ps	768(%rdi,%r9,4){1to16}, %zmm24, %zmm7
	vfmadd231ps	896(%rdi,%r9,4){1to16}, %zmm24, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm23
	movq	%r9, %r13
	orq	$2, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm22
	movq	%r9, %r13
	orq	$3, %r13
	vfmadd231ps	4(%rdi,%r9,4){1to16}, %zmm23, %zmm1
	vfmadd231ps	132(%rdi,%r9,4){1to16}, %zmm23, %zmm2
	vfmadd231ps	260(%rdi,%r9,4){1to16}, %zmm23, %zmm3
	vfmadd231ps	388(%rdi,%r9,4){1to16}, %zmm23, %zmm4
	vfmadd231ps	516(%rdi,%r9,4){1to16}, %zmm23, %zmm5
	vfmadd231ps	644(%rdi,%r9,4){1to16}, %zmm23, %zmm6
	vfmadd231ps	772(%rdi,%r9,4){1to16}, %zmm23, %zmm7
	vfmadd231ps	900(%rdi,%r9,4){1to16}, %zmm23, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm21
	movq	%r9, %r13
	orq	$4, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm20
	movq	%r9, %r13
	orq	$5, %r13
	vfmadd231ps	8(%rdi,%r9,4){1to16}, %zmm22, %zmm1
	vfmadd231ps	136(%rdi,%r9,4){1to16}, %zmm22, %zmm2
	vfmadd231ps	264(%rdi,%r9,4){1to16}, %zmm22, %zmm3
	vfmadd231ps	392(%rdi,%r9,4){1to16}, %zmm22, %zmm4
	vfmadd231ps	520(%rdi,%r9,4){1to16}, %zmm22, %zmm5
	vfmadd231ps	648(%rdi,%r9,4){1to16}, %zmm22, %zmm6
	vfmadd231ps	776(%rdi,%r9,4){1to16}, %zmm22, %zmm7
	vfmadd231ps	904(%rdi,%r9,4){1to16}, %zmm22, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm19
	movq	%r9, %r13
	orq	$6, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm18
	movq	%r9, %r13
	orq	$7, %r13
	vfmadd231ps	12(%rdi,%r9,4){1to16}, %zmm21, %zmm1
	vfmadd231ps	140(%rdi,%r9,4){1to16}, %zmm21, %zmm2
	vfmadd231ps	268(%rdi,%r9,4){1to16}, %zmm21, %zmm3
	vfmadd231ps	396(%rdi,%r9,4){1to16}, %zmm21, %zmm4
	vfmadd231ps	524(%rdi,%r9,4){1to16}, %zmm21, %zmm5
	vfmadd231ps	652(%rdi,%r9,4){1to16}, %zmm21, %zmm6
	vfmadd231ps	780(%rdi,%r9,4){1to16}, %zmm21, %zmm7
	vfmadd231ps	908(%rdi,%r9,4){1to16}, %zmm21, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm17
	movq	%r9, %r13
	orq	$8, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm16
	movq	%r9, %r13
	orq	$9, %r13
	vfmadd231ps	16(%rdi,%r9,4){1to16}, %zmm20, %zmm1
	vfmadd231ps	144(%rdi,%r9,4){1to16}, %zmm20, %zmm2
	vfmadd231ps	272(%rdi,%r9,4){1to16}, %zmm20, %zmm3
	vfmadd231ps	400(%rdi,%r9,4){1to16}, %zmm20, %zmm4
	vfmadd231ps	528(%rdi,%r9,4){1to16}, %zmm20, %zmm5
	vfmadd231ps	656(%rdi,%r9,4){1to16}, %zmm20, %zmm6
	vfmadd231ps	784(%rdi,%r9,4){1to16}, %zmm20, %zmm7
	vfmadd231ps	912(%rdi,%r9,4){1to16}, %zmm20, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm15
	movq	%r9, %r13
	orq	$10, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm14
	movq	%r9, %r13
	orq	$11, %r13
	vfmadd231ps	20(%rdi,%r9,4){1to16}, %zmm19, %zmm1
	vfmadd231ps	148(%rdi,%r9,4){1to16}, %zmm19, %zmm2
	vfmadd231ps	276(%rdi,%r9,4){1to16}, %zmm19, %zmm3
	vfmadd231ps	404(%rdi,%r9,4){1to16}, %zmm19, %zmm4
	vfmadd231ps	532(%rdi,%r9,4){1to16}, %zmm19, %zmm5
	vfmadd231ps	660(%rdi,%r9,4){1to16}, %zmm19, %zmm6
	vfmadd231ps	788(%rdi,%r9,4){1to16}, %zmm19, %zmm7
	vfmadd231ps	916(%rdi,%r9,4){1to16}, %zmm19, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm13
	movq	%r9, %r13
	orq	$12, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm12
	movq	%r9, %r13
	orq	$13, %r13
	vfmadd231ps	24(%rdi,%r9,4){1to16}, %zmm18, %zmm1
	vfmadd231ps	152(%rdi,%r9,4){1to16}, %zmm18, %zmm2
	vfmadd231ps	280(%rdi,%r9,4){1to16}, %zmm18, %zmm3
	vfmadd231ps	408(%rdi,%r9,4){1to16}, %zmm18, %zmm4
	vfmadd231ps	536(%rdi,%r9,4){1to16}, %zmm18, %zmm5
	vfmadd231ps	664(%rdi,%r9,4){1to16}, %zmm18, %zmm6
	vfmadd231ps	792(%rdi,%r9,4){1to16}, %zmm18, %zmm7
	vfmadd231ps	920(%rdi,%r9,4){1to16}, %zmm18, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm11
	movq	%r9, %r13
	orq	$14, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm10
	movq	%r9, %r13
	orq	$15, %r13
	vfmadd231ps	28(%rdi,%r9,4){1to16}, %zmm17, %zmm1
	vfmadd231ps	156(%rdi,%r9,4){1to16}, %zmm17, %zmm2
	vfmadd231ps	284(%rdi,%r9,4){1to16}, %zmm17, %zmm3
	vfmadd231ps	412(%rdi,%r9,4){1to16}, %zmm17, %zmm4
	vfmadd231ps	540(%rdi,%r9,4){1to16}, %zmm17, %zmm5
	vfmadd231ps	668(%rdi,%r9,4){1to16}, %zmm17, %zmm6
	vfmadd231ps	796(%rdi,%r9,4){1to16}, %zmm17, %zmm7
	vfmadd231ps	924(%rdi,%r9,4){1to16}, %zmm17, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm9
	xorl	%r13d, %r13d
	vfmadd231ps	32(%rdi,%r9,4){1to16}, %zmm16, %zmm1
	vfmadd231ps	160(%rdi,%r9,4){1to16}, %zmm16, %zmm2
	vfmadd231ps	288(%rdi,%r9,4){1to16}, %zmm16, %zmm3
	vfmadd231ps	416(%rdi,%r9,4){1to16}, %zmm16, %zmm4
	vfmadd231ps	544(%rdi,%r9,4){1to16}, %zmm16, %zmm5
	vfmadd231ps	672(%rdi,%r9,4){1to16}, %zmm16, %zmm6
	vfmadd231ps	800(%rdi,%r9,4){1to16}, %zmm16, %zmm7
	vfmadd231ps	928(%rdi,%r9,4){1to16}, %zmm16, %zmm8
	vfmadd231ps	36(%rdi,%r9,4){1to16}, %zmm15, %zmm1
	vfmadd231ps	164(%rdi,%r9,4){1to16}, %zmm15, %zmm2
	vfmadd231ps	292(%rdi,%r9,4){1to16}, %zmm15, %zmm3
	vfmadd231ps	420(%rdi,%r9,4){1to16}, %zmm15, %zmm4
	vfmadd231ps	548(%rdi,%r9,4){1to16}, %zmm15, %zmm5
	vfmadd231ps	676(%rdi,%r9,4){1to16}, %zmm15, %zmm6
	vfmadd231ps	804(%rdi,%r9,4){1to16}, %zmm15, %zmm7
	vfmadd231ps	932(%rdi,%r9,4){1to16}, %zmm15, %zmm8
	vfmadd231ps	40(%rdi,%r9,4){1to16}, %zmm14, %zmm1
	vfmadd231ps	168(%rdi,%r9,4){1to16}, %zmm14, %zmm2
	vfmadd231ps	296(%rdi,%r9,4){1to16}, %zmm14, %zmm3
	vfmadd231ps	424(%rdi,%r9,4){1to16}, %zmm14, %zmm4
	vfmadd231ps	552(%rdi,%r9,4){1to16}, %zmm14, %zmm5
	vfmadd231ps	680(%rdi,%r9,4){1to16}, %zmm14, %zmm6
	vfmadd231ps	808(%rdi,%r9,4){1to16}, %zmm14, %zmm7
	vfmadd231ps	936(%rdi,%r9,4){1to16}, %zmm14, %zmm8
	vfmadd231ps	44(%rdi,%r9,4){1to16}, %zmm13, %zmm1
	vfmadd231ps	172(%rdi,%r9,4){1to16}, %zmm13, %zmm2
	vfmadd231ps	300(%rdi,%r9,4){1to16}, %zmm13, %zmm3
	vfmadd231ps	428(%rdi,%r9,4){1to16}, %zmm13, %zmm4
	vfmadd231ps	556(%rdi,%r9,4){1to16}, %zmm13, %zmm5
	vfmadd231ps	684(%rdi,%r9,4){1to16}, %zmm13, %zmm6
	vfmadd231ps	812(%rdi,%r9,4){1to16}, %zmm13, %zmm7
	vfmadd231ps	940(%rdi,%r9,4){1to16}, %zmm13, %zmm8
	vfmadd231ps	48(%rdi,%r9,4){1to16}, %zmm12, %zmm1
	vfmadd231ps	176(%rdi,%r9,4){1to16}, %zmm12, %zmm2
	vfmadd231ps	304(%rdi,%r9,4){1to16}, %zmm12, %zmm3
	vfmadd231ps	432(%rdi,%r9,4){1to16}, %zmm12, %zmm4
	vfmadd231ps	560(%rdi,%r9,4){1to16}, %zmm12, %zmm5
	vfmadd231ps	688(%rdi,%r9,4){1to16}, %zmm12, %zmm6
	vfmadd231ps	816(%rdi,%r9,4){1to16}, %zmm12, %zmm7
	vfmadd231ps	944(%rdi,%r9,4){1to16}, %zmm12, %zmm8
	vfmadd231ps	52(%rdi,%r9,4){1to16}, %zmm11, %zmm1
	vfmadd231ps	180(%rdi,%r9,4){1to16}, %zmm11, %zmm2
	vfmadd231ps	308(%rdi,%r9,4){1to16}, %zmm11, %zmm3
	vfmadd231ps	436(%rdi,%r9,4){1to16}, %zmm11, %zmm4
	vfmadd231ps	564(%rdi,%r9,4){1to16}, %zmm11, %zmm5
	vfmadd231ps	692(%rdi,%r9,4){1to16}, %zmm11, %zmm6
	vfmadd231ps	820(%rdi,%r9,4){1to16}, %zmm11, %zmm7
	vfmadd231ps	948(%rdi,%r9,4){1to16}, %zmm11, %zmm8
	vfmadd231ps	56(%rdi,%r9,4){1to16}, %zmm10, %zmm1
	vfmadd231ps	184(%rdi,%r9,4){1to16}, %zmm10, %zmm2
	vfmadd231ps	312(%rdi,%r9,4){1to16}, %zmm10, %zmm3
	vfmadd231ps	440(%rdi,%r9,4){1to16}, %zmm10, %zmm4
	vfmadd231ps	568(%rdi,%r9,4){1to16}, %zmm10, %zmm5
	vfmadd231ps	696(%rdi,%r9,4){1to16}, %zmm10, %zmm6
	vfmadd231ps	824(%rdi,%r9,4){1to16}, %zmm10, %zmm7
	vfmadd231ps	952(%rdi,%r9,4){1to16}, %zmm10, %zmm8
	vfmadd231ps	60(%rdi,%r9,4){1to16}, %zmm9, %zmm1
	vfmadd231ps	188(%rdi,%r9,4){1to16}, %zmm9, %zmm2
	vfmadd231ps	316(%rdi,%r9,4){1to16}, %zmm9, %zmm3
	vfmadd231ps	444(%rdi,%r9,4){1to16}, %zmm9, %zmm4
	vfmadd231ps	572(%rdi,%r9,4){1to16}, %zmm9, %zmm5
	vfmadd231ps	700(%rdi,%r9,4){1to16}, %zmm9, %zmm6
	vfmadd231ps	828(%rdi,%r9,4){1to16}, %zmm9, %zmm7
	vfmadd231ps	956(%rdi,%r9,4){1to16}, %zmm9, %zmm8
	movl	$16, %r9d
	testb	$1, %r10b
	jne	.LBB16_2
	.loc	17 25 8 is_stmt 1
	leaq	32(%rdx), %r10
	leaq	64(%rdx), %r11
	movq	%r15, %r9
	leaq	128(%rdx), %rbx
	leaq	160(%rdx), %r14
	leaq	192(%rdx), %rsi
	movq	%r15, %r13
	movq	%r15, %r8
	orq	%rdx, %r8
	.loc	17 27 10
	vaddps	%zmm0, %zmm1, %zmm1
	vaddps	%zmm0, %zmm2, %zmm2
	vaddps	%zmm0, %zmm3, %zmm3
	vaddps	%zmm0, %zmm4, %zmm4
	vaddps	%zmm0, %zmm5, %zmm5
	vaddps	%zmm0, %zmm6, %zmm6
	vaddps	%zmm0, %zmm7, %zmm7
	vaddps	%zmm0, %zmm8, %zmm8
	.loc	17 25 8
	orq	%r10, %r9
	movq	%r15, %r10
	orq	%r11, %r10
	leaq	96(%rdx), %r11
	.loc	17 28 10
	vaddps	(%rax,%r8,4), %zmm1, %zmm1
	.loc	17 25 8
	orq	%r11, %r13
	movq	%r15, %r11
	orq	%rbx, %r11
	movq	%r15, %rbx
	orq	%r14, %rbx
	movq	%r15, %r14
	orq	%rsi, %r14
	leaq	224(%rdx), %rsi
	.loc	17 28 10
	vaddps	(%rax,%r9,4), %zmm2, %zmm2
	vaddps	(%rax,%r10,4), %zmm3, %zmm3
	.loc	17 25 8
	orq	%rsi, %r15
	.loc	17 28 10
	vaddps	(%rax,%r13,4), %zmm4, %zmm4
	vaddps	(%rax,%r11,4), %zmm5, %zmm5
	vaddps	(%rax,%rbx,4), %zmm6, %zmm6
	vaddps	(%rax,%r14,4), %zmm7, %zmm7
	vaddps	(%rax,%r15,4), %zmm8, %zmm8
	.loc	17 24 8
	vmovaps	%zmm1, 2048(%rcx,%r8,4)
	vmovaps	%zmm2, 2048(%rcx,%r9,4)
	vmovaps	%zmm3, 2048(%rcx,%r10,4)
	vmovaps	%zmm4, 2048(%rcx,%r13,4)
	vmovaps	%zmm5, 2048(%rcx,%r11,4)
	vmovaps	%zmm6, 2048(%rcx,%rbx,4)
	vmovaps	%zmm7, 2048(%rcx,%r14,4)
	vmovaps	%zmm8, 2048(%rcx,%r15,4)
	movl	$16, %r15d
	testb	$1, %r12b
	movl	$0, %r12d
	jne	.LBB16_1
	.loc	17 32 8
	xorl	%eax, %eax
	.loc	17 32 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp55:
.Lfunc_end16:
	.size	main$async_dispatch_28_batch_matmul_1x16x32x32_f32, .Lfunc_end16-main$async_dispatch_28_batch_matmul_1x16x32x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI17_0:
	.long	0x3d000000
.LCPI17_1:
	.long	0x2b8cbccc
.LCPI17_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_30_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_30_reduction_16x32_f32,@function
main$async_dispatch_30_reduction_16x32_f32:
.Lfunc_begin17:
	.file	18 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_30.mlir"
	.loc	18 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp56:
	.loc	18 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	18 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	18 16 8
	movq	(%rcx), %rax
	.loc	18 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	addq	%rax, %rsi
	.loc	18 0 8 is_stmt 0
.Ltmp57:
	.p2align	4
.LBB17_1:
	.loc	18 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	18 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	18 22 8
	testb	$1, %dil
	jne	.LBB17_1
	.loc	18 30 10
	vmulps	.LCPI17_0(%rip){1to4}, %xmm0, %xmm0
	.loc	18 32 10
	vbroadcastss	.LCPI17_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	18 31 10
	vaddps	.LCPI17_1(%rip){1to4}, %xmm0, %xmm0
	.loc	18 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	18 0 10 is_stmt 0
.Ltmp58:
	.p2align	4
.LBB17_3:
	.loc	18 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	18 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	18 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	18 28 8
	vmovaps	%zmm4, 2048(%rcx,%rsi,4)
	vmovaps	%zmm5, 2176(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB17_3
	.loc	18 39 8
	xorl	%eax, %eax
	.loc	18 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp59:
.Lfunc_end17:
	.size	main$async_dispatch_30_reduction_16x32_f32, .Lfunc_end17-main$async_dispatch_30_reduction_16x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI18_0:
	.long	0x3fb504f3
.LCPI18_1:
	.long	0x80000000
.LCPI18_2:
	.long	0x3f4ccccd
.LCPI18_3:
	.long	0x3f905225
.LCPI18_4:
	.long	0x3f906eba
.LCPI18_5:
	.long	0xbea7bc1b
.LCPI18_6:
	.long	0xbeed51af
.LCPI18_7:
	.long	0xbebabcc4
.LCPI18_8:
	.long	0xbf05e48b
.LCPI18_9:
	.long	0x3ee590a2
.LCPI18_10:
	.long	0x3f04ec44
.LCPI18_11:
	.long	0x3df27f94
.LCPI18_12:
	.long	0x3e56c688
.LCPI18_13:
	.long	0xbdb4eee3
.LCPI18_14:
	.long	0xbe06f8ee
.LCPI18_15:
	.long	0x3d17d100
.LCPI18_16:
	.long	0x3cd3794f
.LCPI18_17:
	.long	0x3d6a78fa
.LCPI18_18:
	.long	0x3d9782a4
.LCPI18_19:
	.long	0x40000000
.LCPI18_20:
	.long	0xbb58546d
.LCPI18_21:
	.long	0x3b66a96a
.LCPI18_22:
	.long	0xc003e25f
.LCPI18_23:
	.long	0xbab94d1e
.LCPI18_24:
	.long	0x3fd0437b
.LCPI18_25:
	.long	0x3984e118
.LCPI18_26:
	.long	0xbf15590a
.LCPI18_27:
	.long	0xb78f7c49
.LCPI18_28:
	.long	0x3da853b3
.LCPI18_29:
	.long	0x3f800000
.LCPI18_30:
	.long	0x40700000
.LCPI18_31:
	.long	0x3f000000
	.section	".text.main$async_dispatch_31_batch_matmul_1x16x37x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_31_batch_matmul_1x16x37x32_f32,@function
main$async_dispatch_31_batch_matmul_1x16x37x32_f32:
.Lfunc_begin18:
	.file	19 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_31.mlir"
	.loc	19 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp60:
	.loc	19 17 8 prologue_end
	movq	32(%rsi), %rcx
	movl	$42240, %eax
	vbroadcastss	.LCPI18_15(%rip), %ymm10
	vbroadcastss	.LCPI18_17(%rip), %ymm11
	vbroadcastss	.LCPI18_19(%rip), %ymm12
	vbroadcastss	.LCPI18_20(%rip), %ymm13
	vbroadcastss	.LCPI18_21(%rip), %ymm14
	vbroadcastss	.LCPI18_22(%rip), %ymm15
	vbroadcastss	.LCPI18_23(%rip), %ymm16
	vbroadcastss	.LCPI18_24(%rip), %ymm17
	vbroadcastss	.LCPI18_25(%rip), %ymm18
	vbroadcastss	.LCPI18_26(%rip), %ymm19
	vbroadcastss	.LCPI18_27(%rip), %ymm20
	vbroadcastss	.LCPI18_28(%rip), %ymm21
	vbroadcastss	.LCPI18_29(%rip), %ymm22
	vbroadcastss	.LCPI18_30(%rip), %ymm23
	vbroadcastss	.LCPI18_31(%rip), %ymm24
	vbroadcastss	.LCPI18_1(%rip), %ymm2
	vxorps	%xmm0, %xmm0, %xmm0
	.loc	19 18 8
	addq	8(%rcx), %rax
	.loc	19 17 8
	movq	(%rcx), %rsi
	.loc	19 19 8
	movq	16(%rcx), %rdi
	.loc	19 24 8
	movl	(%rdx), %ecx
	imulq	$1184, %rcx, %rdx
	shlq	$10, %rcx
	leaq	2048(%rsi,%rcx), %rcx
	xorl	%esi, %esi
	leaq	4096(%rdi,%rdx), %rdx
	.loc	19 0 8 is_stmt 0
.Ltmp61:
	.p2align	4
.LBB18_1:
	.loc	19 24 8
	leaq	(%rax,%rsi,4), %rdi
	movb	$1, %r8b
	vxorps	%xmm25, %xmm25, %xmm25
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r9d, %r9d
	.loc	19 0 8
.Ltmp62:
	.p2align	4
.LBB18_2:
	.loc	19 24 8
	imulq	$148, %r9, %r10
	vmovss	384(%rcx,%r9,4), %xmm5
	vmovss	512(%rcx,%r9,4), %xmm6
	vmovss	256(%rcx,%r9,4), %xmm8
	vextractf128	$1, %ymm1, %xmm9
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vshufpd	$1, %xmm1, %xmm1, %xmm27
	vmovss	640(%rcx,%r9,4), %xmm7
	vbroadcastss	(%rdi,%r10), %xmm31
	movq	%r9, %r10
	orq	$1, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	896(%rcx,%r9,4), %xmm31, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$2, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	900(%rcx,%r9,4), %xmm29, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$3, %r10
	vfmadd231ps	%ymm5, %ymm31, %ymm4
	vbroadcastss	%xmm9, %ymm5
	vfmadd231ps	%ymm8, %ymm31, %ymm27
	vmovss	768(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vfmadd231ss	904(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm6, %ymm31, %ymm5
	vmovshdup	%xmm9, %xmm6
	vmovss	260(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm7, %ymm31, %ymm6
	vpermpd	$255, %ymm1, %ymm7
	vbroadcastss	(%rdi,%r10), %xmm30
	movq	%r9, %r10
	orq	$4, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	908(%rcx,%r9,4), %xmm30, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$5, %r10
	vfmadd231ps	%ymm8, %ymm31, %ymm7
	vmovss	(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vinsertps	$16, 128(%rcx,%r9,4), %xmm8, %xmm8
	vfmadd231ss	912(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm27
	vmovss	264(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$6, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	916(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd213ps	%ymm1, %ymm31, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$7, %r10
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	388(%rcx,%r9,4), %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	920(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm4
	vmovss	516(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm5
	vmovss	392(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	520(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	644(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm6
	vmovss	648(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	772(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm7
	vmovss	776(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	4(%rcx,%r9,4), %xmm9
	vinsertps	$16, 132(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm8
	vmovss	8(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$8, %r10
	vinsertps	$16, 136(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	924(%rcx,%r9,4), %xmm29, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	268(%rcx,%r9,4), %xmm3
	vmovss	272(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm27
	vmovss	396(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm27
	vmovss	276(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm4
	vmovss	524(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm27
	vmovss	400(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm5
	vmovss	652(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm4
	vmovss	528(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm6
	vmovss	780(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm5
	vmovss	404(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm7
	vmovss	12(%rcx,%r9,4), %xmm3
	vinsertps	$16, 140(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm4
	vmovss	532(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$9, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	928(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm5
	vmovss	656(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm6
	vmovss	660(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm6
	vmovss	784(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm7
	vmovss	788(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm7
	vmovss	16(%rcx,%r9,4), %xmm9
	vinsertps	$16, 144(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm8
	vmovss	20(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$10, %r10
	vinsertps	$16, 148(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	932(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm8
	vmovss	280(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$11, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	936(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm9, %ymm1, %ymm27
	vmovss	408(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm4
	vmovss	536(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm5
	vmovss	664(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm6
	vmovss	792(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm7
	vmovss	24(%rcx,%r9,4), %xmm9
	vinsertps	$16, 152(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm8
	vmovss	284(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm9
	movq	%r9, %r10
	orq	$12, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	940(%rcx,%r9,4), %xmm9, %xmm25
	vfmadd231ps	%ymm1, %ymm29, %ymm27
	vmovss	288(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm27
	vmovss	412(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm4
	vmovss	540(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm5
	vmovss	416(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm4
	vmovss	544(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm5
	vmovss	668(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm6
	vmovss	672(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm6
	vmovss	796(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm7
	vmovss	800(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm7
	vmovss	28(%rcx,%r9,4), %xmm1
	vinsertps	$16, 156(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm8
	vmovss	32(%rcx,%r9,4), %xmm1
	vinsertps	$16, 160(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm8
	vmovss	292(%rcx,%r9,4), %xmm1
	vmovss	296(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm27
	vmovss	420(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm27
	vmovss	300(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm4
	vmovss	548(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm27
	vmovss	424(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm5
	vmovss	676(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm4
	vmovss	552(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm6
	vmovss	804(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm5
	vmovss	428(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm7
	vmovss	36(%rcx,%r9,4), %xmm1
	vinsertps	$16, 164(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm4
	vmovss	556(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$13, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	944(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm5
	vmovss	680(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm6
	vmovss	684(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm6
	vmovss	808(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm7
	vmovss	812(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm7
	vmovss	40(%rcx,%r9,4), %xmm3
	vinsertps	$16, 168(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm8
	vmovss	44(%rcx,%r9,4), %xmm3
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$14, %r10
	vinsertps	$16, 172(%rcx,%r9,4), %xmm3, %xmm3
	imulq	$148, %r10, %r10
	vfmadd231ss	948(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm8
	vmovss	304(%rcx,%r9,4), %xmm3
	vmovss	312(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	432(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	560(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	688(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	816(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	48(%rcx,%r9,4), %xmm3
	vinsertps	$16, 176(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vmovss	308(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$15, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	952(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm1, %ymm26, %ymm27
	vmovss	436(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	440(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm4
	vmovss	564(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	568(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm5
	vmovss	692(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	696(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm6
	vmovss	820(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	824(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm7
	vmovss	52(%rcx,%r9,4), %xmm1
	vinsertps	$16, 180(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	56(%rcx,%r9,4), %xmm9
	vinsertps	$16, 184(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movl	%r8d, %r10d
	xorl	%r8d, %r8d
	vfmadd231ss	956(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	316(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	444(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	572(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	700(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	828(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	60(%rcx,%r9,4), %xmm3
	vinsertps	$16, 188(%rcx,%r9,4), %xmm3, %xmm3
	movl	$16, %r9d
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vbroadcastss	%xmm6, %ymm3
	vmovlhps	%xmm27, %xmm8, %xmm1
	vinsertps	$48, %xmm4, %xmm1, %xmm1
	vinsertf128	$1, %xmm5, %ymm1, %ymm1
	vblendps	$32, %ymm3, %ymm1, %ymm1
	vbroadcastsd	%xmm7, %ymm3
	vblendps	$192, %ymm3, %ymm1, %ymm1
	vbroadcastss	%xmm25, %ymm3
	vblendps	$128, %ymm3, %ymm1, %ymm1
	testb	$1, %r10b
	jne	.LBB18_2
	.loc	19 27 10 is_stmt 1
	vaddps	%ymm0, %ymm1, %ymm1
	.loc	19 28 10
	vdivps	.LCPI18_0(%rip){1to8}, %ymm1, %ymm3
	.loc	19 29 10
	vbroadcastss	.LCPI18_5(%rip), %ymm5
	vbroadcastss	.LCPI18_7(%rip), %ymm6
	vbroadcastss	.LCPI18_9(%rip), %ymm7
	vbroadcastss	.LCPI18_11(%rip), %ymm8
	vbroadcastss	.LCPI18_13(%rip), %ymm9
	vxorps	%ymm2, %ymm3, %ymm4
	vcmpltps	%ymm4, %ymm3, %k1
	vmaxps	%ymm3, %ymm4, %ymm3
	vbroadcastss	.LCPI18_3(%rip), %ymm4
	vcmpltps	.LCPI18_2(%rip){1to8}, %ymm3, %k2
	vblendmps	.LCPI18_4(%rip){1to8}, %ymm4, %ymm4 {%k2}
	vblendmps	.LCPI18_6(%rip){1to8}, %ymm5, %ymm5 {%k2}
	vblendmps	.LCPI18_8(%rip){1to8}, %ymm6, %ymm6 {%k2}
	vblendmps	.LCPI18_10(%rip){1to8}, %ymm7, %ymm7 {%k2}
	vblendmps	.LCPI18_12(%rip){1to8}, %ymm8, %ymm8 {%k2}
	vblendmps	.LCPI18_14(%rip){1to8}, %ymm9, %ymm9 {%k2}
	vblendmps	.LCPI18_16(%rip){1to8}, %ymm10, %ymm25 {%k2}
	vblendmps	.LCPI18_18(%rip){1to8}, %ymm11, %ymm26 {%k2}
	vcmpltps	%ymm12, %ymm3, %k2
	vcmpngeps	%ymm23, %ymm3, %k3
	vblendmps	%ymm8, %ymm18, %ymm8 {%k2}
	vblendmps	%ymm25, %ymm20, %ymm25 {%k2}
	vblendmps	%ymm6, %ymm16, %ymm6 {%k2}
	vblendmps	%ymm4, %ymm14, %ymm4 {%k2}
	vfmadd213ps	%ymm8, %ymm3, %ymm25
	vfmadd213ps	%ymm6, %ymm3, %ymm25
	vblendmps	%ymm26, %ymm21, %ymm6 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm0, %ymm13, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm9, %ymm19, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm7, %ymm17, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm5, %ymm15, %ymm4 {%k2}
	vmovaps	%ymm22, %ymm5
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vfmadd213ps	%ymm22, %ymm3, %ymm6
	vblendmps	%ymm0, %ymm22, %ymm3 {%k2}
	vdivps	%ymm6, %ymm25, %ymm4
	vaddps	%ymm4, %ymm3, %ymm5 {%k3}
	vxorps	%ymm2, %ymm5, %ymm5 {%k1}
	.loc	19 30 10
	vaddps	%ymm22, %ymm5, %ymm3
	.loc	19 31 10
	vmulps	%ymm24, %ymm3, %ymm3
	.loc	19 32 10
	vmulps	%ymm3, %ymm1, %ymm1
	.loc	19 24 8
	vmovss	%xmm1, (%rdx,%rsi,4)
	vextractps	$1, %xmm1, 148(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 296(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 444(%rdx,%rsi,4)
	vextracti128	$1, %ymm1, %xmm1
	vmovd	%xmm1, 592(%rdx,%rsi,4)
	vextractps	$1, %xmm1, 740(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 888(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 1036(%rdx,%rsi,4)
	incq	%rsi
	cmpq	$37, %rsi
	jne	.LBB18_1
	.loc	19 36 8
	xorl	%eax, %eax
	.loc	19 36 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp63:
.Lfunc_end18:
	.size	main$async_dispatch_31_batch_matmul_1x16x37x32_f32, .Lfunc_end18-main$async_dispatch_31_batch_matmul_1x16x37x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_32_batch_matmul_1x16x32x37_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_32_batch_matmul_1x16x32x37_f32,@function
main$async_dispatch_32_batch_matmul_1x16x32x37_f32:
.Lfunc_begin19:
	.file	20 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_32.mlir"
	.loc	20 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp64:
	.loc	20 15 8 prologue_end
	movq	32(%rsi), %r8
	.loc	20 24 8
	movl	(%rdx), %ecx
	movl	$46976, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm9, %xmm9, %xmm9
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm10, %xmm10, %xmm10
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm11, %xmm11, %xmm11
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm12, %xmm12, %xmm12
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm13, %xmm13, %xmm13
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm14, %xmm14, %xmm14
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm15, %xmm15, %xmm15
	.loc	20 15 8
	movq	(%r8), %rsi
	imulq	$1184, %rcx, %rdx
	.loc	20 18 8
	movq	16(%r8), %rax
	.loc	20 16 8
	addq	8(%r8), %rdi
	movq	$-148, %r8
	leaq	5132(%rsi,%rdx), %rdx
	.loc	20 0 8 is_stmt 0
.Ltmp65:
	.p2align	4
.LBB19_1:
	vbroadcastss	-740(%rdx,%r8), %zmm19
	.loc	20 24 8 is_stmt 1
	vmovaps	(%rdi), %zmm16
	vmovaps	64(%rdi), %zmm17
	vbroadcastss	-592(%rdx,%r8), %zmm20
	vbroadcastss	-888(%rdx,%r8), %zmm18
	subq	$-128, %rdi
	vfmadd231ps	%zmm16, %zmm19, %zmm2
	vfmadd231ps	%zmm19, %zmm17, %zmm9
	vbroadcastss	-444(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm3
	vfmadd231ps	%zmm20, %zmm17, %zmm10
	vbroadcastss	-296(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm17, %zmm18, %zmm0
	vfmadd231ps	%zmm18, %zmm16, %zmm1
	vfmadd231ps	%zmm16, %zmm19, %zmm4
	vfmadd231ps	%zmm19, %zmm17, %zmm11
	vbroadcastss	-148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm5
	vfmadd231ps	%zmm20, %zmm17, %zmm12
	vbroadcastss	(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm16, %zmm19, %zmm6
	vfmadd231ps	%zmm19, %zmm17, %zmm13
	vbroadcastss	148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm7
	vfmadd231ps	%zmm20, %zmm17, %zmm14
	addq	$4, %r8
	vfmadd231ps	%zmm16, %zmm19, %zmm8
	vfmadd231ps	%zmm17, %zmm19, %zmm15
	jne	.LBB19_1
	.loc	20 25 8
	shlq	$10, %rcx
	.loc	20 27 10
	vxorps	%xmm16, %xmm16, %xmm16
	vaddps	%zmm16, %zmm0, %zmm0
	vaddps	%zmm16, %zmm1, %zmm1
	vaddps	%zmm16, %zmm9, %zmm9
	vaddps	%zmm16, %zmm2, %zmm2
	vaddps	%zmm16, %zmm10, %zmm10
	vaddps	%zmm16, %zmm3, %zmm3
	vaddps	%zmm16, %zmm11, %zmm11
	vaddps	%zmm16, %zmm4, %zmm4
	vaddps	%zmm16, %zmm12, %zmm12
	vaddps	%zmm16, %zmm5, %zmm5
	vaddps	%zmm16, %zmm13, %zmm13
	vaddps	%zmm16, %zmm6, %zmm6
	vaddps	%zmm16, %zmm14, %zmm14
	vaddps	%zmm16, %zmm7, %zmm7
	vaddps	%zmm16, %zmm15, %zmm15
	vaddps	%zmm16, %zmm8, %zmm8
	.loc	20 28 10
	vaddps	2048(%rsi,%rcx), %zmm1, %zmm1
	vaddps	2112(%rsi,%rcx), %zmm0, %zmm0
	vaddps	2176(%rsi,%rcx), %zmm2, %zmm2
	vaddps	2240(%rsi,%rcx), %zmm9, %zmm9
	vaddps	2304(%rsi,%rcx), %zmm3, %zmm3
	vaddps	2368(%rsi,%rcx), %zmm10, %zmm10
	vaddps	2432(%rsi,%rcx), %zmm4, %zmm4
	vaddps	2496(%rsi,%rcx), %zmm11, %zmm11
	vaddps	2560(%rsi,%rcx), %zmm5, %zmm5
	vaddps	2624(%rsi,%rcx), %zmm12, %zmm12
	vaddps	2688(%rsi,%rcx), %zmm6, %zmm6
	vaddps	2752(%rsi,%rcx), %zmm13, %zmm13
	vaddps	2816(%rsi,%rcx), %zmm7, %zmm7
	vaddps	2880(%rsi,%rcx), %zmm14, %zmm14
	vaddps	2944(%rsi,%rcx), %zmm8, %zmm8
	vaddps	3008(%rsi,%rcx), %zmm15, %zmm15
	vmovaps	%zmm0, 64(%rax,%rcx)
	vmovaps	%zmm1, (%rax,%rcx)
	vmovaps	%zmm9, 192(%rax,%rcx)
	vmovaps	%zmm2, 128(%rax,%rcx)
	vmovaps	%zmm10, 320(%rax,%rcx)
	vmovaps	%zmm3, 256(%rax,%rcx)
	vmovaps	%zmm11, 448(%rax,%rcx)
	vmovaps	%zmm4, 384(%rax,%rcx)
	vmovaps	%zmm12, 576(%rax,%rcx)
	vmovaps	%zmm5, 512(%rax,%rcx)
	vmovaps	%zmm13, 704(%rax,%rcx)
	vmovaps	%zmm6, 640(%rax,%rcx)
	vmovaps	%zmm14, 832(%rax,%rcx)
	vmovaps	%zmm7, 768(%rax,%rcx)
	vmovaps	%zmm15, 960(%rax,%rcx)
	vmovaps	%zmm8, 896(%rax,%rcx)
	.loc	20 32 8
	xorl	%eax, %eax
	.loc	20 32 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp66:
.Lfunc_end19:
	.size	main$async_dispatch_32_batch_matmul_1x16x32x37_f32, .Lfunc_end19-main$async_dispatch_32_batch_matmul_1x16x32x37_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI20_0:
	.long	0x3d000000
.LCPI20_1:
	.long	0x2b8cbccc
.LCPI20_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_34_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_34_reduction_16x32_f32,@function
main$async_dispatch_34_reduction_16x32_f32:
.Lfunc_begin20:
	.file	21 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_34.mlir"
	.loc	21 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp67:
	.loc	21 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	21 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	21 16 8
	movq	(%rcx), %rax
	.loc	21 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	leaq	2048(%rax,%rsi), %rsi
	.loc	21 16 8
	addq	$2048, %rax
	.loc	21 0 8 is_stmt 0
.Ltmp68:
	.p2align	4
.LBB20_1:
	.loc	21 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	21 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	21 22 8
	testb	$1, %dil
	jne	.LBB20_1
	.loc	21 30 10
	vmulps	.LCPI20_0(%rip){1to4}, %xmm0, %xmm0
	.loc	21 32 10
	vbroadcastss	.LCPI20_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	21 31 10
	vaddps	.LCPI20_1(%rip){1to4}, %xmm0, %xmm0
	.loc	21 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	21 0 10 is_stmt 0
.Ltmp69:
	.p2align	4
.LBB20_3:
	.loc	21 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	21 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	21 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	21 28 8
	vmovaps	%zmm4, (%rcx,%rsi,4)
	vmovaps	%zmm5, 128(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB20_3
	.loc	21 39 8
	xorl	%eax, %eax
	.loc	21 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp70:
.Lfunc_end20:
	.size	main$async_dispatch_34_reduction_16x32_f32, .Lfunc_end20-main$async_dispatch_34_reduction_16x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_42_batch_matmul_1x16x32x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_42_batch_matmul_1x16x32x32_f32,@function
main$async_dispatch_42_batch_matmul_1x16x32x32_f32:
.Lfunc_begin21:
	.file	22 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_42.mlir"
	.loc	22 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp71:
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
	.loc	22 15 8 prologue_end
	movq	32(%rsi), %rdi
	movl	$64000, %esi
	movb	$1, %r12b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r15d, %r15d
	.loc	22 16 8
	addq	8(%rdi), %rsi
	.loc	22 15 8
	movq	(%rdi), %rax
	.loc	22 18 8
	movq	16(%rdi), %rcx
	.loc	22 24 8
	movl	(%rdx), %edi
	movq	%rdi, %rdx
	shlq	$10, %rdi
	shlq	$8, %rdx
	movq	%rsi, -48(%rbp)
	leaq	8192(%rax,%rdi), %rdi
	.loc	22 0 8 is_stmt 0
.Ltmp72:
	.p2align	4
.LBB21_1:
	movq	-48(%rbp), %rsi
	movb	$1, %r13b
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%r9d, %r9d
	.loc	22 24 8
	leaq	(%rsi,%r15,4), %r8
	.loc	22 0 8
.Ltmp73:
	.p2align	4
.LBB21_2:
	movl	%r13d, %r10d
	.loc	22 24 8
	movq	%r9, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm24
	movq	%r9, %r13
	orq	$1, %r13
	vfmadd231ps	(%rdi,%r9,4){1to16}, %zmm24, %zmm1
	vfmadd231ps	128(%rdi,%r9,4){1to16}, %zmm24, %zmm2
	vfmadd231ps	256(%rdi,%r9,4){1to16}, %zmm24, %zmm3
	vfmadd231ps	384(%rdi,%r9,4){1to16}, %zmm24, %zmm4
	vfmadd231ps	512(%rdi,%r9,4){1to16}, %zmm24, %zmm5
	vfmadd231ps	640(%rdi,%r9,4){1to16}, %zmm24, %zmm6
	vfmadd231ps	768(%rdi,%r9,4){1to16}, %zmm24, %zmm7
	vfmadd231ps	896(%rdi,%r9,4){1to16}, %zmm24, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm23
	movq	%r9, %r13
	orq	$2, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm22
	movq	%r9, %r13
	orq	$3, %r13
	vfmadd231ps	4(%rdi,%r9,4){1to16}, %zmm23, %zmm1
	vfmadd231ps	132(%rdi,%r9,4){1to16}, %zmm23, %zmm2
	vfmadd231ps	260(%rdi,%r9,4){1to16}, %zmm23, %zmm3
	vfmadd231ps	388(%rdi,%r9,4){1to16}, %zmm23, %zmm4
	vfmadd231ps	516(%rdi,%r9,4){1to16}, %zmm23, %zmm5
	vfmadd231ps	644(%rdi,%r9,4){1to16}, %zmm23, %zmm6
	vfmadd231ps	772(%rdi,%r9,4){1to16}, %zmm23, %zmm7
	vfmadd231ps	900(%rdi,%r9,4){1to16}, %zmm23, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm21
	movq	%r9, %r13
	orq	$4, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm20
	movq	%r9, %r13
	orq	$5, %r13
	vfmadd231ps	8(%rdi,%r9,4){1to16}, %zmm22, %zmm1
	vfmadd231ps	136(%rdi,%r9,4){1to16}, %zmm22, %zmm2
	vfmadd231ps	264(%rdi,%r9,4){1to16}, %zmm22, %zmm3
	vfmadd231ps	392(%rdi,%r9,4){1to16}, %zmm22, %zmm4
	vfmadd231ps	520(%rdi,%r9,4){1to16}, %zmm22, %zmm5
	vfmadd231ps	648(%rdi,%r9,4){1to16}, %zmm22, %zmm6
	vfmadd231ps	776(%rdi,%r9,4){1to16}, %zmm22, %zmm7
	vfmadd231ps	904(%rdi,%r9,4){1to16}, %zmm22, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm19
	movq	%r9, %r13
	orq	$6, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm18
	movq	%r9, %r13
	orq	$7, %r13
	vfmadd231ps	12(%rdi,%r9,4){1to16}, %zmm21, %zmm1
	vfmadd231ps	140(%rdi,%r9,4){1to16}, %zmm21, %zmm2
	vfmadd231ps	268(%rdi,%r9,4){1to16}, %zmm21, %zmm3
	vfmadd231ps	396(%rdi,%r9,4){1to16}, %zmm21, %zmm4
	vfmadd231ps	524(%rdi,%r9,4){1to16}, %zmm21, %zmm5
	vfmadd231ps	652(%rdi,%r9,4){1to16}, %zmm21, %zmm6
	vfmadd231ps	780(%rdi,%r9,4){1to16}, %zmm21, %zmm7
	vfmadd231ps	908(%rdi,%r9,4){1to16}, %zmm21, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm17
	movq	%r9, %r13
	orq	$8, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm16
	movq	%r9, %r13
	orq	$9, %r13
	vfmadd231ps	16(%rdi,%r9,4){1to16}, %zmm20, %zmm1
	vfmadd231ps	144(%rdi,%r9,4){1to16}, %zmm20, %zmm2
	vfmadd231ps	272(%rdi,%r9,4){1to16}, %zmm20, %zmm3
	vfmadd231ps	400(%rdi,%r9,4){1to16}, %zmm20, %zmm4
	vfmadd231ps	528(%rdi,%r9,4){1to16}, %zmm20, %zmm5
	vfmadd231ps	656(%rdi,%r9,4){1to16}, %zmm20, %zmm6
	vfmadd231ps	784(%rdi,%r9,4){1to16}, %zmm20, %zmm7
	vfmadd231ps	912(%rdi,%r9,4){1to16}, %zmm20, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm15
	movq	%r9, %r13
	orq	$10, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm14
	movq	%r9, %r13
	orq	$11, %r13
	vfmadd231ps	20(%rdi,%r9,4){1to16}, %zmm19, %zmm1
	vfmadd231ps	148(%rdi,%r9,4){1to16}, %zmm19, %zmm2
	vfmadd231ps	276(%rdi,%r9,4){1to16}, %zmm19, %zmm3
	vfmadd231ps	404(%rdi,%r9,4){1to16}, %zmm19, %zmm4
	vfmadd231ps	532(%rdi,%r9,4){1to16}, %zmm19, %zmm5
	vfmadd231ps	660(%rdi,%r9,4){1to16}, %zmm19, %zmm6
	vfmadd231ps	788(%rdi,%r9,4){1to16}, %zmm19, %zmm7
	vfmadd231ps	916(%rdi,%r9,4){1to16}, %zmm19, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm13
	movq	%r9, %r13
	orq	$12, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm12
	movq	%r9, %r13
	orq	$13, %r13
	vfmadd231ps	24(%rdi,%r9,4){1to16}, %zmm18, %zmm1
	vfmadd231ps	152(%rdi,%r9,4){1to16}, %zmm18, %zmm2
	vfmadd231ps	280(%rdi,%r9,4){1to16}, %zmm18, %zmm3
	vfmadd231ps	408(%rdi,%r9,4){1to16}, %zmm18, %zmm4
	vfmadd231ps	536(%rdi,%r9,4){1to16}, %zmm18, %zmm5
	vfmadd231ps	664(%rdi,%r9,4){1to16}, %zmm18, %zmm6
	vfmadd231ps	792(%rdi,%r9,4){1to16}, %zmm18, %zmm7
	vfmadd231ps	920(%rdi,%r9,4){1to16}, %zmm18, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm11
	movq	%r9, %r13
	orq	$14, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm10
	movq	%r9, %r13
	orq	$15, %r13
	vfmadd231ps	28(%rdi,%r9,4){1to16}, %zmm17, %zmm1
	vfmadd231ps	156(%rdi,%r9,4){1to16}, %zmm17, %zmm2
	vfmadd231ps	284(%rdi,%r9,4){1to16}, %zmm17, %zmm3
	vfmadd231ps	412(%rdi,%r9,4){1to16}, %zmm17, %zmm4
	vfmadd231ps	540(%rdi,%r9,4){1to16}, %zmm17, %zmm5
	vfmadd231ps	668(%rdi,%r9,4){1to16}, %zmm17, %zmm6
	vfmadd231ps	796(%rdi,%r9,4){1to16}, %zmm17, %zmm7
	vfmadd231ps	924(%rdi,%r9,4){1to16}, %zmm17, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm9
	xorl	%r13d, %r13d
	vfmadd231ps	32(%rdi,%r9,4){1to16}, %zmm16, %zmm1
	vfmadd231ps	160(%rdi,%r9,4){1to16}, %zmm16, %zmm2
	vfmadd231ps	288(%rdi,%r9,4){1to16}, %zmm16, %zmm3
	vfmadd231ps	416(%rdi,%r9,4){1to16}, %zmm16, %zmm4
	vfmadd231ps	544(%rdi,%r9,4){1to16}, %zmm16, %zmm5
	vfmadd231ps	672(%rdi,%r9,4){1to16}, %zmm16, %zmm6
	vfmadd231ps	800(%rdi,%r9,4){1to16}, %zmm16, %zmm7
	vfmadd231ps	928(%rdi,%r9,4){1to16}, %zmm16, %zmm8
	vfmadd231ps	36(%rdi,%r9,4){1to16}, %zmm15, %zmm1
	vfmadd231ps	164(%rdi,%r9,4){1to16}, %zmm15, %zmm2
	vfmadd231ps	292(%rdi,%r9,4){1to16}, %zmm15, %zmm3
	vfmadd231ps	420(%rdi,%r9,4){1to16}, %zmm15, %zmm4
	vfmadd231ps	548(%rdi,%r9,4){1to16}, %zmm15, %zmm5
	vfmadd231ps	676(%rdi,%r9,4){1to16}, %zmm15, %zmm6
	vfmadd231ps	804(%rdi,%r9,4){1to16}, %zmm15, %zmm7
	vfmadd231ps	932(%rdi,%r9,4){1to16}, %zmm15, %zmm8
	vfmadd231ps	40(%rdi,%r9,4){1to16}, %zmm14, %zmm1
	vfmadd231ps	168(%rdi,%r9,4){1to16}, %zmm14, %zmm2
	vfmadd231ps	296(%rdi,%r9,4){1to16}, %zmm14, %zmm3
	vfmadd231ps	424(%rdi,%r9,4){1to16}, %zmm14, %zmm4
	vfmadd231ps	552(%rdi,%r9,4){1to16}, %zmm14, %zmm5
	vfmadd231ps	680(%rdi,%r9,4){1to16}, %zmm14, %zmm6
	vfmadd231ps	808(%rdi,%r9,4){1to16}, %zmm14, %zmm7
	vfmadd231ps	936(%rdi,%r9,4){1to16}, %zmm14, %zmm8
	vfmadd231ps	44(%rdi,%r9,4){1to16}, %zmm13, %zmm1
	vfmadd231ps	172(%rdi,%r9,4){1to16}, %zmm13, %zmm2
	vfmadd231ps	300(%rdi,%r9,4){1to16}, %zmm13, %zmm3
	vfmadd231ps	428(%rdi,%r9,4){1to16}, %zmm13, %zmm4
	vfmadd231ps	556(%rdi,%r9,4){1to16}, %zmm13, %zmm5
	vfmadd231ps	684(%rdi,%r9,4){1to16}, %zmm13, %zmm6
	vfmadd231ps	812(%rdi,%r9,4){1to16}, %zmm13, %zmm7
	vfmadd231ps	940(%rdi,%r9,4){1to16}, %zmm13, %zmm8
	vfmadd231ps	48(%rdi,%r9,4){1to16}, %zmm12, %zmm1
	vfmadd231ps	176(%rdi,%r9,4){1to16}, %zmm12, %zmm2
	vfmadd231ps	304(%rdi,%r9,4){1to16}, %zmm12, %zmm3
	vfmadd231ps	432(%rdi,%r9,4){1to16}, %zmm12, %zmm4
	vfmadd231ps	560(%rdi,%r9,4){1to16}, %zmm12, %zmm5
	vfmadd231ps	688(%rdi,%r9,4){1to16}, %zmm12, %zmm6
	vfmadd231ps	816(%rdi,%r9,4){1to16}, %zmm12, %zmm7
	vfmadd231ps	944(%rdi,%r9,4){1to16}, %zmm12, %zmm8
	vfmadd231ps	52(%rdi,%r9,4){1to16}, %zmm11, %zmm1
	vfmadd231ps	180(%rdi,%r9,4){1to16}, %zmm11, %zmm2
	vfmadd231ps	308(%rdi,%r9,4){1to16}, %zmm11, %zmm3
	vfmadd231ps	436(%rdi,%r9,4){1to16}, %zmm11, %zmm4
	vfmadd231ps	564(%rdi,%r9,4){1to16}, %zmm11, %zmm5
	vfmadd231ps	692(%rdi,%r9,4){1to16}, %zmm11, %zmm6
	vfmadd231ps	820(%rdi,%r9,4){1to16}, %zmm11, %zmm7
	vfmadd231ps	948(%rdi,%r9,4){1to16}, %zmm11, %zmm8
	vfmadd231ps	56(%rdi,%r9,4){1to16}, %zmm10, %zmm1
	vfmadd231ps	184(%rdi,%r9,4){1to16}, %zmm10, %zmm2
	vfmadd231ps	312(%rdi,%r9,4){1to16}, %zmm10, %zmm3
	vfmadd231ps	440(%rdi,%r9,4){1to16}, %zmm10, %zmm4
	vfmadd231ps	568(%rdi,%r9,4){1to16}, %zmm10, %zmm5
	vfmadd231ps	696(%rdi,%r9,4){1to16}, %zmm10, %zmm6
	vfmadd231ps	824(%rdi,%r9,4){1to16}, %zmm10, %zmm7
	vfmadd231ps	952(%rdi,%r9,4){1to16}, %zmm10, %zmm8
	vfmadd231ps	60(%rdi,%r9,4){1to16}, %zmm9, %zmm1
	vfmadd231ps	188(%rdi,%r9,4){1to16}, %zmm9, %zmm2
	vfmadd231ps	316(%rdi,%r9,4){1to16}, %zmm9, %zmm3
	vfmadd231ps	444(%rdi,%r9,4){1to16}, %zmm9, %zmm4
	vfmadd231ps	572(%rdi,%r9,4){1to16}, %zmm9, %zmm5
	vfmadd231ps	700(%rdi,%r9,4){1to16}, %zmm9, %zmm6
	vfmadd231ps	828(%rdi,%r9,4){1to16}, %zmm9, %zmm7
	vfmadd231ps	956(%rdi,%r9,4){1to16}, %zmm9, %zmm8
	movl	$16, %r9d
	testb	$1, %r10b
	jne	.LBB21_2
	.loc	22 25 8 is_stmt 1
	leaq	32(%rdx), %r10
	leaq	64(%rdx), %r11
	movq	%r15, %r9
	leaq	128(%rdx), %rbx
	leaq	160(%rdx), %r14
	leaq	192(%rdx), %rsi
	movq	%r15, %r13
	movq	%r15, %r8
	orq	%rdx, %r8
	.loc	22 27 10
	vaddps	%zmm0, %zmm1, %zmm1
	vaddps	%zmm0, %zmm2, %zmm2
	vaddps	%zmm0, %zmm3, %zmm3
	vaddps	%zmm0, %zmm4, %zmm4
	vaddps	%zmm0, %zmm5, %zmm5
	vaddps	%zmm0, %zmm6, %zmm6
	vaddps	%zmm0, %zmm7, %zmm7
	vaddps	%zmm0, %zmm8, %zmm8
	.loc	22 25 8
	orq	%r10, %r9
	movq	%r15, %r10
	orq	%r11, %r10
	leaq	96(%rdx), %r11
	.loc	22 28 10
	vaddps	(%rax,%r8,4), %zmm1, %zmm1
	.loc	22 25 8
	orq	%r11, %r13
	movq	%r15, %r11
	orq	%rbx, %r11
	movq	%r15, %rbx
	orq	%r14, %rbx
	movq	%r15, %r14
	orq	%rsi, %r14
	leaq	224(%rdx), %rsi
	.loc	22 28 10
	vaddps	(%rax,%r9,4), %zmm2, %zmm2
	vaddps	(%rax,%r10,4), %zmm3, %zmm3
	.loc	22 25 8
	orq	%rsi, %r15
	.loc	22 28 10
	vaddps	(%rax,%r13,4), %zmm4, %zmm4
	vaddps	(%rax,%r11,4), %zmm5, %zmm5
	vaddps	(%rax,%rbx,4), %zmm6, %zmm6
	vaddps	(%rax,%r14,4), %zmm7, %zmm7
	vaddps	(%rax,%r15,4), %zmm8, %zmm8
	.loc	22 24 8
	vmovaps	%zmm1, 2048(%rcx,%r8,4)
	vmovaps	%zmm2, 2048(%rcx,%r9,4)
	vmovaps	%zmm3, 2048(%rcx,%r10,4)
	vmovaps	%zmm4, 2048(%rcx,%r13,4)
	vmovaps	%zmm5, 2048(%rcx,%r11,4)
	vmovaps	%zmm6, 2048(%rcx,%rbx,4)
	vmovaps	%zmm7, 2048(%rcx,%r14,4)
	vmovaps	%zmm8, 2048(%rcx,%r15,4)
	movl	$16, %r15d
	testb	$1, %r12b
	movl	$0, %r12d
	jne	.LBB21_1
	.loc	22 32 8
	xorl	%eax, %eax
	.loc	22 32 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp74:
.Lfunc_end21:
	.size	main$async_dispatch_42_batch_matmul_1x16x32x32_f32, .Lfunc_end21-main$async_dispatch_42_batch_matmul_1x16x32x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI22_0:
	.long	0x3d000000
.LCPI22_1:
	.long	0x2b8cbccc
.LCPI22_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_44_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_44_reduction_16x32_f32,@function
main$async_dispatch_44_reduction_16x32_f32:
.Lfunc_begin22:
	.file	23 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_44.mlir"
	.loc	23 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp75:
	.loc	23 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	23 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	23 16 8
	movq	(%rcx), %rax
	.loc	23 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	addq	%rax, %rsi
	.loc	23 0 8 is_stmt 0
.Ltmp76:
	.p2align	4
.LBB22_1:
	.loc	23 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	23 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	23 22 8
	testb	$1, %dil
	jne	.LBB22_1
	.loc	23 30 10
	vmulps	.LCPI22_0(%rip){1to4}, %xmm0, %xmm0
	.loc	23 32 10
	vbroadcastss	.LCPI22_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	23 31 10
	vaddps	.LCPI22_1(%rip){1to4}, %xmm0, %xmm0
	.loc	23 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	23 0 10 is_stmt 0
.Ltmp77:
	.p2align	4
.LBB22_3:
	.loc	23 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	23 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	23 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	23 28 8
	vmovaps	%zmm4, 2048(%rcx,%rsi,4)
	vmovaps	%zmm5, 2176(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB22_3
	.loc	23 39 8
	xorl	%eax, %eax
	.loc	23 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp78:
.Lfunc_end22:
	.size	main$async_dispatch_44_reduction_16x32_f32, .Lfunc_end22-main$async_dispatch_44_reduction_16x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI23_0:
	.long	0x3fb504f3
.LCPI23_1:
	.long	0x80000000
.LCPI23_2:
	.long	0x3f4ccccd
.LCPI23_3:
	.long	0x3f905225
.LCPI23_4:
	.long	0x3f906eba
.LCPI23_5:
	.long	0xbea7bc1b
.LCPI23_6:
	.long	0xbeed51af
.LCPI23_7:
	.long	0xbebabcc4
.LCPI23_8:
	.long	0xbf05e48b
.LCPI23_9:
	.long	0x3ee590a2
.LCPI23_10:
	.long	0x3f04ec44
.LCPI23_11:
	.long	0x3df27f94
.LCPI23_12:
	.long	0x3e56c688
.LCPI23_13:
	.long	0xbdb4eee3
.LCPI23_14:
	.long	0xbe06f8ee
.LCPI23_15:
	.long	0x3d17d100
.LCPI23_16:
	.long	0x3cd3794f
.LCPI23_17:
	.long	0x3d6a78fa
.LCPI23_18:
	.long	0x3d9782a4
.LCPI23_19:
	.long	0x40000000
.LCPI23_20:
	.long	0xbb58546d
.LCPI23_21:
	.long	0x3b66a96a
.LCPI23_22:
	.long	0xc003e25f
.LCPI23_23:
	.long	0xbab94d1e
.LCPI23_24:
	.long	0x3fd0437b
.LCPI23_25:
	.long	0x3984e118
.LCPI23_26:
	.long	0xbf15590a
.LCPI23_27:
	.long	0xb78f7c49
.LCPI23_28:
	.long	0x3da853b3
.LCPI23_29:
	.long	0x3f800000
.LCPI23_30:
	.long	0x40700000
.LCPI23_31:
	.long	0x3f000000
	.section	".text.main$async_dispatch_45_batch_matmul_1x16x37x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_45_batch_matmul_1x16x37x32_f32,@function
main$async_dispatch_45_batch_matmul_1x16x37x32_f32:
.Lfunc_begin23:
	.file	24 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_45.mlir"
	.loc	24 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp79:
	.loc	24 17 8 prologue_end
	movq	32(%rsi), %rcx
	movl	$68096, %eax
	vbroadcastss	.LCPI23_15(%rip), %ymm10
	vbroadcastss	.LCPI23_17(%rip), %ymm11
	vbroadcastss	.LCPI23_19(%rip), %ymm12
	vbroadcastss	.LCPI23_20(%rip), %ymm13
	vbroadcastss	.LCPI23_21(%rip), %ymm14
	vbroadcastss	.LCPI23_22(%rip), %ymm15
	vbroadcastss	.LCPI23_23(%rip), %ymm16
	vbroadcastss	.LCPI23_24(%rip), %ymm17
	vbroadcastss	.LCPI23_25(%rip), %ymm18
	vbroadcastss	.LCPI23_26(%rip), %ymm19
	vbroadcastss	.LCPI23_27(%rip), %ymm20
	vbroadcastss	.LCPI23_28(%rip), %ymm21
	vbroadcastss	.LCPI23_29(%rip), %ymm22
	vbroadcastss	.LCPI23_30(%rip), %ymm23
	vbroadcastss	.LCPI23_31(%rip), %ymm24
	vbroadcastss	.LCPI23_1(%rip), %ymm2
	vxorps	%xmm0, %xmm0, %xmm0
	.loc	24 18 8
	addq	8(%rcx), %rax
	.loc	24 17 8
	movq	(%rcx), %rsi
	.loc	24 19 8
	movq	16(%rcx), %rdi
	.loc	24 24 8
	movl	(%rdx), %ecx
	imulq	$1184, %rcx, %rdx
	shlq	$10, %rcx
	leaq	2048(%rsi,%rcx), %rcx
	xorl	%esi, %esi
	leaq	4096(%rdi,%rdx), %rdx
	.loc	24 0 8 is_stmt 0
.Ltmp80:
	.p2align	4
.LBB23_1:
	.loc	24 24 8
	leaq	(%rax,%rsi,4), %rdi
	movb	$1, %r8b
	vxorps	%xmm25, %xmm25, %xmm25
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r9d, %r9d
	.loc	24 0 8
.Ltmp81:
	.p2align	4
.LBB23_2:
	.loc	24 24 8
	imulq	$148, %r9, %r10
	vmovss	384(%rcx,%r9,4), %xmm5
	vmovss	512(%rcx,%r9,4), %xmm6
	vmovss	256(%rcx,%r9,4), %xmm8
	vextractf128	$1, %ymm1, %xmm9
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vshufpd	$1, %xmm1, %xmm1, %xmm27
	vmovss	640(%rcx,%r9,4), %xmm7
	vbroadcastss	(%rdi,%r10), %xmm31
	movq	%r9, %r10
	orq	$1, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	896(%rcx,%r9,4), %xmm31, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$2, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	900(%rcx,%r9,4), %xmm29, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$3, %r10
	vfmadd231ps	%ymm5, %ymm31, %ymm4
	vbroadcastss	%xmm9, %ymm5
	vfmadd231ps	%ymm8, %ymm31, %ymm27
	vmovss	768(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vfmadd231ss	904(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm6, %ymm31, %ymm5
	vmovshdup	%xmm9, %xmm6
	vmovss	260(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm7, %ymm31, %ymm6
	vpermpd	$255, %ymm1, %ymm7
	vbroadcastss	(%rdi,%r10), %xmm30
	movq	%r9, %r10
	orq	$4, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	908(%rcx,%r9,4), %xmm30, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$5, %r10
	vfmadd231ps	%ymm8, %ymm31, %ymm7
	vmovss	(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vinsertps	$16, 128(%rcx,%r9,4), %xmm8, %xmm8
	vfmadd231ss	912(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm27
	vmovss	264(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$6, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	916(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd213ps	%ymm1, %ymm31, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$7, %r10
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	388(%rcx,%r9,4), %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	920(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm4
	vmovss	516(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm5
	vmovss	392(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	520(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	644(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm6
	vmovss	648(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	772(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm7
	vmovss	776(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	4(%rcx,%r9,4), %xmm9
	vinsertps	$16, 132(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm8
	vmovss	8(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$8, %r10
	vinsertps	$16, 136(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	924(%rcx,%r9,4), %xmm29, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	268(%rcx,%r9,4), %xmm3
	vmovss	272(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm27
	vmovss	396(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm27
	vmovss	276(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm4
	vmovss	524(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm27
	vmovss	400(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm5
	vmovss	652(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm4
	vmovss	528(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm6
	vmovss	780(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm5
	vmovss	404(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm7
	vmovss	12(%rcx,%r9,4), %xmm3
	vinsertps	$16, 140(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm4
	vmovss	532(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$9, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	928(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm5
	vmovss	656(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm6
	vmovss	660(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm6
	vmovss	784(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm7
	vmovss	788(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm7
	vmovss	16(%rcx,%r9,4), %xmm9
	vinsertps	$16, 144(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm8
	vmovss	20(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$10, %r10
	vinsertps	$16, 148(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	932(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm8
	vmovss	280(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$11, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	936(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm9, %ymm1, %ymm27
	vmovss	408(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm4
	vmovss	536(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm5
	vmovss	664(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm6
	vmovss	792(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm7
	vmovss	24(%rcx,%r9,4), %xmm9
	vinsertps	$16, 152(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm8
	vmovss	284(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm9
	movq	%r9, %r10
	orq	$12, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	940(%rcx,%r9,4), %xmm9, %xmm25
	vfmadd231ps	%ymm1, %ymm29, %ymm27
	vmovss	288(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm27
	vmovss	412(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm4
	vmovss	540(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm5
	vmovss	416(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm4
	vmovss	544(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm5
	vmovss	668(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm6
	vmovss	672(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm6
	vmovss	796(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm7
	vmovss	800(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm7
	vmovss	28(%rcx,%r9,4), %xmm1
	vinsertps	$16, 156(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm8
	vmovss	32(%rcx,%r9,4), %xmm1
	vinsertps	$16, 160(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm8
	vmovss	292(%rcx,%r9,4), %xmm1
	vmovss	296(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm27
	vmovss	420(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm27
	vmovss	300(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm4
	vmovss	548(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm27
	vmovss	424(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm5
	vmovss	676(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm4
	vmovss	552(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm6
	vmovss	804(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm5
	vmovss	428(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm7
	vmovss	36(%rcx,%r9,4), %xmm1
	vinsertps	$16, 164(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm4
	vmovss	556(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$13, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	944(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm5
	vmovss	680(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm6
	vmovss	684(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm6
	vmovss	808(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm7
	vmovss	812(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm7
	vmovss	40(%rcx,%r9,4), %xmm3
	vinsertps	$16, 168(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm8
	vmovss	44(%rcx,%r9,4), %xmm3
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$14, %r10
	vinsertps	$16, 172(%rcx,%r9,4), %xmm3, %xmm3
	imulq	$148, %r10, %r10
	vfmadd231ss	948(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm8
	vmovss	304(%rcx,%r9,4), %xmm3
	vmovss	312(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	432(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	560(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	688(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	816(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	48(%rcx,%r9,4), %xmm3
	vinsertps	$16, 176(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vmovss	308(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$15, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	952(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm1, %ymm26, %ymm27
	vmovss	436(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	440(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm4
	vmovss	564(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	568(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm5
	vmovss	692(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	696(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm6
	vmovss	820(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	824(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm7
	vmovss	52(%rcx,%r9,4), %xmm1
	vinsertps	$16, 180(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	56(%rcx,%r9,4), %xmm9
	vinsertps	$16, 184(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movl	%r8d, %r10d
	xorl	%r8d, %r8d
	vfmadd231ss	956(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	316(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	444(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	572(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	700(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	828(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	60(%rcx,%r9,4), %xmm3
	vinsertps	$16, 188(%rcx,%r9,4), %xmm3, %xmm3
	movl	$16, %r9d
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vbroadcastss	%xmm6, %ymm3
	vmovlhps	%xmm27, %xmm8, %xmm1
	vinsertps	$48, %xmm4, %xmm1, %xmm1
	vinsertf128	$1, %xmm5, %ymm1, %ymm1
	vblendps	$32, %ymm3, %ymm1, %ymm1
	vbroadcastsd	%xmm7, %ymm3
	vblendps	$192, %ymm3, %ymm1, %ymm1
	vbroadcastss	%xmm25, %ymm3
	vblendps	$128, %ymm3, %ymm1, %ymm1
	testb	$1, %r10b
	jne	.LBB23_2
	.loc	24 27 10 is_stmt 1
	vaddps	%ymm0, %ymm1, %ymm1
	.loc	24 28 10
	vdivps	.LCPI23_0(%rip){1to8}, %ymm1, %ymm3
	.loc	24 29 10
	vbroadcastss	.LCPI23_5(%rip), %ymm5
	vbroadcastss	.LCPI23_7(%rip), %ymm6
	vbroadcastss	.LCPI23_9(%rip), %ymm7
	vbroadcastss	.LCPI23_11(%rip), %ymm8
	vbroadcastss	.LCPI23_13(%rip), %ymm9
	vxorps	%ymm2, %ymm3, %ymm4
	vcmpltps	%ymm4, %ymm3, %k1
	vmaxps	%ymm3, %ymm4, %ymm3
	vbroadcastss	.LCPI23_3(%rip), %ymm4
	vcmpltps	.LCPI23_2(%rip){1to8}, %ymm3, %k2
	vblendmps	.LCPI23_4(%rip){1to8}, %ymm4, %ymm4 {%k2}
	vblendmps	.LCPI23_6(%rip){1to8}, %ymm5, %ymm5 {%k2}
	vblendmps	.LCPI23_8(%rip){1to8}, %ymm6, %ymm6 {%k2}
	vblendmps	.LCPI23_10(%rip){1to8}, %ymm7, %ymm7 {%k2}
	vblendmps	.LCPI23_12(%rip){1to8}, %ymm8, %ymm8 {%k2}
	vblendmps	.LCPI23_14(%rip){1to8}, %ymm9, %ymm9 {%k2}
	vblendmps	.LCPI23_16(%rip){1to8}, %ymm10, %ymm25 {%k2}
	vblendmps	.LCPI23_18(%rip){1to8}, %ymm11, %ymm26 {%k2}
	vcmpltps	%ymm12, %ymm3, %k2
	vcmpngeps	%ymm23, %ymm3, %k3
	vblendmps	%ymm8, %ymm18, %ymm8 {%k2}
	vblendmps	%ymm25, %ymm20, %ymm25 {%k2}
	vblendmps	%ymm6, %ymm16, %ymm6 {%k2}
	vblendmps	%ymm4, %ymm14, %ymm4 {%k2}
	vfmadd213ps	%ymm8, %ymm3, %ymm25
	vfmadd213ps	%ymm6, %ymm3, %ymm25
	vblendmps	%ymm26, %ymm21, %ymm6 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm0, %ymm13, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm9, %ymm19, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm7, %ymm17, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm5, %ymm15, %ymm4 {%k2}
	vmovaps	%ymm22, %ymm5
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vfmadd213ps	%ymm22, %ymm3, %ymm6
	vblendmps	%ymm0, %ymm22, %ymm3 {%k2}
	vdivps	%ymm6, %ymm25, %ymm4
	vaddps	%ymm4, %ymm3, %ymm5 {%k3}
	vxorps	%ymm2, %ymm5, %ymm5 {%k1}
	.loc	24 30 10
	vaddps	%ymm22, %ymm5, %ymm3
	.loc	24 31 10
	vmulps	%ymm24, %ymm3, %ymm3
	.loc	24 32 10
	vmulps	%ymm3, %ymm1, %ymm1
	.loc	24 24 8
	vmovss	%xmm1, (%rdx,%rsi,4)
	vextractps	$1, %xmm1, 148(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 296(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 444(%rdx,%rsi,4)
	vextracti128	$1, %ymm1, %xmm1
	vmovd	%xmm1, 592(%rdx,%rsi,4)
	vextractps	$1, %xmm1, 740(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 888(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 1036(%rdx,%rsi,4)
	incq	%rsi
	cmpq	$37, %rsi
	jne	.LBB23_1
	.loc	24 36 8
	xorl	%eax, %eax
	.loc	24 36 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp82:
.Lfunc_end23:
	.size	main$async_dispatch_45_batch_matmul_1x16x37x32_f32, .Lfunc_end23-main$async_dispatch_45_batch_matmul_1x16x37x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_46_batch_matmul_1x16x32x37_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_46_batch_matmul_1x16x32x37_f32,@function
main$async_dispatch_46_batch_matmul_1x16x32x37_f32:
.Lfunc_begin24:
	.file	25 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_46.mlir"
	.loc	25 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp83:
	.loc	25 15 8 prologue_end
	movq	32(%rsi), %r8
	.loc	25 24 8
	movl	(%rdx), %ecx
	movl	$72832, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm9, %xmm9, %xmm9
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm10, %xmm10, %xmm10
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm11, %xmm11, %xmm11
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm12, %xmm12, %xmm12
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm13, %xmm13, %xmm13
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm14, %xmm14, %xmm14
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm15, %xmm15, %xmm15
	.loc	25 15 8
	movq	(%r8), %rsi
	imulq	$1184, %rcx, %rdx
	.loc	25 18 8
	movq	16(%r8), %rax
	.loc	25 16 8
	addq	8(%r8), %rdi
	movq	$-148, %r8
	leaq	5132(%rsi,%rdx), %rdx
	.loc	25 0 8 is_stmt 0
.Ltmp84:
	.p2align	4
.LBB24_1:
	vbroadcastss	-740(%rdx,%r8), %zmm19
	.loc	25 24 8 is_stmt 1
	vmovaps	(%rdi), %zmm16
	vmovaps	64(%rdi), %zmm17
	vbroadcastss	-592(%rdx,%r8), %zmm20
	vbroadcastss	-888(%rdx,%r8), %zmm18
	subq	$-128, %rdi
	vfmadd231ps	%zmm16, %zmm19, %zmm2
	vfmadd231ps	%zmm19, %zmm17, %zmm9
	vbroadcastss	-444(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm3
	vfmadd231ps	%zmm20, %zmm17, %zmm10
	vbroadcastss	-296(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm17, %zmm18, %zmm0
	vfmadd231ps	%zmm18, %zmm16, %zmm1
	vfmadd231ps	%zmm16, %zmm19, %zmm4
	vfmadd231ps	%zmm19, %zmm17, %zmm11
	vbroadcastss	-148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm5
	vfmadd231ps	%zmm20, %zmm17, %zmm12
	vbroadcastss	(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm16, %zmm19, %zmm6
	vfmadd231ps	%zmm19, %zmm17, %zmm13
	vbroadcastss	148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm7
	vfmadd231ps	%zmm20, %zmm17, %zmm14
	addq	$4, %r8
	vfmadd231ps	%zmm16, %zmm19, %zmm8
	vfmadd231ps	%zmm17, %zmm19, %zmm15
	jne	.LBB24_1
	.loc	25 25 8
	shlq	$10, %rcx
	.loc	25 27 10
	vxorps	%xmm16, %xmm16, %xmm16
	vaddps	%zmm16, %zmm0, %zmm0
	vaddps	%zmm16, %zmm1, %zmm1
	vaddps	%zmm16, %zmm9, %zmm9
	vaddps	%zmm16, %zmm2, %zmm2
	vaddps	%zmm16, %zmm10, %zmm10
	vaddps	%zmm16, %zmm3, %zmm3
	vaddps	%zmm16, %zmm11, %zmm11
	vaddps	%zmm16, %zmm4, %zmm4
	vaddps	%zmm16, %zmm12, %zmm12
	vaddps	%zmm16, %zmm5, %zmm5
	vaddps	%zmm16, %zmm13, %zmm13
	vaddps	%zmm16, %zmm6, %zmm6
	vaddps	%zmm16, %zmm14, %zmm14
	vaddps	%zmm16, %zmm7, %zmm7
	vaddps	%zmm16, %zmm15, %zmm15
	vaddps	%zmm16, %zmm8, %zmm8
	.loc	25 28 10
	vaddps	2048(%rsi,%rcx), %zmm1, %zmm1
	vaddps	2112(%rsi,%rcx), %zmm0, %zmm0
	vaddps	2176(%rsi,%rcx), %zmm2, %zmm2
	vaddps	2240(%rsi,%rcx), %zmm9, %zmm9
	vaddps	2304(%rsi,%rcx), %zmm3, %zmm3
	vaddps	2368(%rsi,%rcx), %zmm10, %zmm10
	vaddps	2432(%rsi,%rcx), %zmm4, %zmm4
	vaddps	2496(%rsi,%rcx), %zmm11, %zmm11
	vaddps	2560(%rsi,%rcx), %zmm5, %zmm5
	vaddps	2624(%rsi,%rcx), %zmm12, %zmm12
	vaddps	2688(%rsi,%rcx), %zmm6, %zmm6
	vaddps	2752(%rsi,%rcx), %zmm13, %zmm13
	vaddps	2816(%rsi,%rcx), %zmm7, %zmm7
	vaddps	2880(%rsi,%rcx), %zmm14, %zmm14
	vaddps	2944(%rsi,%rcx), %zmm8, %zmm8
	vaddps	3008(%rsi,%rcx), %zmm15, %zmm15
	vmovaps	%zmm0, 64(%rax,%rcx)
	vmovaps	%zmm1, (%rax,%rcx)
	vmovaps	%zmm9, 192(%rax,%rcx)
	vmovaps	%zmm2, 128(%rax,%rcx)
	vmovaps	%zmm10, 320(%rax,%rcx)
	vmovaps	%zmm3, 256(%rax,%rcx)
	vmovaps	%zmm11, 448(%rax,%rcx)
	vmovaps	%zmm4, 384(%rax,%rcx)
	vmovaps	%zmm12, 576(%rax,%rcx)
	vmovaps	%zmm5, 512(%rax,%rcx)
	vmovaps	%zmm13, 704(%rax,%rcx)
	vmovaps	%zmm6, 640(%rax,%rcx)
	vmovaps	%zmm14, 832(%rax,%rcx)
	vmovaps	%zmm7, 768(%rax,%rcx)
	vmovaps	%zmm15, 960(%rax,%rcx)
	vmovaps	%zmm8, 896(%rax,%rcx)
	.loc	25 32 8
	xorl	%eax, %eax
	.loc	25 32 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp85:
.Lfunc_end24:
	.size	main$async_dispatch_46_batch_matmul_1x16x32x37_f32, .Lfunc_end24-main$async_dispatch_46_batch_matmul_1x16x32x37_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI25_0:
	.long	0x3d000000
.LCPI25_1:
	.long	0x2b8cbccc
.LCPI25_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_48_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_48_reduction_16x32_f32,@function
main$async_dispatch_48_reduction_16x32_f32:
.Lfunc_begin25:
	.file	26 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_48.mlir"
	.loc	26 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp86:
	.loc	26 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	26 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	26 16 8
	movq	(%rcx), %rax
	.loc	26 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	leaq	2048(%rax,%rsi), %rsi
	.loc	26 16 8
	addq	$2048, %rax
	.loc	26 0 8 is_stmt 0
.Ltmp87:
	.p2align	4
.LBB25_1:
	.loc	26 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	26 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	26 22 8
	testb	$1, %dil
	jne	.LBB25_1
	.loc	26 30 10
	vmulps	.LCPI25_0(%rip){1to4}, %xmm0, %xmm0
	.loc	26 32 10
	vbroadcastss	.LCPI25_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	26 31 10
	vaddps	.LCPI25_1(%rip){1to4}, %xmm0, %xmm0
	.loc	26 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	26 0 10 is_stmt 0
.Ltmp88:
	.p2align	4
.LBB25_3:
	.loc	26 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	26 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	26 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	26 28 8
	vmovaps	%zmm4, (%rcx,%rsi,4)
	vmovaps	%zmm5, 128(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB25_3
	.loc	26 39 8
	xorl	%eax, %eax
	.loc	26 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp89:
.Lfunc_end25:
	.size	main$async_dispatch_48_reduction_16x32_f32, .Lfunc_end25-main$async_dispatch_48_reduction_16x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_56_batch_matmul_1x16x32x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_56_batch_matmul_1x16x32x32_f32,@function
main$async_dispatch_56_batch_matmul_1x16x32x32_f32:
.Lfunc_begin26:
	.file	27 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_56.mlir"
	.loc	27 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp90:
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
	.loc	27 15 8 prologue_end
	movq	32(%rsi), %rdi
	movl	$89856, %esi
	movb	$1, %r12b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r15d, %r15d
	.loc	27 16 8
	addq	8(%rdi), %rsi
	.loc	27 15 8
	movq	(%rdi), %rax
	.loc	27 18 8
	movq	16(%rdi), %rcx
	.loc	27 24 8
	movl	(%rdx), %edi
	movq	%rdi, %rdx
	shlq	$10, %rdi
	shlq	$8, %rdx
	movq	%rsi, -48(%rbp)
	leaq	8192(%rax,%rdi), %rdi
	.loc	27 0 8 is_stmt 0
.Ltmp91:
	.p2align	4
.LBB26_1:
	movq	-48(%rbp), %rsi
	movb	$1, %r13b
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%r9d, %r9d
	.loc	27 24 8
	leaq	(%rsi,%r15,4), %r8
	.loc	27 0 8
.Ltmp92:
	.p2align	4
.LBB26_2:
	movl	%r13d, %r10d
	.loc	27 24 8
	movq	%r9, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm24
	movq	%r9, %r13
	orq	$1, %r13
	vfmadd231ps	(%rdi,%r9,4){1to16}, %zmm24, %zmm1
	vfmadd231ps	128(%rdi,%r9,4){1to16}, %zmm24, %zmm2
	vfmadd231ps	256(%rdi,%r9,4){1to16}, %zmm24, %zmm3
	vfmadd231ps	384(%rdi,%r9,4){1to16}, %zmm24, %zmm4
	vfmadd231ps	512(%rdi,%r9,4){1to16}, %zmm24, %zmm5
	vfmadd231ps	640(%rdi,%r9,4){1to16}, %zmm24, %zmm6
	vfmadd231ps	768(%rdi,%r9,4){1to16}, %zmm24, %zmm7
	vfmadd231ps	896(%rdi,%r9,4){1to16}, %zmm24, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm23
	movq	%r9, %r13
	orq	$2, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm22
	movq	%r9, %r13
	orq	$3, %r13
	vfmadd231ps	4(%rdi,%r9,4){1to16}, %zmm23, %zmm1
	vfmadd231ps	132(%rdi,%r9,4){1to16}, %zmm23, %zmm2
	vfmadd231ps	260(%rdi,%r9,4){1to16}, %zmm23, %zmm3
	vfmadd231ps	388(%rdi,%r9,4){1to16}, %zmm23, %zmm4
	vfmadd231ps	516(%rdi,%r9,4){1to16}, %zmm23, %zmm5
	vfmadd231ps	644(%rdi,%r9,4){1to16}, %zmm23, %zmm6
	vfmadd231ps	772(%rdi,%r9,4){1to16}, %zmm23, %zmm7
	vfmadd231ps	900(%rdi,%r9,4){1to16}, %zmm23, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm21
	movq	%r9, %r13
	orq	$4, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm20
	movq	%r9, %r13
	orq	$5, %r13
	vfmadd231ps	8(%rdi,%r9,4){1to16}, %zmm22, %zmm1
	vfmadd231ps	136(%rdi,%r9,4){1to16}, %zmm22, %zmm2
	vfmadd231ps	264(%rdi,%r9,4){1to16}, %zmm22, %zmm3
	vfmadd231ps	392(%rdi,%r9,4){1to16}, %zmm22, %zmm4
	vfmadd231ps	520(%rdi,%r9,4){1to16}, %zmm22, %zmm5
	vfmadd231ps	648(%rdi,%r9,4){1to16}, %zmm22, %zmm6
	vfmadd231ps	776(%rdi,%r9,4){1to16}, %zmm22, %zmm7
	vfmadd231ps	904(%rdi,%r9,4){1to16}, %zmm22, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm19
	movq	%r9, %r13
	orq	$6, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm18
	movq	%r9, %r13
	orq	$7, %r13
	vfmadd231ps	12(%rdi,%r9,4){1to16}, %zmm21, %zmm1
	vfmadd231ps	140(%rdi,%r9,4){1to16}, %zmm21, %zmm2
	vfmadd231ps	268(%rdi,%r9,4){1to16}, %zmm21, %zmm3
	vfmadd231ps	396(%rdi,%r9,4){1to16}, %zmm21, %zmm4
	vfmadd231ps	524(%rdi,%r9,4){1to16}, %zmm21, %zmm5
	vfmadd231ps	652(%rdi,%r9,4){1to16}, %zmm21, %zmm6
	vfmadd231ps	780(%rdi,%r9,4){1to16}, %zmm21, %zmm7
	vfmadd231ps	908(%rdi,%r9,4){1to16}, %zmm21, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm17
	movq	%r9, %r13
	orq	$8, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm16
	movq	%r9, %r13
	orq	$9, %r13
	vfmadd231ps	16(%rdi,%r9,4){1to16}, %zmm20, %zmm1
	vfmadd231ps	144(%rdi,%r9,4){1to16}, %zmm20, %zmm2
	vfmadd231ps	272(%rdi,%r9,4){1to16}, %zmm20, %zmm3
	vfmadd231ps	400(%rdi,%r9,4){1to16}, %zmm20, %zmm4
	vfmadd231ps	528(%rdi,%r9,4){1to16}, %zmm20, %zmm5
	vfmadd231ps	656(%rdi,%r9,4){1to16}, %zmm20, %zmm6
	vfmadd231ps	784(%rdi,%r9,4){1to16}, %zmm20, %zmm7
	vfmadd231ps	912(%rdi,%r9,4){1to16}, %zmm20, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm15
	movq	%r9, %r13
	orq	$10, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm14
	movq	%r9, %r13
	orq	$11, %r13
	vfmadd231ps	20(%rdi,%r9,4){1to16}, %zmm19, %zmm1
	vfmadd231ps	148(%rdi,%r9,4){1to16}, %zmm19, %zmm2
	vfmadd231ps	276(%rdi,%r9,4){1to16}, %zmm19, %zmm3
	vfmadd231ps	404(%rdi,%r9,4){1to16}, %zmm19, %zmm4
	vfmadd231ps	532(%rdi,%r9,4){1to16}, %zmm19, %zmm5
	vfmadd231ps	660(%rdi,%r9,4){1to16}, %zmm19, %zmm6
	vfmadd231ps	788(%rdi,%r9,4){1to16}, %zmm19, %zmm7
	vfmadd231ps	916(%rdi,%r9,4){1to16}, %zmm19, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm13
	movq	%r9, %r13
	orq	$12, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm12
	movq	%r9, %r13
	orq	$13, %r13
	vfmadd231ps	24(%rdi,%r9,4){1to16}, %zmm18, %zmm1
	vfmadd231ps	152(%rdi,%r9,4){1to16}, %zmm18, %zmm2
	vfmadd231ps	280(%rdi,%r9,4){1to16}, %zmm18, %zmm3
	vfmadd231ps	408(%rdi,%r9,4){1to16}, %zmm18, %zmm4
	vfmadd231ps	536(%rdi,%r9,4){1to16}, %zmm18, %zmm5
	vfmadd231ps	664(%rdi,%r9,4){1to16}, %zmm18, %zmm6
	vfmadd231ps	792(%rdi,%r9,4){1to16}, %zmm18, %zmm7
	vfmadd231ps	920(%rdi,%r9,4){1to16}, %zmm18, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm11
	movq	%r9, %r13
	orq	$14, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm10
	movq	%r9, %r13
	orq	$15, %r13
	vfmadd231ps	28(%rdi,%r9,4){1to16}, %zmm17, %zmm1
	vfmadd231ps	156(%rdi,%r9,4){1to16}, %zmm17, %zmm2
	vfmadd231ps	284(%rdi,%r9,4){1to16}, %zmm17, %zmm3
	vfmadd231ps	412(%rdi,%r9,4){1to16}, %zmm17, %zmm4
	vfmadd231ps	540(%rdi,%r9,4){1to16}, %zmm17, %zmm5
	vfmadd231ps	668(%rdi,%r9,4){1to16}, %zmm17, %zmm6
	vfmadd231ps	796(%rdi,%r9,4){1to16}, %zmm17, %zmm7
	vfmadd231ps	924(%rdi,%r9,4){1to16}, %zmm17, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm9
	xorl	%r13d, %r13d
	vfmadd231ps	32(%rdi,%r9,4){1to16}, %zmm16, %zmm1
	vfmadd231ps	160(%rdi,%r9,4){1to16}, %zmm16, %zmm2
	vfmadd231ps	288(%rdi,%r9,4){1to16}, %zmm16, %zmm3
	vfmadd231ps	416(%rdi,%r9,4){1to16}, %zmm16, %zmm4
	vfmadd231ps	544(%rdi,%r9,4){1to16}, %zmm16, %zmm5
	vfmadd231ps	672(%rdi,%r9,4){1to16}, %zmm16, %zmm6
	vfmadd231ps	800(%rdi,%r9,4){1to16}, %zmm16, %zmm7
	vfmadd231ps	928(%rdi,%r9,4){1to16}, %zmm16, %zmm8
	vfmadd231ps	36(%rdi,%r9,4){1to16}, %zmm15, %zmm1
	vfmadd231ps	164(%rdi,%r9,4){1to16}, %zmm15, %zmm2
	vfmadd231ps	292(%rdi,%r9,4){1to16}, %zmm15, %zmm3
	vfmadd231ps	420(%rdi,%r9,4){1to16}, %zmm15, %zmm4
	vfmadd231ps	548(%rdi,%r9,4){1to16}, %zmm15, %zmm5
	vfmadd231ps	676(%rdi,%r9,4){1to16}, %zmm15, %zmm6
	vfmadd231ps	804(%rdi,%r9,4){1to16}, %zmm15, %zmm7
	vfmadd231ps	932(%rdi,%r9,4){1to16}, %zmm15, %zmm8
	vfmadd231ps	40(%rdi,%r9,4){1to16}, %zmm14, %zmm1
	vfmadd231ps	168(%rdi,%r9,4){1to16}, %zmm14, %zmm2
	vfmadd231ps	296(%rdi,%r9,4){1to16}, %zmm14, %zmm3
	vfmadd231ps	424(%rdi,%r9,4){1to16}, %zmm14, %zmm4
	vfmadd231ps	552(%rdi,%r9,4){1to16}, %zmm14, %zmm5
	vfmadd231ps	680(%rdi,%r9,4){1to16}, %zmm14, %zmm6
	vfmadd231ps	808(%rdi,%r9,4){1to16}, %zmm14, %zmm7
	vfmadd231ps	936(%rdi,%r9,4){1to16}, %zmm14, %zmm8
	vfmadd231ps	44(%rdi,%r9,4){1to16}, %zmm13, %zmm1
	vfmadd231ps	172(%rdi,%r9,4){1to16}, %zmm13, %zmm2
	vfmadd231ps	300(%rdi,%r9,4){1to16}, %zmm13, %zmm3
	vfmadd231ps	428(%rdi,%r9,4){1to16}, %zmm13, %zmm4
	vfmadd231ps	556(%rdi,%r9,4){1to16}, %zmm13, %zmm5
	vfmadd231ps	684(%rdi,%r9,4){1to16}, %zmm13, %zmm6
	vfmadd231ps	812(%rdi,%r9,4){1to16}, %zmm13, %zmm7
	vfmadd231ps	940(%rdi,%r9,4){1to16}, %zmm13, %zmm8
	vfmadd231ps	48(%rdi,%r9,4){1to16}, %zmm12, %zmm1
	vfmadd231ps	176(%rdi,%r9,4){1to16}, %zmm12, %zmm2
	vfmadd231ps	304(%rdi,%r9,4){1to16}, %zmm12, %zmm3
	vfmadd231ps	432(%rdi,%r9,4){1to16}, %zmm12, %zmm4
	vfmadd231ps	560(%rdi,%r9,4){1to16}, %zmm12, %zmm5
	vfmadd231ps	688(%rdi,%r9,4){1to16}, %zmm12, %zmm6
	vfmadd231ps	816(%rdi,%r9,4){1to16}, %zmm12, %zmm7
	vfmadd231ps	944(%rdi,%r9,4){1to16}, %zmm12, %zmm8
	vfmadd231ps	52(%rdi,%r9,4){1to16}, %zmm11, %zmm1
	vfmadd231ps	180(%rdi,%r9,4){1to16}, %zmm11, %zmm2
	vfmadd231ps	308(%rdi,%r9,4){1to16}, %zmm11, %zmm3
	vfmadd231ps	436(%rdi,%r9,4){1to16}, %zmm11, %zmm4
	vfmadd231ps	564(%rdi,%r9,4){1to16}, %zmm11, %zmm5
	vfmadd231ps	692(%rdi,%r9,4){1to16}, %zmm11, %zmm6
	vfmadd231ps	820(%rdi,%r9,4){1to16}, %zmm11, %zmm7
	vfmadd231ps	948(%rdi,%r9,4){1to16}, %zmm11, %zmm8
	vfmadd231ps	56(%rdi,%r9,4){1to16}, %zmm10, %zmm1
	vfmadd231ps	184(%rdi,%r9,4){1to16}, %zmm10, %zmm2
	vfmadd231ps	312(%rdi,%r9,4){1to16}, %zmm10, %zmm3
	vfmadd231ps	440(%rdi,%r9,4){1to16}, %zmm10, %zmm4
	vfmadd231ps	568(%rdi,%r9,4){1to16}, %zmm10, %zmm5
	vfmadd231ps	696(%rdi,%r9,4){1to16}, %zmm10, %zmm6
	vfmadd231ps	824(%rdi,%r9,4){1to16}, %zmm10, %zmm7
	vfmadd231ps	952(%rdi,%r9,4){1to16}, %zmm10, %zmm8
	vfmadd231ps	60(%rdi,%r9,4){1to16}, %zmm9, %zmm1
	vfmadd231ps	188(%rdi,%r9,4){1to16}, %zmm9, %zmm2
	vfmadd231ps	316(%rdi,%r9,4){1to16}, %zmm9, %zmm3
	vfmadd231ps	444(%rdi,%r9,4){1to16}, %zmm9, %zmm4
	vfmadd231ps	572(%rdi,%r9,4){1to16}, %zmm9, %zmm5
	vfmadd231ps	700(%rdi,%r9,4){1to16}, %zmm9, %zmm6
	vfmadd231ps	828(%rdi,%r9,4){1to16}, %zmm9, %zmm7
	vfmadd231ps	956(%rdi,%r9,4){1to16}, %zmm9, %zmm8
	movl	$16, %r9d
	testb	$1, %r10b
	jne	.LBB26_2
	.loc	27 25 8 is_stmt 1
	leaq	32(%rdx), %r10
	leaq	64(%rdx), %r11
	movq	%r15, %r9
	leaq	128(%rdx), %rbx
	leaq	160(%rdx), %r14
	leaq	192(%rdx), %rsi
	movq	%r15, %r13
	movq	%r15, %r8
	orq	%rdx, %r8
	.loc	27 27 10
	vaddps	%zmm0, %zmm1, %zmm1
	vaddps	%zmm0, %zmm2, %zmm2
	vaddps	%zmm0, %zmm3, %zmm3
	vaddps	%zmm0, %zmm4, %zmm4
	vaddps	%zmm0, %zmm5, %zmm5
	vaddps	%zmm0, %zmm6, %zmm6
	vaddps	%zmm0, %zmm7, %zmm7
	vaddps	%zmm0, %zmm8, %zmm8
	.loc	27 25 8
	orq	%r10, %r9
	movq	%r15, %r10
	orq	%r11, %r10
	leaq	96(%rdx), %r11
	.loc	27 28 10
	vaddps	(%rax,%r8,4), %zmm1, %zmm1
	.loc	27 25 8
	orq	%r11, %r13
	movq	%r15, %r11
	orq	%rbx, %r11
	movq	%r15, %rbx
	orq	%r14, %rbx
	movq	%r15, %r14
	orq	%rsi, %r14
	leaq	224(%rdx), %rsi
	.loc	27 28 10
	vaddps	(%rax,%r9,4), %zmm2, %zmm2
	vaddps	(%rax,%r10,4), %zmm3, %zmm3
	.loc	27 25 8
	orq	%rsi, %r15
	.loc	27 28 10
	vaddps	(%rax,%r13,4), %zmm4, %zmm4
	vaddps	(%rax,%r11,4), %zmm5, %zmm5
	vaddps	(%rax,%rbx,4), %zmm6, %zmm6
	vaddps	(%rax,%r14,4), %zmm7, %zmm7
	vaddps	(%rax,%r15,4), %zmm8, %zmm8
	.loc	27 24 8
	vmovaps	%zmm1, 2048(%rcx,%r8,4)
	vmovaps	%zmm2, 2048(%rcx,%r9,4)
	vmovaps	%zmm3, 2048(%rcx,%r10,4)
	vmovaps	%zmm4, 2048(%rcx,%r13,4)
	vmovaps	%zmm5, 2048(%rcx,%r11,4)
	vmovaps	%zmm6, 2048(%rcx,%rbx,4)
	vmovaps	%zmm7, 2048(%rcx,%r14,4)
	vmovaps	%zmm8, 2048(%rcx,%r15,4)
	movl	$16, %r15d
	testb	$1, %r12b
	movl	$0, %r12d
	jne	.LBB26_1
	.loc	27 32 8
	xorl	%eax, %eax
	.loc	27 32 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp93:
.Lfunc_end26:
	.size	main$async_dispatch_56_batch_matmul_1x16x32x32_f32, .Lfunc_end26-main$async_dispatch_56_batch_matmul_1x16x32x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI27_0:
	.long	0x3d000000
.LCPI27_1:
	.long	0x2b8cbccc
.LCPI27_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_58_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_58_reduction_16x32_f32,@function
main$async_dispatch_58_reduction_16x32_f32:
.Lfunc_begin27:
	.file	28 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_58.mlir"
	.loc	28 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp94:
	.loc	28 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	28 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	28 16 8
	movq	(%rcx), %rax
	.loc	28 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	addq	%rax, %rsi
	.loc	28 0 8 is_stmt 0
.Ltmp95:
	.p2align	4
.LBB27_1:
	.loc	28 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	28 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	28 22 8
	testb	$1, %dil
	jne	.LBB27_1
	.loc	28 30 10
	vmulps	.LCPI27_0(%rip){1to4}, %xmm0, %xmm0
	.loc	28 32 10
	vbroadcastss	.LCPI27_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	28 31 10
	vaddps	.LCPI27_1(%rip){1to4}, %xmm0, %xmm0
	.loc	28 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	28 0 10 is_stmt 0
.Ltmp96:
	.p2align	4
.LBB27_3:
	.loc	28 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	28 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	28 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	28 28 8
	vmovaps	%zmm4, 2048(%rcx,%rsi,4)
	vmovaps	%zmm5, 2176(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB27_3
	.loc	28 39 8
	xorl	%eax, %eax
	.loc	28 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp97:
.Lfunc_end27:
	.size	main$async_dispatch_58_reduction_16x32_f32, .Lfunc_end27-main$async_dispatch_58_reduction_16x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI28_0:
	.long	0x3fb504f3
.LCPI28_1:
	.long	0x80000000
.LCPI28_2:
	.long	0x3f4ccccd
.LCPI28_3:
	.long	0x3f905225
.LCPI28_4:
	.long	0x3f906eba
.LCPI28_5:
	.long	0xbea7bc1b
.LCPI28_6:
	.long	0xbeed51af
.LCPI28_7:
	.long	0xbebabcc4
.LCPI28_8:
	.long	0xbf05e48b
.LCPI28_9:
	.long	0x3ee590a2
.LCPI28_10:
	.long	0x3f04ec44
.LCPI28_11:
	.long	0x3df27f94
.LCPI28_12:
	.long	0x3e56c688
.LCPI28_13:
	.long	0xbdb4eee3
.LCPI28_14:
	.long	0xbe06f8ee
.LCPI28_15:
	.long	0x3d17d100
.LCPI28_16:
	.long	0x3cd3794f
.LCPI28_17:
	.long	0x3d6a78fa
.LCPI28_18:
	.long	0x3d9782a4
.LCPI28_19:
	.long	0x40000000
.LCPI28_20:
	.long	0xbb58546d
.LCPI28_21:
	.long	0x3b66a96a
.LCPI28_22:
	.long	0xc003e25f
.LCPI28_23:
	.long	0xbab94d1e
.LCPI28_24:
	.long	0x3fd0437b
.LCPI28_25:
	.long	0x3984e118
.LCPI28_26:
	.long	0xbf15590a
.LCPI28_27:
	.long	0xb78f7c49
.LCPI28_28:
	.long	0x3da853b3
.LCPI28_29:
	.long	0x3f800000
.LCPI28_30:
	.long	0x40700000
.LCPI28_31:
	.long	0x3f000000
	.section	".text.main$async_dispatch_59_batch_matmul_1x16x37x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_59_batch_matmul_1x16x37x32_f32,@function
main$async_dispatch_59_batch_matmul_1x16x37x32_f32:
.Lfunc_begin28:
	.file	29 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_59.mlir"
	.loc	29 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp98:
	.loc	29 17 8 prologue_end
	movq	32(%rsi), %rcx
	movl	$93952, %eax
	vbroadcastss	.LCPI28_15(%rip), %ymm10
	vbroadcastss	.LCPI28_17(%rip), %ymm11
	vbroadcastss	.LCPI28_19(%rip), %ymm12
	vbroadcastss	.LCPI28_20(%rip), %ymm13
	vbroadcastss	.LCPI28_21(%rip), %ymm14
	vbroadcastss	.LCPI28_22(%rip), %ymm15
	vbroadcastss	.LCPI28_23(%rip), %ymm16
	vbroadcastss	.LCPI28_24(%rip), %ymm17
	vbroadcastss	.LCPI28_25(%rip), %ymm18
	vbroadcastss	.LCPI28_26(%rip), %ymm19
	vbroadcastss	.LCPI28_27(%rip), %ymm20
	vbroadcastss	.LCPI28_28(%rip), %ymm21
	vbroadcastss	.LCPI28_29(%rip), %ymm22
	vbroadcastss	.LCPI28_30(%rip), %ymm23
	vbroadcastss	.LCPI28_31(%rip), %ymm24
	vbroadcastss	.LCPI28_1(%rip), %ymm2
	vxorps	%xmm0, %xmm0, %xmm0
	.loc	29 18 8
	addq	8(%rcx), %rax
	.loc	29 17 8
	movq	(%rcx), %rsi
	.loc	29 19 8
	movq	16(%rcx), %rdi
	.loc	29 24 8
	movl	(%rdx), %ecx
	imulq	$1184, %rcx, %rdx
	shlq	$10, %rcx
	leaq	2048(%rsi,%rcx), %rcx
	xorl	%esi, %esi
	leaq	4096(%rdi,%rdx), %rdx
	.loc	29 0 8 is_stmt 0
.Ltmp99:
	.p2align	4
.LBB28_1:
	.loc	29 24 8
	leaq	(%rax,%rsi,4), %rdi
	movb	$1, %r8b
	vxorps	%xmm25, %xmm25, %xmm25
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r9d, %r9d
	.loc	29 0 8
.Ltmp100:
	.p2align	4
.LBB28_2:
	.loc	29 24 8
	imulq	$148, %r9, %r10
	vmovss	384(%rcx,%r9,4), %xmm5
	vmovss	512(%rcx,%r9,4), %xmm6
	vmovss	256(%rcx,%r9,4), %xmm8
	vextractf128	$1, %ymm1, %xmm9
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vshufpd	$1, %xmm1, %xmm1, %xmm27
	vmovss	640(%rcx,%r9,4), %xmm7
	vbroadcastss	(%rdi,%r10), %xmm31
	movq	%r9, %r10
	orq	$1, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	896(%rcx,%r9,4), %xmm31, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$2, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	900(%rcx,%r9,4), %xmm29, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$3, %r10
	vfmadd231ps	%ymm5, %ymm31, %ymm4
	vbroadcastss	%xmm9, %ymm5
	vfmadd231ps	%ymm8, %ymm31, %ymm27
	vmovss	768(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vfmadd231ss	904(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm6, %ymm31, %ymm5
	vmovshdup	%xmm9, %xmm6
	vmovss	260(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm7, %ymm31, %ymm6
	vpermpd	$255, %ymm1, %ymm7
	vbroadcastss	(%rdi,%r10), %xmm30
	movq	%r9, %r10
	orq	$4, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	908(%rcx,%r9,4), %xmm30, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$5, %r10
	vfmadd231ps	%ymm8, %ymm31, %ymm7
	vmovss	(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vinsertps	$16, 128(%rcx,%r9,4), %xmm8, %xmm8
	vfmadd231ss	912(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm27
	vmovss	264(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$6, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	916(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd213ps	%ymm1, %ymm31, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$7, %r10
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	388(%rcx,%r9,4), %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	920(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm4
	vmovss	516(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm5
	vmovss	392(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	520(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	644(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm6
	vmovss	648(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	772(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm7
	vmovss	776(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	4(%rcx,%r9,4), %xmm9
	vinsertps	$16, 132(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm8
	vmovss	8(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$8, %r10
	vinsertps	$16, 136(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	924(%rcx,%r9,4), %xmm29, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	268(%rcx,%r9,4), %xmm3
	vmovss	272(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm27
	vmovss	396(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm27
	vmovss	276(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm4
	vmovss	524(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm27
	vmovss	400(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm5
	vmovss	652(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm4
	vmovss	528(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm6
	vmovss	780(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm5
	vmovss	404(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm7
	vmovss	12(%rcx,%r9,4), %xmm3
	vinsertps	$16, 140(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm4
	vmovss	532(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$9, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	928(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm5
	vmovss	656(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm6
	vmovss	660(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm6
	vmovss	784(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm7
	vmovss	788(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm7
	vmovss	16(%rcx,%r9,4), %xmm9
	vinsertps	$16, 144(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm8
	vmovss	20(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$10, %r10
	vinsertps	$16, 148(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	932(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm8
	vmovss	280(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$11, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	936(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm9, %ymm1, %ymm27
	vmovss	408(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm4
	vmovss	536(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm5
	vmovss	664(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm6
	vmovss	792(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm7
	vmovss	24(%rcx,%r9,4), %xmm9
	vinsertps	$16, 152(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm8
	vmovss	284(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm9
	movq	%r9, %r10
	orq	$12, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	940(%rcx,%r9,4), %xmm9, %xmm25
	vfmadd231ps	%ymm1, %ymm29, %ymm27
	vmovss	288(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm27
	vmovss	412(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm4
	vmovss	540(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm5
	vmovss	416(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm4
	vmovss	544(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm5
	vmovss	668(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm6
	vmovss	672(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm6
	vmovss	796(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm7
	vmovss	800(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm7
	vmovss	28(%rcx,%r9,4), %xmm1
	vinsertps	$16, 156(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm8
	vmovss	32(%rcx,%r9,4), %xmm1
	vinsertps	$16, 160(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm8
	vmovss	292(%rcx,%r9,4), %xmm1
	vmovss	296(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm27
	vmovss	420(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm27
	vmovss	300(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm4
	vmovss	548(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm27
	vmovss	424(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm5
	vmovss	676(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm4
	vmovss	552(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm6
	vmovss	804(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm5
	vmovss	428(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm7
	vmovss	36(%rcx,%r9,4), %xmm1
	vinsertps	$16, 164(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm4
	vmovss	556(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$13, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	944(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm5
	vmovss	680(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm6
	vmovss	684(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm6
	vmovss	808(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm7
	vmovss	812(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm7
	vmovss	40(%rcx,%r9,4), %xmm3
	vinsertps	$16, 168(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm8
	vmovss	44(%rcx,%r9,4), %xmm3
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$14, %r10
	vinsertps	$16, 172(%rcx,%r9,4), %xmm3, %xmm3
	imulq	$148, %r10, %r10
	vfmadd231ss	948(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm8
	vmovss	304(%rcx,%r9,4), %xmm3
	vmovss	312(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	432(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	560(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	688(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	816(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	48(%rcx,%r9,4), %xmm3
	vinsertps	$16, 176(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vmovss	308(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$15, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	952(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm1, %ymm26, %ymm27
	vmovss	436(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	440(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm4
	vmovss	564(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	568(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm5
	vmovss	692(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	696(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm6
	vmovss	820(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	824(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm7
	vmovss	52(%rcx,%r9,4), %xmm1
	vinsertps	$16, 180(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	56(%rcx,%r9,4), %xmm9
	vinsertps	$16, 184(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movl	%r8d, %r10d
	xorl	%r8d, %r8d
	vfmadd231ss	956(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	316(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	444(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	572(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	700(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	828(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	60(%rcx,%r9,4), %xmm3
	vinsertps	$16, 188(%rcx,%r9,4), %xmm3, %xmm3
	movl	$16, %r9d
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vbroadcastss	%xmm6, %ymm3
	vmovlhps	%xmm27, %xmm8, %xmm1
	vinsertps	$48, %xmm4, %xmm1, %xmm1
	vinsertf128	$1, %xmm5, %ymm1, %ymm1
	vblendps	$32, %ymm3, %ymm1, %ymm1
	vbroadcastsd	%xmm7, %ymm3
	vblendps	$192, %ymm3, %ymm1, %ymm1
	vbroadcastss	%xmm25, %ymm3
	vblendps	$128, %ymm3, %ymm1, %ymm1
	testb	$1, %r10b
	jne	.LBB28_2
	.loc	29 27 10 is_stmt 1
	vaddps	%ymm0, %ymm1, %ymm1
	.loc	29 28 10
	vdivps	.LCPI28_0(%rip){1to8}, %ymm1, %ymm3
	.loc	29 29 10
	vbroadcastss	.LCPI28_5(%rip), %ymm5
	vbroadcastss	.LCPI28_7(%rip), %ymm6
	vbroadcastss	.LCPI28_9(%rip), %ymm7
	vbroadcastss	.LCPI28_11(%rip), %ymm8
	vbroadcastss	.LCPI28_13(%rip), %ymm9
	vxorps	%ymm2, %ymm3, %ymm4
	vcmpltps	%ymm4, %ymm3, %k1
	vmaxps	%ymm3, %ymm4, %ymm3
	vbroadcastss	.LCPI28_3(%rip), %ymm4
	vcmpltps	.LCPI28_2(%rip){1to8}, %ymm3, %k2
	vblendmps	.LCPI28_4(%rip){1to8}, %ymm4, %ymm4 {%k2}
	vblendmps	.LCPI28_6(%rip){1to8}, %ymm5, %ymm5 {%k2}
	vblendmps	.LCPI28_8(%rip){1to8}, %ymm6, %ymm6 {%k2}
	vblendmps	.LCPI28_10(%rip){1to8}, %ymm7, %ymm7 {%k2}
	vblendmps	.LCPI28_12(%rip){1to8}, %ymm8, %ymm8 {%k2}
	vblendmps	.LCPI28_14(%rip){1to8}, %ymm9, %ymm9 {%k2}
	vblendmps	.LCPI28_16(%rip){1to8}, %ymm10, %ymm25 {%k2}
	vblendmps	.LCPI28_18(%rip){1to8}, %ymm11, %ymm26 {%k2}
	vcmpltps	%ymm12, %ymm3, %k2
	vcmpngeps	%ymm23, %ymm3, %k3
	vblendmps	%ymm8, %ymm18, %ymm8 {%k2}
	vblendmps	%ymm25, %ymm20, %ymm25 {%k2}
	vblendmps	%ymm6, %ymm16, %ymm6 {%k2}
	vblendmps	%ymm4, %ymm14, %ymm4 {%k2}
	vfmadd213ps	%ymm8, %ymm3, %ymm25
	vfmadd213ps	%ymm6, %ymm3, %ymm25
	vblendmps	%ymm26, %ymm21, %ymm6 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm0, %ymm13, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm9, %ymm19, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm7, %ymm17, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm5, %ymm15, %ymm4 {%k2}
	vmovaps	%ymm22, %ymm5
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vfmadd213ps	%ymm22, %ymm3, %ymm6
	vblendmps	%ymm0, %ymm22, %ymm3 {%k2}
	vdivps	%ymm6, %ymm25, %ymm4
	vaddps	%ymm4, %ymm3, %ymm5 {%k3}
	vxorps	%ymm2, %ymm5, %ymm5 {%k1}
	.loc	29 30 10
	vaddps	%ymm22, %ymm5, %ymm3
	.loc	29 31 10
	vmulps	%ymm24, %ymm3, %ymm3
	.loc	29 32 10
	vmulps	%ymm3, %ymm1, %ymm1
	.loc	29 24 8
	vmovss	%xmm1, (%rdx,%rsi,4)
	vextractps	$1, %xmm1, 148(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 296(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 444(%rdx,%rsi,4)
	vextracti128	$1, %ymm1, %xmm1
	vmovd	%xmm1, 592(%rdx,%rsi,4)
	vextractps	$1, %xmm1, 740(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 888(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 1036(%rdx,%rsi,4)
	incq	%rsi
	cmpq	$37, %rsi
	jne	.LBB28_1
	.loc	29 36 8
	xorl	%eax, %eax
	.loc	29 36 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp101:
.Lfunc_end28:
	.size	main$async_dispatch_59_batch_matmul_1x16x37x32_f32, .Lfunc_end28-main$async_dispatch_59_batch_matmul_1x16x37x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_60_batch_matmul_1x16x32x37_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_60_batch_matmul_1x16x32x37_f32,@function
main$async_dispatch_60_batch_matmul_1x16x32x37_f32:
.Lfunc_begin29:
	.file	30 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_60.mlir"
	.loc	30 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp102:
	.loc	30 15 8 prologue_end
	movq	32(%rsi), %r8
	.loc	30 24 8
	movl	(%rdx), %ecx
	movl	$98688, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm9, %xmm9, %xmm9
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm10, %xmm10, %xmm10
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm11, %xmm11, %xmm11
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm12, %xmm12, %xmm12
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm13, %xmm13, %xmm13
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm14, %xmm14, %xmm14
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm15, %xmm15, %xmm15
	.loc	30 15 8
	movq	(%r8), %rsi
	imulq	$1184, %rcx, %rdx
	.loc	30 18 8
	movq	16(%r8), %rax
	.loc	30 16 8
	addq	8(%r8), %rdi
	movq	$-148, %r8
	leaq	5132(%rsi,%rdx), %rdx
	.loc	30 0 8 is_stmt 0
.Ltmp103:
	.p2align	4
.LBB29_1:
	vbroadcastss	-740(%rdx,%r8), %zmm19
	.loc	30 24 8 is_stmt 1
	vmovaps	(%rdi), %zmm16
	vmovaps	64(%rdi), %zmm17
	vbroadcastss	-592(%rdx,%r8), %zmm20
	vbroadcastss	-888(%rdx,%r8), %zmm18
	subq	$-128, %rdi
	vfmadd231ps	%zmm16, %zmm19, %zmm2
	vfmadd231ps	%zmm19, %zmm17, %zmm9
	vbroadcastss	-444(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm3
	vfmadd231ps	%zmm20, %zmm17, %zmm10
	vbroadcastss	-296(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm17, %zmm18, %zmm0
	vfmadd231ps	%zmm18, %zmm16, %zmm1
	vfmadd231ps	%zmm16, %zmm19, %zmm4
	vfmadd231ps	%zmm19, %zmm17, %zmm11
	vbroadcastss	-148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm5
	vfmadd231ps	%zmm20, %zmm17, %zmm12
	vbroadcastss	(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm16, %zmm19, %zmm6
	vfmadd231ps	%zmm19, %zmm17, %zmm13
	vbroadcastss	148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm7
	vfmadd231ps	%zmm20, %zmm17, %zmm14
	addq	$4, %r8
	vfmadd231ps	%zmm16, %zmm19, %zmm8
	vfmadd231ps	%zmm17, %zmm19, %zmm15
	jne	.LBB29_1
	.loc	30 25 8
	shlq	$10, %rcx
	.loc	30 27 10
	vxorps	%xmm16, %xmm16, %xmm16
	vaddps	%zmm16, %zmm0, %zmm0
	vaddps	%zmm16, %zmm1, %zmm1
	vaddps	%zmm16, %zmm9, %zmm9
	vaddps	%zmm16, %zmm2, %zmm2
	vaddps	%zmm16, %zmm10, %zmm10
	vaddps	%zmm16, %zmm3, %zmm3
	vaddps	%zmm16, %zmm11, %zmm11
	vaddps	%zmm16, %zmm4, %zmm4
	vaddps	%zmm16, %zmm12, %zmm12
	vaddps	%zmm16, %zmm5, %zmm5
	vaddps	%zmm16, %zmm13, %zmm13
	vaddps	%zmm16, %zmm6, %zmm6
	vaddps	%zmm16, %zmm14, %zmm14
	vaddps	%zmm16, %zmm7, %zmm7
	vaddps	%zmm16, %zmm15, %zmm15
	vaddps	%zmm16, %zmm8, %zmm8
	.loc	30 28 10
	vaddps	2048(%rsi,%rcx), %zmm1, %zmm1
	vaddps	2112(%rsi,%rcx), %zmm0, %zmm0
	vaddps	2176(%rsi,%rcx), %zmm2, %zmm2
	vaddps	2240(%rsi,%rcx), %zmm9, %zmm9
	vaddps	2304(%rsi,%rcx), %zmm3, %zmm3
	vaddps	2368(%rsi,%rcx), %zmm10, %zmm10
	vaddps	2432(%rsi,%rcx), %zmm4, %zmm4
	vaddps	2496(%rsi,%rcx), %zmm11, %zmm11
	vaddps	2560(%rsi,%rcx), %zmm5, %zmm5
	vaddps	2624(%rsi,%rcx), %zmm12, %zmm12
	vaddps	2688(%rsi,%rcx), %zmm6, %zmm6
	vaddps	2752(%rsi,%rcx), %zmm13, %zmm13
	vaddps	2816(%rsi,%rcx), %zmm7, %zmm7
	vaddps	2880(%rsi,%rcx), %zmm14, %zmm14
	vaddps	2944(%rsi,%rcx), %zmm8, %zmm8
	vaddps	3008(%rsi,%rcx), %zmm15, %zmm15
	vmovaps	%zmm0, 64(%rax,%rcx)
	vmovaps	%zmm1, (%rax,%rcx)
	vmovaps	%zmm9, 192(%rax,%rcx)
	vmovaps	%zmm2, 128(%rax,%rcx)
	vmovaps	%zmm10, 320(%rax,%rcx)
	vmovaps	%zmm3, 256(%rax,%rcx)
	vmovaps	%zmm11, 448(%rax,%rcx)
	vmovaps	%zmm4, 384(%rax,%rcx)
	vmovaps	%zmm12, 576(%rax,%rcx)
	vmovaps	%zmm5, 512(%rax,%rcx)
	vmovaps	%zmm13, 704(%rax,%rcx)
	vmovaps	%zmm6, 640(%rax,%rcx)
	vmovaps	%zmm14, 832(%rax,%rcx)
	vmovaps	%zmm7, 768(%rax,%rcx)
	vmovaps	%zmm15, 960(%rax,%rcx)
	vmovaps	%zmm8, 896(%rax,%rcx)
	.loc	30 32 8
	xorl	%eax, %eax
	.loc	30 32 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp104:
.Lfunc_end29:
	.size	main$async_dispatch_60_batch_matmul_1x16x32x37_f32, .Lfunc_end29-main$async_dispatch_60_batch_matmul_1x16x32x37_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI30_0:
	.long	0x3d000000
.LCPI30_1:
	.long	0x2b8cbccc
.LCPI30_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_62_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_62_reduction_16x32_f32,@function
main$async_dispatch_62_reduction_16x32_f32:
.Lfunc_begin30:
	.file	31 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_62.mlir"
	.loc	31 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp105:
	.loc	31 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	31 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	31 16 8
	movq	(%rcx), %rax
	.loc	31 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	leaq	2048(%rax,%rsi), %rsi
	.loc	31 16 8
	addq	$2048, %rax
	.loc	31 0 8 is_stmt 0
.Ltmp106:
	.p2align	4
.LBB30_1:
	.loc	31 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	31 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	31 22 8
	testb	$1, %dil
	jne	.LBB30_1
	.loc	31 30 10
	vmulps	.LCPI30_0(%rip){1to4}, %xmm0, %xmm0
	.loc	31 32 10
	vbroadcastss	.LCPI30_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	31 31 10
	vaddps	.LCPI30_1(%rip){1to4}, %xmm0, %xmm0
	.loc	31 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	31 0 10 is_stmt 0
.Ltmp107:
	.p2align	4
.LBB30_3:
	.loc	31 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	31 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	31 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	31 28 8
	vmovaps	%zmm4, (%rcx,%rsi,4)
	vmovaps	%zmm5, 128(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB30_3
	.loc	31 39 8
	xorl	%eax, %eax
	.loc	31 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp108:
.Lfunc_end30:
	.size	main$async_dispatch_62_reduction_16x32_f32, .Lfunc_end30-main$async_dispatch_62_reduction_16x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_70_batch_matmul_1x16x32x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_70_batch_matmul_1x16x32x32_f32,@function
main$async_dispatch_70_batch_matmul_1x16x32x32_f32:
.Lfunc_begin31:
	.file	32 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_70.mlir"
	.loc	32 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp109:
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
	.loc	32 15 8 prologue_end
	movq	32(%rsi), %rdi
	movl	$115712, %esi
	movb	$1, %r12b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r15d, %r15d
	.loc	32 16 8
	addq	8(%rdi), %rsi
	.loc	32 15 8
	movq	(%rdi), %rax
	.loc	32 18 8
	movq	16(%rdi), %rcx
	.loc	32 24 8
	movl	(%rdx), %edi
	movq	%rdi, %rdx
	shlq	$10, %rdi
	shlq	$8, %rdx
	movq	%rsi, -48(%rbp)
	leaq	8192(%rax,%rdi), %rdi
	.loc	32 0 8 is_stmt 0
.Ltmp110:
	.p2align	4
.LBB31_1:
	movq	-48(%rbp), %rsi
	movb	$1, %r13b
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%r9d, %r9d
	.loc	32 24 8
	leaq	(%rsi,%r15,4), %r8
	.loc	32 0 8
.Ltmp111:
	.p2align	4
.LBB31_2:
	movl	%r13d, %r10d
	.loc	32 24 8
	movq	%r9, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm24
	movq	%r9, %r13
	orq	$1, %r13
	vfmadd231ps	(%rdi,%r9,4){1to16}, %zmm24, %zmm1
	vfmadd231ps	128(%rdi,%r9,4){1to16}, %zmm24, %zmm2
	vfmadd231ps	256(%rdi,%r9,4){1to16}, %zmm24, %zmm3
	vfmadd231ps	384(%rdi,%r9,4){1to16}, %zmm24, %zmm4
	vfmadd231ps	512(%rdi,%r9,4){1to16}, %zmm24, %zmm5
	vfmadd231ps	640(%rdi,%r9,4){1to16}, %zmm24, %zmm6
	vfmadd231ps	768(%rdi,%r9,4){1to16}, %zmm24, %zmm7
	vfmadd231ps	896(%rdi,%r9,4){1to16}, %zmm24, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm23
	movq	%r9, %r13
	orq	$2, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm22
	movq	%r9, %r13
	orq	$3, %r13
	vfmadd231ps	4(%rdi,%r9,4){1to16}, %zmm23, %zmm1
	vfmadd231ps	132(%rdi,%r9,4){1to16}, %zmm23, %zmm2
	vfmadd231ps	260(%rdi,%r9,4){1to16}, %zmm23, %zmm3
	vfmadd231ps	388(%rdi,%r9,4){1to16}, %zmm23, %zmm4
	vfmadd231ps	516(%rdi,%r9,4){1to16}, %zmm23, %zmm5
	vfmadd231ps	644(%rdi,%r9,4){1to16}, %zmm23, %zmm6
	vfmadd231ps	772(%rdi,%r9,4){1to16}, %zmm23, %zmm7
	vfmadd231ps	900(%rdi,%r9,4){1to16}, %zmm23, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm21
	movq	%r9, %r13
	orq	$4, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm20
	movq	%r9, %r13
	orq	$5, %r13
	vfmadd231ps	8(%rdi,%r9,4){1to16}, %zmm22, %zmm1
	vfmadd231ps	136(%rdi,%r9,4){1to16}, %zmm22, %zmm2
	vfmadd231ps	264(%rdi,%r9,4){1to16}, %zmm22, %zmm3
	vfmadd231ps	392(%rdi,%r9,4){1to16}, %zmm22, %zmm4
	vfmadd231ps	520(%rdi,%r9,4){1to16}, %zmm22, %zmm5
	vfmadd231ps	648(%rdi,%r9,4){1to16}, %zmm22, %zmm6
	vfmadd231ps	776(%rdi,%r9,4){1to16}, %zmm22, %zmm7
	vfmadd231ps	904(%rdi,%r9,4){1to16}, %zmm22, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm19
	movq	%r9, %r13
	orq	$6, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm18
	movq	%r9, %r13
	orq	$7, %r13
	vfmadd231ps	12(%rdi,%r9,4){1to16}, %zmm21, %zmm1
	vfmadd231ps	140(%rdi,%r9,4){1to16}, %zmm21, %zmm2
	vfmadd231ps	268(%rdi,%r9,4){1to16}, %zmm21, %zmm3
	vfmadd231ps	396(%rdi,%r9,4){1to16}, %zmm21, %zmm4
	vfmadd231ps	524(%rdi,%r9,4){1to16}, %zmm21, %zmm5
	vfmadd231ps	652(%rdi,%r9,4){1to16}, %zmm21, %zmm6
	vfmadd231ps	780(%rdi,%r9,4){1to16}, %zmm21, %zmm7
	vfmadd231ps	908(%rdi,%r9,4){1to16}, %zmm21, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm17
	movq	%r9, %r13
	orq	$8, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm16
	movq	%r9, %r13
	orq	$9, %r13
	vfmadd231ps	16(%rdi,%r9,4){1to16}, %zmm20, %zmm1
	vfmadd231ps	144(%rdi,%r9,4){1to16}, %zmm20, %zmm2
	vfmadd231ps	272(%rdi,%r9,4){1to16}, %zmm20, %zmm3
	vfmadd231ps	400(%rdi,%r9,4){1to16}, %zmm20, %zmm4
	vfmadd231ps	528(%rdi,%r9,4){1to16}, %zmm20, %zmm5
	vfmadd231ps	656(%rdi,%r9,4){1to16}, %zmm20, %zmm6
	vfmadd231ps	784(%rdi,%r9,4){1to16}, %zmm20, %zmm7
	vfmadd231ps	912(%rdi,%r9,4){1to16}, %zmm20, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm15
	movq	%r9, %r13
	orq	$10, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm14
	movq	%r9, %r13
	orq	$11, %r13
	vfmadd231ps	20(%rdi,%r9,4){1to16}, %zmm19, %zmm1
	vfmadd231ps	148(%rdi,%r9,4){1to16}, %zmm19, %zmm2
	vfmadd231ps	276(%rdi,%r9,4){1to16}, %zmm19, %zmm3
	vfmadd231ps	404(%rdi,%r9,4){1to16}, %zmm19, %zmm4
	vfmadd231ps	532(%rdi,%r9,4){1to16}, %zmm19, %zmm5
	vfmadd231ps	660(%rdi,%r9,4){1to16}, %zmm19, %zmm6
	vfmadd231ps	788(%rdi,%r9,4){1to16}, %zmm19, %zmm7
	vfmadd231ps	916(%rdi,%r9,4){1to16}, %zmm19, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm13
	movq	%r9, %r13
	orq	$12, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm12
	movq	%r9, %r13
	orq	$13, %r13
	vfmadd231ps	24(%rdi,%r9,4){1to16}, %zmm18, %zmm1
	vfmadd231ps	152(%rdi,%r9,4){1to16}, %zmm18, %zmm2
	vfmadd231ps	280(%rdi,%r9,4){1to16}, %zmm18, %zmm3
	vfmadd231ps	408(%rdi,%r9,4){1to16}, %zmm18, %zmm4
	vfmadd231ps	536(%rdi,%r9,4){1to16}, %zmm18, %zmm5
	vfmadd231ps	664(%rdi,%r9,4){1to16}, %zmm18, %zmm6
	vfmadd231ps	792(%rdi,%r9,4){1to16}, %zmm18, %zmm7
	vfmadd231ps	920(%rdi,%r9,4){1to16}, %zmm18, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm11
	movq	%r9, %r13
	orq	$14, %r13
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm10
	movq	%r9, %r13
	orq	$15, %r13
	vfmadd231ps	28(%rdi,%r9,4){1to16}, %zmm17, %zmm1
	vfmadd231ps	156(%rdi,%r9,4){1to16}, %zmm17, %zmm2
	vfmadd231ps	284(%rdi,%r9,4){1to16}, %zmm17, %zmm3
	vfmadd231ps	412(%rdi,%r9,4){1to16}, %zmm17, %zmm4
	vfmadd231ps	540(%rdi,%r9,4){1to16}, %zmm17, %zmm5
	vfmadd231ps	668(%rdi,%r9,4){1to16}, %zmm17, %zmm6
	vfmadd231ps	796(%rdi,%r9,4){1to16}, %zmm17, %zmm7
	vfmadd231ps	924(%rdi,%r9,4){1to16}, %zmm17, %zmm8
	shlq	$7, %r13
	vmovaps	(%r8,%r13), %zmm9
	xorl	%r13d, %r13d
	vfmadd231ps	32(%rdi,%r9,4){1to16}, %zmm16, %zmm1
	vfmadd231ps	160(%rdi,%r9,4){1to16}, %zmm16, %zmm2
	vfmadd231ps	288(%rdi,%r9,4){1to16}, %zmm16, %zmm3
	vfmadd231ps	416(%rdi,%r9,4){1to16}, %zmm16, %zmm4
	vfmadd231ps	544(%rdi,%r9,4){1to16}, %zmm16, %zmm5
	vfmadd231ps	672(%rdi,%r9,4){1to16}, %zmm16, %zmm6
	vfmadd231ps	800(%rdi,%r9,4){1to16}, %zmm16, %zmm7
	vfmadd231ps	928(%rdi,%r9,4){1to16}, %zmm16, %zmm8
	vfmadd231ps	36(%rdi,%r9,4){1to16}, %zmm15, %zmm1
	vfmadd231ps	164(%rdi,%r9,4){1to16}, %zmm15, %zmm2
	vfmadd231ps	292(%rdi,%r9,4){1to16}, %zmm15, %zmm3
	vfmadd231ps	420(%rdi,%r9,4){1to16}, %zmm15, %zmm4
	vfmadd231ps	548(%rdi,%r9,4){1to16}, %zmm15, %zmm5
	vfmadd231ps	676(%rdi,%r9,4){1to16}, %zmm15, %zmm6
	vfmadd231ps	804(%rdi,%r9,4){1to16}, %zmm15, %zmm7
	vfmadd231ps	932(%rdi,%r9,4){1to16}, %zmm15, %zmm8
	vfmadd231ps	40(%rdi,%r9,4){1to16}, %zmm14, %zmm1
	vfmadd231ps	168(%rdi,%r9,4){1to16}, %zmm14, %zmm2
	vfmadd231ps	296(%rdi,%r9,4){1to16}, %zmm14, %zmm3
	vfmadd231ps	424(%rdi,%r9,4){1to16}, %zmm14, %zmm4
	vfmadd231ps	552(%rdi,%r9,4){1to16}, %zmm14, %zmm5
	vfmadd231ps	680(%rdi,%r9,4){1to16}, %zmm14, %zmm6
	vfmadd231ps	808(%rdi,%r9,4){1to16}, %zmm14, %zmm7
	vfmadd231ps	936(%rdi,%r9,4){1to16}, %zmm14, %zmm8
	vfmadd231ps	44(%rdi,%r9,4){1to16}, %zmm13, %zmm1
	vfmadd231ps	172(%rdi,%r9,4){1to16}, %zmm13, %zmm2
	vfmadd231ps	300(%rdi,%r9,4){1to16}, %zmm13, %zmm3
	vfmadd231ps	428(%rdi,%r9,4){1to16}, %zmm13, %zmm4
	vfmadd231ps	556(%rdi,%r9,4){1to16}, %zmm13, %zmm5
	vfmadd231ps	684(%rdi,%r9,4){1to16}, %zmm13, %zmm6
	vfmadd231ps	812(%rdi,%r9,4){1to16}, %zmm13, %zmm7
	vfmadd231ps	940(%rdi,%r9,4){1to16}, %zmm13, %zmm8
	vfmadd231ps	48(%rdi,%r9,4){1to16}, %zmm12, %zmm1
	vfmadd231ps	176(%rdi,%r9,4){1to16}, %zmm12, %zmm2
	vfmadd231ps	304(%rdi,%r9,4){1to16}, %zmm12, %zmm3
	vfmadd231ps	432(%rdi,%r9,4){1to16}, %zmm12, %zmm4
	vfmadd231ps	560(%rdi,%r9,4){1to16}, %zmm12, %zmm5
	vfmadd231ps	688(%rdi,%r9,4){1to16}, %zmm12, %zmm6
	vfmadd231ps	816(%rdi,%r9,4){1to16}, %zmm12, %zmm7
	vfmadd231ps	944(%rdi,%r9,4){1to16}, %zmm12, %zmm8
	vfmadd231ps	52(%rdi,%r9,4){1to16}, %zmm11, %zmm1
	vfmadd231ps	180(%rdi,%r9,4){1to16}, %zmm11, %zmm2
	vfmadd231ps	308(%rdi,%r9,4){1to16}, %zmm11, %zmm3
	vfmadd231ps	436(%rdi,%r9,4){1to16}, %zmm11, %zmm4
	vfmadd231ps	564(%rdi,%r9,4){1to16}, %zmm11, %zmm5
	vfmadd231ps	692(%rdi,%r9,4){1to16}, %zmm11, %zmm6
	vfmadd231ps	820(%rdi,%r9,4){1to16}, %zmm11, %zmm7
	vfmadd231ps	948(%rdi,%r9,4){1to16}, %zmm11, %zmm8
	vfmadd231ps	56(%rdi,%r9,4){1to16}, %zmm10, %zmm1
	vfmadd231ps	184(%rdi,%r9,4){1to16}, %zmm10, %zmm2
	vfmadd231ps	312(%rdi,%r9,4){1to16}, %zmm10, %zmm3
	vfmadd231ps	440(%rdi,%r9,4){1to16}, %zmm10, %zmm4
	vfmadd231ps	568(%rdi,%r9,4){1to16}, %zmm10, %zmm5
	vfmadd231ps	696(%rdi,%r9,4){1to16}, %zmm10, %zmm6
	vfmadd231ps	824(%rdi,%r9,4){1to16}, %zmm10, %zmm7
	vfmadd231ps	952(%rdi,%r9,4){1to16}, %zmm10, %zmm8
	vfmadd231ps	60(%rdi,%r9,4){1to16}, %zmm9, %zmm1
	vfmadd231ps	188(%rdi,%r9,4){1to16}, %zmm9, %zmm2
	vfmadd231ps	316(%rdi,%r9,4){1to16}, %zmm9, %zmm3
	vfmadd231ps	444(%rdi,%r9,4){1to16}, %zmm9, %zmm4
	vfmadd231ps	572(%rdi,%r9,4){1to16}, %zmm9, %zmm5
	vfmadd231ps	700(%rdi,%r9,4){1to16}, %zmm9, %zmm6
	vfmadd231ps	828(%rdi,%r9,4){1to16}, %zmm9, %zmm7
	vfmadd231ps	956(%rdi,%r9,4){1to16}, %zmm9, %zmm8
	movl	$16, %r9d
	testb	$1, %r10b
	jne	.LBB31_2
	.loc	32 25 8 is_stmt 1
	leaq	32(%rdx), %r10
	leaq	64(%rdx), %r11
	movq	%r15, %r9
	leaq	128(%rdx), %rbx
	leaq	160(%rdx), %r14
	leaq	192(%rdx), %rsi
	movq	%r15, %r13
	movq	%r15, %r8
	orq	%rdx, %r8
	.loc	32 27 10
	vaddps	%zmm0, %zmm1, %zmm1
	vaddps	%zmm0, %zmm2, %zmm2
	vaddps	%zmm0, %zmm3, %zmm3
	vaddps	%zmm0, %zmm4, %zmm4
	vaddps	%zmm0, %zmm5, %zmm5
	vaddps	%zmm0, %zmm6, %zmm6
	vaddps	%zmm0, %zmm7, %zmm7
	vaddps	%zmm0, %zmm8, %zmm8
	.loc	32 25 8
	orq	%r10, %r9
	movq	%r15, %r10
	orq	%r11, %r10
	leaq	96(%rdx), %r11
	.loc	32 28 10
	vaddps	(%rax,%r8,4), %zmm1, %zmm1
	.loc	32 25 8
	orq	%r11, %r13
	movq	%r15, %r11
	orq	%rbx, %r11
	movq	%r15, %rbx
	orq	%r14, %rbx
	movq	%r15, %r14
	orq	%rsi, %r14
	leaq	224(%rdx), %rsi
	.loc	32 28 10
	vaddps	(%rax,%r9,4), %zmm2, %zmm2
	vaddps	(%rax,%r10,4), %zmm3, %zmm3
	.loc	32 25 8
	orq	%rsi, %r15
	.loc	32 28 10
	vaddps	(%rax,%r13,4), %zmm4, %zmm4
	vaddps	(%rax,%r11,4), %zmm5, %zmm5
	vaddps	(%rax,%rbx,4), %zmm6, %zmm6
	vaddps	(%rax,%r14,4), %zmm7, %zmm7
	vaddps	(%rax,%r15,4), %zmm8, %zmm8
	.loc	32 24 8
	vmovaps	%zmm1, 2048(%rcx,%r8,4)
	vmovaps	%zmm2, 2048(%rcx,%r9,4)
	vmovaps	%zmm3, 2048(%rcx,%r10,4)
	vmovaps	%zmm4, 2048(%rcx,%r13,4)
	vmovaps	%zmm5, 2048(%rcx,%r11,4)
	vmovaps	%zmm6, 2048(%rcx,%rbx,4)
	vmovaps	%zmm7, 2048(%rcx,%r14,4)
	vmovaps	%zmm8, 2048(%rcx,%r15,4)
	movl	$16, %r15d
	testb	$1, %r12b
	movl	$0, %r12d
	jne	.LBB31_1
	.loc	32 32 8
	xorl	%eax, %eax
	.loc	32 32 8 epilogue_begin is_stmt 0
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp112:
.Lfunc_end31:
	.size	main$async_dispatch_70_batch_matmul_1x16x32x32_f32, .Lfunc_end31-main$async_dispatch_70_batch_matmul_1x16x32x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI32_0:
	.long	0x3d000000
.LCPI32_1:
	.long	0x2b8cbccc
.LCPI32_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_72_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_72_reduction_16x32_f32,@function
main$async_dispatch_72_reduction_16x32_f32:
.Lfunc_begin32:
	.file	33 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_72.mlir"
	.loc	33 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp113:
	.loc	33 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	33 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	33 16 8
	movq	(%rcx), %rax
	.loc	33 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	addq	%rax, %rsi
	.loc	33 0 8 is_stmt 0
.Ltmp114:
	.p2align	4
.LBB32_1:
	.loc	33 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	33 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	33 22 8
	testb	$1, %dil
	jne	.LBB32_1
	.loc	33 30 10
	vmulps	.LCPI32_0(%rip){1to4}, %xmm0, %xmm0
	.loc	33 32 10
	vbroadcastss	.LCPI32_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	33 31 10
	vaddps	.LCPI32_1(%rip){1to4}, %xmm0, %xmm0
	.loc	33 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	33 0 10 is_stmt 0
.Ltmp115:
	.p2align	4
.LBB32_3:
	.loc	33 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	33 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	33 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	33 28 8
	vmovaps	%zmm4, 2048(%rcx,%rsi,4)
	vmovaps	%zmm5, 2176(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB32_3
	.loc	33 39 8
	xorl	%eax, %eax
	.loc	33 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp116:
.Lfunc_end32:
	.size	main$async_dispatch_72_reduction_16x32_f32, .Lfunc_end32-main$async_dispatch_72_reduction_16x32_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI33_0:
	.long	0x3fb504f3
.LCPI33_1:
	.long	0x80000000
.LCPI33_2:
	.long	0x3f4ccccd
.LCPI33_3:
	.long	0x3f905225
.LCPI33_4:
	.long	0x3f906eba
.LCPI33_5:
	.long	0xbea7bc1b
.LCPI33_6:
	.long	0xbeed51af
.LCPI33_7:
	.long	0xbebabcc4
.LCPI33_8:
	.long	0xbf05e48b
.LCPI33_9:
	.long	0x3ee590a2
.LCPI33_10:
	.long	0x3f04ec44
.LCPI33_11:
	.long	0x3df27f94
.LCPI33_12:
	.long	0x3e56c688
.LCPI33_13:
	.long	0xbdb4eee3
.LCPI33_14:
	.long	0xbe06f8ee
.LCPI33_15:
	.long	0x3d17d100
.LCPI33_16:
	.long	0x3cd3794f
.LCPI33_17:
	.long	0x3d6a78fa
.LCPI33_18:
	.long	0x3d9782a4
.LCPI33_19:
	.long	0x40000000
.LCPI33_20:
	.long	0xbb58546d
.LCPI33_21:
	.long	0x3b66a96a
.LCPI33_22:
	.long	0xc003e25f
.LCPI33_23:
	.long	0xbab94d1e
.LCPI33_24:
	.long	0x3fd0437b
.LCPI33_25:
	.long	0x3984e118
.LCPI33_26:
	.long	0xbf15590a
.LCPI33_27:
	.long	0xb78f7c49
.LCPI33_28:
	.long	0x3da853b3
.LCPI33_29:
	.long	0x3f800000
.LCPI33_30:
	.long	0x40700000
.LCPI33_31:
	.long	0x3f000000
	.section	".text.main$async_dispatch_73_batch_matmul_1x16x37x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_73_batch_matmul_1x16x37x32_f32,@function
main$async_dispatch_73_batch_matmul_1x16x37x32_f32:
.Lfunc_begin33:
	.file	34 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_73.mlir"
	.loc	34 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp117:
	.loc	34 17 8 prologue_end
	movq	32(%rsi), %rcx
	movl	$119808, %eax
	vbroadcastss	.LCPI33_15(%rip), %ymm10
	vbroadcastss	.LCPI33_17(%rip), %ymm11
	vbroadcastss	.LCPI33_19(%rip), %ymm12
	vbroadcastss	.LCPI33_20(%rip), %ymm13
	vbroadcastss	.LCPI33_21(%rip), %ymm14
	vbroadcastss	.LCPI33_22(%rip), %ymm15
	vbroadcastss	.LCPI33_23(%rip), %ymm16
	vbroadcastss	.LCPI33_24(%rip), %ymm17
	vbroadcastss	.LCPI33_25(%rip), %ymm18
	vbroadcastss	.LCPI33_26(%rip), %ymm19
	vbroadcastss	.LCPI33_27(%rip), %ymm20
	vbroadcastss	.LCPI33_28(%rip), %ymm21
	vbroadcastss	.LCPI33_29(%rip), %ymm22
	vbroadcastss	.LCPI33_30(%rip), %ymm23
	vbroadcastss	.LCPI33_31(%rip), %ymm24
	vbroadcastss	.LCPI33_1(%rip), %ymm2
	vxorps	%xmm0, %xmm0, %xmm0
	.loc	34 18 8
	addq	8(%rcx), %rax
	.loc	34 17 8
	movq	(%rcx), %rsi
	.loc	34 19 8
	movq	16(%rcx), %rdi
	.loc	34 24 8
	movl	(%rdx), %ecx
	imulq	$1184, %rcx, %rdx
	shlq	$10, %rcx
	leaq	2048(%rsi,%rcx), %rcx
	xorl	%esi, %esi
	leaq	4096(%rdi,%rdx), %rdx
	.loc	34 0 8 is_stmt 0
.Ltmp118:
	.p2align	4
.LBB33_1:
	.loc	34 24 8
	leaq	(%rax,%rsi,4), %rdi
	movb	$1, %r8b
	vxorps	%xmm25, %xmm25, %xmm25
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r9d, %r9d
	.loc	34 0 8
.Ltmp119:
	.p2align	4
.LBB33_2:
	.loc	34 24 8
	imulq	$148, %r9, %r10
	vmovss	384(%rcx,%r9,4), %xmm5
	vmovss	512(%rcx,%r9,4), %xmm6
	vmovss	256(%rcx,%r9,4), %xmm8
	vextractf128	$1, %ymm1, %xmm9
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vshufpd	$1, %xmm1, %xmm1, %xmm27
	vmovss	640(%rcx,%r9,4), %xmm7
	vbroadcastss	(%rdi,%r10), %xmm31
	movq	%r9, %r10
	orq	$1, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	896(%rcx,%r9,4), %xmm31, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$2, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	900(%rcx,%r9,4), %xmm29, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$3, %r10
	vfmadd231ps	%ymm5, %ymm31, %ymm4
	vbroadcastss	%xmm9, %ymm5
	vfmadd231ps	%ymm8, %ymm31, %ymm27
	vmovss	768(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vfmadd231ss	904(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm6, %ymm31, %ymm5
	vmovshdup	%xmm9, %xmm6
	vmovss	260(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm7, %ymm31, %ymm6
	vpermpd	$255, %ymm1, %ymm7
	vbroadcastss	(%rdi,%r10), %xmm30
	movq	%r9, %r10
	orq	$4, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	908(%rcx,%r9,4), %xmm30, %xmm25
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$5, %r10
	vfmadd231ps	%ymm8, %ymm31, %ymm7
	vmovss	(%rcx,%r9,4), %xmm8
	imulq	$148, %r10, %r10
	vinsertps	$16, 128(%rcx,%r9,4), %xmm8, %xmm8
	vfmadd231ss	912(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm27
	vmovss	264(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$6, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	916(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd213ps	%ymm1, %ymm31, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$7, %r10
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	388(%rcx,%r9,4), %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	920(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm29, %ymm4
	vmovss	516(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm5
	vmovss	392(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	520(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	644(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm6
	vmovss	648(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	772(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm7
	vmovss	776(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	4(%rcx,%r9,4), %xmm9
	vinsertps	$16, 132(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm29, %ymm8
	vmovss	8(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm29
	movq	%r9, %r10
	orq	$8, %r10
	vinsertps	$16, 136(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	924(%rcx,%r9,4), %xmm29, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	268(%rcx,%r9,4), %xmm3
	vmovss	272(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm27
	vmovss	396(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm27
	vmovss	276(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm4
	vmovss	524(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm27
	vmovss	400(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm5
	vmovss	652(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm4
	vmovss	528(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm6
	vmovss	780(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm9, %ymm28, %ymm5
	vmovss	404(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm7
	vmovss	12(%rcx,%r9,4), %xmm3
	vinsertps	$16, 140(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm9, %ymm26, %ymm4
	vmovss	532(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm30, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$9, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	928(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm5
	vmovss	656(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm6
	vmovss	660(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm6
	vmovss	784(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm7
	vmovss	788(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm26, %ymm7
	vmovss	16(%rcx,%r9,4), %xmm9
	vinsertps	$16, 144(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm28, %ymm8
	vmovss	20(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm28
	movq	%r9, %r10
	orq	$10, %r10
	vinsertps	$16, 148(%rcx,%r9,4), %xmm9, %xmm9
	imulq	$148, %r10, %r10
	vfmadd231ss	932(%rcx,%r9,4), %xmm28, %xmm25
	vfmadd231ps	%ymm9, %ymm26, %ymm8
	vmovss	280(%rcx,%r9,4), %xmm9
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$11, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	936(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm9, %ymm1, %ymm27
	vmovss	408(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm4
	vmovss	536(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm5
	vmovss	664(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm6
	vmovss	792(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm7
	vmovss	24(%rcx,%r9,4), %xmm9
	vinsertps	$16, 152(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm9, %ymm1, %ymm8
	vmovss	284(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm9
	movq	%r9, %r10
	orq	$12, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	940(%rcx,%r9,4), %xmm9, %xmm25
	vfmadd231ps	%ymm1, %ymm29, %ymm27
	vmovss	288(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm27
	vmovss	412(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm4
	vmovss	540(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm5
	vmovss	416(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm4
	vmovss	544(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm5
	vmovss	668(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm6
	vmovss	672(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm6
	vmovss	796(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm7
	vmovss	800(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm7
	vmovss	28(%rcx,%r9,4), %xmm1
	vinsertps	$16, 156(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm29, %ymm8
	vmovss	32(%rcx,%r9,4), %xmm1
	vinsertps	$16, 160(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm1, %ymm3, %ymm8
	vmovss	292(%rcx,%r9,4), %xmm1
	vmovss	296(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm27
	vmovss	420(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm27
	vmovss	300(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm4
	vmovss	548(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm27
	vmovss	424(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm5
	vmovss	676(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm4
	vmovss	552(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm6
	vmovss	804(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm3, %ymm26, %ymm5
	vmovss	428(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm7
	vmovss	36(%rcx,%r9,4), %xmm1
	vinsertps	$16, 164(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm3, %ymm9, %ymm4
	vmovss	556(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm1, %ymm28, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movq	%r9, %r10
	orq	$13, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	944(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm5
	vmovss	680(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm6
	vmovss	684(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm6
	vmovss	808(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm7
	vmovss	812(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm9, %ymm7
	vmovss	40(%rcx,%r9,4), %xmm3
	vinsertps	$16, 168(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm26, %ymm8
	vmovss	44(%rcx,%r9,4), %xmm3
	vbroadcastss	(%rdi,%r10), %xmm26
	movq	%r9, %r10
	orq	$14, %r10
	vinsertps	$16, 172(%rcx,%r9,4), %xmm3, %xmm3
	imulq	$148, %r10, %r10
	vfmadd231ss	948(%rcx,%r9,4), %xmm26, %xmm25
	vfmadd231ps	%ymm3, %ymm9, %ymm8
	vmovss	304(%rcx,%r9,4), %xmm3
	vmovss	312(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	432(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	560(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	688(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	816(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	48(%rcx,%r9,4), %xmm3
	vinsertps	$16, 176(%rcx,%r9,4), %xmm3, %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vmovss	308(%rcx,%r9,4), %xmm1
	vbroadcastss	(%rdi,%r10), %xmm3
	movq	%r9, %r10
	orq	$15, %r10
	imulq	$148, %r10, %r10
	vfmadd231ss	952(%rcx,%r9,4), %xmm3, %xmm25
	vfmadd231ps	%ymm1, %ymm26, %ymm27
	vmovss	436(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm27
	vmovss	440(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm4
	vmovss	564(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm4
	vmovss	568(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm5
	vmovss	692(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm5
	vmovss	696(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm6
	vmovss	820(%rcx,%r9,4), %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm6
	vmovss	824(%rcx,%r9,4), %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm7
	vmovss	52(%rcx,%r9,4), %xmm1
	vinsertps	$16, 180(%rcx,%r9,4), %xmm1, %xmm1
	vfmadd231ps	%ymm9, %ymm3, %ymm7
	vmovss	56(%rcx,%r9,4), %xmm9
	vinsertps	$16, 184(%rcx,%r9,4), %xmm9, %xmm9
	vfmadd231ps	%ymm1, %ymm26, %ymm8
	vbroadcastss	(%rdi,%r10), %xmm1
	movl	%r8d, %r10d
	xorl	%r8d, %r8d
	vfmadd231ss	956(%rcx,%r9,4), %xmm1, %xmm25
	vfmadd231ps	%ymm9, %ymm3, %ymm8
	vmovss	316(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm27
	vmovss	444(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm4
	vmovss	572(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm5
	vmovss	700(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm6
	vmovss	828(%rcx,%r9,4), %xmm3
	vfmadd231ps	%ymm3, %ymm1, %ymm7
	vmovss	60(%rcx,%r9,4), %xmm3
	vinsertps	$16, 188(%rcx,%r9,4), %xmm3, %xmm3
	movl	$16, %r9d
	vfmadd231ps	%ymm3, %ymm1, %ymm8
	vbroadcastss	%xmm6, %ymm3
	vmovlhps	%xmm27, %xmm8, %xmm1
	vinsertps	$48, %xmm4, %xmm1, %xmm1
	vinsertf128	$1, %xmm5, %ymm1, %ymm1
	vblendps	$32, %ymm3, %ymm1, %ymm1
	vbroadcastsd	%xmm7, %ymm3
	vblendps	$192, %ymm3, %ymm1, %ymm1
	vbroadcastss	%xmm25, %ymm3
	vblendps	$128, %ymm3, %ymm1, %ymm1
	testb	$1, %r10b
	jne	.LBB33_2
	.loc	34 27 10 is_stmt 1
	vaddps	%ymm0, %ymm1, %ymm1
	.loc	34 28 10
	vdivps	.LCPI33_0(%rip){1to8}, %ymm1, %ymm3
	.loc	34 29 10
	vbroadcastss	.LCPI33_5(%rip), %ymm5
	vbroadcastss	.LCPI33_7(%rip), %ymm6
	vbroadcastss	.LCPI33_9(%rip), %ymm7
	vbroadcastss	.LCPI33_11(%rip), %ymm8
	vbroadcastss	.LCPI33_13(%rip), %ymm9
	vxorps	%ymm2, %ymm3, %ymm4
	vcmpltps	%ymm4, %ymm3, %k1
	vmaxps	%ymm3, %ymm4, %ymm3
	vbroadcastss	.LCPI33_3(%rip), %ymm4
	vcmpltps	.LCPI33_2(%rip){1to8}, %ymm3, %k2
	vblendmps	.LCPI33_4(%rip){1to8}, %ymm4, %ymm4 {%k2}
	vblendmps	.LCPI33_6(%rip){1to8}, %ymm5, %ymm5 {%k2}
	vblendmps	.LCPI33_8(%rip){1to8}, %ymm6, %ymm6 {%k2}
	vblendmps	.LCPI33_10(%rip){1to8}, %ymm7, %ymm7 {%k2}
	vblendmps	.LCPI33_12(%rip){1to8}, %ymm8, %ymm8 {%k2}
	vblendmps	.LCPI33_14(%rip){1to8}, %ymm9, %ymm9 {%k2}
	vblendmps	.LCPI33_16(%rip){1to8}, %ymm10, %ymm25 {%k2}
	vblendmps	.LCPI33_18(%rip){1to8}, %ymm11, %ymm26 {%k2}
	vcmpltps	%ymm12, %ymm3, %k2
	vcmpngeps	%ymm23, %ymm3, %k3
	vblendmps	%ymm8, %ymm18, %ymm8 {%k2}
	vblendmps	%ymm25, %ymm20, %ymm25 {%k2}
	vblendmps	%ymm6, %ymm16, %ymm6 {%k2}
	vblendmps	%ymm4, %ymm14, %ymm4 {%k2}
	vfmadd213ps	%ymm8, %ymm3, %ymm25
	vfmadd213ps	%ymm6, %ymm3, %ymm25
	vblendmps	%ymm26, %ymm21, %ymm6 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm0, %ymm13, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm25
	vblendmps	%ymm9, %ymm19, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm7, %ymm17, %ymm4 {%k2}
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vblendmps	%ymm5, %ymm15, %ymm4 {%k2}
	vmovaps	%ymm22, %ymm5
	vfmadd213ps	%ymm4, %ymm3, %ymm6
	vfmadd213ps	%ymm22, %ymm3, %ymm6
	vblendmps	%ymm0, %ymm22, %ymm3 {%k2}
	vdivps	%ymm6, %ymm25, %ymm4
	vaddps	%ymm4, %ymm3, %ymm5 {%k3}
	vxorps	%ymm2, %ymm5, %ymm5 {%k1}
	.loc	34 30 10
	vaddps	%ymm22, %ymm5, %ymm3
	.loc	34 31 10
	vmulps	%ymm24, %ymm3, %ymm3
	.loc	34 32 10
	vmulps	%ymm3, %ymm1, %ymm1
	.loc	34 24 8
	vmovss	%xmm1, (%rdx,%rsi,4)
	vextractps	$1, %xmm1, 148(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 296(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 444(%rdx,%rsi,4)
	vextracti128	$1, %ymm1, %xmm1
	vmovd	%xmm1, 592(%rdx,%rsi,4)
	vextractps	$1, %xmm1, 740(%rdx,%rsi,4)
	vextractps	$2, %xmm1, 888(%rdx,%rsi,4)
	vextractps	$3, %xmm1, 1036(%rdx,%rsi,4)
	incq	%rsi
	cmpq	$37, %rsi
	jne	.LBB33_1
	.loc	34 36 8
	xorl	%eax, %eax
	.loc	34 36 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp120:
.Lfunc_end33:
	.size	main$async_dispatch_73_batch_matmul_1x16x37x32_f32, .Lfunc_end33-main$async_dispatch_73_batch_matmul_1x16x37x32_f32
	.cfi_endproc

	.section	".text.main$async_dispatch_74_batch_matmul_1x16x32x37_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_74_batch_matmul_1x16x32x37_f32,@function
main$async_dispatch_74_batch_matmul_1x16x32x37_f32:
.Lfunc_begin34:
	.file	35 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_74.mlir"
	.loc	35 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp121:
	.loc	35 15 8 prologue_end
	movq	32(%rsi), %r8
	.loc	35 24 8
	movl	(%rdx), %ecx
	movl	$124544, %edi
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm9, %xmm9, %xmm9
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm10, %xmm10, %xmm10
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm11, %xmm11, %xmm11
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm12, %xmm12, %xmm12
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm13, %xmm13, %xmm13
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm14, %xmm14, %xmm14
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm15, %xmm15, %xmm15
	.loc	35 15 8
	movq	(%r8), %rsi
	imulq	$1184, %rcx, %rdx
	.loc	35 18 8
	movq	16(%r8), %rax
	.loc	35 16 8
	addq	8(%r8), %rdi
	movq	$-148, %r8
	leaq	5132(%rsi,%rdx), %rdx
	.loc	35 0 8 is_stmt 0
.Ltmp122:
	.p2align	4
.LBB34_1:
	vbroadcastss	-740(%rdx,%r8), %zmm19
	.loc	35 24 8 is_stmt 1
	vmovaps	(%rdi), %zmm16
	vmovaps	64(%rdi), %zmm17
	vbroadcastss	-592(%rdx,%r8), %zmm20
	vbroadcastss	-888(%rdx,%r8), %zmm18
	subq	$-128, %rdi
	vfmadd231ps	%zmm16, %zmm19, %zmm2
	vfmadd231ps	%zmm19, %zmm17, %zmm9
	vbroadcastss	-444(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm3
	vfmadd231ps	%zmm20, %zmm17, %zmm10
	vbroadcastss	-296(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm17, %zmm18, %zmm0
	vfmadd231ps	%zmm18, %zmm16, %zmm1
	vfmadd231ps	%zmm16, %zmm19, %zmm4
	vfmadd231ps	%zmm19, %zmm17, %zmm11
	vbroadcastss	-148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm5
	vfmadd231ps	%zmm20, %zmm17, %zmm12
	vbroadcastss	(%rdx,%r8), %zmm20
	vfmadd231ps	%zmm16, %zmm19, %zmm6
	vfmadd231ps	%zmm19, %zmm17, %zmm13
	vbroadcastss	148(%rdx,%r8), %zmm19
	vfmadd231ps	%zmm16, %zmm20, %zmm7
	vfmadd231ps	%zmm20, %zmm17, %zmm14
	addq	$4, %r8
	vfmadd231ps	%zmm16, %zmm19, %zmm8
	vfmadd231ps	%zmm17, %zmm19, %zmm15
	jne	.LBB34_1
	.loc	35 25 8
	shlq	$10, %rcx
	.loc	35 27 10
	vxorps	%xmm16, %xmm16, %xmm16
	vaddps	%zmm16, %zmm0, %zmm0
	vaddps	%zmm16, %zmm1, %zmm1
	vaddps	%zmm16, %zmm9, %zmm9
	vaddps	%zmm16, %zmm2, %zmm2
	vaddps	%zmm16, %zmm10, %zmm10
	vaddps	%zmm16, %zmm3, %zmm3
	vaddps	%zmm16, %zmm11, %zmm11
	vaddps	%zmm16, %zmm4, %zmm4
	vaddps	%zmm16, %zmm12, %zmm12
	vaddps	%zmm16, %zmm5, %zmm5
	vaddps	%zmm16, %zmm13, %zmm13
	vaddps	%zmm16, %zmm6, %zmm6
	vaddps	%zmm16, %zmm14, %zmm14
	vaddps	%zmm16, %zmm7, %zmm7
	vaddps	%zmm16, %zmm15, %zmm15
	vaddps	%zmm16, %zmm8, %zmm8
	.loc	35 28 10
	vaddps	2048(%rsi,%rcx), %zmm1, %zmm1
	vaddps	2112(%rsi,%rcx), %zmm0, %zmm0
	vaddps	2176(%rsi,%rcx), %zmm2, %zmm2
	vaddps	2240(%rsi,%rcx), %zmm9, %zmm9
	vaddps	2304(%rsi,%rcx), %zmm3, %zmm3
	vaddps	2368(%rsi,%rcx), %zmm10, %zmm10
	vaddps	2432(%rsi,%rcx), %zmm4, %zmm4
	vaddps	2496(%rsi,%rcx), %zmm11, %zmm11
	vaddps	2560(%rsi,%rcx), %zmm5, %zmm5
	vaddps	2624(%rsi,%rcx), %zmm12, %zmm12
	vaddps	2688(%rsi,%rcx), %zmm6, %zmm6
	vaddps	2752(%rsi,%rcx), %zmm13, %zmm13
	vaddps	2816(%rsi,%rcx), %zmm7, %zmm7
	vaddps	2880(%rsi,%rcx), %zmm14, %zmm14
	vaddps	2944(%rsi,%rcx), %zmm8, %zmm8
	vaddps	3008(%rsi,%rcx), %zmm15, %zmm15
	vmovaps	%zmm0, 64(%rax,%rcx)
	vmovaps	%zmm1, (%rax,%rcx)
	vmovaps	%zmm9, 192(%rax,%rcx)
	vmovaps	%zmm2, 128(%rax,%rcx)
	vmovaps	%zmm10, 320(%rax,%rcx)
	vmovaps	%zmm3, 256(%rax,%rcx)
	vmovaps	%zmm11, 448(%rax,%rcx)
	vmovaps	%zmm4, 384(%rax,%rcx)
	vmovaps	%zmm12, 576(%rax,%rcx)
	vmovaps	%zmm5, 512(%rax,%rcx)
	vmovaps	%zmm13, 704(%rax,%rcx)
	vmovaps	%zmm6, 640(%rax,%rcx)
	vmovaps	%zmm14, 832(%rax,%rcx)
	vmovaps	%zmm7, 768(%rax,%rcx)
	vmovaps	%zmm15, 960(%rax,%rcx)
	vmovaps	%zmm8, 896(%rax,%rcx)
	.loc	35 32 8
	xorl	%eax, %eax
	.loc	35 32 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp123:
.Lfunc_end34:
	.size	main$async_dispatch_74_batch_matmul_1x16x32x37_f32, .Lfunc_end34-main$async_dispatch_74_batch_matmul_1x16x32x37_f32
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI35_0:
	.long	0x3d000000
.LCPI35_1:
	.long	0x2b8cbccc
.LCPI35_2:
	.long	0x3f800000
	.section	".text.main$async_dispatch_76_reduction_16x32_f32","ax",@progbits
	.prefalign	16
	.type	main$async_dispatch_76_reduction_16x32_f32,@function
main$async_dispatch_76_reduction_16x32_f32:
.Lfunc_begin35:
	.file	36 "/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm" "module_main$async_dispatch_76.mlir"
	.loc	36 1 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp124:
	.loc	36 16 8 prologue_end
	movq	32(%rsi), %rcx
	.loc	36 22 8
	movl	(%rdx), %edx
	movb	$1, %r9b
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r8d, %r8d
	.loc	36 16 8
	movq	(%rcx), %rax
	.loc	36 17 8
	movq	8(%rcx), %rcx
	movq	%rdx, %rsi
	shlq	$8, %rsi
	leaq	2048(%rax,%rsi), %rsi
	.loc	36 16 8
	addq	$2048, %rax
	.loc	36 0 8 is_stmt 0
.Ltmp125:
	.p2align	4
.LBB35_1:
	.loc	36 22 8 is_stmt 1
	vmovaps	(%rsi,%r8,4), %zmm1
	vmovaps	128(%rsi,%r8,4), %zmm2
	movl	%r9d, %edi
	movl	$16, %r8d
	xorl	%r9d, %r9d
	.loc	36 25 10
	vmulps	%zmm1, %zmm1, %zmm1
	vmulps	%zmm2, %zmm2, %zmm2
	vaddss	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm1, %xmm4
	vmovshdup	%xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vshufps	$255, %xmm1, %xmm1, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf128	$1, %ymm1, %xmm4
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vextractf32x4	$2, %zmm1, %xmm4
	vextractf32x4	$3, %zmm1, %xmm1
	vmovshdup	%xmm4, %xmm5
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5
	vshufps	$255, %xmm4, %xmm4, %xmm4
	vaddss	%xmm5, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4
	vshufps	$255, %xmm1, %xmm1, %xmm1
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm1
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf128	$1, %ymm2, %xmm3
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vextractf32x4	$2, %zmm2, %xmm3
	vextractf32x4	$3, %zmm2, %xmm2
	vmovshdup	%xmm3, %xmm4
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm3, %xmm3, %xmm4
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovshdup	%xmm2, %xmm3
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vshufpd	$1, %xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0
	.loc	36 22 8
	testb	$1, %dil
	jne	.LBB35_1
	.loc	36 30 10
	vmulps	.LCPI35_0(%rip){1to4}, %xmm0, %xmm0
	.loc	36 32 10
	vbroadcastss	.LCPI35_2(%rip), %xmm1
	shlq	$6, %rdx
	movb	$1, %r8b
	leaq	__constant_32xf32_0_9(%rip), %rdi
	xorl	%esi, %esi
	vxorps	%xmm2, %xmm2, %xmm2
	.loc	36 31 10
	vaddps	.LCPI35_1(%rip){1to4}, %xmm0, %xmm0
	.loc	36 32 10
	vsqrtps	%xmm0, %xmm0
	vdivps	%xmm0, %xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm0
	vmovshdup	%xmm1, %xmm1
	vbroadcastss	%xmm1, %zmm1
	.loc	36 0 10 is_stmt 0
.Ltmp126:
	.p2align	4
.LBB35_3:
	.loc	36 28 8 is_stmt 1
	vmovaps	(%rdi,%rsi,4), %zmm3
	orq	%rdx, %rsi
	movl	%r8d, %r9d
	xorl	%r8d, %r8d
	.loc	36 33 10
	vmulps	(%rax,%rsi,4), %zmm0, %zmm4
	vmulps	128(%rax,%rsi,4), %zmm1, %zmm5
	.loc	36 35 10
	vfmadd213ps	%zmm2, %zmm3, %zmm4
	vfmadd213ps	%zmm2, %zmm3, %zmm5
	.loc	36 28 8
	vmovaps	%zmm4, (%rcx,%rsi,4)
	vmovaps	%zmm5, 128(%rcx,%rsi,4)
	movl	$16, %esi
	testb	$1, %r9b
	jne	.LBB35_3
	.loc	36 39 8
	xorl	%eax, %eax
	.loc	36 39 8 epilogue_begin is_stmt 0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Ltmp127:
.Lfunc_end35:
	.size	main$async_dispatch_76_reduction_16x32_f32, .Lfunc_end35-main$async_dispatch_76_reduction_16x32_f32
	.cfi_endproc

	.section	.text.iree_hal_executable_library_query,"ax",@progbits
	.globl	iree_hal_executable_library_query
	.prefalign	16
	.type	iree_hal_executable_library_query,@function
iree_hal_executable_library_query:
.Liree_hal_executable_library_query$local:
	.type	.Liree_hal_executable_library_query$local,@function
.Lfunc_begin36:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	$6, %edi
	leaq	iree_hal_executable_library_query_v0(%rip), %rcx
	cmoveq	%rcx, %rax
	retq
.Lfunc_end36:
	.size	iree_hal_executable_library_query, .Lfunc_end36-iree_hal_executable_library_query
	.size	.Liree_hal_executable_library_query$local, .Lfunc_end36-iree_hal_executable_library_query
	.cfi_endproc

	.section	.text.iree_h2f_ieee,"ax",@progbits
	.prefalign	16
	.type	iree_h2f_ieee,@function
iree_h2f_ieee:
.Lfunc_begin37:
	.cfi_startproc
	movl	%edi, %eax
	andl	$32768, %eax
	movl	%edi, %edx
	movl	%edi, %ecx
	andl	$1023, %ecx
	shll	$16, %eax
	andw	$31744, %dx
	je	.LBB37_6
	andl	$31744, %edi
	cmpl	$31744, %edi
	jne	.LBB37_5
	testw	%cx, %cx
	je	.LBB37_4
	orl	$2143289344, %eax
	vmovd	%eax, %xmm0
	retq
.LBB37_6:
	movzwl	%cx, %ecx
	orl	$864026624, %eax
	vcvtsi2ss	%ecx, %xmm15, %xmm0
	vmovd	%eax, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.LBB37_5:
	movzwl	%cx, %ecx
	movzwl	%dx, %edx
	addl	%ecx, %edx
	shll	$13, %edx
	leal	939524096(%rdx,%rax), %eax
	vmovd	%eax, %xmm0
	retq
.LBB37_4:
	orl	$2139095040, %eax
	vmovd	%eax, %xmm0
	retq
.Lfunc_end37:
	.size	iree_h2f_ieee, .Lfunc_end37-iree_h2f_ieee
	.cfi_endproc

	.section	.text.iree_f2h_ieee,"ax",@progbits
	.prefalign	16
	.type	iree_f2h_ieee,@function
iree_f2h_ieee:
.Lfunc_begin38:
	.cfi_startproc
	vmovd	%xmm0, %esi
	movl	%esi, %eax
	shrl	$16, %eax
	movl	%esi, %ecx
	andl	$2139095040, %ecx
	je	.LBB38_1
	movl	%esi, %edx
	andl	$8388607, %edx
	cmpl	$2139095040, %ecx
	jne	.LBB38_6
	testl	%edx, %edx
	je	.LBB38_4
	orl	$32767, %eax
	retq
.LBB38_1:
	movl	%ecx, %edi
.LBB38_9:
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.LBB38_6:
	movl	$31744, %edi
	cmpl	$1191182336, %ecx
	ja	.LBB38_9
	xorl	%edi, %edi
	cmpl	$947912704, %ecx
	jb	.LBB38_9
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
.LBB38_4:
	movl	$31744, %edi
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.Lfunc_end38:
	.size	iree_f2h_ieee, .Lfunc_end38-iree_f2h_ieee
	.cfi_endproc

	.section	.text.__gnu_h2f_ieee,"ax",@progbits
	.prefalign	16
	.type	__gnu_h2f_ieee,@function
__gnu_h2f_ieee:
.Lfunc_begin39:
	.cfi_startproc
	movl	%edi, %eax
	andl	$32768, %eax
	movl	%edi, %edx
	movl	%edi, %ecx
	andl	$1023, %ecx
	shll	$16, %eax
	andw	$31744, %dx
	je	.LBB39_6
	andl	$31744, %edi
	cmpl	$31744, %edi
	jne	.LBB39_5
	testw	%cx, %cx
	je	.LBB39_4
	orl	$2143289344, %eax
	vmovd	%eax, %xmm0
	retq
.LBB39_6:
	movzwl	%cx, %ecx
	orl	$864026624, %eax
	vcvtsi2ss	%ecx, %xmm15, %xmm0
	vmovd	%eax, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.LBB39_5:
	movzwl	%cx, %ecx
	movzwl	%dx, %edx
	addl	%ecx, %edx
	shll	$13, %edx
	leal	939524096(%rdx,%rax), %eax
	vmovd	%eax, %xmm0
	retq
.LBB39_4:
	orl	$2139095040, %eax
	vmovd	%eax, %xmm0
	retq
.Lfunc_end39:
	.size	__gnu_h2f_ieee, .Lfunc_end39-__gnu_h2f_ieee
	.cfi_endproc

	.section	.text.__extendhfsf2,"ax",@progbits
	.prefalign	16
	.type	__extendhfsf2,@function
__extendhfsf2:
.Lfunc_begin40:
	.cfi_startproc
	vmovd	%xmm0, %ecx
	movl	%ecx, %eax
	shll	$16, %eax
	movl	%ecx, %edx
	andl	$1023, %edx
	movl	%ecx, %esi
	andl	$-2147483648, %eax
	andl	$31744, %esi
	je	.LBB40_6
	cmpl	$31744, %esi
	jne	.LBB40_5
	testw	%dx, %dx
	je	.LBB40_4
	orl	$2143289344, %eax
	vmovd	%eax, %xmm0
	retq
.LBB40_6:
	movzwl	%dx, %ecx
	orl	$864026624, %eax
	vcvtsi2ss	%ecx, %xmm15, %xmm0
	vmovd	%eax, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.LBB40_5:
	andl	$32767, %ecx
	shll	$13, %ecx
	leal	939524096(%rcx,%rax), %eax
	vmovd	%eax, %xmm0
	retq
.LBB40_4:
	orl	$2139095040, %eax
	vmovd	%eax, %xmm0
	retq
.Lfunc_end40:
	.size	__extendhfsf2, .Lfunc_end40-__extendhfsf2
	.cfi_endproc

	.section	.text.__gnu_f2h_ieee,"ax",@progbits
	.prefalign	16
	.type	__gnu_f2h_ieee,@function
__gnu_f2h_ieee:
.Lfunc_begin41:
	.cfi_startproc
	vmovd	%xmm0, %esi
	movl	%esi, %eax
	shrl	$16, %eax
	movl	%esi, %ecx
	andl	$2139095040, %ecx
	je	.LBB41_1
	movl	%esi, %edx
	andl	$8388607, %edx
	cmpl	$2139095040, %ecx
	jne	.LBB41_6
	testl	%edx, %edx
	je	.LBB41_4
	orl	$32767, %eax
	retq
.LBB41_1:
	movl	%ecx, %edi
.LBB41_9:
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.LBB41_6:
	movl	$31744, %edi
	cmpl	$1191182336, %ecx
	ja	.LBB41_9
	xorl	%edi, %edi
	cmpl	$947912704, %ecx
	jb	.LBB41_9
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
.LBB41_4:
	movl	$31744, %edi
	andl	$32768, %eax
	orl	%edi, %eax
	retq
.Lfunc_end41:
	.size	__gnu_f2h_ieee, .Lfunc_end41-__gnu_f2h_ieee
	.cfi_endproc

	.section	.text.__truncsfhf2,"ax",@progbits
	.prefalign	16
	.type	__truncsfhf2,@function
__truncsfhf2:
.Lfunc_begin42:
	.cfi_startproc
	vmovd	%xmm0, %esi
	movl	%esi, %eax
	shrl	$16, %eax
	movl	%esi, %ecx
	andl	$2139095040, %ecx
	je	.LBB42_1
	movl	%esi, %edx
	andl	$8388607, %edx
	cmpl	$2139095040, %ecx
	jne	.LBB42_6
	testl	%edx, %edx
	je	.LBB42_4
	orl	$32767, %eax
	movw	%ax, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	retq
.LBB42_1:
	movl	%ecx, %edi
	jmp	.LBB42_9
.LBB42_6:
	movl	$31744, %edi
	cmpl	$1191182336, %ecx
	ja	.LBB42_9
	xorl	%edi, %edi
	cmpl	$947912704, %ecx
	jb	.LBB42_9
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
	jmp	.LBB42_9
.LBB42_4:
	movl	$31744, %edi
.LBB42_9:
	andl	$32768, %eax
	orl	%edi, %eax
	movw	%ax, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	retq
.Lfunc_end42:
	.size	__truncsfhf2, .Lfunc_end42-__truncsfhf2
	.cfi_endproc

	.section	.text.__extendhfdf2,"ax",@progbits
	.prefalign	16
	.type	__extendhfdf2,@function
__extendhfdf2:
.Lfunc_begin43:
	.cfi_startproc
	vmovd	%xmm0, %ecx
	movl	%ecx, %eax
	shll	$16, %eax
	movl	%ecx, %edx
	andl	$1023, %edx
	movl	%ecx, %esi
	andl	$-2147483648, %eax
	andl	$31744, %esi
	je	.LBB43_6
	cmpl	$31744, %esi
	jne	.LBB43_5
	testw	%dx, %dx
	je	.LBB43_4
	orl	$2143289344, %eax
	vmovd	%eax, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	retq
.LBB43_6:
	movzwl	%dx, %ecx
	orl	$864026624, %eax
	vcvtsi2ss	%ecx, %xmm15, %xmm0
	vmovd	%eax, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	retq
.LBB43_5:
	andl	$32767, %ecx
	shll	$13, %ecx
	leal	939524096(%rcx,%rax), %eax
	vmovd	%eax, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	retq
.LBB43_4:
	orl	$2139095040, %eax
	vmovd	%eax, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	retq
.Lfunc_end43:
	.size	__extendhfdf2, .Lfunc_end43-__extendhfdf2
	.cfi_endproc

	.section	.text.__truncdfhf2,"ax",@progbits
	.prefalign	16
	.type	__truncdfhf2,@function
__truncdfhf2:
.Lfunc_begin44:
	.cfi_startproc
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %esi
	movl	%esi, %eax
	shrl	$16, %eax
	movl	%esi, %ecx
	andl	$2139095040, %ecx
	je	.LBB44_1
	movl	%esi, %edx
	andl	$8388607, %edx
	cmpl	$2139095040, %ecx
	jne	.LBB44_6
	testl	%edx, %edx
	je	.LBB44_4
	orl	$32767, %eax
	movw	%ax, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	retq
.LBB44_1:
	movl	%ecx, %edi
	jmp	.LBB44_9
.LBB44_6:
	movl	$31744, %edi
	cmpl	$1191182336, %ecx
	ja	.LBB44_9
	xorl	%edi, %edi
	cmpl	$947912704, %ecx
	jb	.LBB44_9
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
	jmp	.LBB44_9
.LBB44_4:
	movl	$31744, %edi
.LBB44_9:
	andl	$32768, %eax
	orl	%edi, %eax
	movw	%ax, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	retq
.Lfunc_end44:
	.size	__truncdfhf2, .Lfunc_end44-__truncdfhf2
	.cfi_endproc

	.section	.text.fma,"ax",@progbits
	.prefalign	16
	.type	fma,@function
fma:
.Lfunc_begin45:
	.cfi_startproc
	vfmadd213sd	%xmm2, %xmm1, %xmm0
	retq
.Lfunc_end45:
	.size	fma, .Lfunc_end45-fma
	.cfi_endproc

	.section	.text.__math_invalidf,"ax",@progbits
	.prefalign	16
	.type	__math_invalidf,@function
__math_invalidf:
.Lfunc_begin46:
	.cfi_startproc
	vsubss	%xmm0, %xmm0, %xmm0
	vdivss	%xmm0, %xmm0, %xmm0
	retq
.Lfunc_end46:
	.size	__math_invalidf, .Lfunc_end46-__math_invalidf
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	2, 0x0
.LCPI47_0:
	.long	0xf0000000
	.long	0x70000000
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI47_1:
	.long	0x70000000
	.section	.text.__math_oflowf,"ax",@progbits
	.prefalign	16
	.type	__math_oflowf,@function
__math_oflowf:
.Lfunc_begin47:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	leaq	.LCPI47_0(%rip), %rcx
	sete	%al
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	vmulss	.LCPI47_1(%rip), %xmm0, %xmm0
	retq
.Lfunc_end47:
	.size	__math_oflowf, .Lfunc_end47-__math_oflowf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI48_0:
	.long	0x80000000
	.section	.text.__math_xflowf,"ax",@progbits
	.prefalign	16
	.type	__math_xflowf,@function
__math_xflowf:
.Lfunc_begin48:
	.cfi_startproc
	vxorps	.LCPI48_0(%rip){1to4}, %xmm0, %xmm1
	testl	%edi, %edi
	sete	%al
	kmovd	%eax, %k1
	vmovss	%xmm0, %xmm1, %xmm1 {%k1}
	vmovss	%xmm1, -4(%rsp)
	vmulss	-4(%rsp), %xmm0, %xmm0
	retq
.Lfunc_end48:
	.size	__math_xflowf, .Lfunc_end48-__math_xflowf
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	2, 0x0
.LCPI49_0:
	.long	0x90000000
	.long	0x10000000
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI49_1:
	.long	0x10000000
	.section	.text.__math_uflowf,"ax",@progbits
	.prefalign	16
	.type	__math_uflowf,@function
__math_uflowf:
.Lfunc_begin49:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	leaq	.LCPI49_0(%rip), %rcx
	sete	%al
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	%xmm0, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	vmulss	.LCPI49_1(%rip), %xmm0, %xmm0
	retq
.Lfunc_end49:
	.size	__math_uflowf, .Lfunc_end49-__math_uflowf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI50_0:
	.long	0x7b800000
.LCPI50_1:
	.long	0x80000000
.LCPI50_2:
	.long	0x3f800000
	.section	.text.ceilf,"ax",@progbits
	.prefalign	16
	.type	ceilf,@function
ceilf:
.Lfunc_begin50:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	$2071, %ecx
	bextrl	%ecx, %eax, %ecx
	cmpl	$149, %ecx
	ja	.LBB50_7
	cmpl	$127, %ecx
	jb	.LBB50_4
	addl	$-127, %ecx
	movl	$8388607, %edx
	shrxl	%ecx, %edx, %edx
	testl	%eax, %edx
	je	.LBB50_7
	vaddss	.LCPI50_0(%rip), %xmm0, %xmm0
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
.LBB50_4:
	vaddss	.LCPI50_0(%rip), %xmm0, %xmm1
	vmovss	%xmm1, -4(%rsp)
	testl	%eax, %eax
	js	.LBB50_5
	vmovss	.LCPI50_2(%rip), %xmm1
	sete	%al
	kmovd	%eax, %k1
	vmovss	%xmm0, %xmm1, %xmm1 {%k1}
	vmovaps	%xmm1, %xmm0
.LBB50_7:
	retq
.LBB50_5:
	vmovss	.LCPI50_1(%rip), %xmm0
	retq
.Lfunc_end50:
	.size	ceilf, .Lfunc_end50-ceilf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI51_0:
	.long	0xff800000
.LCPI51_1:
	.long	0x42b17217
.LCPI51_2:
	.long	0xc2cff1b4
.LCPI51_3:
	.long	0x10000000
.LCPI51_4:
	.long	0x70000000
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI51_5:
	.quad	0x40471547652b82fe
.LCPI51_6:
	.quad	0x4338000000000000
.LCPI51_7:
	.quad	0xc338000000000000
.LCPI51_8:
	.quad	0x3ebc6af84b912394
.LCPI51_9:
	.quad	0x3f2ebfce50fac4f3
.LCPI51_10:
	.quad	0x3f962e42ff0c52d6
.LCPI51_11:
	.quad	0x3ff0000000000000
	.section	.text.expf,"ax",@progbits
	.prefalign	16
	.type	expf,@function
expf:
.Lfunc_begin51:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	$2836, %ecx
	bextrl	%ecx, %eax, %eax
	cmpl	$1067, %eax
	jae	.LBB51_1
.LBB51_8:
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	.LCPI51_5(%rip), %xmm0, %xmm0
	vmovsd	.LCPI51_8(%rip), %xmm2
	vmovsd	.LCPI51_10(%rip), %xmm4
	leaq	__exp2f_data(%rip), %rdx
	vaddsd	.LCPI51_6(%rip), %xmm0, %xmm1
	vmovq	%xmm1, %rax
	vaddsd	.LCPI51_7(%rip), %xmm1, %xmm1
	movl	%eax, %ecx
	andl	$31, %ecx
	shlq	$47, %rax
	addq	(%rdx,%rcx,8), %rax
	vsubsd	%xmm1, %xmm0, %xmm0
	vfmadd213sd	.LCPI51_9(%rip), %xmm0, %xmm2
	vfmadd213sd	.LCPI51_11(%rip), %xmm0, %xmm4
	vmovq	%rax, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm3
	vfmadd231sd	%xmm3, %xmm2, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm1
.LBB51_9:
	vmovaps	%xmm1, %xmm0
	retq
.LBB51_1:
	vmovss	.LCPI51_0(%rip), %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm0, %xmm2
	jae	.LBB51_9
	cmpl	$2040, %eax
	jae	.LBB51_3
	vucomiss	.LCPI51_1(%rip), %xmm0
	jbe	.LBB51_6
	movl	$1879048192, -8(%rsp)
	vmovss	-8(%rsp), %xmm0
	vmulss	.LCPI51_4(%rip), %xmm0, %xmm0
	retq
.LBB51_3:
	vaddss	%xmm0, %xmm0, %xmm0
	retq
.LBB51_6:
	vmovss	.LCPI51_2(%rip), %xmm1
	vucomiss	%xmm0, %xmm1
	jbe	.LBB51_8
	movl	$268435456, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	vmulss	.LCPI51_3(%rip), %xmm0, %xmm0
	retq
.Lfunc_end51:
	.size	expf, .Lfunc_end51-expf
	.cfi_endproc

	.section	.text.feclearexcept,"ax",@progbits
	.prefalign	16
	.type	feclearexcept,@function
feclearexcept:
.Lfunc_begin52:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end52:
	.size	feclearexcept, .Lfunc_end52-feclearexcept
	.cfi_endproc

	.section	.text.feraiseexcept,"ax",@progbits
	.prefalign	16
	.type	feraiseexcept,@function
feraiseexcept:
.Lfunc_begin53:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end53:
	.size	feraiseexcept, .Lfunc_end53-feraiseexcept
	.cfi_endproc

	.section	.text.fetestexcept,"ax",@progbits
	.prefalign	16
	.type	fetestexcept,@function
fetestexcept:
.Lfunc_begin54:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end54:
	.size	fetestexcept, .Lfunc_end54-fetestexcept
	.cfi_endproc

	.section	.text.fegetround,"ax",@progbits
	.prefalign	16
	.type	fegetround,@function
fegetround:
.Lfunc_begin55:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end55:
	.size	fegetround, .Lfunc_end55-fegetround
	.cfi_endproc

	.section	.text.__fesetround,"ax",@progbits
	.prefalign	16
	.type	__fesetround,@function
__fesetround:
.Lfunc_begin56:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end56:
	.size	__fesetround, .Lfunc_end56-__fesetround
	.cfi_endproc

	.section	.text.fegetenv,"ax",@progbits
	.prefalign	16
	.type	fegetenv,@function
fegetenv:
.Lfunc_begin57:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end57:
	.size	fegetenv, .Lfunc_end57-fegetenv
	.cfi_endproc

	.section	.text.fesetenv,"ax",@progbits
	.prefalign	16
	.type	fesetenv,@function
fesetenv:
.Lfunc_begin58:
	.cfi_startproc
	xorl	%eax, %eax
	retq
.Lfunc_end58:
	.size	fesetenv, .Lfunc_end58-fesetenv
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI59_0:
	.long	0x7b800000
.LCPI59_1:
	.long	0xbf800000
	.section	.text.floorf,"ax",@progbits
	.prefalign	16
	.type	floorf,@function
floorf:
.Lfunc_begin59:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	$2071, %ecx
	bextrl	%ecx, %eax, %ecx
	cmpl	$149, %ecx
	jbe	.LBB59_1
	retq
.LBB59_1:
	cmpl	$127, %ecx
	jb	.LBB59_4
	addl	$-127, %ecx
	movl	$8388607, %edx
	shrxl	%ecx, %edx, %edx
	testl	%eax, %edx
	je	.LBB59_6
	vaddss	.LCPI59_0(%rip), %xmm0, %xmm0
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
.LBB59_4:
	vaddss	.LCPI59_0(%rip), %xmm0, %xmm1
	vmovss	%xmm1, -4(%rsp)
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%eax, %eax
	jns	.LBB59_5
	vucomiss	%xmm1, %xmm0
	vmovaps	%xmm0, %xmm1
	jne	.LBB59_8
	jp	.LBB59_8
.LBB59_5:
	vmovaps	%xmm1, %xmm0
.LBB59_6:
	retq
.LBB59_8:
	vmovss	.LCPI59_1(%rip), %xmm1
	vmovaps	%xmm1, %xmm0
	retq
.Lfunc_end59:
	.size	floorf, .Lfunc_end59-floorf
	.cfi_endproc

	.section	.text.fmaf,"ax",@progbits
	.prefalign	16
	.type	fmaf,@function
fmaf:
.Lfunc_begin60:
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
	jne	.LBB60_4
	vsubsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	jne	.LBB60_3
	jp	.LBB60_3
	vsubsd	%xmm2, %xmm0, %xmm3
	vucomisd	%xmm1, %xmm3
	jne	.LBB60_3
	jp	.LBB60_3
.LBB60_4:
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	retq
.LBB60_3:
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
.Lfunc_end60:
	.size	fmaf, .Lfunc_end60-fmaf
	.cfi_endproc

	.section	.text.fmodf,"ax",@progbits
	.prefalign	16
	.type	fmodf,@function
fmodf:
.Lfunc_begin61:
	.cfi_startproc
	vmovd	%xmm1, %edx
	movl	%edx, %esi
	addl	%edx, %esi
	je	.LBB61_2
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
	jne	.LBB61_3
.LBB61_2:
	vmulss	%xmm1, %xmm0, %xmm0
	vdivss	%xmm0, %xmm0, %xmm0
	retq
.LBB61_3:
	leal	(%rax,%rax), %r8d
	cmpl	%esi, %r8d
	jbe	.LBB61_4
	bextrl	%edi, %edx, %edi
	testl	%ecx, %ecx
	je	.LBB61_6
	movl	%eax, %esi
	andl	$8388607, %esi
	orl	$8388608, %esi
	testl	%edi, %edi
	je	.LBB61_11
.LBB61_14:
	andl	$8388607, %edx
	orl	$8388608, %edx
	cmpl	%edi, %ecx
	jg	.LBB61_16
.LBB61_21:
	movl	%esi, %edi
	subl	%edx, %edi
	jns	.LBB61_22
	jmp	.LBB61_23
.LBB61_4:
	vpxor	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm1
	sete	%al
	kmovd	%eax, %k1
	vmovss	%xmm1, %xmm0, %xmm0 {%k1}
	retq
.LBB61_6:
	movl	%eax, %esi
	xorl	%ecx, %ecx
	shll	$9, %esi
	js	.LBB61_8
	.p2align	4
.LBB61_7:
	decl	%ecx
	addl	%esi, %esi
	jns	.LBB61_7
.LBB61_8:
	movb	$1, %sil
	subb	%cl, %sil
	shlxl	%esi, %eax, %esi
	testl	%edi, %edi
	jne	.LBB61_14
.LBB61_11:
	movl	%edx, %r8d
	xorl	%edi, %edi
	shll	$9, %r8d
	js	.LBB61_13
	.p2align	4
.LBB61_12:
	decl	%edi
	addl	%r8d, %r8d
	jns	.LBB61_12
.LBB61_13:
	movb	$1, %r8b
	subb	%dil, %r8b
	shlxl	%r8d, %edx, %edx
	cmpl	%edi, %ecx
	jg	.LBB61_16
	jmp	.LBB61_21
	.p2align	4
.LBB61_19:
	addl	%esi, %esi
	decl	%ecx
	cmpl	%edi, %ecx
	jle	.LBB61_20
.LBB61_16:
	movl	%esi, %r8d
	subl	%edx, %r8d
	js	.LBB61_19
	movl	%r8d, %esi
	jne	.LBB61_19
	jmp	.LBB61_18
.LBB61_20:
	movl	%edi, %ecx
	movl	%esi, %edi
	subl	%edx, %edi
	js	.LBB61_23
.LBB61_22:
	movl	%edi, %esi
	je	.LBB61_18
.LBB61_23:
	cmpl	$8388607, %esi
	ja	.LBB61_24
	.p2align	4
.LBB61_25:
	leal	(%rsi,%rsi), %edx
	decl	%ecx
	cmpl	$4194304, %esi
	movl	%edx, %esi
	jb	.LBB61_25
	andl	$-2147483648, %eax
	testl	%ecx, %ecx
	jle	.LBB61_28
.LBB61_27:
	addl	$-8388608, %edx
	shll	$23, %ecx
	orl	%edx, %ecx
	orl	%eax, %ecx
	vmovd	%ecx, %xmm0
	retq
.LBB61_18:
	vpxor	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.LBB61_24:
	movl	%esi, %edx
	andl	$-2147483648, %eax
	testl	%ecx, %ecx
	jg	.LBB61_27
.LBB61_28:
	movb	$1, %sil
	subb	%cl, %sil
	shrxl	%esi, %edx, %ecx
	orl	%eax, %ecx
	vmovd	%ecx, %xmm0
	retq
.Lfunc_end61:
	.size	fmodf, .Lfunc_end61-fmodf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI62_0:
	.long	0x5f800000
	.section	.text.frexpf,"ax",@progbits
	.prefalign	16
	.type	frexpf,@function
frexpf:
.Lfunc_begin62:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	%eax, %ecx
	shrl	$23, %ecx
	cmpb	$-1, %cl
	je	.LBB62_7
	movzbl	%cl, %edx
	testl	%edx, %edx
	jne	.LBB62_6
	vxorps	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm0
	jne	.LBB62_4
	jnp	.LBB62_3
.LBB62_4:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	vmulss	.LCPI62_0(%rip), %xmm0, %xmm0
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
.LBB62_6:
	andl	$-2139095041, %eax
	movzbl	%cl, %ecx
	orl	$1056964608, %eax
	addl	$-126, %ecx
	vmovd	%eax, %xmm0
	movl	%ecx, (%rdi)
.LBB62_7:
	retq
.LBB62_3:
	xorl	%eax, %eax
	movl	%eax, (%rdi)
	retq
.Lfunc_end62:
	.size	frexpf, .Lfunc_end62-frexpf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI63_0:
	.long	0x0c800000
.LCPI63_1:
	.long	0x7f000000
	.section	.text.ldexpf,"ax",@progbits
	.prefalign	16
	.type	ldexpf,@function
ldexpf:
.Lfunc_begin63:
	.cfi_startproc
	cmpl	$128, %edi
	jl	.LBB63_4
	vmulss	.LCPI63_1(%rip), %xmm0, %xmm0
	cmpl	$255, %edi
	jb	.LBB63_2
	vmulss	.LCPI63_1(%rip), %xmm0, %xmm0
	cmpl	$381, %edi
	movl	$381, %eax
	cmovbl	%edi, %eax
	addl	$-254, %eax
	jmp	.LBB63_8
.LBB63_4:
	cmpl	$-127, %edi
	jg	.LBB63_9
	vmulss	.LCPI63_0(%rip), %xmm0, %xmm0
	cmpl	$-229, %edi
	ja	.LBB63_6
	vmulss	.LCPI63_0(%rip), %xmm0, %xmm0
	cmpl	$-329, %edi
	movl	$-330, %eax
	cmovael	%edi, %eax
	addl	$204, %eax
.LBB63_8:
	movl	%eax, %edi
	jmp	.LBB63_9
.LBB63_2:
	addl	$-127, %edi
	jmp	.LBB63_9
.LBB63_6:
	addl	$102, %edi
.LBB63_9:
	shll	$23, %edi
	addl	$1065353216, %edi
	vmovd	%edi, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end63:
	.size	ldexpf, .Lfunc_end63-ldexpf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI64_0:
	.long	0x0c800000
.LCPI64_1:
	.long	0x7f000000
	.section	.text.scalbnf,"ax",@progbits
	.prefalign	16
	.type	scalbnf,@function
scalbnf:
.Lfunc_begin64:
	.cfi_startproc
	cmpl	$128, %edi
	jl	.LBB64_4
	vmulss	.LCPI64_1(%rip), %xmm0, %xmm0
	cmpl	$255, %edi
	jb	.LBB64_2
	vmulss	.LCPI64_1(%rip), %xmm0, %xmm0
	cmpl	$381, %edi
	movl	$381, %eax
	cmovbl	%edi, %eax
	addl	$-254, %eax
	jmp	.LBB64_8
.LBB64_4:
	cmpl	$-127, %edi
	jg	.LBB64_9
	vmulss	.LCPI64_0(%rip), %xmm0, %xmm0
	cmpl	$-229, %edi
	ja	.LBB64_6
	vmulss	.LCPI64_0(%rip), %xmm0, %xmm0
	cmpl	$-329, %edi
	movl	$-330, %eax
	cmovael	%edi, %eax
	addl	$204, %eax
.LBB64_8:
	movl	%eax, %edi
	jmp	.LBB64_9
.LBB64_2:
	addl	$-127, %edi
	jmp	.LBB64_9
.LBB64_6:
	addl	$102, %edi
.LBB64_9:
	shll	$23, %edi
	addl	$1065353216, %edi
	vmovd	%edi, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	retq
.Lfunc_end64:
	.size	scalbnf, .Lfunc_end64-scalbnf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI65_0:
	.long	0x3f800000
.LCPI65_1:
	.long	0x80000000
.LCPI65_2:
	.long	0x4b000000
.LCPI65_12:
	.long	0x10000000
.LCPI65_20:
	.long	0x70000000
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI65_3:
	.quad	0xbff0000000000000
.LCPI65_4:
	.quad	0x3fd27616c9496e0b
.LCPI65_5:
	.quad	0xbfd71969a075c67a
.LCPI65_6:
	.quad	0x3fdec70a6ca7badd
.LCPI65_7:
	.quad	0xbfe7154748bef6c8
.LCPI65_8:
	.quad	0x3ff71547652ab82b
.LCPI65_9:
	.quad	0x405fffffffd1d571
.LCPI65_10:
	.quad	0xc062c00000000000
.LCPI65_11:
	.long	0x90000000
	.long	0x10000000
.LCPI65_13:
	.quad	0x42e8000000000000
.LCPI65_14:
	.quad	0xc2e8000000000000
.LCPI65_15:
	.quad	0x3fac6af84b912394
.LCPI65_16:
	.quad	0x3fcebfce50fac4f3
.LCPI65_17:
	.quad	0x3fe62e42ff0c52d6
.LCPI65_18:
	.quad	0x3ff0000000000000
.LCPI65_19:
	.long	0xf0000000
	.long	0x70000000
	.section	.text.powf,"ax",@progbits
	.prefalign	16
	.type	powf,@function
powf:
.Lfunc_begin65:
	.cfi_startproc
	vmovd	%xmm0, %edx
	vmovd	%xmm1, %ecx
	leal	-2139095040(%rdx), %eax
	cmpl	$-2130706432, %eax
	jb	.LBB65_2
	leal	16777216(%rcx,%rcx), %esi
	xorl	%eax, %eax
	cmpl	$16777216, %esi
	jbe	.LBB65_2
.LBB65_24:
	leal	-1060306944(%rdx), %ecx
	vmovsd	.LCPI65_6(%rip), %xmm5
	vmovsd	.LCPI65_4(%rip), %xmm4
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
	vfmadd213sd	.LCPI65_3(%rip), %xmm0, %xmm2
	vcvtsi2sd	%ecx, %xmm15, %xmm3
	vaddsd	8(%rsi,%rdi), %xmm3, %xmm0
	movabsq	$4638426141214900225, %rsi
	vfmadd213sd	.LCPI65_7(%rip), %xmm2, %xmm5
	vfmadd231sd	.LCPI65_8(%rip), %xmm2, %xmm0
	vfmadd213sd	.LCPI65_5(%rip), %xmm2, %xmm4
	vmulsd	%xmm2, %xmm2, %xmm3
	vmulsd	%xmm3, %xmm3, %xmm6
	vfmadd231sd	%xmm5, %xmm3, %xmm0
	vfmadd231sd	%xmm6, %xmm4, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rcx
	andq	%rcx, %rdx
	cmpq	%rsi, %rdx
	jae	.LBB65_25
.LBB65_29:
	vaddsd	.LCPI65_13(%rip), %xmm0, %xmm1
	vmovsd	.LCPI65_15(%rip), %xmm2
	vmovsd	.LCPI65_17(%rip), %xmm4
	leaq	__exp2f_data(%rip), %rdx
	vmovq	%xmm1, %rcx
	vaddsd	.LCPI65_14(%rip), %xmm1, %xmm1
	addl	%ecx, %eax
	andl	$31, %ecx
	shlq	$47, %rax
	addq	(%rdx,%rcx,8), %rax
	vsubsd	%xmm1, %xmm0, %xmm0
	vfmadd213sd	.LCPI65_16(%rip), %xmm0, %xmm2
	vfmadd213sd	.LCPI65_18(%rip), %xmm0, %xmm4
	vmovq	%rax, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm3
	vfmadd231sd	%xmm3, %xmm2, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
.LBB65_30:
	retq
.LBB65_2:
	leal	(%rcx,%rcx), %eax
	leal	-1(%rax), %esi
	cmpl	$-16777217, %esi
	jae	.LBB65_3
	leal	-1(%rdx,%rdx), %eax
	cmpl	$-16777217, %eax
	jae	.LBB65_10
	xorl	%eax, %eax
	testl	%edx, %edx
	js	.LBB65_16
	cmpl	$8388607, %edx
	ja	.LBB65_24
.LBB65_23:
	vmulss	.LCPI65_2(%rip), %xmm0, %xmm0
	vmovd	%xmm0, %edx
	andl	$2147483647, %edx
	addl	$-192937984, %edx
	jmp	.LBB65_24
.LBB65_25:
	vucomisd	.LCPI65_9(%rip), %xmm0
	jbe	.LBB65_27
	xorl	%ecx, %ecx
	testl	%eax, %eax
	leaq	.LCPI65_19(%rip), %rax
	sete	%cl
	vmovss	(%rax,%rcx,4), %xmm0
	vmovss	%xmm0, -8(%rsp)
	vmovss	-8(%rsp), %xmm0
	vmulss	.LCPI65_20(%rip), %xmm0, %xmm0
	retq
.LBB65_16:
	movl	$2071, %eax
	bextrl	%eax, %ecx, %eax
	cmpl	$127, %eax
	jb	.LBB65_31
	cmpl	$150, %eax
	jbe	.LBB65_18
.LBB65_20:
	xorl	%eax, %eax
.LBB65_21:
	vmovd	%xmm0, %edx
	andl	$2147483647, %edx
	cmpl	$8388607, %edx
	ja	.LBB65_24
	jmp	.LBB65_23
.LBB65_27:
	vmovsd	.LCPI65_10(%rip), %xmm1
	vucomisd	%xmm0, %xmm1
	jb	.LBB65_29
	xorl	%ecx, %ecx
	testl	%eax, %eax
	leaq	.LCPI65_11(%rip), %rax
	sete	%cl
	vmovss	(%rax,%rcx,4), %xmm0
	vmovss	%xmm0, -4(%rsp)
	vmovss	-4(%rsp), %xmm0
	vmulss	.LCPI65_12(%rip), %xmm0, %xmm0
	retq
.LBB65_18:
	movb	$-106, %dl
	subb	%al, %dl
	bzhil	%edx, %ecx, %eax
	je	.LBB65_19
.LBB65_31:
	vsubss	%xmm0, %xmm0, %xmm0
	vdivss	%xmm0, %xmm0, %xmm0
	retq
.LBB65_19:
	movl	$1, %eax
	shlxl	%edx, %eax, %edx
	movl	$65536, %eax
	testl	%ecx, %edx
	jne	.LBB65_21
	jmp	.LBB65_20
.LBB65_3:
	vmovdqa	%xmm0, %xmm2
	vmovss	.LCPI65_0(%rip), %xmm0
	cmpl	$1065353216, %edx
	je	.LBB65_30
	testl	%eax, %eax
	je	.LBB65_30
	addl	%edx, %edx
	cmpl	$-16777215, %edx
	setb	%sil
	cmpl	$-16777215, %eax
	setb	%al
	testb	%al, %sil
	jne	.LBB65_7
	vaddss	%xmm1, %xmm2, %xmm0
	retq
.LBB65_10:
	vmulss	%xmm0, %xmm0, %xmm0
	testl	%edx, %edx
	jns	.LBB65_13
	movl	$2071, %eax
	bextrl	%eax, %ecx, %eax
	leal	-151(%rax), %edx
	cmpl	$-24, %edx
	jb	.LBB65_13
	vxorps	.LCPI65_1(%rip){1to4}, %xmm0, %xmm1
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
.LBB65_13:
	testl	%ecx, %ecx
	jns	.LBB65_30
	vmovss	.LCPI65_0(%rip), %xmm1
	vdivss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -12(%rsp)
	vmovss	-12(%rsp), %xmm0
	retq
.LBB65_7:
	cmpl	$2130706432, %edx
	je	.LBB65_30
	setb	%al
	testl	%ecx, %ecx
	vmulss	%xmm1, %xmm1, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	sets	%cl
	xorb	%al, %cl
	kmovd	%ecx, %k1
	vmovss	%xmm1, %xmm0, %xmm0 {%k1}
	retq
.Lfunc_end65:
	.size	powf, .Lfunc_end65-powf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI66_0:
	.long	0xcb000000
.LCPI66_1:
	.long	0x4b000000
.LCPI66_2:
	.long	0x80000000
	.section	.text.rintf,"ax",@progbits
	.prefalign	16
	.type	rintf,@function
rintf:
.Lfunc_begin66:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	%eax, %ecx
	andl	$2130706432, %ecx
	cmpl	$1249902592, %ecx
	ja	.LBB66_4
	vmovss	.LCPI66_0(%rip), %xmm2
	vmovss	.LCPI66_1(%rip), %xmm3
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
	jne	.LBB66_2
	jp	.LBB66_2
	vmovss	.LCPI66_2(%rip), %xmm0
	testl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	setns	%al
	kmovd	%eax, %k1
	vmovss	%xmm1, %xmm0, %xmm0 {%k1}
.LBB66_4:
	retq
.LBB66_2:
	vmovaps	%xmm1, %xmm0
	retq
.Lfunc_end66:
	.size	rintf, .Lfunc_end66-rintf
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI67_0:
	.long	0x7fffffff
.LCPI67_1:
	.long	0x4b000000
.LCPI67_2:
	.long	0xcb000000
.LCPI67_3:
	.long	0x3f000000
.LCPI67_4:
	.long	0xbf000000
.LCPI67_5:
	.long	0x3f800000
.LCPI67_6:
	.long	0xbf800000
.LCPI67_7:
	.long	0x80000000
	.section	.text.roundf,"ax",@progbits
	.prefalign	16
	.type	roundf,@function
roundf:
.Lfunc_begin67:
	.cfi_startproc
	vmovd	%xmm0, %eax
	movl	$2071, %ecx
	bextrl	%ecx, %eax, %ecx
	cmpl	$149, %ecx
	ja	.LBB67_8
	vpandd	.LCPI67_0(%rip){1to4}, %xmm0, %xmm1
	vaddss	.LCPI67_1(%rip), %xmm1, %xmm2
	cmpl	$125, %ecx
	ja	.LBB67_3
	vxorps	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm2, -4(%rsp)
	retq
.LBB67_3:
	vaddss	.LCPI67_2(%rip), %xmm2, %xmm0
	vsubss	%xmm1, %xmm0, %xmm0
	vucomiss	.LCPI67_3(%rip), %xmm0
	jbe	.LBB67_5
	vaddss	%xmm0, %xmm1, %xmm0
	vaddss	.LCPI67_6(%rip), %xmm0, %xmm0
	jmp	.LBB67_7
.LBB67_5:
	vmovss	.LCPI67_4(%rip), %xmm2
	vucomiss	%xmm0, %xmm2
	vaddss	%xmm0, %xmm1, %xmm0
	jb	.LBB67_7
	vaddss	.LCPI67_5(%rip), %xmm0, %xmm0
.LBB67_7:
	vxorps	.LCPI67_7(%rip){1to4}, %xmm0, %xmm1
	testl	%eax, %eax
	sets	%al
	kmovd	%eax, %k1
	vmovss	%xmm1, %xmm0, %xmm0 {%k1}
.LBB67_8:
	retq
.Lfunc_end67:
	.size	roundf, .Lfunc_end67-roundf
	.cfi_endproc

	.type	__constant_32xf32_0_9,@object
	.section	.rodata.__constant_32xf32_0_9,"a",@progbits
	.p2align	6, 0x0
__constant_32xf32_0_9:
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.long	0x3f800000
	.size	__constant_32xf32_0_9, 128

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
	.quad	main$async_dispatch_0_elementwise_16_i64xi32
	.quad	main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store
	.quad	main$async_dispatch_2_elementwise_16_i64xi32
	.quad	main$async_dispatch_3_elementwise_16_i32
	.quad	main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32
	.quad	main$async_dispatch_5_reduction_16x32_f32
	.quad	main$async_dispatch_6_reduction_16x32_f32
	.quad	main$async_dispatch_7_batch_matmul_1x16x32x32_f32
	.quad	main$async_dispatch_8_elementwise_transpose_16x4x8_f32
	.quad	main$async_dispatch_12_elementwise_transpose_16x32_f32
	.quad	main$async_dispatch_13_attention_4x16x8x8x16
	.quad	main$async_dispatch_14_batch_matmul_1x16x32x32_f32
	.quad	main$async_dispatch_16_reduction_16x32_f32
	.quad	main$async_dispatch_17_batch_matmul_1x16x37x32_f32
	.quad	main$async_dispatch_18_batch_matmul_1x16x32x37_f32
	.quad	main$async_dispatch_20_reduction_16x32_f32
	.quad	main$async_dispatch_28_batch_matmul_1x16x32x32_f32
	.quad	main$async_dispatch_30_reduction_16x32_f32
	.quad	main$async_dispatch_31_batch_matmul_1x16x37x32_f32
	.quad	main$async_dispatch_32_batch_matmul_1x16x32x37_f32
	.quad	main$async_dispatch_34_reduction_16x32_f32
	.quad	main$async_dispatch_42_batch_matmul_1x16x32x32_f32
	.quad	main$async_dispatch_44_reduction_16x32_f32
	.quad	main$async_dispatch_45_batch_matmul_1x16x37x32_f32
	.quad	main$async_dispatch_46_batch_matmul_1x16x32x37_f32
	.quad	main$async_dispatch_48_reduction_16x32_f32
	.quad	main$async_dispatch_56_batch_matmul_1x16x32x32_f32
	.quad	main$async_dispatch_58_reduction_16x32_f32
	.quad	main$async_dispatch_59_batch_matmul_1x16x37x32_f32
	.quad	main$async_dispatch_60_batch_matmul_1x16x32x37_f32
	.quad	main$async_dispatch_62_reduction_16x32_f32
	.quad	main$async_dispatch_70_batch_matmul_1x16x32x32_f32
	.quad	main$async_dispatch_72_reduction_16x32_f32
	.quad	main$async_dispatch_73_batch_matmul_1x16x37x32_f32
	.quad	main$async_dispatch_74_batch_matmul_1x16x32x37_f32
	.quad	main$async_dispatch_76_reduction_16x32_f32
	.size	iree_hal_executable_library_query_v0_funcs, 288

	.type	iree_hal_executable_library_query_v0_attrs,@object
	.section	.rodata.iree_hal_executable_library_query_v0_attrs,"a",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_attrs:
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
	.byte	4
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
	.byte	2
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
	.byte	3
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
	.byte	1
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
	.size	iree_hal_executable_library_query_v0_attrs, 2304

	.type	__unnamed_2,@object
	.section	.rodata.__unnamed_2,"a",@progbits
__unnamed_2:
	.asciz	"main$async_dispatch_0_elementwise_16_i64xi32"
	.size	__unnamed_2, 45

	.type	__unnamed_3,@object
	.section	.rodata.__unnamed_3,"a",@progbits
__unnamed_3:
	.asciz	"main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store"
	.size	__unnamed_3, 58

	.type	__unnamed_4,@object
	.section	.rodata.__unnamed_4,"a",@progbits
__unnamed_4:
	.asciz	"main$async_dispatch_2_elementwise_16_i64xi32"
	.size	__unnamed_4, 45

	.type	__unnamed_5,@object
	.section	.rodata.__unnamed_5,"a",@progbits
__unnamed_5:
	.asciz	"main$async_dispatch_3_elementwise_16_i32"
	.size	__unnamed_5, 41

	.type	__unnamed_6,@object
	.section	.rodata.__unnamed_6,"a",@progbits
__unnamed_6:
	.asciz	"main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32"
	.size	__unnamed_6, 62

	.type	__unnamed_7,@object
	.section	.rodata.__unnamed_7,"a",@progbits
__unnamed_7:
	.asciz	"main$async_dispatch_5_reduction_16x32_f32"
	.size	__unnamed_7, 42

	.type	__unnamed_8,@object
	.section	.rodata.__unnamed_8,"a",@progbits
__unnamed_8:
	.asciz	"main$async_dispatch_6_reduction_16x32_f32"
	.size	__unnamed_8, 42

	.type	__unnamed_9,@object
	.section	.rodata.__unnamed_9,"a",@progbits
__unnamed_9:
	.asciz	"main$async_dispatch_7_batch_matmul_1x16x32x32_f32"
	.size	__unnamed_9, 50

	.type	__unnamed_10,@object
	.section	.rodata.__unnamed_10,"a",@progbits
__unnamed_10:
	.asciz	"main$async_dispatch_8_elementwise_transpose_16x4x8_f32"
	.size	__unnamed_10, 55

	.type	__unnamed_11,@object
	.section	.rodata.__unnamed_11,"a",@progbits
__unnamed_11:
	.asciz	"main$async_dispatch_12_elementwise_transpose_16x32_f32"
	.size	__unnamed_11, 55

	.type	__unnamed_12,@object
	.section	.rodata.__unnamed_12,"a",@progbits
__unnamed_12:
	.asciz	"main$async_dispatch_13_attention_4x16x8x8x16"
	.size	__unnamed_12, 45

	.type	__unnamed_13,@object
	.section	.rodata.__unnamed_13,"a",@progbits
__unnamed_13:
	.asciz	"main$async_dispatch_14_batch_matmul_1x16x32x32_f32"
	.size	__unnamed_13, 51

	.type	__unnamed_14,@object
	.section	.rodata.__unnamed_14,"a",@progbits
__unnamed_14:
	.asciz	"main$async_dispatch_16_reduction_16x32_f32"
	.size	__unnamed_14, 43

	.type	__unnamed_15,@object
	.section	.rodata.__unnamed_15,"a",@progbits
__unnamed_15:
	.asciz	"main$async_dispatch_17_batch_matmul_1x16x37x32_f32"
	.size	__unnamed_15, 51

	.type	__unnamed_16,@object
	.section	.rodata.__unnamed_16,"a",@progbits
__unnamed_16:
	.asciz	"main$async_dispatch_18_batch_matmul_1x16x32x37_f32"
	.size	__unnamed_16, 51

	.type	__unnamed_17,@object
	.section	.rodata.__unnamed_17,"a",@progbits
__unnamed_17:
	.asciz	"main$async_dispatch_20_reduction_16x32_f32"
	.size	__unnamed_17, 43

	.type	__unnamed_18,@object
	.section	.rodata.__unnamed_18,"a",@progbits
__unnamed_18:
	.asciz	"main$async_dispatch_28_batch_matmul_1x16x32x32_f32"
	.size	__unnamed_18, 51

	.type	__unnamed_19,@object
	.section	.rodata.__unnamed_19,"a",@progbits
__unnamed_19:
	.asciz	"main$async_dispatch_30_reduction_16x32_f32"
	.size	__unnamed_19, 43

	.type	__unnamed_20,@object
	.section	.rodata.__unnamed_20,"a",@progbits
__unnamed_20:
	.asciz	"main$async_dispatch_31_batch_matmul_1x16x37x32_f32"
	.size	__unnamed_20, 51

	.type	__unnamed_21,@object
	.section	.rodata.__unnamed_21,"a",@progbits
__unnamed_21:
	.asciz	"main$async_dispatch_32_batch_matmul_1x16x32x37_f32"
	.size	__unnamed_21, 51

	.type	__unnamed_22,@object
	.section	.rodata.__unnamed_22,"a",@progbits
__unnamed_22:
	.asciz	"main$async_dispatch_34_reduction_16x32_f32"
	.size	__unnamed_22, 43

	.type	__unnamed_23,@object
	.section	.rodata.__unnamed_23,"a",@progbits
__unnamed_23:
	.asciz	"main$async_dispatch_42_batch_matmul_1x16x32x32_f32"
	.size	__unnamed_23, 51

	.type	__unnamed_24,@object
	.section	.rodata.__unnamed_24,"a",@progbits
__unnamed_24:
	.asciz	"main$async_dispatch_44_reduction_16x32_f32"
	.size	__unnamed_24, 43

	.type	__unnamed_25,@object
	.section	.rodata.__unnamed_25,"a",@progbits
__unnamed_25:
	.asciz	"main$async_dispatch_45_batch_matmul_1x16x37x32_f32"
	.size	__unnamed_25, 51

	.type	__unnamed_26,@object
	.section	.rodata.__unnamed_26,"a",@progbits
__unnamed_26:
	.asciz	"main$async_dispatch_46_batch_matmul_1x16x32x37_f32"
	.size	__unnamed_26, 51

	.type	__unnamed_27,@object
	.section	.rodata.__unnamed_27,"a",@progbits
__unnamed_27:
	.asciz	"main$async_dispatch_48_reduction_16x32_f32"
	.size	__unnamed_27, 43

	.type	__unnamed_28,@object
	.section	.rodata.__unnamed_28,"a",@progbits
__unnamed_28:
	.asciz	"main$async_dispatch_56_batch_matmul_1x16x32x32_f32"
	.size	__unnamed_28, 51

	.type	__unnamed_29,@object
	.section	.rodata.__unnamed_29,"a",@progbits
__unnamed_29:
	.asciz	"main$async_dispatch_58_reduction_16x32_f32"
	.size	__unnamed_29, 43

	.type	__unnamed_30,@object
	.section	.rodata.__unnamed_30,"a",@progbits
__unnamed_30:
	.asciz	"main$async_dispatch_59_batch_matmul_1x16x37x32_f32"
	.size	__unnamed_30, 51

	.type	__unnamed_31,@object
	.section	.rodata.__unnamed_31,"a",@progbits
__unnamed_31:
	.asciz	"main$async_dispatch_60_batch_matmul_1x16x32x37_f32"
	.size	__unnamed_31, 51

	.type	__unnamed_32,@object
	.section	.rodata.__unnamed_32,"a",@progbits
__unnamed_32:
	.asciz	"main$async_dispatch_62_reduction_16x32_f32"
	.size	__unnamed_32, 43

	.type	__unnamed_33,@object
	.section	.rodata.__unnamed_33,"a",@progbits
__unnamed_33:
	.asciz	"main$async_dispatch_70_batch_matmul_1x16x32x32_f32"
	.size	__unnamed_33, 51

	.type	__unnamed_34,@object
	.section	.rodata.__unnamed_34,"a",@progbits
__unnamed_34:
	.asciz	"main$async_dispatch_72_reduction_16x32_f32"
	.size	__unnamed_34, 43

	.type	__unnamed_35,@object
	.section	.rodata.__unnamed_35,"a",@progbits
__unnamed_35:
	.asciz	"main$async_dispatch_73_batch_matmul_1x16x37x32_f32"
	.size	__unnamed_35, 51

	.type	__unnamed_36,@object
	.section	.rodata.__unnamed_36,"a",@progbits
__unnamed_36:
	.asciz	"main$async_dispatch_74_batch_matmul_1x16x32x37_f32"
	.size	__unnamed_36, 51

	.type	__unnamed_37,@object
	.section	.rodata.__unnamed_37,"a",@progbits
__unnamed_37:
	.asciz	"main$async_dispatch_76_reduction_16x32_f32"
	.size	__unnamed_37, 43

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
	.quad	__unnamed_19
	.quad	__unnamed_20
	.quad	__unnamed_21
	.quad	__unnamed_22
	.quad	__unnamed_23
	.quad	__unnamed_24
	.quad	__unnamed_25
	.quad	__unnamed_26
	.quad	__unnamed_27
	.quad	__unnamed_28
	.quad	__unnamed_29
	.quad	__unnamed_30
	.quad	__unnamed_31
	.quad	__unnamed_32
	.quad	__unnamed_33
	.quad	__unnamed_34
	.quad	__unnamed_35
	.quad	__unnamed_36
	.quad	__unnamed_37
	.size	iree_hal_executable_library_query_v0_names, 288

	.type	__unnamed_38,@object
	.section	.rodata.__unnamed_38,"a",@progbits
__unnamed_38:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_0.mlir"
	.size	__unnamed_38, 137

	.type	__unnamed_39,@object
	.section	.rodata.__unnamed_39,"a",@progbits
__unnamed_39:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_1.mlir"
	.size	__unnamed_39, 137

	.type	__unnamed_40,@object
	.section	.rodata.__unnamed_40,"a",@progbits
__unnamed_40:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_2.mlir"
	.size	__unnamed_40, 137

	.type	__unnamed_41,@object
	.section	.rodata.__unnamed_41,"a",@progbits
__unnamed_41:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_3.mlir"
	.size	__unnamed_41, 137

	.type	__unnamed_42,@object
	.section	.rodata.__unnamed_42,"a",@progbits
__unnamed_42:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_4.mlir"
	.size	__unnamed_42, 137

	.type	__unnamed_43,@object
	.section	.rodata.__unnamed_43,"a",@progbits
__unnamed_43:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_5.mlir"
	.size	__unnamed_43, 137

	.type	__unnamed_44,@object
	.section	.rodata.__unnamed_44,"a",@progbits
__unnamed_44:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_6.mlir"
	.size	__unnamed_44, 137

	.type	__unnamed_45,@object
	.section	.rodata.__unnamed_45,"a",@progbits
__unnamed_45:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_7.mlir"
	.size	__unnamed_45, 137

	.type	__unnamed_46,@object
	.section	.rodata.__unnamed_46,"a",@progbits
__unnamed_46:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_8.mlir"
	.size	__unnamed_46, 137

	.type	__unnamed_47,@object
	.section	.rodata.__unnamed_47,"a",@progbits
__unnamed_47:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_12.mlir"
	.size	__unnamed_47, 138

	.type	__unnamed_48,@object
	.section	.rodata.__unnamed_48,"a",@progbits
__unnamed_48:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_13.mlir"
	.size	__unnamed_48, 138

	.type	__unnamed_49,@object
	.section	.rodata.__unnamed_49,"a",@progbits
__unnamed_49:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_14.mlir"
	.size	__unnamed_49, 138

	.type	__unnamed_50,@object
	.section	.rodata.__unnamed_50,"a",@progbits
__unnamed_50:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_16.mlir"
	.size	__unnamed_50, 138

	.type	__unnamed_51,@object
	.section	.rodata.__unnamed_51,"a",@progbits
__unnamed_51:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_17.mlir"
	.size	__unnamed_51, 138

	.type	__unnamed_52,@object
	.section	.rodata.__unnamed_52,"a",@progbits
__unnamed_52:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_18.mlir"
	.size	__unnamed_52, 138

	.type	__unnamed_53,@object
	.section	.rodata.__unnamed_53,"a",@progbits
__unnamed_53:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_20.mlir"
	.size	__unnamed_53, 138

	.type	__unnamed_54,@object
	.section	.rodata.__unnamed_54,"a",@progbits
__unnamed_54:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_28.mlir"
	.size	__unnamed_54, 138

	.type	__unnamed_55,@object
	.section	.rodata.__unnamed_55,"a",@progbits
__unnamed_55:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_30.mlir"
	.size	__unnamed_55, 138

	.type	__unnamed_56,@object
	.section	.rodata.__unnamed_56,"a",@progbits
__unnamed_56:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_31.mlir"
	.size	__unnamed_56, 138

	.type	__unnamed_57,@object
	.section	.rodata.__unnamed_57,"a",@progbits
__unnamed_57:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_32.mlir"
	.size	__unnamed_57, 138

	.type	__unnamed_58,@object
	.section	.rodata.__unnamed_58,"a",@progbits
__unnamed_58:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_34.mlir"
	.size	__unnamed_58, 138

	.type	__unnamed_59,@object
	.section	.rodata.__unnamed_59,"a",@progbits
__unnamed_59:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_42.mlir"
	.size	__unnamed_59, 138

	.type	__unnamed_60,@object
	.section	.rodata.__unnamed_60,"a",@progbits
__unnamed_60:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_44.mlir"
	.size	__unnamed_60, 138

	.type	__unnamed_61,@object
	.section	.rodata.__unnamed_61,"a",@progbits
__unnamed_61:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_45.mlir"
	.size	__unnamed_61, 138

	.type	__unnamed_62,@object
	.section	.rodata.__unnamed_62,"a",@progbits
__unnamed_62:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_46.mlir"
	.size	__unnamed_62, 138

	.type	__unnamed_63,@object
	.section	.rodata.__unnamed_63,"a",@progbits
__unnamed_63:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_48.mlir"
	.size	__unnamed_63, 138

	.type	__unnamed_64,@object
	.section	.rodata.__unnamed_64,"a",@progbits
__unnamed_64:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_56.mlir"
	.size	__unnamed_64, 138

	.type	__unnamed_65,@object
	.section	.rodata.__unnamed_65,"a",@progbits
__unnamed_65:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_58.mlir"
	.size	__unnamed_65, 138

	.type	__unnamed_66,@object
	.section	.rodata.__unnamed_66,"a",@progbits
__unnamed_66:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_59.mlir"
	.size	__unnamed_66, 138

	.type	__unnamed_67,@object
	.section	.rodata.__unnamed_67,"a",@progbits
__unnamed_67:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_60.mlir"
	.size	__unnamed_67, 138

	.type	__unnamed_68,@object
	.section	.rodata.__unnamed_68,"a",@progbits
__unnamed_68:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_62.mlir"
	.size	__unnamed_68, 138

	.type	__unnamed_69,@object
	.section	.rodata.__unnamed_69,"a",@progbits
__unnamed_69:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_70.mlir"
	.size	__unnamed_69, 138

	.type	__unnamed_70,@object
	.section	.rodata.__unnamed_70,"a",@progbits
__unnamed_70:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_72.mlir"
	.size	__unnamed_70, 138

	.type	__unnamed_71,@object
	.section	.rodata.__unnamed_71,"a",@progbits
__unnamed_71:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_73.mlir"
	.size	__unnamed_71, 138

	.type	__unnamed_72,@object
	.section	.rodata.__unnamed_72,"a",@progbits
__unnamed_72:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_74.mlir"
	.size	__unnamed_72, 138

	.type	__unnamed_73,@object
	.section	.rodata.__unnamed_73,"a",@progbits
__unnamed_73:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm/module_main$async_dispatch_76.mlir"
	.size	__unnamed_73, 138

	.type	iree_hal_executable_library_query_v0_source_locations,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_source_locations,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_source_locations:
	.long	3
	.long	136
	.quad	__unnamed_38
	.long	3
	.long	136
	.quad	__unnamed_39
	.long	3
	.long	136
	.quad	__unnamed_40
	.long	3
	.long	136
	.quad	__unnamed_41
	.long	3
	.long	136
	.quad	__unnamed_42
	.long	3
	.long	136
	.quad	__unnamed_43
	.long	3
	.long	136
	.quad	__unnamed_44
	.long	3
	.long	136
	.quad	__unnamed_45
	.long	3
	.long	136
	.quad	__unnamed_46
	.long	3
	.long	137
	.quad	__unnamed_47
	.long	3
	.long	137
	.quad	__unnamed_48
	.long	3
	.long	137
	.quad	__unnamed_49
	.long	3
	.long	137
	.quad	__unnamed_50
	.long	3
	.long	137
	.quad	__unnamed_51
	.long	3
	.long	137
	.quad	__unnamed_52
	.long	3
	.long	137
	.quad	__unnamed_53
	.long	3
	.long	137
	.quad	__unnamed_54
	.long	3
	.long	137
	.quad	__unnamed_55
	.long	3
	.long	137
	.quad	__unnamed_56
	.long	3
	.long	137
	.quad	__unnamed_57
	.long	3
	.long	137
	.quad	__unnamed_58
	.long	3
	.long	137
	.quad	__unnamed_59
	.long	3
	.long	137
	.quad	__unnamed_60
	.long	3
	.long	137
	.quad	__unnamed_61
	.long	3
	.long	137
	.quad	__unnamed_62
	.long	3
	.long	137
	.quad	__unnamed_63
	.long	3
	.long	137
	.quad	__unnamed_64
	.long	3
	.long	137
	.quad	__unnamed_65
	.long	3
	.long	137
	.quad	__unnamed_66
	.long	3
	.long	137
	.quad	__unnamed_67
	.long	3
	.long	137
	.quad	__unnamed_68
	.long	3
	.long	137
	.quad	__unnamed_69
	.long	3
	.long	137
	.quad	__unnamed_70
	.long	3
	.long	137
	.quad	__unnamed_71
	.long	3
	.long	137
	.quad	__unnamed_72
	.long	3
	.long	137
	.quad	__unnamed_73
	.size	iree_hal_executable_library_query_v0_source_locations, 576

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_names,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_names","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_names:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_names, 0

	.type	iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_source_locations,@object
	.section	".rodata.iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_source_locations","a",@progbits
	.p2align	3, 0x0
iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_source_locations:
	.size	iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_source_locations, 0

	.type	iree_hal_executable_library_query_v0_stage_location_tables,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0_stage_location_tables,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0_stage_location_tables:
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16_i64xi32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_2_elementwise_16_i64xi32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_3_elementwise_16_i32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_5_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_6_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_7_batch_matmul_1x16x32x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_8_elementwise_transpose_16x4x8_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_12_elementwise_transpose_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_13_attention_4x16x8x8x16_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_14_batch_matmul_1x16x32x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_17_batch_matmul_1x16x37x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_18_batch_matmul_1x16x32x37_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_28_batch_matmul_1x16x32x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_30_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_31_batch_matmul_1x16x37x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_32_batch_matmul_1x16x32x37_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_34_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_42_batch_matmul_1x16x32x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_44_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_45_batch_matmul_1x16x37x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_46_batch_matmul_1x16x32x37_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_48_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_56_batch_matmul_1x16x32x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_58_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_59_batch_matmul_1x16x37x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_60_batch_matmul_1x16x32x37_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_62_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_70_batch_matmul_1x16x32x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_72_reduction_16x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_73_batch_matmul_1x16x37x32_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_74_batch_matmul_1x16x32x37_f32_stage_source_locations
	.long	0
	.zero	4
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_names
	.quad	iree_hal_executable_library_query_v0_main$async_dispatch_76_reduction_16x32_f32_stage_source_locations
	.size	iree_hal_executable_library_query_v0_stage_location_tables, 864

	.type	iree_hal_executable_library_query_v0,@object
	.section	.data.rel.ro.iree_hal_executable_library_query_v0,"aw",@progbits
	.p2align	4, 0x0
iree_hal_executable_library_query_v0:
	.quad	iree_hal_executable_library_query_v0_header
	.zero	16
	.long	36
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
	.long	.Linfo_string38
	.long	.Linfo_string38
	.byte	1
	.byte	1
	.long	71

	.byte	3
	.long	.Linfo_string39
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
	.long	.Linfo_string40
	.long	.Linfo_string40
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
	.long	.Linfo_string41
	.long	.Linfo_string41
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
	.long	.Linfo_string42
	.long	.Linfo_string42
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
	.long	.Linfo_string43
	.long	.Linfo_string43
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
	.long	.Linfo_string44
	.long	.Linfo_string44
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
	.long	.Linfo_string45
	.long	.Linfo_string45
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
	.long	.Linfo_string46
	.long	.Linfo_string46
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
	.long	.Linfo_string47
	.long	.Linfo_string47
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
	.long	.Linfo_string48
	.long	.Linfo_string48
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
	.long	.Linfo_string49
	.long	.Linfo_string49
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
	.long	.Linfo_string50
	.long	.Linfo_string50
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
	.long	.Linfo_string51
	.long	.Linfo_string51
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
	.long	.Linfo_string52
	.long	.Linfo_string52
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
	.long	.Linfo_string53
	.long	.Linfo_string53
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
	.long	.Linfo_string54
	.long	.Linfo_string54
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
	.long	.Linfo_string55
	.long	.Linfo_string55
	.byte	17
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end16:
.Lcu_begin17:
	.long	.Ldebug_info_end17-.Ldebug_info_start17
.Ldebug_info_start17:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string19
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin17
	.long	.Lfunc_end17-.Lfunc_begin17
	.byte	4
	.quad	.Lfunc_begin17
	.long	.Lfunc_end17-.Lfunc_begin17
	.byte	1
	.byte	86
	.long	.Linfo_string56
	.long	.Linfo_string56
	.byte	18
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end17:
.Lcu_begin18:
	.long	.Ldebug_info_end18-.Ldebug_info_start18
.Ldebug_info_start18:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string20
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin18
	.long	.Lfunc_end18-.Lfunc_begin18
	.byte	4
	.quad	.Lfunc_begin18
	.long	.Lfunc_end18-.Lfunc_begin18
	.byte	1
	.byte	86
	.long	.Linfo_string57
	.long	.Linfo_string57
	.byte	19
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end18:
.Lcu_begin19:
	.long	.Ldebug_info_end19-.Ldebug_info_start19
.Ldebug_info_start19:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string21
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin19
	.long	.Lfunc_end19-.Lfunc_begin19
	.byte	4
	.quad	.Lfunc_begin19
	.long	.Lfunc_end19-.Lfunc_begin19
	.byte	1
	.byte	86
	.long	.Linfo_string58
	.long	.Linfo_string58
	.byte	20
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end19:
.Lcu_begin20:
	.long	.Ldebug_info_end20-.Ldebug_info_start20
.Ldebug_info_start20:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string22
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin20
	.long	.Lfunc_end20-.Lfunc_begin20
	.byte	4
	.quad	.Lfunc_begin20
	.long	.Lfunc_end20-.Lfunc_begin20
	.byte	1
	.byte	86
	.long	.Linfo_string59
	.long	.Linfo_string59
	.byte	21
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end20:
.Lcu_begin21:
	.long	.Ldebug_info_end21-.Ldebug_info_start21
.Ldebug_info_start21:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string23
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin21
	.long	.Lfunc_end21-.Lfunc_begin21
	.byte	4
	.quad	.Lfunc_begin21
	.long	.Lfunc_end21-.Lfunc_begin21
	.byte	1
	.byte	86
	.long	.Linfo_string60
	.long	.Linfo_string60
	.byte	22
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end21:
.Lcu_begin22:
	.long	.Ldebug_info_end22-.Ldebug_info_start22
.Ldebug_info_start22:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string24
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin22
	.long	.Lfunc_end22-.Lfunc_begin22
	.byte	4
	.quad	.Lfunc_begin22
	.long	.Lfunc_end22-.Lfunc_begin22
	.byte	1
	.byte	86
	.long	.Linfo_string61
	.long	.Linfo_string61
	.byte	23
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end22:
.Lcu_begin23:
	.long	.Ldebug_info_end23-.Ldebug_info_start23
.Ldebug_info_start23:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string25
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin23
	.long	.Lfunc_end23-.Lfunc_begin23
	.byte	4
	.quad	.Lfunc_begin23
	.long	.Lfunc_end23-.Lfunc_begin23
	.byte	1
	.byte	86
	.long	.Linfo_string62
	.long	.Linfo_string62
	.byte	24
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end23:
.Lcu_begin24:
	.long	.Ldebug_info_end24-.Ldebug_info_start24
.Ldebug_info_start24:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string26
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin24
	.long	.Lfunc_end24-.Lfunc_begin24
	.byte	4
	.quad	.Lfunc_begin24
	.long	.Lfunc_end24-.Lfunc_begin24
	.byte	1
	.byte	86
	.long	.Linfo_string63
	.long	.Linfo_string63
	.byte	25
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end24:
.Lcu_begin25:
	.long	.Ldebug_info_end25-.Ldebug_info_start25
.Ldebug_info_start25:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string27
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin25
	.long	.Lfunc_end25-.Lfunc_begin25
	.byte	4
	.quad	.Lfunc_begin25
	.long	.Lfunc_end25-.Lfunc_begin25
	.byte	1
	.byte	86
	.long	.Linfo_string64
	.long	.Linfo_string64
	.byte	26
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end25:
.Lcu_begin26:
	.long	.Ldebug_info_end26-.Ldebug_info_start26
.Ldebug_info_start26:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string28
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin26
	.long	.Lfunc_end26-.Lfunc_begin26
	.byte	4
	.quad	.Lfunc_begin26
	.long	.Lfunc_end26-.Lfunc_begin26
	.byte	1
	.byte	86
	.long	.Linfo_string65
	.long	.Linfo_string65
	.byte	27
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end26:
.Lcu_begin27:
	.long	.Ldebug_info_end27-.Ldebug_info_start27
.Ldebug_info_start27:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string29
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin27
	.long	.Lfunc_end27-.Lfunc_begin27
	.byte	4
	.quad	.Lfunc_begin27
	.long	.Lfunc_end27-.Lfunc_begin27
	.byte	1
	.byte	86
	.long	.Linfo_string66
	.long	.Linfo_string66
	.byte	28
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end27:
.Lcu_begin28:
	.long	.Ldebug_info_end28-.Ldebug_info_start28
.Ldebug_info_start28:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string30
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin28
	.long	.Lfunc_end28-.Lfunc_begin28
	.byte	4
	.quad	.Lfunc_begin28
	.long	.Lfunc_end28-.Lfunc_begin28
	.byte	1
	.byte	86
	.long	.Linfo_string67
	.long	.Linfo_string67
	.byte	29
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end28:
.Lcu_begin29:
	.long	.Ldebug_info_end29-.Ldebug_info_start29
.Ldebug_info_start29:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string31
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin29
	.long	.Lfunc_end29-.Lfunc_begin29
	.byte	4
	.quad	.Lfunc_begin29
	.long	.Lfunc_end29-.Lfunc_begin29
	.byte	1
	.byte	86
	.long	.Linfo_string68
	.long	.Linfo_string68
	.byte	30
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end29:
.Lcu_begin30:
	.long	.Ldebug_info_end30-.Ldebug_info_start30
.Ldebug_info_start30:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string32
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin30
	.long	.Lfunc_end30-.Lfunc_begin30
	.byte	4
	.quad	.Lfunc_begin30
	.long	.Lfunc_end30-.Lfunc_begin30
	.byte	1
	.byte	86
	.long	.Linfo_string69
	.long	.Linfo_string69
	.byte	31
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end30:
.Lcu_begin31:
	.long	.Ldebug_info_end31-.Ldebug_info_start31
.Ldebug_info_start31:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string33
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin31
	.long	.Lfunc_end31-.Lfunc_begin31
	.byte	4
	.quad	.Lfunc_begin31
	.long	.Lfunc_end31-.Lfunc_begin31
	.byte	1
	.byte	86
	.long	.Linfo_string70
	.long	.Linfo_string70
	.byte	32
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end31:
.Lcu_begin32:
	.long	.Ldebug_info_end32-.Ldebug_info_start32
.Ldebug_info_start32:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string34
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin32
	.long	.Lfunc_end32-.Lfunc_begin32
	.byte	4
	.quad	.Lfunc_begin32
	.long	.Lfunc_end32-.Lfunc_begin32
	.byte	1
	.byte	86
	.long	.Linfo_string71
	.long	.Linfo_string71
	.byte	33
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end32:
.Lcu_begin33:
	.long	.Ldebug_info_end33-.Ldebug_info_start33
.Ldebug_info_start33:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string35
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin33
	.long	.Lfunc_end33-.Lfunc_begin33
	.byte	4
	.quad	.Lfunc_begin33
	.long	.Lfunc_end33-.Lfunc_begin33
	.byte	1
	.byte	86
	.long	.Linfo_string72
	.long	.Linfo_string72
	.byte	34
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end33:
.Lcu_begin34:
	.long	.Ldebug_info_end34-.Ldebug_info_start34
.Ldebug_info_start34:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string36
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin34
	.long	.Lfunc_end34-.Lfunc_begin34
	.byte	4
	.quad	.Lfunc_begin34
	.long	.Lfunc_end34-.Lfunc_begin34
	.byte	1
	.byte	86
	.long	.Linfo_string73
	.long	.Linfo_string73
	.byte	35
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end34:
.Lcu_begin35:
	.long	.Ldebug_info_end35-.Ldebug_info_start35
.Ldebug_info_start35:
	.short	4
	.long	.debug_abbrev
	.byte	8
	.byte	1
	.long	.Linfo_string0
	.short	44
	.long	.Linfo_string37
	.long	.Lline_table_start0
	.long	.Linfo_string2

	.quad	.Lfunc_begin35
	.long	.Lfunc_end35-.Lfunc_begin35
	.byte	4
	.quad	.Lfunc_begin35
	.long	.Lfunc_end35-.Lfunc_begin35
	.byte	1
	.byte	86
	.long	.Linfo_string74
	.long	.Linfo_string74
	.byte	36
	.byte	1
	.long	.debug_info+71

	.byte	0
.Ldebug_info_end35:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"IREE"
.Linfo_string1:
	.asciz	"module_main$async_dispatch_0.mlir"
.Linfo_string2:
	.asciz	"/local/mnt/workspace/compilers/CompilerLens/examples/hf-internal-testing_tiny-random-RobertaModel/llvm"
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
	.asciz	"module_main$async_dispatch_6.mlir"
.Linfo_string9:
	.asciz	"module_main$async_dispatch_7.mlir"
.Linfo_string10:
	.asciz	"module_main$async_dispatch_8.mlir"
.Linfo_string11:
	.asciz	"module_main$async_dispatch_12.mlir"
.Linfo_string12:
	.asciz	"module_main$async_dispatch_13.mlir"
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
	.asciz	"module_main$async_dispatch_28.mlir"
.Linfo_string19:
	.asciz	"module_main$async_dispatch_30.mlir"
.Linfo_string20:
	.asciz	"module_main$async_dispatch_31.mlir"
.Linfo_string21:
	.asciz	"module_main$async_dispatch_32.mlir"
.Linfo_string22:
	.asciz	"module_main$async_dispatch_34.mlir"
.Linfo_string23:
	.asciz	"module_main$async_dispatch_42.mlir"
.Linfo_string24:
	.asciz	"module_main$async_dispatch_44.mlir"
.Linfo_string25:
	.asciz	"module_main$async_dispatch_45.mlir"
.Linfo_string26:
	.asciz	"module_main$async_dispatch_46.mlir"
.Linfo_string27:
	.asciz	"module_main$async_dispatch_48.mlir"
.Linfo_string28:
	.asciz	"module_main$async_dispatch_56.mlir"
.Linfo_string29:
	.asciz	"module_main$async_dispatch_58.mlir"
.Linfo_string30:
	.asciz	"module_main$async_dispatch_59.mlir"
.Linfo_string31:
	.asciz	"module_main$async_dispatch_60.mlir"
.Linfo_string32:
	.asciz	"module_main$async_dispatch_62.mlir"
.Linfo_string33:
	.asciz	"module_main$async_dispatch_70.mlir"
.Linfo_string34:
	.asciz	"module_main$async_dispatch_72.mlir"
.Linfo_string35:
	.asciz	"module_main$async_dispatch_73.mlir"
.Linfo_string36:
	.asciz	"module_main$async_dispatch_74.mlir"
.Linfo_string37:
	.asciz	"module_main$async_dispatch_76.mlir"
.Linfo_string38:
	.asciz	"main$async_dispatch_0_elementwise_16_i64xi32"
.Linfo_string39:
	.asciz	"int"
.Linfo_string40:
	.asciz	"main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store"
.Linfo_string41:
	.asciz	"main$async_dispatch_2_elementwise_16_i64xi32"
.Linfo_string42:
	.asciz	"main$async_dispatch_3_elementwise_16_i32"
.Linfo_string43:
	.asciz	"main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32"
.Linfo_string44:
	.asciz	"main$async_dispatch_5_reduction_16x32_f32"
.Linfo_string45:
	.asciz	"main$async_dispatch_6_reduction_16x32_f32"
.Linfo_string46:
	.asciz	"main$async_dispatch_7_batch_matmul_1x16x32x32_f32"
.Linfo_string47:
	.asciz	"main$async_dispatch_8_elementwise_transpose_16x4x8_f32"
.Linfo_string48:
	.asciz	"main$async_dispatch_12_elementwise_transpose_16x32_f32"
.Linfo_string49:
	.asciz	"main$async_dispatch_13_attention_4x16x8x8x16"
.Linfo_string50:
	.asciz	"main$async_dispatch_14_batch_matmul_1x16x32x32_f32"
.Linfo_string51:
	.asciz	"main$async_dispatch_16_reduction_16x32_f32"
.Linfo_string52:
	.asciz	"main$async_dispatch_17_batch_matmul_1x16x37x32_f32"
.Linfo_string53:
	.asciz	"main$async_dispatch_18_batch_matmul_1x16x32x37_f32"
.Linfo_string54:
	.asciz	"main$async_dispatch_20_reduction_16x32_f32"
.Linfo_string55:
	.asciz	"main$async_dispatch_28_batch_matmul_1x16x32x32_f32"
.Linfo_string56:
	.asciz	"main$async_dispatch_30_reduction_16x32_f32"
.Linfo_string57:
	.asciz	"main$async_dispatch_31_batch_matmul_1x16x37x32_f32"
.Linfo_string58:
	.asciz	"main$async_dispatch_32_batch_matmul_1x16x32x37_f32"
.Linfo_string59:
	.asciz	"main$async_dispatch_34_reduction_16x32_f32"
.Linfo_string60:
	.asciz	"main$async_dispatch_42_batch_matmul_1x16x32x32_f32"
.Linfo_string61:
	.asciz	"main$async_dispatch_44_reduction_16x32_f32"
.Linfo_string62:
	.asciz	"main$async_dispatch_45_batch_matmul_1x16x37x32_f32"
.Linfo_string63:
	.asciz	"main$async_dispatch_46_batch_matmul_1x16x32x37_f32"
.Linfo_string64:
	.asciz	"main$async_dispatch_48_reduction_16x32_f32"
.Linfo_string65:
	.asciz	"main$async_dispatch_56_batch_matmul_1x16x32x32_f32"
.Linfo_string66:
	.asciz	"main$async_dispatch_58_reduction_16x32_f32"
.Linfo_string67:
	.asciz	"main$async_dispatch_59_batch_matmul_1x16x37x32_f32"
.Linfo_string68:
	.asciz	"main$async_dispatch_60_batch_matmul_1x16x32x37_f32"
.Linfo_string69:
	.asciz	"main$async_dispatch_62_reduction_16x32_f32"
.Linfo_string70:
	.asciz	"main$async_dispatch_70_batch_matmul_1x16x32x32_f32"
.Linfo_string71:
	.asciz	"main$async_dispatch_72_reduction_16x32_f32"
.Linfo_string72:
	.asciz	"main$async_dispatch_73_batch_matmul_1x16x37x32_f32"
.Linfo_string73:
	.asciz	"main$async_dispatch_74_batch_matmul_1x16x32x37_f32"
.Linfo_string74:
	.asciz	"main$async_dispatch_76_reduction_16x32_f32"
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_start0
.LpubNames_start0:
	.short	2
	.long	.Lcu_begin0
	.long	79
	.long	42
	.asciz	"main$async_dispatch_0_elementwise_16_i64xi32"
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
	.asciz	"main$async_dispatch_1_scan_1x16xi64_dispatch_tensor_store"
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
	.asciz	"main$async_dispatch_2_elementwise_16_i64xi32"
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
	.asciz	"main$async_dispatch_3_elementwise_16_i32"
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
	.asciz	"main$async_dispatch_4_elementwise_broadcast_16x32_i64xi64xf32"
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
	.asciz	"main$async_dispatch_5_reduction_16x32_f32"
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
	.asciz	"main$async_dispatch_6_reduction_16x32_f32"
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
	.asciz	"main$async_dispatch_7_batch_matmul_1x16x32x32_f32"
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
	.asciz	"main$async_dispatch_8_elementwise_transpose_16x4x8_f32"
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
	.asciz	"main$async_dispatch_12_elementwise_transpose_16x32_f32"
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
	.asciz	"main$async_dispatch_13_attention_4x16x8x8x16"
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
	.asciz	"main$async_dispatch_14_batch_matmul_1x16x32x32_f32"
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
	.asciz	"main$async_dispatch_16_reduction_16x32_f32"
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
	.asciz	"main$async_dispatch_17_batch_matmul_1x16x37x32_f32"
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
	.asciz	"main$async_dispatch_18_batch_matmul_1x16x32x37_f32"
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
	.asciz	"main$async_dispatch_20_reduction_16x32_f32"
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
	.asciz	"main$async_dispatch_28_batch_matmul_1x16x32x32_f32"
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
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end17-.LpubNames_start17
.LpubNames_start17:
	.short	2
	.long	.Lcu_begin17
	.long	72
	.long	42
	.asciz	"main$async_dispatch_30_reduction_16x32_f32"
	.long	0
.LpubNames_end17:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end17-.LpubTypes_start17
.LpubTypes_start17:
	.short	2
	.long	.Lcu_begin17
	.long	72
	.long	0
.LpubTypes_end17:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end18-.LpubNames_start18
.LpubNames_start18:
	.short	2
	.long	.Lcu_begin18
	.long	72
	.long	42
	.asciz	"main$async_dispatch_31_batch_matmul_1x16x37x32_f32"
	.long	0
.LpubNames_end18:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end18-.LpubTypes_start18
.LpubTypes_start18:
	.short	2
	.long	.Lcu_begin18
	.long	72
	.long	0
.LpubTypes_end18:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end19-.LpubNames_start19
.LpubNames_start19:
	.short	2
	.long	.Lcu_begin19
	.long	72
	.long	42
	.asciz	"main$async_dispatch_32_batch_matmul_1x16x32x37_f32"
	.long	0
.LpubNames_end19:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end19-.LpubTypes_start19
.LpubTypes_start19:
	.short	2
	.long	.Lcu_begin19
	.long	72
	.long	0
.LpubTypes_end19:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end20-.LpubNames_start20
.LpubNames_start20:
	.short	2
	.long	.Lcu_begin20
	.long	72
	.long	42
	.asciz	"main$async_dispatch_34_reduction_16x32_f32"
	.long	0
.LpubNames_end20:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end20-.LpubTypes_start20
.LpubTypes_start20:
	.short	2
	.long	.Lcu_begin20
	.long	72
	.long	0
.LpubTypes_end20:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end21-.LpubNames_start21
.LpubNames_start21:
	.short	2
	.long	.Lcu_begin21
	.long	72
	.long	42
	.asciz	"main$async_dispatch_42_batch_matmul_1x16x32x32_f32"
	.long	0
.LpubNames_end21:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end21-.LpubTypes_start21
.LpubTypes_start21:
	.short	2
	.long	.Lcu_begin21
	.long	72
	.long	0
.LpubTypes_end21:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end22-.LpubNames_start22
.LpubNames_start22:
	.short	2
	.long	.Lcu_begin22
	.long	72
	.long	42
	.asciz	"main$async_dispatch_44_reduction_16x32_f32"
	.long	0
.LpubNames_end22:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end22-.LpubTypes_start22
.LpubTypes_start22:
	.short	2
	.long	.Lcu_begin22
	.long	72
	.long	0
.LpubTypes_end22:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end23-.LpubNames_start23
.LpubNames_start23:
	.short	2
	.long	.Lcu_begin23
	.long	72
	.long	42
	.asciz	"main$async_dispatch_45_batch_matmul_1x16x37x32_f32"
	.long	0
.LpubNames_end23:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end23-.LpubTypes_start23
.LpubTypes_start23:
	.short	2
	.long	.Lcu_begin23
	.long	72
	.long	0
.LpubTypes_end23:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end24-.LpubNames_start24
.LpubNames_start24:
	.short	2
	.long	.Lcu_begin24
	.long	72
	.long	42
	.asciz	"main$async_dispatch_46_batch_matmul_1x16x32x37_f32"
	.long	0
.LpubNames_end24:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end24-.LpubTypes_start24
.LpubTypes_start24:
	.short	2
	.long	.Lcu_begin24
	.long	72
	.long	0
.LpubTypes_end24:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end25-.LpubNames_start25
.LpubNames_start25:
	.short	2
	.long	.Lcu_begin25
	.long	72
	.long	42
	.asciz	"main$async_dispatch_48_reduction_16x32_f32"
	.long	0
.LpubNames_end25:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end25-.LpubTypes_start25
.LpubTypes_start25:
	.short	2
	.long	.Lcu_begin25
	.long	72
	.long	0
.LpubTypes_end25:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end26-.LpubNames_start26
.LpubNames_start26:
	.short	2
	.long	.Lcu_begin26
	.long	72
	.long	42
	.asciz	"main$async_dispatch_56_batch_matmul_1x16x32x32_f32"
	.long	0
.LpubNames_end26:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end26-.LpubTypes_start26
.LpubTypes_start26:
	.short	2
	.long	.Lcu_begin26
	.long	72
	.long	0
.LpubTypes_end26:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end27-.LpubNames_start27
.LpubNames_start27:
	.short	2
	.long	.Lcu_begin27
	.long	72
	.long	42
	.asciz	"main$async_dispatch_58_reduction_16x32_f32"
	.long	0
.LpubNames_end27:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end27-.LpubTypes_start27
.LpubTypes_start27:
	.short	2
	.long	.Lcu_begin27
	.long	72
	.long	0
.LpubTypes_end27:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end28-.LpubNames_start28
.LpubNames_start28:
	.short	2
	.long	.Lcu_begin28
	.long	72
	.long	42
	.asciz	"main$async_dispatch_59_batch_matmul_1x16x37x32_f32"
	.long	0
.LpubNames_end28:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end28-.LpubTypes_start28
.LpubTypes_start28:
	.short	2
	.long	.Lcu_begin28
	.long	72
	.long	0
.LpubTypes_end28:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end29-.LpubNames_start29
.LpubNames_start29:
	.short	2
	.long	.Lcu_begin29
	.long	72
	.long	42
	.asciz	"main$async_dispatch_60_batch_matmul_1x16x32x37_f32"
	.long	0
.LpubNames_end29:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end29-.LpubTypes_start29
.LpubTypes_start29:
	.short	2
	.long	.Lcu_begin29
	.long	72
	.long	0
.LpubTypes_end29:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end30-.LpubNames_start30
.LpubNames_start30:
	.short	2
	.long	.Lcu_begin30
	.long	72
	.long	42
	.asciz	"main$async_dispatch_62_reduction_16x32_f32"
	.long	0
.LpubNames_end30:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end30-.LpubTypes_start30
.LpubTypes_start30:
	.short	2
	.long	.Lcu_begin30
	.long	72
	.long	0
.LpubTypes_end30:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end31-.LpubNames_start31
.LpubNames_start31:
	.short	2
	.long	.Lcu_begin31
	.long	72
	.long	42
	.asciz	"main$async_dispatch_70_batch_matmul_1x16x32x32_f32"
	.long	0
.LpubNames_end31:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end31-.LpubTypes_start31
.LpubTypes_start31:
	.short	2
	.long	.Lcu_begin31
	.long	72
	.long	0
.LpubTypes_end31:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end32-.LpubNames_start32
.LpubNames_start32:
	.short	2
	.long	.Lcu_begin32
	.long	72
	.long	42
	.asciz	"main$async_dispatch_72_reduction_16x32_f32"
	.long	0
.LpubNames_end32:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end32-.LpubTypes_start32
.LpubTypes_start32:
	.short	2
	.long	.Lcu_begin32
	.long	72
	.long	0
.LpubTypes_end32:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end33-.LpubNames_start33
.LpubNames_start33:
	.short	2
	.long	.Lcu_begin33
	.long	72
	.long	42
	.asciz	"main$async_dispatch_73_batch_matmul_1x16x37x32_f32"
	.long	0
.LpubNames_end33:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end33-.LpubTypes_start33
.LpubTypes_start33:
	.short	2
	.long	.Lcu_begin33
	.long	72
	.long	0
.LpubTypes_end33:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end34-.LpubNames_start34
.LpubNames_start34:
	.short	2
	.long	.Lcu_begin34
	.long	72
	.long	42
	.asciz	"main$async_dispatch_74_batch_matmul_1x16x32x37_f32"
	.long	0
.LpubNames_end34:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end34-.LpubTypes_start34
.LpubTypes_start34:
	.short	2
	.long	.Lcu_begin34
	.long	72
	.long	0
.LpubTypes_end34:
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end35-.LpubNames_start35
.LpubNames_start35:
	.short	2
	.long	.Lcu_begin35
	.long	72
	.long	42
	.asciz	"main$async_dispatch_76_reduction_16x32_f32"
	.long	0
.LpubNames_end35:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end35-.LpubTypes_start35
.LpubTypes_start35:
	.short	2
	.long	.Lcu_begin35
	.long	72
	.long	0
.LpubTypes_end35:
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
