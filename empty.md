# empty

An analysis of the disassembly of a basic C program compiled with `gcc`.

## Printing Dependencies

Running `ldd empty` outputs:

```
        linux-vdso.so.1 (0x00007ffd4eaed000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3f183a2000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f3f185b6000)
```

## Dumping the Disassembly

Running `objdump -d empty` will give us the disassembly below:

```
empty:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 dd 2f 00 00 	mov    0x2fdd(%rip),%rax        # 3fe8 <__gmon_start__>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	callq  *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 a2 2f 00 00    	pushq  0x2fa2(%rip)        # 3fc8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 a4 2f 00 00    	jmpq   *0x2fa4(%rip)        # 3fd0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

Disassembly of section .plt.got:

0000000000001030 <__cxa_finalize@plt>:
    1030:	ff 25 c2 2f 00 00    	jmpq   *0x2fc2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1036:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001040 <_start>:
    1040:	31 ed                	xor    %ebp,%ebp
    1042:	49 89 d1             	mov    %rdx,%r9
    1045:	5e                   	pop    %rsi
    1046:	48 89 e2             	mov    %rsp,%rdx
    1049:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    104d:	50                   	push   %rax
    104e:	54                   	push   %rsp
    104f:	4c 8d 05 3a 01 00 00 	lea    0x13a(%rip),%r8        # 1190 <__libc_csu_fini>
    1056:	48 8d 0d d3 00 00 00 	lea    0xd3(%rip),%rcx        # 1130 <__libc_csu_init>
    105d:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 1125 <main>
    1064:	ff 15 76 2f 00 00    	callq  *0x2f76(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    106a:	f4                   	hlt    
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001070 <deregister_tm_clones>:
    1070:	48 8d 3d 99 2f 00 00 	lea    0x2f99(%rip),%rdi        # 4010 <__TMC_END__>
    1077:	48 8d 05 92 2f 00 00 	lea    0x2f92(%rip),%rax        # 4010 <__TMC_END__>
    107e:	48 39 f8             	cmp    %rdi,%rax
    1081:	74 15                	je     1098 <deregister_tm_clones+0x28>
    1083:	48 8b 05 4e 2f 00 00 	mov    0x2f4e(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    108a:	48 85 c0             	test   %rax,%rax
    108d:	74 09                	je     1098 <deregister_tm_clones+0x28>
    108f:	ff e0                	jmpq   *%rax
    1091:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1098:	c3                   	retq   
    1099:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010a0 <register_tm_clones>:
    10a0:	48 8d 3d 69 2f 00 00 	lea    0x2f69(%rip),%rdi        # 4010 <__TMC_END__>
    10a7:	48 8d 35 62 2f 00 00 	lea    0x2f62(%rip),%rsi        # 4010 <__TMC_END__>
    10ae:	48 29 fe             	sub    %rdi,%rsi
    10b1:	48 c1 fe 03          	sar    $0x3,%rsi
    10b5:	48 89 f0             	mov    %rsi,%rax
    10b8:	48 c1 e8 3f          	shr    $0x3f,%rax
    10bc:	48 01 c6             	add    %rax,%rsi
    10bf:	48 d1 fe             	sar    %rsi
    10c2:	74 14                	je     10d8 <register_tm_clones+0x38>
    10c4:	48 8b 05 25 2f 00 00 	mov    0x2f25(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    10cb:	48 85 c0             	test   %rax,%rax
    10ce:	74 08                	je     10d8 <register_tm_clones+0x38>
    10d0:	ff e0                	jmpq   *%rax
    10d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10d8:	c3                   	retq   
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010e0 <__do_global_dtors_aux>:
    10e0:	80 3d 29 2f 00 00 00 	cmpb   $0x0,0x2f29(%rip)        # 4010 <__TMC_END__>
    10e7:	75 2f                	jne    1118 <__do_global_dtors_aux+0x38>
    10e9:	55                   	push   %rbp
    10ea:	48 83 3d 06 2f 00 00 	cmpq   $0x0,0x2f06(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10f1:	00 
    10f2:	48 89 e5             	mov    %rsp,%rbp
    10f5:	74 0c                	je     1103 <__do_global_dtors_aux+0x23>
    10f7:	48 8b 3d 0a 2f 00 00 	mov    0x2f0a(%rip),%rdi        # 4008 <__dso_handle>
    10fe:	e8 2d ff ff ff       	callq  1030 <__cxa_finalize@plt>
    1103:	e8 68 ff ff ff       	callq  1070 <deregister_tm_clones>
    1108:	c6 05 01 2f 00 00 01 	movb   $0x1,0x2f01(%rip)        # 4010 <__TMC_END__>
    110f:	5d                   	pop    %rbp
    1110:	c3                   	retq   
    1111:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1118:	c3                   	retq   
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <frame_dummy>:
    1120:	e9 7b ff ff ff       	jmpq   10a0 <register_tm_clones>

0000000000001125 <main>:
    1125:	55                   	push   %rbp
    1126:	48 89 e5             	mov    %rsp,%rbp
    1129:	b8 00 00 00 00       	mov    $0x0,%eax
    112e:	5d                   	pop    %rbp
    112f:	c3                   	retq   

0000000000001130 <__libc_csu_init>:
    1130:	41 57                	push   %r15
    1132:	49 89 d7             	mov    %rdx,%r15
    1135:	41 56                	push   %r14
    1137:	49 89 f6             	mov    %rsi,%r14
    113a:	41 55                	push   %r13
    113c:	41 89 fd             	mov    %edi,%r13d
    113f:	41 54                	push   %r12
    1141:	4c 8d 25 a8 2c 00 00 	lea    0x2ca8(%rip),%r12        # 3df0 <__frame_dummy_init_array_entry>
    1148:	55                   	push   %rbp
    1149:	48 8d 2d a8 2c 00 00 	lea    0x2ca8(%rip),%rbp        # 3df8 <__init_array_end>
    1150:	53                   	push   %rbx
    1151:	4c 29 e5             	sub    %r12,%rbp
    1154:	48 83 ec 08          	sub    $0x8,%rsp
    1158:	e8 a3 fe ff ff       	callq  1000 <_init>
    115d:	48 c1 fd 03          	sar    $0x3,%rbp
    1161:	74 1b                	je     117e <__libc_csu_init+0x4e>
    1163:	31 db                	xor    %ebx,%ebx
    1165:	0f 1f 00             	nopl   (%rax)
    1168:	4c 89 fa             	mov    %r15,%rdx
    116b:	4c 89 f6             	mov    %r14,%rsi
    116e:	44 89 ef             	mov    %r13d,%edi
    1171:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
    1175:	48 83 c3 01          	add    $0x1,%rbx
    1179:	48 39 dd             	cmp    %rbx,%rbp
    117c:	75 ea                	jne    1168 <__libc_csu_init+0x38>
    117e:	48 83 c4 08          	add    $0x8,%rsp
    1182:	5b                   	pop    %rbx
    1183:	5d                   	pop    %rbp
    1184:	41 5c                	pop    %r12
    1186:	41 5d                	pop    %r13
    1188:	41 5e                	pop    %r14
    118a:	41 5f                	pop    %r15
    118c:	c3                   	retq   
    118d:	0f 1f 00             	nopl   (%rax)

0000000000001190 <__libc_csu_fini>:
    1190:	c3                   	retq   

Disassembly of section .fini:

0000000000001194 <_fini>:
    1194:	48 83 ec 08          	sub    $0x8,%rsp
    1198:	48 83 c4 08          	add    $0x8,%rsp
    119c:	c3                   	retq   
```

Let's take it one section at a time.

## The fini Section

This section holds executable instructions that contribute to the process
termination code. When a program exits normally, the system arranges to execute
the code in this section.

```
Disassembly of section .fini:

0000000000001194 <_fini>:
    1194:	48 83 ec 08          	sub    $0x8,%rsp
    1198:	48 83 c4 08          	add    $0x8,%rsp
    119c:	c3                   	retq   
```

## References

* [The .init and .fini Sections](http://l4u-00.jinr.ru/usoft/WWW/www_debian.org/Documentation/elf/node3.html)
