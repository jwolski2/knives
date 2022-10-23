# doublefree

A demonstration and in-depth look at double free bugs in C.

# Analysis

When running the code in this directory, the result in my terminal is:

```
$ ./doublefree
free(): double free detected in tcache 2
zsh: abort (core dumped)  ./doublefree
```

Some initial questions:

**Which library is printing out the error message?**

First, let's see what libraries the doublefree binary links to:

```
$ ldd doublefree
        linux-vdso.so.1 (0x00007fffae98f000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fcb0cfcb000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fcb0d1df000)
```

Ok, so the smoking gun here is libc. Let's look at its source. If I clone the
glibc repo from git://sourceware.org/git/glibc.git and grep:

```
$ git grep "double free detected"
malloc/malloc.c:                malloc_printerr ("free(): double free detected in tcache 2");
```

Great! I found the source of the error message. I got a bit lucky in that the
latest source still has a same error message even though the version of my
libc dependency might be different. Another question arises:

**What's with the 6 in .so.6?**

We can find out the answer with `man libc`. Therein there's a bit of history
about glibc and its relationship with the defunct Linux libc. "By the time glibc
2.0 was released (in 1997), it was clearly superior to Linux libc" whose
released major versions included 2, 3, 4, 5. "To avoid any confusion with Linux
libc versions, glibc2.0 and layer used the shared library soname libc.so.6."

**Why's it so bad to double-free? In other words, why the coredump?**

Now's a good time to review what harm glibc is exactly trying to prevent.

**How does glibc track allocated and freed memory?**

**Who's responsibility is it to protect applications from memory corruption?**

The function in which glibc spits out the above error message is named
`_int_free`. This function in turn checks an internal "tcache" (more on that
later) and invokes `malloc_printerr` which invokes `__libc_message` (defined in
`sysdeps/posix/libc_fatal.c`) which invokes `abort (defined in
`stdlib/abort.c`) which invokes ABORT_INSTRUCTION which is
architecture/platform-specific macro that invokes `asm("hlt") (on my system).

**Can I just invoke `asm("hlt")` from my own C program?**

# Out of Scope Questions

* What other mallocs are there out there and how do their implementations
  differ?
