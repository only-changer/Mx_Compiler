import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.FileNotFoundException;

public class Irtox86
{
    static Integer addr = 0;
    static String[] regs = {"rax", "rcx", "rdx", "rbx", "rsi", "rdi","r8","r9","r10","r11","r12","r13","r14","r15"};
    static String[] regsb = {"al", "cl", "dl", "bl", "bpl", "sil", "dil","r8b","r9b","r10b","r11b","r12b","r13b","r14b","r15b"};
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
    public static void translate(ir irr) throws Exception
    {
        Integer strfor = new Integer(0);
        Integer ws = 0;
        Integer f = 0;
        System.out.println("global main\n\n");
        System.out.println("extern puts\n");
        System.out.println("extern getchar\n");
        System.out.println("extern putchar\n");
        System.out.println("extern __stack_chk_fail\n");
        System.out.println("extern malloc\n");
        System.out.println("extern printf\n");
        System.out.println("extern strlen\n");
        System.out.println("extern memcpy\n");
        System.out.println("extern scanf\n");
        //toString
        System.out.println("toString:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tsub     rsp, 1088\n");
        System.out.println("\tmov     dword [rbp-434H], edi\n");
        System.out.println("\tmov     rax, qword [fs:abs 28H]\n");
        System.out.println("\tmov     qword [rbp-8H], rax\n");
        System.out.println("\txor     eax, eax\n");
        System.out.println("\tmov     edi, 256\n");
        System.out.println("\tcall    malloc\n");
        System.out.println("\tmov     qword [rbp-418H], rax\n");
        System.out.println("\tmov     dword [rbp-424H], 0\n");
        System.out.println("\tcmp     dword [rbp-434H], 0\n");
        System.out.println("\tjnz     L_001\n");
        System.out.println("\tmov     rax, qword [rbp-418H]\n");
        System.out.println("\tmov     byte [rax], 48\n");
        System.out.println("\tmov     rax, qword [rbp-418H]\n");
        System.out.println("\tadd     rax, 1\n");
        System.out.println("\tmov     byte [rax], 0\n");
        System.out.println("\tmov     rax, qword [rbp-418H]\n");
        System.out.println("\tjmp     L_007\n");
        System.out.println("L_001:  cmp     dword [rbp-434H], 0\n");
        System.out.println("\tjns     L_002\n");
        System.out.println("\tmov     rax, qword [rbp-418H]\n");
        System.out.println("\tmov     byte [rax], 45\n");
        System.out.println("\tneg     dword [rbp-434H]\n");
        System.out.println("\tmov     dword [rbp-424H], 1\n");
        System.out.println("L_002:  mov     dword [rbp-420H], 0\n");
        System.out.println("\tjmp     L_004\n");
        System.out.println("L_003:  mov     esi, dword [rbp-420H]\n");
        System.out.println("\tlea     eax, [rsi+1H]\n");
        System.out.println("\tmov     dword [rbp-420H], eax\n");
        System.out.println("\tmov     ecx, dword [rbp-434H]\n");
        System.out.println("\tmov     edx, 1717986919\n");
        System.out.println("\tmov     eax, ecx\n");
        System.out.println("\timul    edx\n");
        System.out.println("\tsar     edx, 2\n");
        System.out.println("\tmov     eax, ecx\n");
        System.out.println("\tsar     eax, 31\n");
        System.out.println("\tsub     edx, eax\n");
        System.out.println("\tmov     eax, edx\n");
        System.out.println("\tshl     eax, 2\n");
        System.out.println("\tadd     eax, edx\n");
        System.out.println("\tadd     eax, eax\n");
        System.out.println("\tsub     ecx, eax\n");
        System.out.println("\tmov     edx, ecx\n");
        System.out.println("\tmovsxd  rax, esi\n");
        System.out.println("\tmov     dword [rbp+rax*4-410H], edx\n");
        System.out.println("\tmov     ecx, dword [rbp-434H]\n");
        System.out.println("\tmov     edx, 1717986919\n");
        System.out.println("\tmov     eax, ecx\n");
        System.out.println("\timul    edx\n");
        System.out.println("\tsar     edx, 2\n");
        System.out.println("\tmov     eax, ecx\n");
        System.out.println("\tsar     eax, 31\n");
        System.out.println("\tsub     edx, eax\n");
        System.out.println("\tmov     eax, edx\n");
        System.out.println("\tmov     dword [rbp-434H], eax\n");
        System.out.println("L_004:  cmp     dword [rbp-434H], 0\n");
        System.out.println("\tjnz     L_003\n");
        System.out.println("\tmov     dword [rbp-41CH], 0\n");
        System.out.println("\tjmp     L_006\n");
        System.out.println("L_005:  mov     edx, dword [rbp-424H]\n");
        System.out.println("\tmov     eax, dword [rbp-41CH]\n");
        System.out.println("\tadd     eax, edx\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-418H]\n");
        System.out.println("\tadd     rdx, rax\n");
        System.out.println("\tmov     eax, dword [rbp-420H]\n");
        System.out.println("\tsub     eax, 1\n");
        System.out.println("\tsub     eax, dword [rbp-41CH]\n");
        System.out.println("\tcdqe\n");
        System.out.println("\tmov     eax, dword [rbp+rax*4-410H]\n");
        System.out.println("\tadd     eax, 48\n");
        System.out.println("\tmov     byte [rdx], al\n");
        System.out.println("\tadd     dword [rbp-41CH], 1\n");
        System.out.println("L_006:  mov     eax, dword [rbp-41CH]\n");
        System.out.println("\tcmp     eax, dword [rbp-420H]\n");
        System.out.println("\tjl      L_005\n");
        System.out.println("\tmov     edx, dword [rbp-424H]\n");
        System.out.println("\tmov     eax, dword [rbp-420H]\n");
        System.out.println("\tadd     eax, edx\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-418H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmov     byte [rax], 0\n");
        System.out.println("\tmov     rax, qword [rbp-418H]\n");
        System.out.println("L_007:  mov     rdi, qword [rbp-8H]\n");
        System.out.println("\txor     rdi, qword [fs:abs 28H]\n");
        System.out.println("\tjz      L_008\n");
        System.out.println("\tcall    __stack_chk_fail\n");
        System.out.println("L_008:  leave\n");
        System.out.println("\t        ret\n");


        //println
        System.out.println("println:\n");
        System.out.println("\tcall puts\n");
        System.out.println("\tret\n\n");

        //array.size
        System.out.println("array.size:\n");
        System.out.println("\tmov\trax, qword [rdi - 8]\n");
        System.out.println("\tret\n\n");

        //string.add
        System.out.println("string.add:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tsub     rsp, 48\n");
        System.out.println("\tmov     qword [rbp-28H], rdi\n");
        System.out.println("\tmov     qword [rbp-30H], rsi\n");
        System.out.println("\tmov     edi, 256\n");
        System.out.println("\tcall    malloc\n");
        System.out.println("\tmov     qword [rbp-8H], rax\n");
        System.out.println("\tmov     dword [rbp-14H], 0\n");
        System.out.println("\tmov     dword [rbp-10H], 0\n");
        System.out.println("\tjmp     Ladd_002\n");
        System.out.println("Ladd_001:  add     dword [rbp-14H], 1\n");
        System.out.println("Ladd_002:  mov     eax, dword [rbp-14H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-28H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjnz     Ladd_001\n");
        System.out.println("\tjmp     Ladd_004\n");
        System.out.println("Ladd_003:  add     dword [rbp-10H], 1\n");
        System.out.println("Ladd_004:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-30H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjnz     Ladd_003\n");
        System.out.println("\tmov     dword [rbp-0CH], 0\n");
        System.out.println("\tjmp     Ladd_006\n");
        System.out.println("Ladd_005:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-8H]\n");
        System.out.println("\tadd     rdx, rax\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-28H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tmov     byte [rdx], al\n");
        System.out.println("\tadd     dword [rbp-0CH], 1\n");
        System.out.println("Ladd_006:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tcmp     eax, dword [rbp-14H]\n");
        System.out.println("\tjl      Ladd_005\n");
        System.out.println("\tmov     eax, dword [rbp-14H]\n");
        System.out.println("\tmov     dword [rbp-0CH], eax\n");
        System.out.println("\tjmp     Ladd_008\n");
        System.out.println("Ladd_007:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-8H]\n");
        System.out.println("\tadd     rdx, rax\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tsub     eax, dword [rbp-14H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-30H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tmov     byte [rdx], al\n");
        System.out.println("\tadd     dword [rbp-0CH], 1\n");
        System.out.println("Ladd_008:  mov     edx, dword [rbp-14H]\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tadd     eax, edx\n");
        System.out.println("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.println("\tjg      Ladd_007\n");
        System.out.println("\tmov     edx, dword [rbp-14H]\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tadd     eax, edx\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-8H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmov     byte [rax], 0\n");
        System.out.println("\tmov     rax, qword [rbp-8H]\n");
        System.out.println("\tleave\n");
        System.out.println("\t        ret\n");

        //getInt
        System.out.println("getInt:\n");
        System.out.println("\tpush rbp\n");
        System.out.println("\tmov rbp,rsp\n");
        System.out.println("\tmov rax,0\n");
        System.out.println("\tmov rdi,format1\n");
        System.out.println("\tmov rsi,intbuffer\n");
        System.out.println("\tcall scanf\n");
        System.out.println("\tmov rax,[intbuffer]\n");
        System.out.println("\tmov rsp,rbp\n");
        System.out.println("\tpop rbp\n");
        System.out.println("\tret\n");

        //string.length
        System.out.println("string.length:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     dword [rbp-4H], 0\n");
        System.out.println("\tjmp     Llen_002\n");
        System.out.println("Llen_001:  add     dword [rbp-4H], 1\n");
        System.out.println("Llen_002:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjnz     Llen_001\n");
        System.out.println("\tmov     eax, dword [rbp-4H]\n");
        System.out.println("\tpop     rbp\n");
        System.out.println("\tret\n");

        //string.ord
        System.out.println("string.ord:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     dword [rbp-1CH], esi\n");
        System.out.println("\tmov     eax, dword [rbp-1CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tmovsx   eax, al\n");
        System.out.println("\tmov     dword [rbp-4H], eax\n");
        System.out.println("\tmov     eax, dword [rbp-4H]\n");
        System.out.println("\tpop     rbp\n");
        System.out.println("\tret\n");

        //print
        System.out.println("print:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tsub     rsp, 32\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tjmp     Lprt_002\n");
        System.out.println("Lprt_001:  add     dword [rbp-8H], 1\n");
        System.out.println("Lprt_002:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjnz     Lprt_001\n");
        System.out.println("\tmov     dword [rbp-4H], 0\n");
        System.out.println("\tjmp     Lprt_010\n");
        System.out.println("Lprt_003:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 92\n");
        System.out.println("\tjne     Lprt_008\n");
        System.out.println("\tmov     eax, dword [rbp-4H]\n");
        System.out.println("\tadd     eax, 1\n");
        System.out.println("\tcmp     eax, dword [rbp-8H]\n");
        System.out.println("\tjge     Lprt_008\n");
        System.out.println("\tmov     eax, dword [rbp-4H]\n");
        System.out.println("\tcdqe\n");
        System.out.println("\tlea     rdx, [rax+1H]\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 110\n");
        System.out.println("\tjnz     Lprt_004\n");
        System.out.println("\tmov     edi, 10\n");
        System.out.println("\tcall    putchar\n");
        System.out.println("\tadd     dword [rbp-4H], 1\n");
        System.out.println("\tjmp     Lprt_009\n");
        System.out.println("Lprt_004:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tcdqe\n");
        System.out.println("\tlea     rdx, [rax+1H]\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 116\n");
        System.out.println("\tjnz     Lprt_005\n");
        System.out.println("\tmov     edi, 9\n");
        System.out.println("\tcall    putchar\n");
        System.out.println("\tadd     dword [rbp-4H], 1\n");
        System.out.println("\tjmp     Lprt_009\n");
        System.out.println("Lprt_005:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tcdqe\n");
        System.out.println("\tlea     rdx, [rax+1H]\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 92\n");
        System.out.println("\tjnz     Lprt_006\n");
        System.out.println("\tmov     edi, 92\n");
        System.out.println("\tcall    putchar\n");
        System.out.println("\tadd     dword [rbp-4H], 1\n");
        System.out.println("\tjmp     Lprt_009\n");
        System.out.println("Lprt_006:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tcdqe\n");
        System.out.println("\tlea     rdx, [rax+1H]\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 34\n");
        System.out.println("\tjnz     Lprt_007\n");
        System.out.println("\tmov     edi, 34\n");
        System.out.println("\tcall    putchar\n");
        System.out.println("\tadd     dword [rbp-4H], 1\n");
        System.out.println("\tjmp     Lprt_009\n");
        System.out.println("Lprt_007:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tmovsx   eax, al\n");
        System.out.println("\tmov     edi, eax\n");
        System.out.println("\tcall    putchar\n");
        System.out.println("\tjmp     Lprt_009\n");
        System.out.println("Lprt_008:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tmovsx   eax, al\n");
        System.out.println("\tmov     edi, eax\n");
        System.out.println("\tcall    putchar\n");
        System.out.println("Lprt_009:  add     dword [rbp-4H], 1\n");
        System.out.println("Lprt_010:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjne     Lprt_003\n");
        System.out.println("\tnop\n");
        System.out.println("\t        leave\n");
        System.out.println("\tret\n");

        //getString
        System.out.println("transtring:\n");
        System.out.println("\n");
        System.out.println("\tpush rbp\n");
        System.out.println("\tmov rbp,rsp\n");
        System.out.println("\tcall strlen\n");
        System.out.println("\tpush rdi\n");
        System.out.println("\tmov rdi,rax\n");
        System.out.println("\tpush rdi\n");
        System.out.println("\tadd rdi,9\n");
        System.out.println("\tcall malloc\n");
        System.out.println("\tpop rdi\n");
        System.out.println("\tmov [rax],rdi\n");
        System.out.println("\tadd rax,8\n");
        System.out.println("\tmov rdx,rdi\n");
        System.out.println("\tadd rdx,1\n");
        System.out.println("\tmov rdi,rax\n");
        System.out.println("\tpop rsi\n");
        System.out.println("\tsub rsp,8\n");
        System.out.println("\tpush rax\n");
        System.out.println("\tcall memcpy\n");
        System.out.println("\tpop rax\n");
        System.out.println("\tmov rsp,rbp\n");
        System.out.println("\tpop rbp\n");
        System.out.println("\tret\n");
        System.out.println("\n");
        System.out.println("getString:\n");
        System.out.println("\n");
        System.out.println("\tpush rbp\n");
        System.out.println("\tmov rbp,rsp\n");
        System.out.println("\tmov rax,0\n");
        System.out.println("\tmov rdi,format2\n");
        System.out.println("\tmov rsi,stringbuffer\n");
        System.out.println("\tcall scanf\n");
        System.out.println("\tmov rdi,stringbuffer\n");
        System.out.println("\tcall transtring\n");
        System.out.println("\tmov rsp,rbp\n");
        System.out.println("\tpop rbp\n");
        System.out.println("\tret\n");
        System.out.println("\n");

        //string.substring
        System.out.println("string.substring:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tsub     rsp, 32\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     dword [rbp-1CH], esi\n");
        System.out.println("\tmov     dword [rbp-20H], edx\n");
        System.out.println("\tmov     edi, 256\n");
        System.out.println("\tcall    malloc\n");
        System.out.println("\tmov     qword [rbp-8H], rax\n");
        System.out.println("\tmov     eax, dword [rbp-20H]\n");
        System.out.println("\tsub     eax, dword [rbp-1CH]\n");
        System.out.println("\tadd     eax, 1\n");
        System.out.println("\tmov     dword [rbp-0CH], eax\n");
        System.out.println("\tmov     dword [rbp-10H], 0\n");
        System.out.println("\tjmp     Lsub_002\n");
        System.out.println("Lsub_001:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-8H]\n");
        System.out.println("\tadd     rdx, rax\n");
        System.out.println("\tmov     ecx, dword [rbp-10H]\n");
        System.out.println("\tmov     eax, dword [rbp-1CH]\n");
        System.out.println("\tadd     eax, ecx\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tmov     byte [rdx], al\n");
        System.out.println("\tadd     dword [rbp-10H], 1\n");
        System.out.println("Lsub_002:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.println("\tjl      Lsub_001\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-8H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmov     byte [rax], 0\n");
        System.out.println("\tmov     rax, qword [rbp-8H]\n");
        System.out.println("\tleave\n");
        System.out.println("\t        ret\n");

        //string.parseInt
        System.out.println("string.parseInt:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tsub     rsp, 32\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     edi, 256\n");
        System.out.println("\tcall    malloc\n");
        System.out.println("\tmov     qword [rbp-8H], rax\n");
        System.out.println("\tmov     dword [rbp-10H], 0\n");
        System.out.println("\tmov     dword [rbp-0CH], 0\n");
        System.out.println("\tjmp     Lpar_002\n");
        System.out.println("Lpar_001:  add     dword [rbp-10H], 1\n");
        System.out.println("Lpar_002:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Lpar_004\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Lpar_001\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Lpar_001\n");
        System.out.println("\tjmp     Lpar_004\n");
        System.out.println("Lpar_003:  mov     edx, dword [rbp-0CH]\n");
        System.out.println("\tmov     eax, edx\n");
        System.out.println("\tshl     eax, 2\n");
        System.out.println("\tadd     eax, edx\n");
        System.out.println("\tadd     eax, eax\n");
        System.out.println("\tmov     ecx, eax\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tmovsx   eax, al\n");
        System.out.println("\tadd     eax, ecx\n");
        System.out.println("\tsub     eax, 48\n");
        System.out.println("\tmov     dword [rbp-0CH], eax\n");
        System.out.println("\tadd     dword [rbp-10H], 1\n");
        System.out.println("Lpar_004:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 47\n");
        System.out.println("\tjle     Lpar_005\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjle     Lpar_003\n");
        System.out.println("Lpar_005:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tleave\n");
        System.out.println("\tret\n");

        //string.eq
        System.out.println("\tstring.eq:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     qword [rbp-20H], rsi\n");
        System.out.println("\tmov     dword [rbp-0CH], 0\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tjmp     Leq_002\n");
        System.out.println("Leq_001:  add     dword [rbp-0CH], 1\n");
        System.out.println("Leq_002:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Leq_004\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Leq_001\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Leq_001\n");
        System.out.println("\tjmp     Leq_004\n");
        System.out.println("Leq_003:  add     dword [rbp-8H], 1\n");
        System.out.println("Leq_004:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Leq_005\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Leq_003\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Leq_003\n");
        System.out.println("Leq_005:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tcmp     eax, dword [rbp-8H]\n");
        System.out.println("\tjz      Leq_006\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Leq_010\n");
        System.out.println("Leq_006:  mov     dword [rbp-4H], 0\n");
        System.out.println("\tmov     dword [rbp-4H], 0\n");
        System.out.println("\tjmp     Leq_009\n");
        System.out.println("Leq_007:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-4H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjz      Leq_008\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Leq_010\n");
        System.out.println("Leq_008:  add     dword [rbp-4H], 1\n");
        System.out.println("Leq_009:  mov     eax, dword [rbp-4H]\n");
        System.out.println("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.println("\tjl      Leq_007\n");
        System.out.println("\tmov     eax, 1\n");
        System.out.println("Leq_010:  pop     rbp\n");
        System.out.println("\tret\n");

        //string.s
        System.out.println("string.s:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     qword [rbp-20H], rsi\n");
        System.out.println("\tmov     dword [rbp-10H], 0\n");
        System.out.println("\tmov     dword [rbp-0CH], 0\n");
        System.out.println("\tjmp     Ll_012\n");
        System.out.println("Ll_011:  add     dword [rbp-10H], 1\n");
        System.out.println("Ll_012:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Ll_014\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Ll_011\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Ll_011\n");
        System.out.println("\tjmp     Ll_014\n");
        System.out.println("Ll_013:  add     dword [rbp-0CH], 1\n");
        System.out.println("Ll_014:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Ll_015\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Ll_013\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Ll_013\n");
        System.out.println("Ll_015:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tcmp     dword [rbp-10H], eax\n");
        System.out.println("\tcmovle  eax, dword [rbp-10H]\n");
        System.out.println("\tmov     dword [rbp-4H], eax\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tjmp     Ll_019\n");
        System.out.println("Ll_016:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjge     Ll_017\n");
        System.out.println("\tmov     eax, 1\n");
        System.out.println("\tjmp     Ll_021\n");
        System.out.println("Ll_017:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjle     Ll_018\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Ll_021\n");
        System.out.println("Ll_018:  add     dword [rbp-8H], 1\n");
        System.out.println("Ll_019:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tcmp     eax, dword [rbp-4H]\n");
        System.out.println("\tjl      Ll_016\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.println("\tjl      Ll_020\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Ll_021\n");
        System.out.println("Ll_020:  mov     eax, 1\n");
        System.out.println("Ll_021:  pop     rbp\n");
        System.out.println("\tret\n");

        //string.g
        System.out.println("string.g:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     qword [rbp-20H], rsi\n");
        System.out.println("\tmov     dword [rbp-10H], 0\n");
        System.out.println("\tmov     dword [rbp-0CH], 0\n");
        System.out.println("\tjmp     Lg_023\n");
        System.out.println("Lg_022:  add     dword [rbp-10H], 1\n");
        System.out.println("Lg_023:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Lg_025\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Lg_022\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Lg_022\n");
        System.out.println("\tjmp     Lg_025\n");
        System.out.println("Lg_024:  add     dword [rbp-0CH], 1\n");
        System.out.println("Lg_025:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Lg_026\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Lg_024\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Lg_024\n");
        System.out.println("Lg_026:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tcmp     dword [rbp-10H], eax\n");
        System.out.println("\tcmovle  eax, dword [rbp-10H]\n");
        System.out.println("\tmov     dword [rbp-4H], eax\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tjmp     Lg_030\n");
        System.out.println("Lg_027:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjle     Lg_028\n");
        System.out.println("\tmov     eax, 1\n");
        System.out.println("\tjmp     Lg_032\n");
        System.out.println("Lg_028:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjge     Lg_029\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Lg_032\n");
        System.out.println("Lg_029:  add     dword [rbp-8H], 1\n");
        System.out.println("Lg_030:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tcmp     eax, dword [rbp-4H]\n");
        System.out.println("\tjl      Lg_027\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.println("\tjg      Lg_031\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Lg_032\n");
        System.out.println("Lg_031:  mov     eax, 1\n");
        System.out.println("Lg_032:  pop     rbp\n");
        System.out.println("\tret\n");

        //string.le
        System.out.println("\tstring.le:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     qword [rbp-20H], rsi\n");
        System.out.println("\tmov     dword [rbp-10H], 0\n");
        System.out.println("\tmov     dword [rbp-0CH], 0\n");
        System.out.println("\tjmp     Llege_002\n");
        System.out.println("Llege_001:  add     dword [rbp-10H], 1\n");
        System.out.println("Llege_002:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Llege_004\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Llege_001\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Llege_001\n");
        System.out.println("\tjmp     Llege_004\n");
        System.out.println("Llege_003:  add     dword [rbp-0CH], 1\n");
        System.out.println("Llege_004:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Llege_005\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Llege_003\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Llege_003\n");
        System.out.println("Llege_005:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tcmp     dword [rbp-10H], eax\n");
        System.out.println("\tcmovle  eax, dword [rbp-10H]\n");
        System.out.println("\tmov     dword [rbp-4H], eax\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tjmp     Llege_009\n");
        System.out.println("Llege_006:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjge     Llege_007\n");
        System.out.println("\tmov     eax, 1\n");
        System.out.println("\tjmp     Llege_011\n");
        System.out.println("Llege_007:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjle     Llege_008\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Llege_011\n");
        System.out.println("Llege_008:  add     dword [rbp-8H], 1\n");
        System.out.println("Llege_009:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tcmp     eax, dword [rbp-4H]\n");
        System.out.println("\tjl      Llege_006\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.println("\tjle     Llege_010\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Llege_011\n");
        System.out.println("\tLlege_010:  mov     eax, 1\n");
        System.out.println("\tLlege_011:  pop     rbp\n");
        System.out.println("\tret\n");

        //string.ge
        System.out.println("\tstring.ge:\n");
        System.out.println("\tpush    rbp\n");
        System.out.println("\tmov     rbp, rsp\n");
        System.out.println("\tmov     qword [rbp-18H], rdi\n");
        System.out.println("\tmov     qword [rbp-20H], rsi\n");
        System.out.println("\tmov     dword [rbp-10H], 0\n");
        System.out.println("\tmov     dword [rbp-0CH], 0\n");
        System.out.println("\tjmp     Llege_013\n");
        System.out.println("Llege_012:  add     dword [rbp-10H], 1\n");
        System.out.println("Llege_013:  mov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Llege_015\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Llege_012\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Llege_012\n");
        System.out.println("\tjmp     Llege_015\n");
        System.out.println("Llege_014:  add     dword [rbp-0CH], 1\n");
        System.out.println("Llege_015:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjz      Llege_016\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\ttest    al, al\n");
        System.out.println("\tjs      Llege_014\n");
        System.out.println("\tmov     eax, dword [rbp-0CH]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     al, 57\n");
        System.out.println("\tjg      Llege_014\n");
        System.out.println("Llege_016:  mov     eax, dword [rbp-0CH]\n");
        System.out.println("\tcmp     dword [rbp-10H], eax\n");
        System.out.println("\tcmovle  eax, dword [rbp-10H]\n");
        System.out.println("\tmov     dword [rbp-4H], eax\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tmov     dword [rbp-8H], 0\n");
        System.out.println("\tjmp     Llege_020\n");
        System.out.println("Llege_017:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjle     Llege_018\n");
        System.out.println("\tmov     eax, 1\n");
        System.out.println("\tjmp     Llege_022\n");
        System.out.println("Llege_018:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rdx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-18H]\n");
        System.out.println("\tadd     rax, rdx\n");
        System.out.println("\tmovzx   edx, byte [rax]\n");
        System.out.println("\tmov     eax, dword [rbp-8H]\n");
        System.out.println("\tmovsxd  rcx, eax\n");
        System.out.println("\tmov     rax, qword [rbp-20H]\n");
        System.out.println("\tadd     rax, rcx\n");
        System.out.println("\tmovzx   eax, byte [rax]\n");
        System.out.println("\tcmp     dl, al\n");
        System.out.println("\tjge     Llege_019\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Llege_022\n");
        System.out.println("Llege_019:  add     dword [rbp-8H], 1\n");
        System.out.println("Llege_020:  mov     eax, dword [rbp-8H]\n");
        System.out.println("\tcmp     eax, dword [rbp-4H]\n");
        System.out.println("\tjl      Llege_017\n");
        System.out.println("\tmov     eax, dword [rbp-10H]\n");
        System.out.println("\tcmp     eax, dword [rbp-0CH]\n");
        System.out.println("\tjge     Llege_021\n");
        System.out.println("\tmov     eax, 0\n");
        System.out.println("\tjmp     Llege_022\n");
        System.out.println("Llege_021:  mov     eax, 1\n");
        System.out.println("Llege_022:  pop     rbp\n");
        System.out.println("\tret\n");


        System.out.println("section   .text");
        quard head = irr.head;
        int k = 0;
        while (head != null)
        {
         ///   System.out.println(head.op);
            ++k;
            quard q = new quard();
            q = head;
            Integer temp = -1;
            String temps = new String();
            for (int i = 0; i < q.y.name.length(); ++i)
            {
                if (!(q.y.name.charAt(i) >= '0' && q.y.name.charAt(i) <= '9')) break;
                temps += q.y.name.charAt(i);
            }
            if (!temps.equals(""))
                temp = Integer.parseInt(temps);
            Integer temp2 = -1;
            String temps2 = new String();
            for (int i = 0; i < q.x.name.length(); ++i)
            {
                if (!(q.x.name.charAt(i) >= '0' && q.x.name.charAt(i) <= '9')) break;
                temps2 += q.x.name.charAt(i);
            }
            if (!temps2.equals(""))
                temp2 = Integer.parseInt(temps2);
            Integer temp3 = -1;
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
                System.out.println(q.y.name + ":");
            }
            if (q.op.equals("funcinit"))
            {
                System.out.print("      ");
                System.out.println("push\trbp");
                System.out.print("      ");
                System.out.println("mov\trbp,rsp");
            }
            if (q.op.equals("str="))
            {
                String s = q.x.name;
                System.out.print("      ");
                Integer addr = Integer.parseInt(q.y.addr);
                System.out.println("mov"+'\t'+"qword[rbp-"+addr.toString() + "],"+s.length());
                addr += 8;
                for (int i = 0;i < s.length();++i)
                {
                    System.out.print("      ");
                    System.out.println("mov"+'\t'+"byte[rbp-"+addr.toString() + "],'"+s.charAt(i)+"'");
                    ++addr;
                }
            }
            if (q.op.equals("int") || q.op.equals("bool"))
            {
                // System.out.print("      ");
                // if (temp >= 15) return;
                // System.out.println("mov" + '\t' + regs[temp] + ",[rbp-" + q.y.addr.toString() + ']');
            }
            if (q.op.equals("push"))
            {
                if (temp2 < 14)
                {
                    System.out.print("      ");
                    System.out.println("push" + '\t' + regs[temp2]);
                }
            }
            if (q.op.equals("pop"))
            {
                if (temp2 < 14)
                {
                    System.out.print("      ");
                    System.out.println("pop" + '\t' + regs[temp2]);
                }
            }
            if (q.op.equals("b="))
            {
                String s = new String();
                String ss = new String();
                String sy = new String();
                String sall  = new String();
                if (q.x.name.equals("addr"))
                {
                    ss = "qword";
                    s = q.x.addr;
                }
                else if (q.x.name.equals("arr"))
                {
                    s = "[rbp-"+q.x.addr+"]";
                } else
                if (!q.x.name.contains("temp"))
                {
                    s = q.x.name;
                    ss = "qword";
                }
                else
                {
                    if (temp2 >= 15) return;
                    s = regs[temp2];
                }
                if (q.y.name.contains("temp") && temp < 14)
                {
                    sy = regsb[temp];
                    sall = regs[temp];
                    ss = "";
                }
                else
                {
                    sy = "[rbp-" + q.y.addr + "]";
                }
                if (!q.y.name.equals(q.x.name))
                {
                    System.out.print("      ");
                    System.out.println("mov" + '\t' + ss + sy + ',' + s);
                    System.out.print("      ");
                    System.out.println("movzx" + '\t' + sall + "," + sy);
                }
            }
            if (q.op.equals("="))
            {
                String s = new String();
                String ss = new String();
                String sy = new String();
                if (q.x.name.contains("format"))
                {
                    s = q.x.name;
                }
                if (q.x.name.equals("addr"))
                {
                    ss = "qword";
                    s = q.x.addr;
                }
                else if (q.x.name.equals("arr"))
                {
                    if (q.x.addr.contains("r"))
                    {
                        System.out.print("      ");
                        System.out.println("mov\tr12,rbp");
                        System.out.print("      ");
                        System.out.println("sub\tr12," + q.x.addr);
                        s = "[r12]";
                    }
                    else
                    {
                        s = "[rbp -" + q.x.addr + "]";
                    }
                } else
                if (!q.x.name.contains("temp"))
                {
                    s = q.x.name;
                    ss = "qword";
                }
                else
                {
                    if (temp2 >= 15) return;
                    s = regs[temp2];
                }
                if (q.y.name.contains("temp") && temp < 14)
                {
                    sy = regs[temp];
                    ss = "";
                }
                else
                {
                    if (q.y.addr.contains("r"))
                    {
                        System.out.print("      ");
                        System.out.println("mov\tr12,rbp");
                        System.out.print("      ");
                        System.out.println("sub\tr12," + q.y.addr);
                        sy = "[r12]";
                    }
                    else
                        sy = "[rbp -" + q.y.addr + "]";
                }
                if (!q.y.name.equals(q.x.name))
                {
                    System.out.print("      ");
                    System.out.println("mov" + '\t' + ss + sy + ',' + s);
                }
            }
            if (q.op.equals("=="))
            {
                System.out.print("      ");
                if (temp >= 15) return;
                System.out.println("xor" + '\t' + regs[temp] + "," + q.x.name);
                System.out.print("      ");
                System.out.println("not" + '\t' + regs[temp]);
            }
            if (q.op.equals("if"))
            {
                if (temp >= 15) return;
                System.out.print("      ");
                System.out.println("cmp" + '\t' + regs[temp] + ",0");
                System.out.print("      ");
                System.out.println("je" + '\t' + '_' + q.x.name);
            }
            if (q.op.equals("for"))
            {
                if (temp2 >= 15) return;
                System.out.print("      ");
                System.out.println("cmp" + '\t' + regs[temp2] + ",1");
                System.out.print("      ");
                System.out.println("je" + '\t' + q.y.name);
            }
            if (q.op.equals("return"))
            {
                String s = new String();
                if (temp2 >= 15 && !q.x.addr.equals("-1")) return;
                if (q.x.name.equals("arr") || q.x.name.equals("addr"))
                {
                    if (q.x.addr.contains("r"))
                    {
                        System.out.print("      ");
                        System.out.println("mov\tr12,rbp");
                        System.out.print("      ");
                        System.out.println("sub\tr12," + q.x.addr);
                        s = "[r12]";
                    }
                    else
                        s = "[rbp -" + q.x.addr + "]";
                }
                else if (q.x.name.contains("temp"))
                {
                    if (temp2 >= 15) return;
                    s = regs[temp2];
                }
                else
                    s = q.x.name;
                System.out.print("      ");
                System.out.println("mov" + '\t' + "rdi," + s);
                System.out.print("      ");
                System.out.println("mov" + '\t' + "rax,60");
                System.out.print("      ");
                System.out.println("syscall");
            }
            if (q.op.equals("ret"))
            {
                String s = new String();
                if (temp2 >= 15 && !q.x.addr.equals("-1")) return;
                if (q.x.name.equals("arr") || q.x.name.equals("addr"))
                {
                    s = "[rbp-" + q.x.addr + "]";
                }
                else if (q.x.name.contains("temp"))
                {
                    if (temp2 >= 15) return;
                    s = regs[temp2];
                }
                else
                    s = q.x.name;
                System.out.print("      ");
                System.out.println("mov" + '\t' + "rax," + s);
                System.out.print("      ");
                System.out.println("pop\trbp");
                System.out.print("      ");
                System.out.println("ret");
            }
            if (q.op.equals("goto"))
            {
                System.out.print("      ");
                System.out.println("jmp" + '\t' + '_' + q.y.name);
            }
            if (q.op.equals("call"))
            {
                System.out.print("      ");
                System.out.println("call" + '\t' + q.y.name);
            }
            if (q.op.equals("str+"))
            {

                String s1 = q.x.name;
                String s2 = q.x.addr;
                Integer addr  = Integer.parseInt(q.y.addr);
                System.out.print("      ");
                System.out.println("mov" + '\t' + "r13,[rbp-" +s1+"]");

                System.out.print("      ");
                System.out.println("mov" + '\t' + "r15,0");
                addr += 8;
                System.out.println("_" + strfor.toString() + "str:");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "r14b,[rbp-8+" + s1 + "+r15]");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "[rbp-" + addr.toString() + "+r15],r14b");
                System.out.print("      ");
                System.out.println("add" + '\t' + "r15,1");
                System.out.print("      ");
                System.out.println("cmp" + '\t' + "r15,qword[rbp-" + s1 + "]");
                System.out.print("      ");
                System.out.println("jl" + '\t' + "_" + strfor.toString() + "str" );
                ++strfor;
                System.out.print("      ");
                System.out.println("mov" + '\t' + "r15,0");
                System.out.println("_" + strfor.toString() + "str:");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "r14b,[rbp-8+" + s2 + "+r15]");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "[rbp-r13+" + addr.toString() + "+r15],r14b");
                System.out.print("      ");
                System.out.println("add" + '\t' + "r15,1");
                System.out.print("      ");
                System.out.println("cmp" + '\t' + "r15,qword[rbp-" + s2 + "]");
                System.out.print("      ");
                System.out.println("jl" + '\t' + "_" + strfor.toString() + "str" );
                ++strfor;
                addr -= 8;
                System.out.print("      ");
                System.out.println("add" + '\t' + "r13,[rbp-" + s2 + "]");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "[rbp-" + addr.toString() + "],r13");
            }
            if (q.op.equals("+"))
            {

                String s = new String();
                String ss = new String();
                String sy = new String();
                if (q.x.name.equals("arr"))
                {
                    s = "[rbp-" + q.x.addr + "]";
                }
                else if (!q.x.name.contains("temp"))
                {
                    s = q.x.name;
                    ss = "qword";
                }
                else
                {
                    if (temp >= 15 || temp2 >= 15) return;
                    s = regs[temp2];
                }
                if (q.y.name.equals("arr"))
                {
                    if (q.y.addr.contains("r"))
                    {
                        System.out.print("      ");
                        System.out.println("mov\tr12,rbp");
                        System.out.print("      ");
                        System.out.println("sub\tr12," + q.y.addr);
                        sy = "[r12]";
                    }
                    else
                        sy = "[rbp -" + q.y.addr + "]";
                }
                else
                {
                    //System.out.println(temp);
                    if (temp < 0) sy = q.y.name; else
                    if (temp < 14)
                        sy = regs[temp];
                    else sy = "[" + q.y.addr + "]";
                }
                System.out.print("      ");
                System.out.println("add" + '\t' + sy + ',' + s);
            }
            if (q.op.equals("-"))
            {

                String s = new String();
                String ss = new String();
                String sy = new String();
                if (q.x.name.equals("arr"))
                {
                    s = "[rbp-" + q.x.addr + "]";
                }
                else if (!q.x.name.contains("temp"))
                {
                    s = q.x.name;
                    ss = "qword";
                }
                else
                {
                    if (temp >= 15 || temp2 >= 15) return;
                    s = regs[temp2];
                }
                if (q.y.name.equals("arr"))
                {
                    sy = "qword[rbp-" + q.y.addr + "]";
                }
                else
                {
                    //System.out.println(temp);
                    if (temp < 0) sy = q.y.name; else
                    if (temp < 14)
                        sy = regs[temp];
                    else sy = "[" + q.y.addr + "]";
                }
                System.out.print("      ");
                System.out.println("sub" + '\t' + sy + ',' + s);
            }
            if (q.op.equals("*"))
            {

                String s = new String();
                String ss = new String();
                String sy = new String();
                if (q.x.name.equals("arr") || q.x.name.equals("addr"))
                {
                    s = "[rbp-" + q.x.addr + "]";
                }
                else if (!q.x.name.contains("temp"))
                {
                    s = q.x.name;
                    ss = "qword";
                }
                else
                {
                    if (temp >= 15 || temp2 >= 15) return;
                    s = regs[temp2];
                }
                if (q.y.name.equals("arr") || q.y.name.equals("addr"))
                {
                    sy = "qword[rbp-" + q.y.addr + "]";
                }
                else
                {
                    if (temp >= 0 )
                    sy = regs[temp]; else sy = q.y.name;
                }
                System.out.print("      ");
                System.out.println("imul" + '\t' + sy + ',' + s);
            }
            if (q.op.equals("<="))
            {
                if (temp >= 15 || temp2 >= 15 || temp3 >= 15) return;
                System.out.print("      ");
                System.out.println("cmp" + '\t' + regs[temp] + ',' + regs[temp2]);
                System.out.print("      ");
                System.out.println("jle" + '\t' + q.next.y.name);
                String s = new String();
                s = q.next.y.name;
                s += "back";
                System.out.print("      ");
                //  System.out.println(q.z.name);
                System.out.println("mov" + '\t' + regs[temp3] + ",0");
                System.out.print("      ");
                System.out.println("jmp" + '\t' + s);
            }
            if (q.op.equals("<"))
            {
                String st = new String();
                String st2 = new String();
                String st3 = new String();
                if (temp < 14)
                {
                    st = regs[temp];
                }else
                {
                    st = "[str + " + addr.toString() + "]";
                    addr += 4;
                }
                if (!q.x.name.contains("temp"))
                {
                    st2 = q.x.name;
                } else
                if (temp2 < 14)
                {
                    st2 = regs[temp2];
                }else
                {
                    st2 = "[str + " + addr.toString() + "]";
                    addr += 4;
                }
                if (temp3 < 14)
                {
                    st3 = regs[temp3];
                }else
                {
                    st3 = "[str + " + addr.toString() + "]";
                    addr += 4;
                }
                System.out.print("      ");
                System.out.println("cmp" + '\t' + st + ',' + st2);
                System.out.print("      ");
                System.out.println("jl" + '\t' + q.next.y.name);
                String s = new String();
                s = q.next.y.name;
                s += "back";
                System.out.print("      ");
                //  System.out.println(q.z.name);
                System.out.println("mov" + '\t' + st3 + ",0");
                System.out.print("      ");
                System.out.println("jmp" + '\t' + s);
            }
            if (q.op.equals(">"))
            {
                String st = new String();
                String st2 = new String();
                String st3 = new String();
                if (temp < 14)
                {
                    st = regs[temp];
                }else
                {
                    st = "[str + " + addr.toString() + "]";
                    addr += 4;
                }
                if (!q.x.name.contains("temp"))
                {
                    st2 = q.x.name;
                } else
                if (temp2 < 14)
                {
                    st2 = regs[temp2];
                }else
                {
                    st2 = "[str + " + addr.toString() + "]";
                    addr += 4;
                }
                if (temp3 < 14)
                {
                    st3 = regs[temp3];
                }else
                {
                    st3 = "[str + " + addr.toString() + "]";
                    addr += 4;
                }
                System.out.print("      ");
                System.out.println("cmp" + '\t' + st + ',' + st2);
                System.out.print("      ");
                System.out.println("jg" + '\t' + q.next.y.name);
                String s = new String();
                s = q.next.y.name;
                s += "back";
                System.out.print("      ");
                //  System.out.println(q.z.name);
                System.out.println("mov" + '\t' + st3 + ",0");
                System.out.print("      ");
                System.out.println("jmp" + '\t' + s);
            }
            if (head.next == null) break;
            head = head.next;
        }
        System.out.println("format:");
        System.out.println("      db  \"%d\"");
        System.out.println("intbuffer:\n");
        System.out.println("\tdq 0\n");
        System.out.println("format1:\n");
        System.out.println("\tdb\"%lld\",0\n");
        System.out.println("format2:\n");
        System.out.println("\tdb\"%s\",0\n\n");
        System.out.println("section .bss\n");
        System.out.println("stringbuffer:\n");
        System.out.println("\tresb 256\n");
    }

    public static void main(String[] args) throws Exception
    {
        Main m = new Main();
        check chk = m.main();
        //chk.code.print();
        addr = chk.addr;
        translate(chk.code);
    }
}
