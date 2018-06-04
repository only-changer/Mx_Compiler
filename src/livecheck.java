import java.util.*;

class node
{
    Integer color = new Integer(-1);
    String name = new String();
    Vector<node> neibor = new Vector<>();
    Integer degree = new Integer(0);

    void add(node n)
    {
        neibor.add(n);
        ++degree;
    }

    void dec()
    {
        for (int i = 0; i < neibor.size(); ++i)
        {
            --neibor.get(i).degree;
        }
    }
}

class map
{
    Map<String, node> nodes = new HashMap<>();

    node newnode(String str)
    {
        if (nodes.containsKey(str)) return nodes.get(str);
        else
        {
            node n = new node();
            n.name = str;
            nodes.put(str, n);
            return n;
        }
    }

    void add(String str1, String str2)
    {
        if (str2.equals("0"))
        {
            node n1 = newnode(str1);
        }
        else
        {
            node n1 = newnode(str1);
            node n2 = newnode(str2);
            n1.add(n2);
            n2.add(n1);
        }
    }
}

public class livecheck
{
    String[] regs = {"r12", "r13", "r14", "r15"};
    map m = new map();
    Set<String> in = new HashSet<>();
    Set<String> out = new HashSet<>();
    Map<String , Integer> result = new HashMap<>();
    void lives(ir code)
    {
        boolean change = true;
        while (change)
        {
            change = false;
            quard q = code.last;
            while (q != null)
            {
                if (q.op.equals("funcinit"))
                    break;
                if (q.z.name.contains("temp"))
                    q.def.add(q.z.name);
                if (q.y.name.contains("temp"))
                    q.used.add(q.y.name);
                if (q.x.name.contains("temp"))
                    q.used.add(q.x.name);
                in.clear();
                out.clear();
                in.addAll(q.in);
                out.addAll(q.out);
                q.in.clear();
                q.out.clear();
                q.in.addAll(q.used);
                if (q.next != null && !q.op.equals("ret"))
                {
                    q.out.addAll(q.next.in);
                }
                q.in.addAll(q.out);
                if (q.in.contains(q.z.name) && !q.used.contains(q.z.name))
                {
                    q.in.remove(q.z.name);
                }
                if (q.in.equals(in) && q.out.equals(out))
                    change = false;
                else change = true;
                if (q.prev == null) break;
                else q = q.prev;
            }
        }
    }

    ir admit(ir code)
    {
        ir ad = new ir();
        quard head = code.head;
        while (head != null)
        {
            if (!(head.op.equals("imm") || head.op.equals("int") || head.op.equals("string")))
            {
                ad.push(head);
            }
            if (head.next == null) break;
            else head = head.next;
        }
        return ad;
    }

    void allocate(ir code)
    {
        Integer color = new Integer(0);
        quard head = new quard();
        head = code.head;
        while (head != null)
        {
            String s1 = new String();
            for (String str : head.def)
            {
                s1 = (str);
                m.add(s1, "0");
            }
            for (String str : head.out)
            {
                if (!s1.equals("") && !s1.equals(str))
                    m.add(s1, str);
            }
            if (head.next == null)
                break;
            else
                head = head.next;
        }
        for (Map.Entry<String, node> entry : m.nodes.entrySet())
        {
           // System.out.println(entry.getKey() + entry.getValue().degree);
        }
        for (int i = 0; i < m.nodes.size(); ++i)
        {
            Integer min = new Integer(2147483647);
            node n = new node();
            for (Map.Entry<String, node> entry : m.nodes.entrySet())
            {
                if (min > entry.getValue().degree && entry.getValue().color == -1)
                {
                    min = entry.getValue().degree;
                    n = m.newnode(entry.getKey());
                }
            }
            n.dec();
            boolean[] check = {false, false, false, false};
            for (int j = 0; j < n.neibor.size(); ++j)
            {
                if (n.neibor.get(j).color != -1)
                    check[n.neibor.get(j).color] = true;
            }
            for (int j = 0;j < check.length;++j)
            {
                if (check[j] == false)
                {
                    n.color = j;
                    result.put(n.name , n.color);
                    break;
                }
            }
            if (n.color == -1)
            {
                if (color < 4)
                {
                    n.color = color;
                    result.put(n.name , n.color);
                    ++color;
                }
            }
           // System.out.println(n.name + ' ' + n.color);
        }

    }

    Map<String,Integer> check(ir code)
    {
        code = admit(code);
        lives(code);
       /* quard head = new quard();
        head = code.head;
        while (head != null)
        {
            System.out.println(head.z.name + ' ' + head.op + ' ' + head.y.name + ' ' + head.x.name);
            System.out.println("used:\t" + head.used);
            System.out.println("def:\t" + head.def);
            System.out.println("in:\t" + head.in);
            System.out.println("out:\t" + head.out);
            System.out.println();
            if (head.next == null)
                break;
            else
                head = head.next;
        }*/
        allocate(code);

        return result;
    }
}
