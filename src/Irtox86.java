public class Irtox86
{
    public static void translate(ir irr)
    {
        quard head = irr.head;
        while (head != null)
        {
            if (head.next == null) break;
            head = head.next;
        }
    }
    public static void main(String[] args) throws Exception
    {
        Main m = new Main();
        check chk = m.main();
        chk.code.print();
        translate(chk.code);
    }
}
