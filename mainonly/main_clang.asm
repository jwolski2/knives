
empty-clang:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	48 83 ec 08          	sub    $0x8,%rsp
  401004:	48 8b 05 ed 2f 00 00 	mov    0x2fed(%rip),%rax        # 403ff8 <__gmon_start__>
  40100b:	48 85 c0             	test   %rax,%rax
  40100e:	74 02                	je     401012 <_init+0x12>
  401010:	ff d0                	callq  *%rax
  401012:	48 83 c4 08          	add    $0x8,%rsp
  401016:	c3                   	retq   

Disassembly of section .text:

0000000000401020 <_start>:
  401020:	31 ed                	xor    %ebp,%ebp
  401022:	49 89 d1             	mov    %rdx,%r9
  401025:	5e                   	pop    %rsi
  401026:	48 89 e2             	mov    %rsp,%rdx
  401029:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40102d:	50                   	push   %rax
  40102e:	54                   	push   %rsp
  40102f:	49 c7 c0 80 11 40 00 	mov    $0x401180,%r8
  401036:	48 c7 c1 20 11 40 00 	mov    $0x401120,%rcx
  40103d:	48 c7 c7 10 11 40 00 	mov    $0x401110,%rdi
  401044:	ff 15 a6 2f 00 00    	callq  *0x2fa6(%rip)        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40104a:	f4                   	hlt    
  40104b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401050 <_dl_relocate_static_pie>:
  401050:	c3                   	retq   
  401051:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401058:	00 00 00 
  40105b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401060 <deregister_tm_clones>:
  401060:	b8 28 40 40 00       	mov    $0x404028,%eax
  401065:	48 3d 28 40 40 00    	cmp    $0x404028,%rax
  40106b:	74 13                	je     401080 <deregister_tm_clones+0x20>
  40106d:	b8 00 00 00 00       	mov    $0x0,%eax
  401072:	48 85 c0             	test   %rax,%rax
  401075:	74 09                	je     401080 <deregister_tm_clones+0x20>
  401077:	bf 28 40 40 00       	mov    $0x404028,%edi
  40107c:	ff e0                	jmpq   *%rax
  40107e:	66 90                	xchg   %ax,%ax
  401080:	c3                   	retq   
  401081:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401088:	00 00 00 00 
  40108c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401090 <register_tm_clones>:
  401090:	be 28 40 40 00       	mov    $0x404028,%esi
  401095:	48 81 ee 28 40 40 00 	sub    $0x404028,%rsi
  40109c:	48 c1 fe 03          	sar    $0x3,%rsi
  4010a0:	48 89 f0             	mov    %rsi,%rax
  4010a3:	48 c1 e8 3f          	shr    $0x3f,%rax
  4010a7:	48 01 c6             	add    %rax,%rsi
  4010aa:	48 d1 fe             	sar    %rsi
  4010ad:	74 11                	je     4010c0 <register_tm_clones+0x30>
  4010af:	b8 00 00 00 00       	mov    $0x0,%eax
  4010b4:	48 85 c0             	test   %rax,%rax
  4010b7:	74 07                	je     4010c0 <register_tm_clones+0x30>
  4010b9:	bf 28 40 40 00       	mov    $0x404028,%edi
  4010be:	ff e0                	jmpq   *%rax
  4010c0:	c3                   	retq   
  4010c1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010c8:	00 00 00 00 
  4010cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004010d0 <__do_global_dtors_aux>:
  4010d0:	80 3d 51 2f 00 00 00 	cmpb   $0x0,0x2f51(%rip)        # 404028 <__TMC_END__>
  4010d7:	75 17                	jne    4010f0 <__do_global_dtors_aux+0x20>
  4010d9:	55                   	push   %rbp
  4010da:	48 89 e5             	mov    %rsp,%rbp
  4010dd:	e8 7e ff ff ff       	callq  401060 <deregister_tm_clones>
  4010e2:	c6 05 3f 2f 00 00 01 	movb   $0x1,0x2f3f(%rip)        # 404028 <__TMC_END__>
  4010e9:	5d                   	pop    %rbp
  4010ea:	c3                   	retq   
  4010eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4010f0:	c3                   	retq   
  4010f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010f8:	00 00 00 00 
  4010fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401100 <frame_dummy>:
  401100:	eb 8e                	jmp    401090 <register_tm_clones>
  401102:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401109:	00 00 00 
  40110c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401110 <main>:
  401110:	55                   	push   %rbp
  401111:	48 89 e5             	mov    %rsp,%rbp
  401114:	31 c0                	xor    %eax,%eax
  401116:	5d                   	pop    %rbp
  401117:	c3                   	retq   
  401118:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40111f:	00 

0000000000401120 <__libc_csu_init>:
  401120:	41 57                	push   %r15
  401122:	49 89 d7             	mov    %rdx,%r15
  401125:	41 56                	push   %r14
  401127:	49 89 f6             	mov    %rsi,%r14
  40112a:	41 55                	push   %r13
  40112c:	41 89 fd             	mov    %edi,%r13d
  40112f:	41 54                	push   %r12
  401131:	4c 8d 25 08 2d 00 00 	lea    0x2d08(%rip),%r12        # 403e40 <__frame_dummy_init_array_entry>
  401138:	55                   	push   %rbp
  401139:	48 8d 2d 08 2d 00 00 	lea    0x2d08(%rip),%rbp        # 403e48 <__init_array_end>
  401140:	53                   	push   %rbx
  401141:	4c 29 e5             	sub    %r12,%rbp
  401144:	48 83 ec 08          	sub    $0x8,%rsp
  401148:	e8 b3 fe ff ff       	callq  401000 <_init>
  40114d:	48 c1 fd 03          	sar    $0x3,%rbp
  401151:	74 1b                	je     40116e <__libc_csu_init+0x4e>
  401153:	31 db                	xor    %ebx,%ebx
  401155:	0f 1f 00             	nopl   (%rax)
  401158:	4c 89 fa             	mov    %r15,%rdx
  40115b:	4c 89 f6             	mov    %r14,%rsi
  40115e:	44 89 ef             	mov    %r13d,%edi
  401161:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  401165:	48 83 c3 01          	add    $0x1,%rbx
  401169:	48 39 dd             	cmp    %rbx,%rbp
  40116c:	75 ea                	jne    401158 <__libc_csu_init+0x38>
  40116e:	48 83 c4 08          	add    $0x8,%rsp
  401172:	5b                   	pop    %rbx
  401173:	5d                   	pop    %rbp
  401174:	41 5c                	pop    %r12
  401176:	41 5d                	pop    %r13
  401178:	41 5e                	pop    %r14
  40117a:	41 5f                	pop    %r15
  40117c:	c3                   	retq   
  40117d:	0f 1f 00             	nopl   (%rax)

0000000000401180 <__libc_csu_fini>:
  401180:	c3                   	retq   

Disassembly of section .fini:

0000000000401184 <_fini>:
  401184:	48 83 ec 08          	sub    $0x8,%rsp
  401188:	48 83 c4 08          	add    $0x8,%rsp
  40118c:	c3                   	retq   
