import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.FileNotFoundException;
import java.util.Vector;

public class Irtox86
{
    static Integer addr = 0;
    static String[] regs = {"rax", "rcx", "rdx", "rbx", "rsi", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15"};
    static String[] regsb = {"al", "cl", "dl", "bl", "bpl", "sil", "dil", "r8b", "r9b", "r10b", "r11b", "r12b", "r13b", "r14b", "r15b"};
    static String[] callregs = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
    static Integer temp = new Integer(0);
    static Integer temp2 = new Integer(0);
    static Integer temp3 = new Integer(0);
    static Integer start = new Integer(0);
    static Integer end = new Integer(0);
    static Vector<varible> global = new Vector<>();

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
            System.out.println("mov\t" + reg + ",[lc" + s + "]");
        }
        else
        {
            System.out.print("      ");
            System.out.println("mov\t" + reg + ",[rbp - " + addr.toString() + "]");
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
            else if (!(params.get(i).name.charAt(0) >= '0' && params.get(i).name.charAt(0) <= '9'))
            {
                System.out.print("      ");
                System.out.println("add\t" + reg + ",[lc" + params.get(i).name + "]");
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
        System.out.println("jmp     Lc_002");

        System.out.println("Lc_001: ");
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
        System.out.println("Lc_002: ");
        System.out.println("mov     eax, dword [rbp-10H]");
        System.out.println("movsxd  rdx, eax");
        System.out.println("mov     rax, qword [rbp-18H]");
        System.out.println(" add     rax, rdx");
        System.out.println("movzx   eax, byte [rax]");
        System.out.println("test    al, al");
        System.out.println("jnz     Lc_001");
        System.out.println("jmp     Lc_004");

        System.out.println("Lc_003:  ");
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
        System.out.println("Lc_004: ");
        System.out.println("mov     eax, dword [rbp-0CH]");
        System.out.println("movsxd  rdx, eax");
        System.out.println("mov     rax, qword [rbp-20H]");
        System.out.println("add     rax, rdx");
        System.out.println("movzx   eax, byte [rax]");
        System.out.println("test    al, al");
        System.out.println("jnz     Lc_003");
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
            if (q.op.equals("funcinit"))
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
                if (length < 1000) length = 1000;
                System.out.println("sub\trsp," + length.toString());
                if (q.z.params != null )
                {
                    for (int i = 0; i < q.z.params.size(); ++i)
                    if (i < 6)
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
                        I = q.z.params.size() - I + 2;
                        I *= 8;
                        System.out.print("      ");
                        System.out.println("mov\tr10,[rbp + "+I.toString() + "]");
                        System.out.print("      ");
                        System.out.println("mov\t[rbp - " + addr.toString() + "],r10");
                    }
                }
            }
            if (q.op.equals("str="))
            {
                System.out.print("      ");
                System.out.println("push r10");
                System.out.print("      ");
                System.out.println("push r11");
                System.out.print("      ");
                System.out.println("mov\trdi,256");
                System.out.print("      ");
                System.out.println("call\tmalloc");
                System.out.print("      ");
                System.out.println("pop r10");
                System.out.print("      ");
                System.out.println("pop r11");
                Integer sub = new Integer(0);
                for (int i = 0; i < q.y.name.length(); ++i)
                {
                    char c = q.y.name.charAt(i);
                    if (c == '\\')
                    {
                        Integer sn = new Integer(0);
                        if (q.y.name.charAt(i + 1) == 'n') sn = 10;
                        if (q.y.name.charAt(i + 1) == '\\') sn = 92;
                        if (q.y.name.charAt(i + 1) == '\"') sn = 34;
                        System.out.print("      ");
                        System.out.println("mov\tbyte[rax + " + i + "]," + sn.toString());
                        ++i;
                        ++sub;
                    }
                    else
                    {
                        if (q.y.name.charAt(i) == '\'')
                        {
                            System.out.print("      ");
                            System.out.println("mov\tbyte[rax + " + (i - sub) + "],39");
                        }else
                        {
                            System.out.print("      ");
                            System.out.println("mov\tbyte[rax + " + (i - sub) + "],'" + q.y.name.charAt(i) + "'");
                        }
                    }
                }
                System.out.print("      ");
                System.out.println("mov\tbyte[rax + " + (q.y.name.length() - sub) + "],0");
                Integer addr3 = new Integer(temp3 - start);
                addr3 = (addr3 + 1) * 8;
                System.out.print("      ");
                System.out.println("mov\t[rbp - " + addr3.toString() + "],rax");
            }
            if (q.op.equals("="))
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
                            System.out.println("mov\t[lc" + q.z.name + "],r10");
                        }
                        else
                        {
                            Integer addr3 = new Integer(temp3 - start);
                            addr3 = (addr3 + 1) * 8;
                            System.out.print("      ");
                            System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
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
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                    if (q.z.params == null)
                    {
                        if (!(q.z.name.charAt(0) >= '0' && q.z.name.charAt(0) <= '9'))
                        {
                            System.out.print("      ");
                            System.out.println("mov\t[lc" + q.z.name + "],r10");
                        }
                        else
                        {
                            Integer addr3 = new Integer(temp3 - start);
                            addr3 = (addr3 + 1) * 8;
                            System.out.print("      ");
                            System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
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
                            System.out.println("mov\tr10,[lc" + q.y.name + "]");
                            System.out.print("      ");
                            System.out.println("mov\t[lc" + q.z.name + "],r10");
                        }
                        else
                        {
                            Integer addr3 = new Integer(temp3 - start);
                            addr3 = (addr3 + 1) * 8;
                            System.out.print("      ");
                            System.out.println("mov\tr10,[lc" + q.y.name + "]");
                            System.out.print("      ");
                            System.out.println("mov\t[rbp-" + addr3.toString() + "],r10");
                        }
                    }
                    else
                    {
                        getaddr(q.z.name, q.z.params, "r11");
                        System.out.print("      ");
                        System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                            System.out.println("mov\tqword[lc" + q.z.name + "]," + q.y.name);
                        }
                        else
                        {
                            Integer addr3 = new Integer(temp3 - start);
                            addr3 = (addr3 + 1) * 8;
                            System.out.print("      ");
                            System.out.println("mov\tqword[rbp - " + addr3.toString() + "]," + q.y.name);
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
            if (q.op.equals("if"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\t r10,[rbp-" + addr1.toString() + "]");
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
            if (q.op.equals("for"))
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
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp -  " + addr1.toString() + "]");
                    System.out.print("      ");
                    System.out.println("cmp\tr10,1");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
            if (q.op.equals("ret"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\trax,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\trax,[rbp -  " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9') && !q.y.name.equals("null"))
                {
                    System.out.print("      ");
                    System.out.println("mov\trax,[lc" + q.y.name + "]");
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
            if (q.op.equals("goto"))
            {
                System.out.print("      ");
                System.out.println("jmp" + '\t' + '_' + q.z.name);
            }
            if (q.op.equals("array"))
            {

            }
            if (q.op.equals("call"))
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
                                    System.out.println("mov\t" + callregs[i] + ",[lc" + q.y.params.get(i).name + "]");
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
                                    System.out.println("mov\tr10,[lc" + q.y.params.get(i).name + "]");
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
                System.out.print("      ");
                System.out.println("push\tr10");
                System.out.print("      ");
                System.out.println("push\tr11");
                if (q.z.name.contains("print"))
                {
                    System.out.print("      ");
                    System.out.println("mov\trax,0");
                }
                System.out.print("      ");
                System.out.println("call\t" + q.z.name);
                System.out.print("      ");
                System.out.println("pop\tr11");
                System.out.print("      ");
                System.out.println("pop\tr10");
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\t[rbp -  " + addr1.toString() + "],rax");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\t[  " + q.y.name + "],rax");
                }
            }

            if (q.op.equals("str+"))
            {
            }
            if (q.op.equals("+"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("add\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("add\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("-"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("sub\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("sub\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("*"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("imul\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("imul\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("/"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\teax,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\teax,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\teax,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10d,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10d,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],rax");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],rax");
                }
            }
            if (q.op.equals("%"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r10");
                    System.out.print("      ");
                    System.out.println("mov\teax,[r10]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\teax,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\teax,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10d,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10d,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],rdx");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],rdx");
                }
            }
            if (q.op.equals(">>"))
            {
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.name.contains("temp"))
                {
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("shr\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("shr\tr10,[lc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("shr\tr10," + q.x.name);
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("<<"))
            {
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.name.contains("temp"))
                {
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("shl\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("shl\tr10,[lc" + q.x.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("shl\tr10," + q.x.name);
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("<="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("<"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {

                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals(">="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals(">"))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("!"))
            {
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp -  " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }

            if (q.op.equals("^"))
            {
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("--"))
            {
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("=="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.name.contains("temp"))
                {
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("!="))
            {
                if (q.y.params != null)
                {
                    getaddr(q.y.name, q.y.params, "r11");
                    System.out.print("      ");
                    System.out.println("mov\tr10,[r11]");
                }
                else if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.name.contains("temp"))
                {
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("cmp\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("check"))
            {
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("and\tr10,[lc" + q.y.name + "]");
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
            if (q.op.equals("&&") || (q.op.equals("&")))
            {
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("and\tr10,[lc" + q.y.name + "]");
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
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("and\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("and\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
                }
            }
            if (q.op.equals("||") || (q.op.equals("|")))
            {
                if (q.y.name.contains("temp"))
                {
                    Integer addr1 = new Integer(temp - start);
                    addr1 = (addr1 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("mov\tr10,[rbp - " + addr1.toString() + "]");
                }
                else if (!(q.y.name.charAt(0) >= '0' && q.y.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10,[lc" + q.y.name + "]");
                }
                else
                {
                    System.out.print("      ");
                    System.out.println("mov\tr10," + q.y.name);
                }
                if (q.x.name.contains("temp"))
                {
                    Integer addr2 = new Integer(temp2 - start);
                    addr2 = (addr2 + 1) * 8;
                    System.out.print("      ");
                    System.out.println("or\tr10,[rbp - " + addr2.toString() + "]");
                }
                else if (!(q.x.name.charAt(0) >= '0' && q.x.name.charAt(0) <= '9'))
                {
                    System.out.print("      ");
                    System.out.println("or\tr10,[lc" + q.x.name + "]");
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
                    System.out.println("mov\t[lc" + q.z.name + "],r10");
                }
                else
                {
                    Integer addr3 = new Integer(temp3 - start);
                    addr3 = (addr3 + 1) * 8;

                    System.out.print("      ");
                    System.out.println("mov\t[rbp - " + addr3.toString() + "],r10");
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
        for (int i = 0; i < global.size(); ++i)
        {
            System.out.println(global.get(i).name + ":");
            System.out.print("\tdq 0\n");
        }
        System.out.print("section .bss\n");
        System.out.print("stringbuffer:\n");
        System.out.print("\tresb 256\n");

    }

    public static void main(String[] args) throws Exception
    {
        Main m = new Main();
        check chk = m.main();
        //chk.code.print();
        addr = chk.addr;
        global = new Vector<>(chk.params);
        translate(chk.code);
    }
}