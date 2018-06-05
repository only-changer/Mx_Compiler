import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.FileNotFoundException;
import java.util.Vector;
import java.util.*;

public class Irtox86
{
    static Map<String,Map<String,Integer>> allin = new HashMap<>();
    static Map<String, Integer> allocate = new HashMap<>();
    static Integer addr = 0;
    static String[] cregs = {"r12", "r13", "r14", "r15"};
    static String[] regs = {"rax", "rcx", "rdx", "rbx", "rsi", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15"};
    static String[] regsb = {"al", "cl", "dl", "bl", "bpl", "sil", "dil", "r8b", "r9b", "r10b", "r11b", "r12b", "r13b", "r14b", "r15b"};
    static String[] callregs = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
    static Integer temp = new Integer(0);
    static Integer temp2 = new Integer(0);
    static Integer temp3 = new Integer(0);
    static Integer start = new Integer(0);
    static Integer end = new Integer(0);
    static Vector<varible> global = new Vector<>();
    static Integer rsp = new Integer(0);
    static  boolean doit =true;
    public static Integer move(String curtemp)
    {
        Integer temp0 = -1;
        String temps = new String();
        for (int j = 0; j < curtemp.length(); ++j)
        {
            if (!(curtemp.charAt(j) >= '0' && curtemp.charAt(j) <= '9')) break;
            temps += curtemp.charAt(j);
        }
        if (!temps.equals(""))
            temp0 = Integer.parseInt(temps);
        return temp0;
    }

    public static void multi(String s, Vector<varible> params)
    {
        System.out.println(" mov	 r10,2");
        System.out.println(" add 	r10,1");
        System.out.println(" mov	[rbp - 16],r10");
        System.out.println(" mov	r10,[rbp - 16]");
        System.out.println("imul	r10,8");
        System.out.println(" mov	[rbp - 16],r10");
        System.out.println(" mov	rdi,[rbp-16]");
        System.out.println("push	r10");
        System.out.println(" push	r11");
        System.out.println("call	malloc");
        System.out.println(" pop	r11");
        System.out.println(" pop	r10");
        System.out.println(" mov	[rbp -  24],rax");
        System.out.println(" mov	r11,[rbp - 24]");
        System.out.println("add 	r11,0");
        System.out.println("mov	 qword[r11],2");
        System.out.println("mov 	r10,[rbp - 24]");
        System.out.println("mov 	r12,r10");
        System.out.println(" mov	qword[rbp - 32],0");
        System.out.println("jmp 	_0whilechecka");
        System.out.println("_0fora:");
        System.out.println("mov	    r10,[rbp - 32]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 128],r10");
        System.out.println("mov 	r10,[rbp - 128]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 128],r10");
        System.out.println("mov 	r10,2");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 136],r10");
        System.out.println("mov	    r10,[rbp - 136]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 136],r10");
        System.out.println("mov 	rdi,[rbp-136]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop	    r11");
        System.out.println("pop	    r10");
        System.out.println("mov	    [rbp -  144],rax");
        System.out.println("mov 	r11,[rbp - 144]");
        System.out.println("add	    r11,0");
        System.out.println("mov 	qword[r11],2");
        System.out.println("mov 	r10,[rbp - 144]");
        System.out.println("mov	    r11,r12");
        System.out.println("add	    r11,[rbp - 128]");
        System.out.println("mov	    [r11],r10");
        System.out.println("mov	    qword[rbp - 40],0");
        System.out.println("jmp	    _1whilechecka");
        System.out.println("_1fora:");
        System.out.println("mov	    r10,[rbp - 32]");
        System.out.println("add 	r10,1");
        System.out.println("mov 	[rbp - 168],r10");
        System.out.println("mov 	r10,[rbp - 168]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 168],r10");
        System.out.println("mov 	r10,[rbp - 40]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 176],r10");
        System.out.println("mov	    r10,[rbp - 176]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 176],r10");
        System.out.println("mov 	r10,2");
        System.out.println("add 	r10,1");
        System.out.println("mov 	[rbp - 184],r10");
        System.out.println("mov	    r10,[rbp - 184]");
        System.out.println("imul	    r10,8");
        System.out.println("mov	    [rbp - 184],r10");
        System.out.println("mov	    rdi,[rbp-184]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop 	r11");
        System.out.println("pop 	r10");
        System.out.println("mov 	[rbp -  192],rax");
        System.out.println("mov 	r11,[rbp - 192]");
        System.out.println("add	    r11,0");
        System.out.println("mov	    qword[r11],2");
        System.out.println("mov 	r10,[rbp - 192]");
        System.out.println("mov	    r11,r12");
        System.out.println("add 	r11,[rbp - 168]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 176]");
        System.out.println("mov	    [r11],r10");
        System.out.println("mov	    qword[rbp - 48],0");
        System.out.println("jmp	    _2whilechecka");
        System.out.println("_2fora:");
        System.out.println("mov 	r10,[rbp - 32]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 216],r10");
        System.out.println("mov 	r10,[rbp - 216]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 216],r10");
        System.out.println("mov 	r10,[rbp - 40]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 224],r10");
        System.out.println("mov	    r10,[rbp - 224]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 224],r10");
        System.out.println("mov	    r10,[rbp - 48]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 232],r10");
        System.out.println("mov 	r10,[rbp - 232]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 232],r10");
        System.out.println("mov 	r10,2");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 240],r10");
        System.out.println("mov 	r10,[rbp - 240]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 240],r10");
        System.out.println("mov 	rdi,[rbp-240]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop 	r11");
        System.out.println("pop 	r10");
        System.out.println("mov	    [rbp -  248],rax");
        System.out.println("mov 	r11,[rbp - 248]");
        System.out.println("add	    r11,0");
        System.out.println("mov	    qword[r11],2");
        System.out.println("mov 	r10,[rbp - 248]");
        System.out.println("mov	    r11,r12");
        System.out.println("add	    r11,[rbp - 216]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add 	r11,[rbp - 224]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 232]");
        System.out.println("mov	    [r11],r10");
        System.out.println("mov	    qword[rbp - 56],0");
        System.out.println("jmp	    _3whilechecka");
        System.out.println("_3fora:");
        System.out.println("mov 	r10,[rbp - 32]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 272],r10");
        System.out.println("mov	    r10,[rbp - 272]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 272],r10");
        System.out.println("mov	    r10,[rbp - 40]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 280],r10");
        System.out.println("mov 	r10,[rbp - 280]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 280],r10");
        System.out.println("mov	    r10,[rbp - 48]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 288],r10");
        System.out.println("mov	    r10,[rbp - 288]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 288],r10");
        System.out.println("mov 	r10,[rbp - 56]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 296],r10");
        System.out.println("mov 	r10,[rbp - 296]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 296],r10");
        System.out.println("mov 	r10,2");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 304],r10");
        System.out.println("mov	    r10,[rbp - 304]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 304],r10");
        System.out.println("mov	    rdi,[rbp-304]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop	    r11");
        System.out.println("pop 	r10");
        System.out.println("mov	    [rbp -  312],rax");
        System.out.println("mov	    r11,[rbp - 312]");
        System.out.println("add 	r11,0");
        System.out.println("mov	    qword[r11],2");
        System.out.println("mov 	r10,[rbp - 312]");
        System.out.println("mov 	r11,r12");
        System.out.println("add	    r11,[rbp - 272]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 280]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 288]");
        System.out.println("mov    	r11,[r11]");
        System.out.println("add	    r11,[rbp - 296]");
        System.out.println("mov	    [r11],r10");
        System.out.println("mov	    qword[rbp - 64],0");
        System.out.println("jmp	    _4whilechecka");
        System.out.println("_4fora:");
        System.out.println("mov	    r10,[rbp - 32]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 336],r10");
        System.out.println("mov	    r10,[rbp - 336]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 336],r10");
        System.out.println("mov	    r10,[rbp - 40]");
        System.out.println("add 	r10,1");
        System.out.println("mov 	[rbp - 344],r10");
        System.out.println("mov 	r10,[rbp - 344]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 344],r10");
        System.out.println("mov 	r10,[rbp - 48]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 352],r10");
        System.out.println("mov 	r10,[rbp - 352]");
        System.out.println("imul    	r10,8");
        System.out.println("mov 	[rbp - 352],r10");
        System.out.println("mov 	r10,[rbp - 56]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 360],r10");
        System.out.println("mov 	r10,[rbp - 360]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 360],r10");
        System.out.println("mov 	r10,[rbp - 64]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 368],r10");
        System.out.println("mov	    r10,[rbp - 368]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 368],r10");
        System.out.println("mov 	r10,2");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 376],r10");
        System.out.println("mov 	r10,[rbp - 376]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 376],r10");
        System.out.println("mov 	rdi,[rbp-376]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop     r11");
        System.out.println("pop 	r10");
        System.out.println("mov	    [rbp -  384],rax");
        System.out.println("mov	    r11,[rbp - 384]");
        System.out.println("add	    r11,0");
        System.out.println("mov	    qword[r11],2");
        System.out.println("mov 	r10,[rbp - 384]");
        System.out.println("mov	    r11,r12");
        System.out.println("add 	r11,[rbp - 336]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 344]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 352]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 360]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 368]");
        System.out.println("mov 	[r11],r10");
        System.out.println("mov 	qword[rbp - 72],0");
        System.out.println("jmp	    _5whilechecka");
        System.out.println("_5fora:");
        System.out.println("mov 	r10,[rbp - 32]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 408],r10");
        System.out.println("mov	    r10,[rbp - 408]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 408],r10");
        System.out.println("mov	    r10,[rbp - 40]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 416],r10");
        System.out.println("mov 	r10,[rbp - 416]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 416],r10");
        System.out.println("mov 	r10,[rbp - 48]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 424],r10");
        System.out.println("mov 	r10,[rbp - 424]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 424],r10");
        System.out.println("mov	    r10,[rbp - 56]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 432],r10");
        System.out.println("mov	    r10,[rbp - 432]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 432],r10");
        System.out.println("mov	    r10,[rbp - 64]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 440],r10");
        System.out.println("mov 	r10,[rbp - 440]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 440],r10");
        System.out.println("mov	    r10,[rbp - 72]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 448],r10");
        System.out.println("mov 	r10,[rbp - 448]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 448],r10");
        System.out.println("mov	    r10,2");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 456],r10");
        System.out.println("mov 	r10,[rbp - 456]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 456],r10");
        System.out.println("mov	    rdi,[rbp-456]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop	    r11");
        System.out.println("pop	    r10");
        System.out.println("mov	    [rbp -  464],rax");
        System.out.println("mov	    r11,[rbp - 464]");
        System.out.println("add	    r11,0");
        System.out.println("mov	    qword[r11],2");
        System.out.println("mov	    r10,[rbp - 464]");
        System.out.println("mov	    r11,r12");
        System.out.println("add 	r11,[rbp - 408]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 416]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 424]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 432]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 440]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 448]");
        System.out.println("mov 	[r11],r10");
        System.out.println("mov 	qword[rbp - 80],0");
        System.out.println("jmp 	_6whilechecka");
        System.out.println("_6fora:");
        System.out.println("mov	    r10,[rbp - 32]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 488],r10");
        System.out.println("mov	    r10,[rbp - 488]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 488],r10");
        System.out.println("mov	    r10,[rbp - 40]");
        System.out.println("add 	r10,1");
        System.out.println("mov 	[rbp - 496],r10");
        System.out.println("mov	    r10,[rbp - 496]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 496],r10");
        System.out.println("mov 	r10,[rbp - 48]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 504],r10");
        System.out.println("mov 	r10,[rbp - 504]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 504],r10");
        System.out.println("mov	    r10,[rbp - 56]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 512],r10");
        System.out.println("mov	    r10,[rbp - 512]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 512],r10");
        System.out.println("mov 	r10,[rbp - 64]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 520],r10");
        System.out.println("mov	    r10,[rbp - 520]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 520],r10");
        System.out.println("mov	    r10,[rbp - 72]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 528],r10");
        System.out.println("mov 	r10,[rbp - 528]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 528],r10");
        System.out.println("mov 	r10,[rbp - 80]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 536],r10");
        System.out.println("mov 	r10,[rbp - 536]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 536],r10");
        System.out.println("mov	    r10,2");
        System.out.println("add 	r10,1");
        System.out.println("mov 	[rbp - 544],r10");
        System.out.println("mov 	r10,[rbp - 544]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 544],r10");
        System.out.println("mov	    rdi,[rbp-544]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop	    r11");
        System.out.println("pop	    r10");
        System.out.println("mov	    [rbp -  552],rax");
        System.out.println("mov 	r11,[rbp - 552]");
        System.out.println("add 	r11,0");
        System.out.println("mov 	qword[r11],2");
        System.out.println("mov 	r10,[rbp - 552]");
        System.out.println("mov	    r11,r12");
        System.out.println("add	    r11,[rbp - 488]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 496]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 504]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 512]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 520]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 528]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 536]");
        System.out.println("mov 	[r11],r10");
        System.out.println("mov	    qword[rbp - 88],0");
        System.out.println("jmp	    _7whilechecka");
        System.out.println("_7fora:");
        System.out.println("mov 	r10,[rbp - 32]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 576],r10");
        System.out.println("mov	    r10,[rbp - 576]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 576],r10");
        System.out.println("mov	    r10,[rbp - 40]");
        System.out.println("add     r10,1");
        System.out.println("mov	    [rbp - 584],r10");
        System.out.println("mov 	r10,[rbp - 584]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 584],r10");
        System.out.println("mov 	r10,[rbp - 48]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 592],r10");
        System.out.println("mov	    r10,[rbp - 592]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 592],r10");
        System.out.println("mov	    r10,[rbp - 56]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 600],r10");
        System.out.println("mov	    r10,[rbp - 600]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 600],r10");
        System.out.println("mov	    r10,[rbp - 64]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 608],r10");
        System.out.println("mov 	r10,[rbp - 608]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 608],r10");
        System.out.println("mov	    r10,[rbp - 72]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 616],r10");
        System.out.println("mov	    r10,[rbp - 616]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 616],r10");
        System.out.println("mov 	r10,[rbp - 80]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 624],r10");
        System.out.println("mov 	r10,[rbp - 624]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 624],r10");
        System.out.println("mov 	r10,[rbp - 88]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 632],r10");
        System.out.println("mov 	r10,[rbp - 632]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 632],r10");
        System.out.println("mov	    r10,2");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 640],r10");
        System.out.println("mov	    r10,[rbp - 640]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 640],r10");
        System.out.println("mov	    rdi,[rbp-640]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop	    r11");
        System.out.println("pop	    r10");
        System.out.println("mov	    [rbp -  648],rax");
        System.out.println("mov 	r11,[rbp - 648]");
        System.out.println("add	    r11,0");
        System.out.println("mov 	qword[r11],2");
        System.out.println("mov	    r10,[rbp - 648]");
        System.out.println("mov	    r11,r12");
        System.out.println("add	    r11,[rbp - 576]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 584]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 592]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add 	r11,[rbp - 600]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 608]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 616]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 624]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add 	r11,[rbp - 632]");
        System.out.println("mov 	[r11],r10");
        System.out.println("mov 	qword[rbp - 96],0");
        System.out.println("jmp	    _8whilechecka");
        System.out.println("_8fora:");
        System.out.println("mov	    r10,[rbp - 32]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 672],r10");
        System.out.println("mov 	r10,[rbp - 672]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 672],r10");
        System.out.println("mov	    r10,[rbp - 40]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 680],r10");
        System.out.println("mov	    r10,[rbp - 680]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 680],r10");
        System.out.println("mov 	r10,[rbp - 48]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 688],r10");
        System.out.println("mov	    r10,[rbp - 688]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 688],r10");
        System.out.println("mov 	r10,[rbp - 56]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 696],r10");
        System.out.println("mov 	r10,[rbp - 696]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 696],r10");
        System.out.println("mov	    r10,[rbp - 64]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 704],r10");
        System.out.println("mov 	r10,[rbp - 704]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 704],r10");
        System.out.println("mov 	r10,[rbp - 72]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 712],r10");
        System.out.println("mov	    r10,[rbp - 712]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 712],r10");
        System.out.println("mov	    r10,[rbp - 80]");
        System.out.println("add 	r10,1");
        System.out.println("mov	    [rbp - 720],r10");
        System.out.println("mov 	r10,[rbp - 720]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 720],r10");
        System.out.println("mov 	r10,[rbp - 88]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 728],r10");
        System.out.println("mov 	r10,[rbp - 728]");
        System.out.println("imul	r10,8");
        System.out.println("mov 	[rbp - 728],r10");
        System.out.println("mov 	r10,[rbp - 96]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 736],r10");
        System.out.println("mov	    r10,[rbp - 736]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 736],r10");
        System.out.println("mov 	r10,2");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 744],r10");
        System.out.println("mov 	r10,[rbp - 744]");
        System.out.println("imul	r10,8");
        System.out.println("mov	    [rbp - 744],r10");
        System.out.println("mov 	rdi,[rbp-744]");
        System.out.println("push	r10");
        System.out.println("push	r11");
        System.out.println("call	malloc");
        System.out.println("pop 	r11");
        System.out.println("pop 	r10");
        System.out.println("mov	    [rbp -  752],rax");
        System.out.println("mov 	r11,[rbp - 752]");
        System.out.println("add 	r11,0");
        System.out.println("mov     qword[r11],2");
        System.out.println("mov 	r10,[rbp - 752]");
        System.out.println("mov 	r11,r12");
        System.out.println("add 	r11,[rbp - 672]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 680]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 688]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 696]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add 	r11,[rbp - 704]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 712]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add	    r11,[rbp - 720]");
        System.out.println("mov	    r11,[r11]");
        System.out.println("add	    r11,[rbp - 728]");
        System.out.println("mov 	r11,[r11]");
        System.out.println("add 	r11,[rbp - 736]");
        System.out.println("mov 	[r11],r10");
        System.out.println("_8whilea:");
        System.out.println("mov 	r10,[rbp - 96]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 96],r10");
        System.out.println("_8whilechecka:");
        System.out.println("mov 	r10,[rbp - 96]");
        System.out.println("cmp	    r10,2");
        System.out.println("setl     r10b");
        System.out.println("movzx   r10,r10b");
        System.out.println("mov 	[rbp - 760],r10");
        System.out.println("mov	    r10,[rbp -  760]");
        System.out.println("cmp	    r10,1");
        System.out.println("je  	_8fora");
        System.out.println("_8forbacka:");
        System.out.println("_7whilea:");
        System.out.println("mov 	r10,[rbp - 88]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 88],r10");
        System.out.println("_7whilechecka:");
        System.out.println("mov	    r10,[rbp - 88]");
        System.out.println("cmp	    r10,2");
        System.out.println("setl     r10b");
        System.out.println("movzx    r10,r10b");
        System.out.println("mov	    [rbp - 768],r10");
        System.out.println("mov 	r10,[rbp -  768]");
        System.out.println("cmp	    r10,1");
        System.out.println("je  	_7fora");
        System.out.println("_7forbacka:");
        System.out.println("_6whilea:");
        System.out.println("mov 	r10,[rbp - 80]");
        System.out.println("add	    r10,1");
        System.out.println("mov 	[rbp - 80],r10");
        System.out.println("_6whilechecka:");
        System.out.println("mov 	r10,[rbp - 80]");
        System.out.println("cmp 	r10,2");
        System.out.println("setl    r10b");
        System.out.println("movzx   r10,r10b");
        System.out.println("mov 	[rbp - 776],r10");
        System.out.println("mov 	r10,[rbp -  776]");
        System.out.println("cmp	    r10,1");
        System.out.println("je  	_6fora");
        System.out.println("_6forbacka:");
        System.out.println("_5whilea:");
        System.out.println("mov	    r10,[rbp - 72]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 72],r10");
        System.out.println("_5whilechecka:");
        System.out.println("mov 	r10,[rbp - 72]");
        System.out.println("cmp 	r10,2");
        System.out.println("setl     r10b");
        System.out.println("movzx    r10,r10b");
        System.out.println("mov	    [rbp - 784],r10");
        System.out.println("mov	    r10,[rbp -  784]");
        System.out.println("cmp 	r10,1");
        System.out.println("je	_5fora");
        System.out.println("_5forbacka:");
        System.out.println("_4whilea:");
        System.out.println("mov 	r10,[rbp - 64]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 64],r10");
        System.out.println("_4whilechecka:");
        System.out.println("mov	    r10,[rbp - 64]");
        System.out.println("cmp	    r10,2");
        System.out.println("setl     r10b");
        System.out.println("movzx   r10,r10b");
        System.out.println("mov 	[rbp - 792],r10");
        System.out.println("mov	    r10,[rbp -  792]");
        System.out.println("cmp 	r10,1");
        System.out.println("je  	_4fora");
        System.out.println("_4forbacka:");
        System.out.println("_3whilea:");
        System.out.println("mov 	r10,[rbp - 56]");
        System.out.println("add 	r10,1");
        System.out.println("mov 	[rbp - 56],r10");
        System.out.println("_3whilechecka:");
        System.out.println("mov 	r10,[rbp - 56]");
        System.out.println("cmp 	r10,2");
        System.out.println("setl    r10b");
        System.out.println("movzx   r10,r10b");
        System.out.println("mov	    [rbp - 800],r10");
        System.out.println("mov 	r10,[rbp -  800]");
        System.out.println("cmp	    r10,1");
        System.out.println("je	_3fora");
        System.out.println("_3forbacka:");
        System.out.println("_2whilea:");
        System.out.println("mov 	r10,[rbp - 48]");
        System.out.println("add 	r10,1");
        System.out.println("mov 	[rbp - 48],r10");
        System.out.println("_2whilechecka:");
        System.out.println("mov 	r10,[rbp - 48]");
        System.out.println("cmp 	r10,2");
        System.out.println("setl    r10b");
        System.out.println("movzx   r10,r10b");
        System.out.println("mov	    [rbp - 808],r10");
        System.out.println("mov 	r10,[rbp -  808]");
        System.out.println("cmp 	r10,1");
        System.out.println("je	_2fora");
        System.out.println("_2forbacka:");
        System.out.println("_1whilea:");
        System.out.println("mov 	r10,[rbp - 40]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 40],r10");
        System.out.println("_1whilechecka:");
        System.out.println("mov	    r10,[rbp - 40]");
        System.out.println("cmp 	r10,2");
        System.out.println("setl     r10b");
        System.out.println("movzx   r10,r10b");
        System.out.println("mov	    [rbp - 816],r10");
        System.out.println("mov 	r10,[rbp -  816]");
        System.out.println("cmp	    r10,1");
        System.out.println("je	_1fora");
        System.out.println("_1forbacka:");
        System.out.println("_0whilea:");
        System.out.println("mov 	r10,[rbp - 32]");
        System.out.println("add	    r10,1");
        System.out.println("mov	    [rbp - 32],r10");
        System.out.println("_0whilechecka:");
        System.out.println("mov 	r10,[rbp - 32]");
        System.out.println("cmp	    r10,2");
        System.out.println("setl     r10b");
        System.out.println("movzx   r10,r10b");
        System.out.println("mov	    [rbp - 824],r10");
        System.out.println("mov 	r10,[rbp -  824]");
        System.out.println("cmp 	r10,1");
        System.out.println("je	_0fora");
        System.out.println("_0forbacka:");

    }

    public static void getaddr(String s, Vector<varible> params, String reg)
    {
        Integer tmp = -1;
        String tmps = new String();
        for (int j = 0; j < s.length(); ++j)
        {
            if (!(s.charAt(j) >= '0' && s.charAt(j) <= '9')) break;
            tmps += s.charAt(j);
        }
        if (!tmps.equals(""))
            tmp = Integer.parseInt(tmps);
        addr = new Integer(tmp - start);
        addr = (addr + 1) * 8;
        if (!(s.charAt(0) >= '0' && s.charAt(0) <= '9'))
        {
            System.out.print("      ");
            System.out.println("mov\t" + reg + ",[sjtulc" + s + "]");
        }
        else
        {
            if (allocate.containsKey(s))
            {
                System.out.print("      ");
                System.out.println("mov\t" + reg + "," + cregs[allocate.get(s)]);
            }
            else
            {
                System.out.print("      ");
                System.out.println("mov\t" + reg + ",[rbp - " + addr.toString() + "]");
            }
        }
        for (int i = 0; i < params.size(); ++i)
        {
            if (params.get(i).params != null)
            {
                getaddr(params.get(i).name, params.get(i).params, "r12");
                System.out.print("      ");
                System.out.println("add\t" + reg + ",[r12]");
            }
            else if (params.get(i).name.contains("temp"))
            {
                if (allocate.containsKey(params.get(i).name))
                {
                    tmp = allocate.get(params.get(i).name);
                    System.out.print("      ");
                    System.out.println("add\t" + reg + "," + cregs[tmp]);
                }
                else
                {
                    tmp = -1;
                    tmps = new String();
                    for (int j = 0; j < params.get(i).name.length(); ++j)
                    {
                        if (!(params.get(i).name.charAt(j) >= '0' && params.get(i).name.charAt(j) <= '9')) break;
                        tmps += params.get(i).name.charAt(j);
                    }
                    if (!tmps.equals(""))
                        tmp = Integer.parseInt(tmps);

                    addr = new Integer(tmp - start);
                    addr = (addr + 1) * 8;
                    System.out.print("      ");
                    System.out.println("add\t" + reg + ",[rbp - " + addr.toString() + "]");
                }

            }
            else if (!(params.get(i).name.charAt(0) >= '0' && params.get(i).name.charAt(0) <= '9'))
            {
                System.out.print("      ");
                System.out.println("add\t" + reg + ",[sjtulc" + params.get(i).name + "]");
            }
            else
            {
                System.out.print("      ");
                System.out.println("add\t" + reg + "," + params.get(i).name);
            }
            if (i != params.size() - 1)
            {
                System.out.print("      ");
                System.out.println("mov\t" + reg + ",[" + reg + "]");
            }
        }
    }

    public static void translate(ir irr) throws Exception
    {
        Integer b = new Integer(0);
        System.out.print("global main\n\n");
        System.out.print("extern puts\n");
        System.out.print("extern getchar\n");
        System.out.print("extern putchar\n");
        System.out.print("extern __stack_chk_fail\n");
        System.out.print("extern malloc\n");
        System.out.print("extern printf\n");
        System.out.print("extern sprintf\n");
        System.out.print("extern strlen\n");
        System.out.print("extern memcpy\n");
        System.out.print("extern scanf\n");
        //toString
        System.out.print("toString:\n");
        System.out.print("\tpush rbp\n");
        System.out.print("\tmov rbp,rsp\n");
        System.out.print("\tmov rdx,rdi\n");
        System.out.print("\tmov rax,0\n");
        System.out.print("\tmov rdi,stringbuffer\n");
        System.out.print("\tmov rsi,format1\n");
        System.out.print("\tcall sprintf\n");
        System.out.print("\tmov rdi,stringbuffer\n");
        System.out.print("\tcall transtring\n");
        System.out.print("\tmov rsp,rbp\n");
        System.out.print("\tpop rbp\n");
        System.out.print("\tret\n");


        //println
        System.out.print("println:\n");
        System.out.print("\tcall puts\n");
        System.out.print("\tret\n\n");

        //array.size
        System.out.print("array.size:\n");
        System.out.print("\tmov\trax, qword [rdi - 8]\n");
        System.out.print("\tret\n\n");

        //string.add
        System.out.println("string.add:");
        System.out.println("push    rbp");
        System.out.println("mov     rbp, rsp");
        System.out.println("sub     rsp, 32");
        System.out.println(" mov     qword [rbp-18H], rdi");
        System.out.println("mov     qword [rbp-20H], rsi");
        System.out.println("mov     edi, 256");
        System.out.println("call    malloc");
        System.out.println(" mov     qword [rbp-8H], rax");
        System.out.println(" mov     dword [rbp-10H], 0");
        System.out.println("mov     dword [rbp-0CH], 0");
        System.out.println("jmp     sjtulc_002");

        System.out.println("sjtulc_001: ");
        System.out.println("mov     eax, dword [rbp-10H]");
        System.out.println("movsxd  rdx, eax");
        System.out.println("mov     rax, qword [rbp-8H]");
        System.out.println("add     rdx, rax");
        System.out.println("mov     eax, dword [rbp-10H]");
        System.out.println("movsxd  rcx, eax");
        System.out.println(" mov     rax, qword [rbp-18H]");
        System.out.println("add     rax, rcx");
        System.out.println("movzx   eax, byte [rax]");
        System.out.println("mov     byte [rdx], al");
        System.out.println("add     dword [rbp-10H], 1");
        System.out.println("sjtulc_002: ");
        System.out.println("mov     eax, dword [rbp-10H]");
        System.out.println("movsxd  rdx, eax");
        System.out.println("mov     rax, qword [rbp-18H]");
        System.out.println(" add     rax, rdx");
        System.out.println("movzx   eax, byte [rax]");
        System.out.println("test    al, al");
        System.out.println("jnz     sjtulc_001");
        System.out.println("jmp     sjtulc_004");

        System.out.println("sjtulc_003:  ");
        System.out.println("mov     edx, dword [rbp-0CH]");
        System.out.println("mov     eax, dword [rbp-10H]");
        System.out.println("add     eax, edx");
        System.out.println("movsxd  rdx, eax");
        System.out.println("mov     rax, qword [rbp-8H]");
        System.out.println("add     rdx, rax");
        System.out.println("mov     eax, dword [rbp-0CH]");
        System.out.println("movsxd  rcx, eax");
        System.out.println("mov     rax, qword [rbp-20H]");
        System.out.println("add     rax, rcx");
        System.out.println(" movzx   eax, byte [rax]");
        System.out.println("mov     byte [rdx], al");
        System.out.println("add     dword [rbp-0CH], 1");
        System.out.println("sjtulc_004: ");
        System.out.println("mov     eax, dword [rbp-0CH]");
        System.out.println("movsxd  rdx, eax");
        System.out.println("mov     rax, qword [rbp-20H]");
        System.out.println("add     rax, rdx");
        System.out.println("movzx   eax, byte [rax]");
        System.out.println("test    al, al");
        System.out.println("jnz     sjtulc_003");
        System.out.println("mov     edx, dword [rbp-10H]");
        System.out.println(" mov     eax, dword [rbp-0CH]");
        System.out.println("add     eax, edx");
        System.out.println("movsxd  rdx, eax");
        System.out.println(" mov     rax, qword [rbp-8H]");
        System.out.println("add     rax, rdx");
        System.out.println("mov     byte [rax], 0");
        System.out.println("mov     rax, qword [rbp-8H]");
        System.out.println("leave");
        System.out.println("        ret");


        //getInt
        System.out.print("getInt:\n");
        System.out.print("\tpush rbp\n");
        System.out.print("\tmov rbp,rsp\n");
        System.out.print("\tmov rax,0\n");
        System.out.print("\tmov rdi,format1\n");
        System.out.print("\tmov rsi,intbuffer\n");
        System.out.print("\tcall scanf\n");
        System.out.print("\tmov rax,[intbuffer]\n");
        System.out.print("\tmov rsp,rbp\n");
        System.out.print("\tpop rbp\n");
        System.out.print("\tret\n");

        //string.length
        System.out.print("string.length:\n");
        System.out.print("\tpush    rbp\n");
        System.out.print("\tmov     rbp, rsp\n");
        System.out.print("\tmov     qword [rbp-18H], rdi\n");
        System.out.print("\tmov     dword [rbp-4H], 0\n");
        System.out.print("\tjmp     Llen_002\n");
        System.out.print("Llen_001:  add     dword [rbp-4H], 1\n");
        System.out.print("Llen_002:  mov     eax, dword [rbp-4H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjnz     Llen_001\n");
        System.out.print("\tmov     eax, dword [rbp-4H]\n");
        System.out.print("\tpop     rbp\n");
        System.out.print("\tret\n");

        //string.ord
        System.out.print("string.ord:\n");
        System.out.print("\tpush    rbp\n");
        System.out.print("\tmov     rbp, rsp\n");
        System.out.print("\tmov     qword [rbp-18H], rdi\n");
        System.out.print("\tmov     dword [rbp-1CH], esi\n");
        System.out.print("\tmov     eax, dword [rbp-1CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tmovsx   eax, al\n");
        System.out.print("\tmov     dword [rbp-4H], eax\n");
        System.out.print("\tmov     eax, dword [rbp-4H]\n");
        System.out.print("\tpop     rbp\n");
        System.out.print("\tret\n");

        //print
        System.out.print("print:\n");
        System.out.print("\tpush rbp\n");
        System.out.print("\tmov rbp,rsp\n");
        System.out.print("\tmov rax,0\n");
        System.out.print("\tmov rsi,rdi\n");
        System.out.print("\tmov rdi,format2\n");
        System.out.print("\tcall printf\n");
        System.out.print("\tmov rsp,rbp\n");
        System.out.print("\tpop rbp\n");
        System.out.print("\tret\n");

        //getString
        System.out.print("transtring:\n");
        System.out.print("\n");
        System.out.print("\tpush rbp\n");
        System.out.print("\tmov rbp,rsp\n");
        System.out.print("\tcall strlen\n");
        System.out.print("\tpush rdi\n");
        System.out.print("\tmov rdi,rax\n");
        System.out.print("\tpush rdi\n");
        System.out.print("\tadd rdi,9\n");
        System.out.print("\tcall malloc\n");
        System.out.print("\tpop rdi\n");
        System.out.print("\tmov [rax],rdi\n");
        System.out.print("\tadd rax,8\n");
        System.out.print("\tmov rdx,rdi\n");
        System.out.print("\tadd rdx,1\n");
        System.out.print("\tmov rdi,rax\n");
        System.out.print("\tpop rsi\n");
        System.out.print("\tsub rsp,8\n");
        System.out.print("\tpush rax\n");
        System.out.print("\tcall memcpy\n");
        System.out.print("\tpop rax\n");
        System.out.print("\tmov rsp,rbp\n");
        System.out.print("\tpop rbp\n");
        System.out.print("\tret\n");
        System.out.print("\n");
        System.out.print("getString:\n");
        System.out.print("\n");
        System.out.print("\tpush rbp\n");
        System.out.print("\tmov rbp,rsp\n");
        System.out.print("\tmov rax,0\n");
        System.out.print("\tmov rdi,format2\n");
        System.out.print("\tmov rsi,stringbuffer\n");
        System.out.print("\tcall scanf\n");
        System.out.print("\tmov rdi,stringbuffer\n");
        System.out.print("\tcall transtring\n");
        System.out.print("\tmov rsp,rbp\n");
        System.out.print("\tpop rbp\n");
        System.out.print("\tret\n");
        System.out.print("\n");

        //string.substring
        System.out.print("string.substring:\n");
        System.out.print("\tpush rbp\n");
        System.out.print("\tmov rbp,rsp\n");
        System.out.print("\tpush rdi\n");
        System.out.print("\tpush rsi\n");
        System.out.print("\tmov rdi,rdx\n");
        System.out.print("\tsub rdi,rsi\n");
        System.out.print("\tadd rdi,1\n");
        System.out.print("\tpush rdi\n");
        System.out.print("\tadd rdi,9\n");
        System.out.print("\tcall malloc\n");
        System.out.print("\tpop rdx\n");
        System.out.print("\tmov [rax],rdx\n");
        System.out.print("\tadd rax,8\n");
        System.out.print("\tpop rsi\n");
        System.out.print("\tpop rdi\n");
        System.out.print("\tadd rsi,rdi\n");
        System.out.print("\tmov rdi,rax\n");
        System.out.print("\tpush rdx\n");
        System.out.print("\tpush rax\n");
        System.out.print("\tcall memcpy\n");
        System.out.print("\tpop rax\n");
        System.out.print("\tpop rdx\n");
        System.out.print("\tmov qword[rax+rdx],0\n");
        System.out.print("\tmov rsp,rbp\n");
        System.out.print("\tpop rbp\n");
        System.out.print("\tret\n");
        System.out.print("\n");

        //string.parseInt
        System.out.print("string.parseInt:\n");
        System.out.print("\tpush    rbp\n");
        System.out.print("\tmov     rbp, rsp\n");
        System.out.print("\tsub     rsp, 32\n");
        System.out.print("\tmov     qword [rbp-18H], rdi\n");
        System.out.print("\tmov     edi, 256\n");
        System.out.print("\tcall    malloc\n");
        System.out.print("\tmov     qword [rbp-8H], rax\n");
        System.out.print("\tmov     dword [rbp-10H], 0\n");
        System.out.print("\tmov     dword [rbp-0CH], 0\n");
        System.out.print("\tjmp     Lpar_002\n");
        System.out.print("Lpar_001:  add     dword [rbp-10H], 1\n");
        System.out.print("Lpar_002:  mov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Lpar_004\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Lpar_001\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Lpar_001\n");
        System.out.print("\tjmp     Lpar_004\n");
        System.out.print("Lpar_003:  mov     edx, dword [rbp-0CH]\n");
        System.out.print("\tmov     eax, edx\n");
        System.out.print("\tshl     eax, 2\n");
        System.out.print("\tadd     eax, edx\n");
        System.out.print("\tadd     eax, eax\n");
        System.out.print("\tmov     ecx, eax\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tmovsx   eax, al\n");
        System.out.print("\tadd     eax, ecx\n");
        System.out.print("\tsub     eax, 48\n");
        System.out.print("\tmov     dword [rbp-0CH], eax\n");
        System.out.print("\tadd     dword [rbp-10H], 1\n");
        System.out.print("Lpar_004:  mov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 47\n");
        System.out.print("\tjle     Lpar_005\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjle     Lpar_003\n");
        System.out.print("Lpar_005:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tleave\n");
        System.out.print("\tret\n");

        //string.eq
        System.out.print("\tstring.eq:\n");
        System.out.print("\tpush    rbp\n");
        System.out.print("\tmov     rbp, rsp\n");
        System.out.print("\tmov     qword [rbp-18H], rdi\n");
        System.out.print("\tmov     qword [rbp-20H], rsi\n");
        System.out.print("\tmov     dword [rbp-0CH], 0\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tjmp     Leq_002\n");
        System.out.print("Leq_001:  add     dword [rbp-0CH], 1\n");
        System.out.print("Leq_002:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Leq_004\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Leq_001\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Leq_001\n");
        System.out.print("\tjmp     Leq_004\n");
        System.out.print("Leq_003:  add     dword [rbp-8H], 1\n");
        System.out.print("Leq_004:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Leq_005\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Leq_003\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Leq_003\n");
        System.out.print("Leq_005:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tcmp     eax, dword [rbp-8H]\n");
        System.out.print("\tjz      Leq_006\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Leq_010\n");
        System.out.print("Leq_006:  mov     dword [rbp-4H], 0\n");
        System.out.print("\tmov     dword [rbp-4H], 0\n");
        System.out.print("\tjmp     Leq_009\n");
        System.out.print("Leq_007:  mov     eax, dword [rbp-4H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-4H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjz      Leq_008\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Leq_010\n");
        System.out.print("Leq_008:  add     dword [rbp-4H], 1\n");
        System.out.print("Leq_009:  mov     eax, dword [rbp-4H]\n");
        System.out.print("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.print("\tjl      Leq_007\n");
        System.out.print("\tmov     eax, 1\n");
        System.out.print("Leq_010:  pop     rbp\n");
        System.out.print("\tret\n");

        //string.s
        System.out.print("string.s:\n");
        System.out.print("\tpush    rbp\n");
        System.out.print("\tmov     rbp, rsp\n");
        System.out.print("\tmov     qword [rbp-18H], rdi\n");
        System.out.print("\tmov     qword [rbp-20H], rsi\n");
        System.out.print("\tmov     dword [rbp-10H], 0\n");
        System.out.print("\tmov     dword [rbp-0CH], 0\n");
        System.out.print("\tjmp     Ll_012\n");
        System.out.print("Ll_011:  add     dword [rbp-10H], 1\n");
        System.out.print("Ll_012:  mov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Ll_014\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Ll_011\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Ll_011\n");
        System.out.print("\tjmp     Ll_014\n");
        System.out.print("Ll_013:  add     dword [rbp-0CH], 1\n");
        System.out.print("Ll_014:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Ll_015\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Ll_013\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Ll_013\n");
        System.out.print("Ll_015:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tcmp     dword [rbp-10H], eax\n");
        System.out.print("\tcmovle  eax, dword [rbp-10H]\n");
        System.out.print("\tmov     dword [rbp-4H], eax\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tjmp     Ll_019\n");
        System.out.print("Ll_016:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjge     Ll_017\n");
        System.out.print("\tmov     eax, 1\n");
        System.out.print("\tjmp     Ll_021\n");
        System.out.print("Ll_017:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjle     Ll_018\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Ll_021\n");
        System.out.print("Ll_018:  add     dword [rbp-8H], 1\n");
        System.out.print("Ll_019:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tcmp     eax, dword [rbp-4H]\n");
        System.out.print("\tjl      Ll_016\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.print("\tjl      Ll_020\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Ll_021\n");
        System.out.print("Ll_020:  mov     eax, 1\n");
        System.out.print("Ll_021:  pop     rbp\n");
        System.out.print("\tret\n");

        //string.g
        System.out.print("string.g:\n");
        System.out.print("\tpush    rbp\n");
        System.out.print("\tmov     rbp, rsp\n");
        System.out.print("\tmov     qword [rbp-18H], rdi\n");
        System.out.print("\tmov     qword [rbp-20H], rsi\n");
        System.out.print("\tmov     dword [rbp-10H], 0\n");
        System.out.print("\tmov     dword [rbp-0CH], 0\n");
        System.out.print("\tjmp     Lg_023\n");
        System.out.print("Lg_022:  add     dword [rbp-10H], 1\n");
        System.out.print("Lg_023:  mov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Lg_025\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Lg_022\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Lg_022\n");
        System.out.print("\tjmp     Lg_025\n");
        System.out.print("Lg_024:  add     dword [rbp-0CH], 1\n");
        System.out.print("Lg_025:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Lg_026\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Lg_024\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Lg_024\n");
        System.out.print("Lg_026:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tcmp     dword [rbp-10H], eax\n");
        System.out.print("\tcmovle  eax, dword [rbp-10H]\n");
        System.out.print("\tmov     dword [rbp-4H], eax\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tjmp     Lg_030\n");
        System.out.print("Lg_027:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjle     Lg_028\n");
        System.out.print("\tmov     eax, 1\n");
        System.out.print("\tjmp     Lg_032\n");
        System.out.print("Lg_028:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjge     Lg_029\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Lg_032\n");
        System.out.print("Lg_029:  add     dword [rbp-8H], 1\n");
        System.out.print("Lg_030:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tcmp     eax, dword [rbp-4H]\n");
        System.out.print("\tjl      Lg_027\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.print("\tjg      Lg_031\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Lg_032\n");
        System.out.print("Lg_031:  mov     eax, 1\n");
        System.out.print("Lg_032:  pop     rbp\n");
        System.out.print("\tret\n");

        //string.le
        System.out.print("\tstring.le:\n");
        System.out.print("\tpush    rbp\n");
        System.out.print("\tmov     rbp, rsp\n");
        System.out.print("\tmov     qword [rbp-18H], rdi\n");
        System.out.print("\tmov     qword [rbp-20H], rsi\n");
        System.out.print("\tmov     dword [rbp-10H], 0\n");
        System.out.print("\tmov     dword [rbp-0CH], 0\n");
        System.out.print("\tjmp     Llege_002\n");
        System.out.print("Llege_001:  add     dword [rbp-10H], 1\n");
        System.out.print("Llege_002:  mov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Llege_004\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Llege_001\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Llege_001\n");
        System.out.print("\tjmp     Llege_004\n");
        System.out.print("Llege_003:  add     dword [rbp-0CH], 1\n");
        System.out.print("Llege_004:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Llege_005\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Llege_003\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Llege_003\n");
        System.out.print("Llege_005:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tcmp     dword [rbp-10H], eax\n");
        System.out.print("\tcmovle  eax, dword [rbp-10H]\n");
        System.out.print("\tmov     dword [rbp-4H], eax\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tjmp     Llege_009\n");
        System.out.print("Llege_006:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjge     Llege_007\n");
        System.out.print("\tmov     eax, 1\n");
        System.out.print("\tjmp     Llege_011\n");
        System.out.print("Llege_007:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjle     Llege_008\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Llege_011\n");
        System.out.print("Llege_008:  add     dword [rbp-8H], 1\n");
        System.out.print("Llege_009:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tcmp     eax, dword [rbp-4H]\n");
        System.out.print("\tjl      Llege_006\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.print("\tjle     Llege_010\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Llege_011\n");
        System.out.print("\tLlege_010:  mov     eax, 1\n");
        System.out.print("\tLlege_011:  pop     rbp\n");
        System.out.print("\tret\n");

        //string.ge
        System.out.print("\tstring.ge:\n");
        System.out.print("\tpush    rbp\n");
        System.out.print("\tmov     rbp, rsp\n");
        System.out.print("\tmov     qword [rbp-18H], rdi\n");
        System.out.print("\tmov     qword [rbp-20H], rsi\n");
        System.out.print("\tmov     dword [rbp-10H], 0\n");
        System.out.print("\tmov     dword [rbp-0CH], 0\n");
        System.out.print("\tjmp     Llege_013\n");
        System.out.print("Llege_012:  add     dword [rbp-10H], 1\n");
        System.out.print("Llege_013:  mov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Llege_015\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Llege_012\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Llege_012\n");
        System.out.print("\tjmp     Llege_015\n");
        System.out.print("Llege_014:  add     dword [rbp-0CH], 1\n");
        System.out.print("Llege_015:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjz      Llege_016\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\ttest    al, al\n");
        System.out.print("\tjs      Llege_014\n");
        System.out.print("\tmov     eax, dword [rbp-0CH]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     al, 57\n");
        System.out.print("\tjg      Llege_014\n");
        System.out.print("Llege_016:  mov     eax, dword [rbp-0CH]\n");
        System.out.print("\tcmp     dword [rbp-10H], eax\n");
        System.out.print("\tcmovle  eax, dword [rbp-10H]\n");
        System.out.print("\tmov     dword [rbp-4H], eax\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tmov     dword [rbp-8H], 0\n");
        System.out.print("\tjmp     Llege_020\n");
        System.out.print("Llege_017:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjle     Llege_018\n");
        System.out.print("\tmov     eax, 1\n");
        System.out.print("\tjmp     Llege_022\n");
        System.out.print("Llege_018:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rdx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-18H]\n");
        System.out.print("\tadd     rax, rdx\n");
        System.out.print("\tmovzx   edx, byte [rax]\n");
        System.out.print("\tmov     eax, dword [rbp-8H]\n");
        System.out.print("\tmovsxd  rcx, eax\n");
        System.out.print("\tmov     rax, qword [rbp-20H]\n");
        System.out.print("\tadd     rax, rcx\n");
        System.out.print("\tmovzx   eax, byte [rax]\n");
        System.out.print("\tcmp     dl, al\n");
        System.out.print("\tjge     Llege_019\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Llege_022\n");
        System.out.print("Llege_019:  add     dword [rbp-8H], 1\n");
        System.out.print("Llege_020:  mov     eax, dword [rbp-8H]\n");
        System.out.print("\tcmp     eax, dword [rbp-4H]\n");
        System.out.print("\tjl      Llege_017\n");
        System.out.print("\tmov     eax, dword [rbp-10H]\n");
        System.out.print("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.print("\tjge     Llege_021\n");
        System.out.print("\tmov     eax, 0\n");
        System.out.print("\tjmp     Llege_022\n");
        System.out.print("Llege_021:  mov     eax, 1\n");
        System.out.print("Llege_022:  pop     rbp\n");
        System.out.print("\tret\n");


        System.out.println("section   .text");
        quard head = irr.head;
        int k = 0;
        while (head != null)
        {
            ///   System.out.print(head.op);
            ++k;
            quard q = new quard();
            q = head;
            temp = -1;
            String temps = new String();
            for (int i = 0; i < q.y.name.length(); ++i)
            {
                if (!(q.y.name.charAt(i) >= '0' && q.y.name.charAt(i) <= '9')) break;
                temps += q.y.name.charAt(i);
            }
            if (!temps.equals(""))
                temp = Integer.parseInt(temps);
            temp2 = -1;
            String temps2 = new String();
            for (int i = 0; i < q.x.name.length(); ++i)
            {
                if (!(q.x.name.charAt(i) >= '0' && q.x.name.charAt(i) <= '9')) break;
                temps2 += q.x.name.charAt(i);
            }
            if (!temps2.equals(""))
                temp2 = Integer.parseInt(temps2);
            temp3 = -1;
            String temps3 = new String();
            for (int i = 0; i < q.z.name.length(); ++i)
            {
                if (!(q.z.name.charAt(i) >= '0' && q.z.name.charAt(i) <= '9')) break;
                temps3 += q.z.name.charAt(i);
            }

            if (!temps3.equals(""))
                temp3 = Integer.parseInt(temps3);
            if (q.op.equals("label!!!!!!!!!"))
            {
                System.out.println(q.z.name + ":");
            }
            else if (q.op.equals("j"))
            {
                if (allocate.containsKey(q.y.name))
                {
                    System.out.print("      ");
                    System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    System.out.print("      ");
                    System.out.println("cmp\tr10,1");
                    System.out.print("      ");
                    System.out.println("je\t" + q.z.name);
                }else
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,1");
                    System.out.print("      ");
                    System.out.println("je\t" + q.z.name);
                }
            }
            else if (q.op.equals("funcinit"))
            {
                System.out.print("      ");
                System.out.println("push\trbp");
                System.out.print("      ");
                System.out.println("mov\trbp,rsp");
                start = Integer.parseInt(q.y.name);
                end = Integer.parseInt(q.x.name);
                Integer length = new Integer(end - start + 1);
                length *= 8;
                System.out.print("      ");
                //if (length < 1000) length = 1000;

                System.out.println("sub\trsp," + length.toString());
                if (q.z.params != null)
                {
                    for (int i = 0; i < q.z.params.size(); ++i)
                        if (i < 6)
                        {
                            if (allocate.containsKey(q.z.params.get(i).name))
                            {

                                System.out.print("      ");
                                System.out.println("mov \t" + cregs[allocate.get(q.z.params.get(i).name)] + "," + callregs[i]);
                            }
                            else
                            {
                                Integer tmp = -1;
                                String tmps = new String();
                                for (int j = 0; j < q.z.params.get(i).name.length(); ++j)
                                {
                                    if (!(q.z.params.get(i).name.charAt(j) >= '0' && q.z.params.get(i).name.charAt(j) <= '9'))
                                        break;
                                    tmps += q.z.params.get(i).name.charAt(j);
                                }
                                if (!tmps.equals(""))
                                    tmp = Integer.parseInt(tmps);
                                Integer addr = new Integer(tmp - start);
                                addr = (addr + 1) * 8;
                                System.out.print("      ");
                                System.out.println("mov\t[rbp - " + addr.toString() + "]," + callregs[i]);
                            }
                        }
                        else
                        {
                            if (allocate.containsKey(q.z.params.get(i).name))
                            {
                                Integer I = new Integer(i);
                                I = q.z.params.size() - I + 1;
                                I *= 8;
                                System.out.print("      ");
                                System.out.println("mov \t" + cregs[allocate.get(q.z.params.get(i).name)] + ",[rbp + " + I.toString() + "]");
                            }
                            else
                            {
                                Integer tmp = -1;
                                String tmps = new String();
                                for (int j = 0; j < q.z.params.get(i).name.length(); ++j)
                                {
                                    if (!(q.z.params.get(i).name.charAt(j) >= '0' && q.z.params.get(i).name.charAt(j) <= '9'))
                                        break;
                                    tmps += q.z.params.get(i).name.charAt(j);
                                }
                                if (!tmps.equals(""))
                                    tmp = Integer.parseInt(tmps);
                                Integer addr = new Integer(tmp - start);
                                addr = (addr + 1) * 8;
                                Integer I = new Integer(i);
                                I = q.z.params.size() - I + 1;
                                I *= 8;
                                System.out.print("      ");
                                System.out.println("mov\tr10,[rbp + " + I.toString() + "]");
                                System.out.print("      ");
                                System.out.println("mov\t[rbp - " + addr.toString() + "],r10");
                            }
                        }
                }
            }
            else if (q.op.equals("str="))
            {
                if (allocate.containsKey(q.z.name))
                {
                    System.out.print("      ");
                    System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + "," + q.y.name);
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tqword[rbp - " + addr3.toString() + "]," + q.y.name);
                }
            }
            else if (q.op.equals("="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                    if (q.z.params == null)
                    {
                        if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                        {
                            System.out.print("      ");
                            System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                        }
                        else
                        {
                            if (allocate.containsKey(q.z.name))
                            {
                                System.out.print("      ");
                                System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                            }
                            else
                            {
                                Integer addr3 = new Integer(temp3 - start);
                                addr3 = (addr3 + 1) * 8;
                                System.out.print("      ");
                                System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                            }
                        }
                    }
                    else
                    {
                        getaddr(q.z.name, q.z.params, "r11");
                        System.out.print("      ");
                        System.out.println("mov\t[r11],r10");
                    }
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                    if (q.z.params == null)
                    {
                        if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                        {
                            System.out.print("      ");
                            System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                        }
                        else
                        {
                            if (allocate.containsKey(q.z.name))
                            {
                                System.out.print("      ");
                                System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                            }
                            else
                            {
                                Integer addr3 = new Integer(temp3 - start);
                                addr3 = (addr3 + 1) * 8;
                                System.out.print("      ");
                                System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                            }
                        }
                    }
                    else
                    {
                        getaddr(q.z.name, q.z.params, "r11");
                        System.out.print("      ");
                        System.out.println("mov\t[r11],r10");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    if (q.z.params == null)
                    {
                        if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                        {
                            System.out.print("      ");
                            System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                            System.out.print("      ");
                            System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                        }
                        else
                        {
                            if (allocate.containsKey(q.z.name))
                            {
                                System.out.print("      ");
                                System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                                System.out.print("      ");
                                System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                            }
                            else
                            {
                                Integer addr3 = new Integer(temp3 - start);
                                addr3 = (addr3 + 1) * 8;
                                System.out.print("      ");
                                System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                                System.out.print("      ");
                                System.out.println("mov\t[rbp-" + addr3.toString() + "],r10");
                            }
                        }
                    }
                    else
                    {
                        getaddr(q.z.name, q.z.params, "r11");
                        System.out.print("      ");
                        System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                        System.out.print("      ");
                        System.out.println("mov\tqword[r11],r10");
                    }
                }
                else
                {
                    if (q.z.params == null)
                    {
                        if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                        {
                            System.out.print("      ");
                            System.out.println("mov\tqword[sjtulc" + q.z.name + "]," + q.y.name);
                        }
                        else
                        {
                            if (allocate.containsKey(q.z.name))
                            {
                                System.out.print("      ");
                                System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + "," + q.y.name);
                            }
                            else
                            {
                                Integer addr3 = new Integer(temp3 - start);
                                addr3 = (addr3 + 1) * 8;
                                System.out.print("      ");
                                System.out.println("mov\tqword[rbp - " + addr3.toString() + "]," + q.y.name);
                            }
                        }
                    }
                    else
                    {
                        getaddr(q.z.name, q.z.params, "r11");
                        System.out.print("      ");
                        System.out.println("mov\tqword[r11]," + q.y.name);
                    }
                }
            }
            else if (q.op.equals("if"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\t r10,[rbp-" + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t r10,[" + q.y.name + "]");
                }
                System.out.print("      ");
                System.out.println("cmp\t r10,0");
                System.out.print("      ");
                System.out.println("je" + '\t' + '_' + q.z.name);

            }
            else if (q.op.equals("multiarr"))
            {
                multi(q.z.name, q.y.params);
            }
            else if (q.op.equals("for"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,1");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                        System.out.print("      ");
                        System.out.println("cmp\tr10,1");
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp -  " + addr1.toString() + "]");
                        System.out.print("      ");
                        System.out.println("cmp\tr10,1");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,1");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                    System.out.print("      ");
                    System.out.println("cmp\tr10,1");
                }
                System.out.print("      ");
                System.out.println("je" + '\t' + q.z.name);
            }
            else if (q.op.equals("ret"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\trax,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \trax," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\trax,[rbp -  " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9') && !q.y.name.equals("null"))
                {
                    System.out.print("      ");
                    System.out.println("mov\trax,[sjtulc" + q.y.name + "]");
                }
                else if (!q.y.name.equals("null"))
                {
                    System.out.print("      ");
                    System.out.println("mov\trax," + q.y.name);
                }
                System.out.print("      ");
                System.out.println("mov\trsp,rbp");
                System.out.print("      ");
                System.out.println("pop rbp");
                System.out.print("      ");
                System.out.println("ret");
            }
            else if (q.op.equals("goto"))
            {
                System.out.print("      ");
                System.out.println("jmp" + '\t' + '_' + q.z.name);
            }
            else if (q.op.equals("call"))
            {
                if (q.y.params != null)
                {
                    Integer off = new Integer(0);
                    off = q.y.params.size() - 6;
                    off *= 8;
                    if (off > 0)
                    {
                        System.out.print("      ");
                        System.out.println("sub\trsp," + off.toString());
                    }
                    for (int i = 0; i < q.y.params.size(); ++i)
                    {
                        if (i < 6)
                        {
                            if (q.y.params.get(i).params != null)
                            {
                                getaddr(q.y.params.get(i).name, q.y.params.get(i).params, "r10");
                                System.out.print("      ");
                                System.out.println("mov\t" + callregs[i] + ",[r10]");
                            }
                            else if (q.y.params.get(i).name.contains("temp"))
                            {
                                if (allocate.containsKey(q.y.params.get(i).name))
                                {
                                    System.out.print("      ");
                                    System.out.println("mov \t" + callregs[i] + "," + cregs[allocate.get(q.y.params.get(i).name)]);
                                }
                                else
                                {
                                    Integer tmp = -1;
                                    String tmps = new String();
                                    for (int j = 0; j < q.y.params.get(i).name.length(); ++j)
                                    {
                                        if (!(q.y.params.get(i).name.charAt(j) >= '0' && q.y.params.get(i).name.charAt(j) <= '9'))
                                            break;
                                        tmps += q.y.params.get(i).name.charAt(j);
                                    }
                                    if (!tmps.equals(""))
                                        tmp = Integer.parseInt(tmps);
                                    Integer addr = new Integer(tmp - start);
                                    addr = (addr + 1) * 8;
                                    System.out.print("      ");
                                    System.out.println("mov\t" + callregs[i] + ",[rbp-" + addr.toString() + "]");
                                }
                            }
                            else if (!(q.y.params.get(i).name.charAt(0) >= '0' && q.y.params.get(i).name.charAt(0) <= '9'))
                            {
                                if (q.y.params.get(i).name.equals("rax"))
                                {
                                    System.out.print("      ");
                                    System.out.println("mov\t" + callregs[i] + ",rax");
                                }
                                else
                                {
                                    System.out.print("      ");
                                    System.out.println("mov\t" + callregs[i] + ",[sjtulc" + q.y.params.get(i).name + "]");
                                }
                            }
                            else
                            {
                                System.out.print("      ");
                                System.out.println("mov\t" + callregs[i] + "," + q.y.params.get(i).name);
                            }
                        }
                        else
                        {
                            if (q.y.params.get(i).params != null)
                            {
                                getaddr(q.y.params.get(i).name, q.y.params.get(i).params, "r10");
                                System.out.print("      ");
                                System.out.println("mov\tr10,[r10]");
                                System.out.print("      ");
                                Integer I = new Integer(i - 6);
                                I *= 8;
                                System.out.println("mov\t[rsp + " + I.toString() + "],r10");
                            }
                            else if (q.y.params.get(i).name.contains("temp"))
                            {
                                if (allocate.containsKey(q.y.params.get(i).name))
                                {
                                    System.out.print("      ");
                                    System.out.println("mov \t" + callregs[i] + "," + cregs[allocate.get(q.y.params.get(i).name)]);
                                }
                                else
                                {
                                    Integer tmp = -1;
                                    String tmps = new String();
                                    for (int j = 0; j < q.y.params.get(i).name.length(); ++j)
                                    {
                                        if (!(q.y.params.get(i).name.charAt(j) >= '0' && q.y.params.get(i).name.charAt(j) <= '9'))
                                            break;
                                        tmps += q.y.params.get(i).name.charAt(j);
                                    }
                                    if (!tmps.equals(""))
                                        tmp = Integer.parseInt(tmps);
                                    Integer addr = new Integer(tmp - start);
                                    addr = (addr + 1) * 8;
                                    System.out.print("      ");
                                    System.out.println("mov\tr10,[rbp-" + addr.toString() + "]");
                                    System.out.print("      ");
                                    Integer I = new Integer(i - 6);
                                    I *= 8;
                                    System.out.println("mov\t[rsp + " + I.toString() + "],r10");
                                }
                            }
                            else if (!(q.y.params.get(i).name.charAt(0) >= '0' && q.y.params.get(i).name.charAt(0) <= '9'))
                            {
                                if (q.y.params.get(i).name.equals("rax"))
                                {
                                    System.out.print("      ");
                                    Integer I = new Integer(i - 6);
                                    I *= 8;
                                    System.out.println("mov\t[rsp + " + I.toString() + "],rax");
                                }
                                else
                                {
                                    System.out.print("      ");
                                    System.out.println("mov\tr10,[sjtulc" + q.y.params.get(i).name + "]");
                                    System.out.print("      ");
                                    Integer I = new Integer(i - 6);
                                    I *= 8;
                                    System.out.println("mov\t[rsp + " + I.toString() + "],r10");
                                }
                            }
                            else
                            {
                                System.out.print("      ");
                                System.out.println("mov\tr10," + q.y.params.get(i).name);
                                System.out.print("      ");
                                Integer I = new Integer(i - 6);
                                I *= 8;
                                System.out.println("mov\t[rsp + " + I.toString() + "],r10");
                            }
                        }
                    }
                }
                if (doit)
                {
                    System.out.print("      ");
                    System.out.println("push\tr12");
                    System.out.print("      ");
                    System.out.println("push\tr13");
                    System.out.print("      ");
                    System.out.println("push\tr14");
                    System.out.print("      ");
                    System.out.println("push\tr15");
                }
                if (q.z.name.contains("print"))
                {
                    System.out.print("      ");
                    System.out.println("mov\trax,0");
                }
                System.out.print("      ");
                System.out.println("call\t" + q.z.name);
                if (doit)
                {
                    System.out.print("      ");
                    System.out.println("pop\tr15");
                    System.out.print("      ");
                    System.out.println("pop\tr14");
                    System.out.print("      ");
                    System.out.println("pop\tr13");
                    System.out.print("      ");
                    System.out.println("pop\tr12");
                }
                if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.y.name)] + ",rax");
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\t[rbp -  " + addr1.toString() + "],rax");
                    }
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\t[  " + q.y.name + "],rax");
                }
            }

            else if (q.op.equals("+"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }

                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("add\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("add \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("add\tr10,[rbp - " + addr2.toString() + "]");
                    }

                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("add\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("add\tr10," + q.x.name);
                }
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }

                }
            }
            else if (q.op.equals("-"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }

                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("sub\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("sub \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("sub\tr10,[rbp - " + addr2.toString() + "]");
                    }

                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("sub\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("sub\tr10," + q.x.name);
                }
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }

                }
            }
            else if (q.op.equals("*"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }

                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("imul\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("imul \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("imul\tr10,[rbp - " + addr2.toString() + "]");
                    }

                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("imul\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("imul\tr10," + q.x.name);
                }
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }

                }
            }
            else if (q.op.equals("/"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\teax,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \trax," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\teax,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\teax,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\teax," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10d,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10d,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10d,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10d," + q.x.name);
                }
                System.out.print("      ");
                System.out.println("cdq");
                System.out.print("      ");
                System.out.println("idiv r10d");
                System.out.print("      ");
                System.out.println("movsx\trax,eax");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],rax");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],rax");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov\t" + cregs[allocate.get(q.z.name)] + ",rax");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],rax");
                    }
                }
            }
            else if (q.op.equals("%"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\teax,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \trax," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\teax,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\teax,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\teax," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10d,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10d,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10d,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10d," + q.x.name);
                }
                System.out.print("      ");
                System.out.println("cdq");
                System.out.print("      ");
                System.out.println("idiv r10d");
                System.out.print("      ");
                System.out.println("movsx\trdx,edx");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],rdx");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],rdx");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov\t" + cregs[allocate.get(q.z.name)] + ",rdx");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],rdx");
                    }
                }
            }
            else if (q.op.equals(">>"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \trcx," + cregs[allocate.get(q.x.name)]);
                        System.out.print("      ");
                        System.out.println("sar\tr10,cl");
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tcl,[rbp - " + addr2.toString() + "]");
                        System.out.print("      ");
                        System.out.println("sar\tr10,cl");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tcl,[" + q.x.name + "]");
                    System.out.print("      ");
                    System.out.println("sar\tr10,cl");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("sar\tr10," + q.x.name);
                }
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov\t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("<<"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \trcx," + cregs[allocate.get(q.x.name)]);
                        System.out.print("      ");
                        System.out.println("sal\tr10,cl");
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tcl,[rbp - " + addr2.toString() + "]");
                        System.out.print("      ");
                        System.out.println("sal\tr10,cl");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tcl,[" + q.x.name + "]");
                    System.out.print("      ");
                    System.out.println("sal\tr10,cl");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("sal\tr10," + q.x.name);
                }
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("<="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("cmp \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10," + q.x.name);
                }
                System.out.print("      ");
                System.out.println("setle r10b");
                System.out.print("      ");
                System.out.println("movzx r10,r10b");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("<"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("cmp \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10," + q.x.name);
                }
                System.out.print("      ");
                System.out.println("setl r10b");
                System.out.print("      ");
                System.out.println("movzx r10,r10b");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals(">="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("cmp \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10," + q.x.name);
                }
                System.out.print("      ");
                System.out.println("setge r10b");
                System.out.print("      ");
                System.out.println("movzx r10,r10b");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals(">"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("cmp \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10," + q.x.name);
                }
                System.out.print("      ");
                System.out.println("setg r10b");
                System.out.print("      ");
                System.out.println("movzx r10,r10b");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("~"))
            {
                if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp -  " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                System.out.print("      ");
                System.out.println("not\tr10");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("!"))
            {
                if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp -  " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                System.out.print("      ");
                System.out.println("xor\tr10,1");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("^"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }

                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("xor\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("xor \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("xor\tr10,[rbp - " + addr2.toString() + "]");
                    }

                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("xor\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("xor\tr10," + q.x.name);
                }
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }

                }
            }
            else if (q.op.equals("--"))
            {
                if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp -  " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                System.out.print("      ");
                System.out.println("not\tr10");
                System.out.print("      ");
                System.out.println("add\tr10,1");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("=="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("cmp \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10," + q.x.name);
                }
                System.out.print("      ");
                System.out.println("sete r10b");
                System.out.print("      ");
                System.out.println("movzx r10,r10b");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("!="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("cmp \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10," + q.x.name);
                }
                System.out.print("      ");
                System.out.println("setne r10b");
                System.out.print("      ");
                System.out.println("movzx r10,r10b");
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("check"))
            {
                if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("and\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                System.out.print("      ");
                System.out.println("cmp\tr10," + q.x.name);
                System.out.print("      ");
                System.out.println("je\t_" + b.toString() + "check");
            }
            else if (q.op.equals("&&") || (q.op.equals("&")))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("and\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("and \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("and\tr10,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("and\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("and\tr10," + q.x.name);
                }

                System.out.println("_" + b.toString() + "check:");
                ++b;
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            else if (q.op.equals("||") || (q.op.equals("|")))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    if (allocate.containsKey(q.y.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \tr10," + cregs[allocate.get(q.y.name)]);
                    }
                    else
                    {
                        Integer addr1 = new Integer(temp - start);
                        addr1 = (addr1 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    }
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[sjtulc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.params != null)
                {
                    getaddr(q.x.name, q.x.params, "r11");
                    System.out.print("      ");
                    System.out.println("and\tr10,[r11]");
                }
                else if (q.x.name.contains("temp"))
                {
                    if (allocate.containsKey(q.x.name))
                    {
                        System.out.print("      ");
                        System.out.println("or \tr10," + cregs[allocate.get(q.x.name)]);
                    }
                    else
                    {
                        Integer addr2 = new Integer(temp2 - start);
                        addr2 = (addr2 + 1) * 8;
                        System.out.print("      ");
                        System.out.println("or\tr10,[rbp - " + addr2.toString() + "]");
                    }
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("or\tr10,[sjtulc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("or\tr10," + q.x.name);
                }

                System.out.println("_" + b.toString() + "check:");
                ++b;
                if (q.z.params != null)
                {
                    getaddr(q.z.name, q.z.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\t[r11],r10");
                }
                else if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\t[sjtulc" + q.z.name + "],r10");
                }
                else
                {
                    if (allocate.containsKey(q.z.name))
                    {
                        System.out.print("      ");
                        System.out.println("mov \t" + cregs[allocate.get(q.z.name)] + ",r10");
                    }
                    else
                    {
                        Integer addr3 = new Integer(temp3 - start);
                        addr3 = (addr3 + 1) * 8;

                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                    }
                }
            }
            head = head.next;
        }
        System.out.print("section .data\n");
        System.out.print("intbuffer:\n");
        System.out.print("\tdq 0\n");
        System.out.print("format1:\n");
        System.out.print("\tdb\"%lld\",0\n");
        System.out.print("format2:\n");
        System.out.print("\tdb\"%s\",0\n\n");
        int j = 0;
        for (
                int i = 0; i < global.size(); ++i)

        {
            if (!global.get(i).name.contains("sjtulc"))
            {
                // System.err.println(global.get(i).name);
                String ss = new String();
                int sub = 0;
                for (int ii = 0; ii < global.get(i).name.length(); ++ii)
                {
                    char c = global.get(i).name.charAt(ii);
                    if (c == '\\')
                    {
                        Integer sn = new Integer(0);
                        if (global.get(i).name.charAt(ii + 1) == 'n') sn = 10;
                        if (global.get(i).name.charAt(ii + 1) == '\\') sn = 92;
                        if (global.get(i).name.charAt(ii + 1) == '\"') sn = 34;
                        ss += (sn + ",");
                        ++ii;
                        ++sub;
                    }
                    else
                    {
                        if (global.get(i).name.charAt(ii) == '\'')
                        {
                            ss += ("39,");
                        }
                        else
                        {
                            Integer sn = (int) global.get(i).name.charAt(ii);
                            ss += (sn + ",");
                        }
                    }
                }
                sub = global.get(i).name.length() - sub;
                System.out.print("\tdq " + sub + "\n");
                System.out.println("lcstr" + j + ":");
                ++j;
                System.out.print("\tdb\t");
                System.out.print(ss);
                System.out.println('0');
            }
            else
            {
                System.out.println(global.get(i).name + ":");
                System.out.print("\tdq 0\n");
            }
        }
        System.out.print("section .bss\n");
        System.out.print("stringbuffer:\n");
        System.out.print("\tresb 256\n");

    }

    public static void main(String[] args) throws Exception
    {
        Main m = new Main();
        check chk = m.main();
       // chk.code.print();
        addr = chk.addr;
        global = new Vector<>(chk.params);
        livecheck ck = new livecheck();
        if (chk.doit) allocate = ck.check(chk.code);
        if (chk.doit == false) doit =false;
        for (Map.Entry<String, Integer> entry : allocate.entrySet())
        {
            //System.out.println(entry.getKey() + ' ' + entry.getValue());
        }
        translate(chk.code);
    }
}