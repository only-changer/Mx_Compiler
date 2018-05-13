"C:\Program Files (x86)\Java\jdk1.8.0_161\bin\java" "-javaagent:E:\IntelliJ IDEA Community Edition 2018.1\lib\idea_rt.jar=62975:E:\IntelliJ IDEA Community Edition 2018.1\bin" -Dfile.encoding=UTF-8 -classpath "C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\charsets.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\deploy.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\access-bridge-32.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\cldrdata.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\dnsns.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\jaccess.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\jfxrt.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\localedata.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\nashorn.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\sunec.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\sunjce_provider.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\sunmscapi.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\sunpkcs11.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\ext\zipfs.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\javaws.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\jce.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\jfr.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\jfxswt.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\jsse.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\management-agent.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\plugin.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\resources.jar;C:\Program Files (x86)\Java\jdk1.8.0_161\jre\lib\rt.jar;E:\Java_Files\IDE\out\production\IDE;F:\antlr-4.7-complete.jar" Irtox86
global    main
section   .text
main:
      mov	rax,10
      mov	rcx,0
      mov	rdx,1
_0for:
      add	rcx,rdx
      add	rdx,1
      cmp	rdx,rax
      jle	_0cmp
      mov	rbx,0
      jmp	_0cmpback
_0cmp:
      mov	rbx,1
_0cmpback:
      cmp	rbx,1
      je	_0for
_0forback:
      mov	rsp,1
_1for:
      add	rcx,10
      add	rcx,rsp
      add	rsp,1
      cmp	rsp,rax
      jle	_1cmp
      mov	rbp,0
      jmp	_1cmpback
_1cmp:
      mov	rbp,1
_1cmpback:
      cmp	rbp,1
      je	_1for
_1forback:
      mov	rdi,rcx
      mov	rax,60
      syscall
section   .bss
str:      resb      64  

Process finished with exit code 0
