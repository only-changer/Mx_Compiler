import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.FileNotFoundException;

public class Irtox86
{
    static Integer addr = 0;
    static String[] regs = {"rax", "rcx", "rdx", "rbx", "rbp", "rsi", "rdi","r8","r9","r10","r11","r12","r13","r14","r15"};
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
        System.out.println("global    main");
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
            if (q.op.equals("str="))
            {
                String s = q.x.name;
                System.out.print("      ");
                Integer addr = Integer.parseInt(q.y.addr);
                System.out.println("mov"+'\t'+"qword[str+"+addr.toString() + "],"+s.length());
                addr += 8;
                for (int i = 0;i < s.length();++i)
                {
                    System.out.print("      ");
                    System.out.println("mov"+'\t'+"byte[str+"+addr.toString() + "],'"+s.charAt(i)+"'");
                    ++addr;
                }
            }
            if (q.op.equals("int") || q.op.equals("bool"))
            {
                // System.out.print("      ");
                // if (temp >= 15) return;
                // System.out.println("mov" + '\t' + regs[temp] + ",[str+" + q.y.addr.toString() + ']');
            }
            if (q.op.equals("push"))
            {
                if (temp2 < 15)
                {
                    System.out.print("      ");
                    System.out.println("push" + '\t' + regs[temp2]);
                }
            }
            if (q.op.equals("pop"))
            {
                if (temp2 < 15)
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
                    s = "[str+"+q.x.addr+"]";
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
                if (q.y.name.contains("temp") && temp < 15)
                {
                    sy = regsb[temp];
                    sall = regs[temp];
                    ss = "";
                }
                else
                {
                    sy = "[str+" + q.y.addr + "]";
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
                if (q.x.name.equals("addr"))
                {
                    ss = "qword";
                    s = q.x.addr;
                }
                else if (q.x.name.equals("arr"))
                {
                     s = "[str+"+q.x.addr+"]";
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
                if (q.y.name.contains("temp") && temp < 15)
                {
                    sy = regs[temp];
                    ss = "";
                }
                else
                {
                    sy = "[str+" + q.y.addr + "]";
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
                    s = "[str+" + q.x.addr + "]";
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
                    s = "[str+" + q.x.addr + "]";
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
                System.out.println("mov" + '\t' + "r13,[str+" +s1+"]");

                System.out.print("      ");
                System.out.println("mov" + '\t' + "r15,0");
                addr += 8;
                System.out.println("_" + strfor.toString() + "str:");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "r14b,[str+8+" + s1 + "+r15]");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "[str+" + addr.toString() + "+r15],r14b");
                System.out.print("      ");
                System.out.println("add" + '\t' + "r15,1");
                System.out.print("      ");
                System.out.println("cmp" + '\t' + "r15,qword[str+" + s1 + "]");
                System.out.print("      ");
                System.out.println("jl" + '\t' + "_" + strfor.toString() + "str" );
                ++strfor;
                System.out.print("      ");
                System.out.println("mov" + '\t' + "r15,0");
                System.out.println("_" + strfor.toString() + "str:");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "r14b,[str+8+" + s2 + "+r15]");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "[str+r13+" + addr.toString() + "+r15],r14b");
                System.out.print("      ");
                System.out.println("add" + '\t' + "r15,1");
                System.out.print("      ");
                System.out.println("cmp" + '\t' + "r15,qword[str+" + s2 + "]");
                System.out.print("      ");
                System.out.println("jl" + '\t' + "_" + strfor.toString() + "str" );
                ++strfor;
                addr -= 8;
                System.out.print("      ");
                System.out.println("add" + '\t' + "r13,[str+" + s2 + "]");
                System.out.print("      ");
                System.out.println("mov" + '\t' + "[str+" + addr.toString() + "],r13");
            }
            if (q.op.equals("+"))
            {

                String s = new String();
                String ss = new String();
                String sy = new String();
                if (q.x.name.equals("arr"))
                {
                    s = "[str+" + q.x.addr + "]";
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
                    sy = "qword[str+" + q.y.addr + "]";
                }
                else
                {
                    //System.out.println(temp);
                    if (temp < 0) sy = q.y.name; else
                    if (temp < 15)
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
                    s = "[str+" + q.x.addr + "]";
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
                    sy = "qword[str+" + q.y.addr + "]";
                }
                else
                {
                    //System.out.println(temp);
                    if (temp < 0) sy = q.y.name; else
                    if (temp < 15)
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
                    s = "[str+" + q.x.addr + "]";
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
                    sy = "qword[str+" + q.y.addr + "]";
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
                if (temp < 15)
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
                if (temp2 < 15)
                {
                    st2 = regs[temp2];
                }else
                {
                    st2 = "[str + " + addr.toString() + "]";
                    addr += 4;
                }
                if (temp3 < 15)
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
                if (temp < 15)
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
                if (temp2 < 15)
                {
                    st2 = regs[temp2];
                }else
                {
                    st2 = "[str + " + addr.toString() + "]";
                    addr += 4;
                }
                if (temp3 < 15)
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
        System.out.println("section   .bss");
        System.out.println("str:      resb      64  ");
    }

    public static void main(String[] args) throws Exception
    {
        Main m = new Main();
        check chk = m.main();
        chk.code.print();
        addr = chk.addr;
        translate(chk.code);
    }
}
