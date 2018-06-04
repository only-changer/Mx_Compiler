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
            if (!n1.neibor.contains(n2)) n1.add(n2);
            if (!n2.neibor.contains(n1)) n2.add(n1);
        }
    }
}

public class livecheck
{
    Map<String, quard> jmpmap = new HashMap<>();
    String[] regs = {"r12", "r13", "r14", "r15"};
    map m = new map();
    Set<String> in = new HashSet<>();
    Set<String> out = new HashSet<>();
    Map<String, Integer> result = new HashMap<>();
    Map<String, Map<String, Integer>> allin = new HashMap<>();

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
                {
                    if (q.z.params != null)
                    {
                        for (int i = 0; i < q.z.params.size(); ++i)
                            if (q.z.params.get(i).name.contains("temp"))
                                q.def.add(q.z.params.get(i).name);
                    }
                }else
                if (q.op.equals("call"))
                {
                    if (q.y.name.contains("temp"))
                        q.def.add(q.y.name);
                    if (q.y.params != null)
                        for (int i = 0; i < q.y.params.size(); ++i)
                            if (q.y.params.get(i).name.contains("temp"))
                            {
                                q.used.add(q.y.params.get(i).name);
                            }
                    if (jmpmap.containsKey(q.z.name))
                    {
                        q.out.addAll(jmpmap.get(q.z.name).in);
                    }
                }
                else
                {
                    if (q.z.name.contains("temp"))
                    {
                        q.def.add(q.z.name);
                    }
                    if (q.y.name.contains("temp"))
                    {
                        q.used.add(q.y.name);
                    }
                    if (q.y.params != null)
                        for (int i = 0; i < q.y.params.size(); ++i)
                            if (q.y.params.get(i).name.contains("temp"))
                            {
                                q.used.add(q.y.params.get(i).name);
                            }
                    if (q.x.name.contains("temp"))
                    {
                        q.used.add(q.x.name);
                    }
                    if (q.x.params != null)
                        for (int i = 0; i < q.x.params.size(); ++i)
                            if (q.x.params.get(i).name.contains("temp"))
                            {
                                q.used.add(q.x.params.get(i).name);
                            }
                }
                in.clear();
                out.clear();
                in.addAll(q.in);
                out.addAll(q.out);
                q.in.clear();
                q.out.clear();
                q.in.addAll(q.used);
                if (q.op.equals("goto") || q.op.equals("if") || q.op.equals("for") || q.op.equals("j"))
                {
                    String s= new String(q.z.name);
                    if (s.charAt(0) >= '0' && s.charAt(0) <= '9')
                        s = "_" + s;
                    if (jmpmap.containsKey(s))
                    {
                        q.out.addAll(jmpmap.get(s).in);
                    }
                }
                if (q.next != null && !q.op.equals("ret"))
                {
                    q.out.addAll(q.next.in);
                }
                q.in.addAll(q.out);
                if (q.in.contains(q.z.name) && !q.used.contains(q.z.name))
                {
                    q.in.remove(q.z.name);
                }
                if (q.z.params != null)
                {
                    q.in.add(q.z.name);
                    for (int i = 0; i < q.z.params.size(); ++i)
                        if (q.z.params.get(i).name.contains("temp"))
                            q.in.add(q.z.params.get(i).name);
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
        String curfunc = new String();
        ir ad = new ir();
        quard head = code.head;
        while (head != null)
        {
            if (!(head.op.equals("imm") || head.op.contains("int") || head.op.contains("string") || head.op.equals("arr")))
            {
                ad.push(head);
            }
            if (head.op.equals("label!!!!!!!!!"))
            {
                jmpmap.put(head.z.name, head);
                if (!head.z.name.contains("_"))
                {
                    curfunc = head.z.name;
                }
            }
            head.curfunc = curfunc;
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
                for (String str2 : head.out)
                {
                    if (!s1.equals("") && !s1.equals(str2))
                        m.add(s1, str2);
                }
            }

            if (head.next == null)
                break;
            else
                head = head.next;
        }
        for (Map.Entry<String, node> entry : m.nodes.entrySet())
        {
             System.out.print(entry.getKey() + entry.getValue().degree);
              for (int i = 0; i < entry.getValue().neibor.size(); ++i)
                 System.out.print(' ' + entry.getValue().neibor.get(i).name);
              System.out.println();
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
            for (int j = 0; j < check.length; ++j)
            {
                if (check[j] == false)
                {
                    n.color = j;
                    if (color <= j) color = j + 1;
                    result.put(n.name, n.color);
                    break;
                }
            }
            if (n.color == -1)
            {
                if (color < 4)
                {
                    n.color = color;
                    result.put(n.name, n.color);
                    ++color;
                }
            }
            //System.out.println(n.name + ' ' + n.color);
        }

    }

    Map<String, Integer> check(ir code)
    {
        code = admit(code);
        lives(code);
       quard head = new quard();
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
        }
        allocate(code);

        return result;
    }
}
