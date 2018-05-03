import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.FileNotFoundException;

public class Irtox86
{
    static Integer addr = 0;
    static String[] regs = {"rax", "rcx", "rdx", "rbx", "rsp", "rbp", "rsi", "rdi"};

    public static void translate(ir irr) throws Exception
    {
        Integer ws = 0;
        Integer f = 0;
        System.out.println("global    _start");
        System.out.println("section   .text");
        quard head = irr.head;
        int k = 0;
        while (head != null)
        {
            ++k;
            quard q = new quard();
            q = head;
            Integer temp = 0;
            String temps = new String();
            for (int i = 0; i < q.y.name.length(); ++i)
            {
                if (!(q.y.name.charAt(i) >= '0' && q.y.name.charAt(i) <= '9')) break;
                temps += q.y.name.charAt(i);
            }
            if (!temps.equals(""))
                temp = Integer.parseInt(temps);

            if (q.op.equals("label!!!!!!!!!"))
            {
                System.out.println('_'+q.y.name + ":");
            }
            if (q.op.equals("int"))
            {
                System.out.print("      ");
                if (temp >= 8) return;
                System.out.println("mov" + '\t' + regs[temp] + ",[str+" + q.y.addr.toString() + ']');
            }
            if (q.op.equals("="))
            {
                System.out.print("      ");
                System.out.println("mov" + '\t' + "dword [str+" + q.y.addr.toString() + "]," + q.x.name);
            }
            if (q.op.equals("=="))
            {
                System.out.print("      ");
                if (temp >= 8) return;
                System.out.println("xor" + '\t' + regs[temp] + "," + q.x.name);
                System.out.print("      ");
                System.out.println("not" + '\t' + regs[temp]);
            }
            if (q.op.equals("if"))
            {
                if (temp >= 8) return;
                System.out.print("      ");
                System.out.println("cmp" + '\t' + regs[temp] + ",0");
                System.out.print("      ");
                System.out.println("je" + '\t' + '_'+q.y.name);
            }
            if (q.op.equals("return"))
            {
                if (temp >= 8) return;
                System.out.print("      ");
                System.out.println("mov" + '\t' + "rdi," + regs[temp]);
                System.out.print("      ");
                System.out.println("mov" + '\t' + "rax,60");
                System.out.print("      ");
                System.out.println("syscall");
            }
            if (head.next == null) break;
            head = head.next;
        }
        System.out.println("section   .bss");
        System.out.println("str:      resb      64  ");
    }

    public static void main(String[] args) throws Exception
    {
        Main m = new Main();
        check chk = m.main();
        chk.code.print();
        translate(chk.code);
    }
}
