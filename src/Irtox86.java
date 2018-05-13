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
        System.out.println("global    main");
        System.out.println("section   .text");
        quard head = irr.head;
        int k = 0;
        while (head != null)
        {
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
            if (q.op.equals("int") || q.op.equals("bool"))
            {
               // System.out.print("      ");
               // if (temp >= 8) return;
               // System.out.println("mov" + '\t' + regs[temp] + ",[str+" + q.y.addr.toString() + ']');
            }
            if (q.op.equals("="))
            {
                String s = new String();
                String ss = new String();
                String sy = new String();
                if (!q.x.name.contains("temp"))
                {
                    s = q.x.name;
                    ss = "dword";
                }
                else
                {
                    if (temp2 >= 8 ) return;
                    s = regs[temp2];
                }
                if (q.y.name.contains("temp") && temp < 8)
                {
                    sy = regs[temp];
                    ss ="";
                }
                else sy = "[str+" + q.y.addr.toString() + "]" ;
                if (!q.y.name.equals(q.x.name))
                {
                    System.out.print("      ");
                    System.out.println("mov" + '\t' + ss + sy + ',' + s);
                }
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
                System.out.println("je" + '\t' + '_' + q.x.name);
            }
            if (q.op.equals("for"))
            {
                if (temp2 >= 8) return;
                System.out.print("      ");
                System.out.println("cmp" + '\t' + regs[temp2] + ",1");
                System.out.print("      ");
                System.out.println("je" + '\t'  + q.y.name);
            }
            if (q.op.equals("return"))
            {
                if (temp2 >= 8) return;
                System.out.print("      ");
                System.out.println("mov" + '\t' + "rdi," + regs[temp2]);
                System.out.print("      ");
                System.out.println("mov" + '\t' + "rax,60");
                System.out.print("      ");
                System.out.println("syscall");
            }
            if (q.op.equals("goto"))
            {
                System.out.print("      ");
                System.out.println("jmp" + '\t' + '_' + q.y.name);
            }
            if (q.op.equals("+"))
            {

                String s = new String();
                String ss = new String();
                if (!q.x.name.contains("temp"))
                {
                    s = q.x.name;
                    ss = "dword";
                }
                else
                {
                    if (temp >= 8 || temp2 >= 8) return;
                    s = regs[temp2];
                }
                System.out.print("      ");
                System.out.println("add" + '\t' + regs[temp] + ',' + s);
            }
            if (q.op.equals("<="))
            {
                if (temp >= 8 || temp2 >= 8 ||temp3 >= 8) return;
                System.out.print("      ");
                System.out.println("cmp" + '\t' + regs[temp] + ',' + regs[temp2]);
                System.out.print("      ");
                System.out.println("jle" + '\t' + q.next.y.name);
                String s = new String();
                s = q.next.y.name;
                s += "back";
                System.out.print("      ");
              //  System.out.println(q.z.name);
                System.out.println("mov" + '\t' + regs[temp3]+",0");
                System.out.print("      ");
                System.out.println("jmp" + '\t' + s);
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
        //chk.code.print();
        translate(chk.code);
    }
}
