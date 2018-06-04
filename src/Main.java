import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ANTLRInputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;

class varible
{
    String name;
    Integer arr;
    boolean isfunc;
    String addr;
    Vector<varible> params;

    varible()
    {
        name = new String();
        addr = new String();
    }

    public varible(varible var)
    {
        this.name = new String(var.name);
        this.addr = new String(var.addr);
        if (var.params != null)
        {
            this.params = new Vector<>(var.params);
        }
    }

    void add(varible param)
    {
        if (params == null) params = new Vector<>();
        params.add(param);
    }
}

class quard
{
    String op;
    varible x;
    varible y;
    quard prev;
    quard next;
    varible z;
    Integer num = new Integer(0);

    quard()
    {
        op = new String();
        x = new varible();
        y = new varible();
        z = new varible();
    }
}

class ir
{
    public quard head;
    public quard last;

    ir()
    {
        head = null;
        last = null;
    }

    public quard getlast()
    {
        return last;
    }

    public void push(quard quad)
    {
        if (head == null)
        {
            head = quad;
            last = quad;
        }
        else
        {
            last.next = quad;
            quad.prev = last;
            last = last.next;
        }
    }

    public void add(ir irr)
    {
        if (head == null)
        {
            head = irr.head;
            last = irr.last;
        }
        else
        {
            if (irr.head != null)
            {
                last.next = irr.head;
                irr.head.prev = last.next;
                last = irr.last;
            }
        }
    }

    public void print()
    {
        if (head != null)
        {
            quard quad = new quard();
            quad = head;
            while (quad != null)
            {
                System.err.println(quad.z.name + ' ' + quad.op + ' ' + quad.y.name + ' ' + quad.x.name);
                if (quad.next == null) break;
                quad = quad.next;
            }
        }
    }
}

class check
{
    Integer addr = new Integer(0);
    public ir code;
    Map<String, vartype> defvars = new HashMap();
    Vector<Vector> vars = new Vector<>();
    Vector<String> var = new Vector();
    Vector<varible> params = new Vector<>();

    check()
    {
        code = new ir();
    }

}

class vartype
{
    String type;
    Integer addr;

    vartype()
    {
        type = new String();
        addr = new Integer(0);
    }
}

class all
{
    Map<String, Vector<String>> defuns = new HashMap<>();
    Map<String, vartype> defvars = new HashMap<>();
    Map<String, Integer> defcom = new HashMap<>();
    int oh = 0;
    Integer size = new Integer(0);
    Map<String, Integer> addr = new HashMap<>();
    Map<String, Integer> vars = new HashMap<>();

    all()
    {
        vartype v = new vartype();
        v.type = "this";
        defvars.put("this", v);
    }
}

class arrtype
{
    Integer div;
    Integer start;
    arrtype[] subarr;
    Integer[] addr = new Integer[100];
    Integer length;

    arrtype(Integer di)
    {
        start = new Integer(0);
        div = new Integer(di);
    }

    void add(Integer sta, Integer leng)
    {
        start = new Integer(sta);
        length = new Integer(leng);
        if (div == 1) addr = new Integer[100];
        else
        {
            subarr = new arrtype[length];
            for (int i = 0; i < leng; ++i)
                subarr[i] = new arrtype(div - 1);
        }
    }
}

class MyVisitor extends MxBaseVisitor<check>
{
    Map<String, String> regstemp = new HashMap<>();
    String[] regsname = {"rax", "rcx", "rdx", "rbx", "rbp", "rsi", "rdi"};
    Integer[] callregs = {5, 4, 2, 1, 6, 7};
    Integer templist[] = new Integer[30];
    Integer addr = 0;
    Map<String, Vector<String>> defuns = new HashMap<>();
    String defun = new String();
    Map<String, vartype> defvars = new HashMap<>();
    Map<String, arrtype> defcom = new HashMap<>();
    Map<String, all> defclass = new HashMap<>();
    boolean isfor = false;
    boolean getin = false;
    String classname = new String();
    String cla = new String();
    boolean classfun = false;
    Integer temp = 0;
    Integer b = 0;
    Integer b_f = 0;
    Integer b_i = 0;
    Map<String, Integer> regs = new HashMap<>();
    String curarr = new String();
    String curtemp = new String();
    String arrname = new String();
    Vector<String> params = new Vector<>();
    boolean ismain;
    String strname = new String();
    boolean left;
    Integer maxtemp = new Integer(0);
    boolean isglobal = false;
    ir global = new ir();
    Integer forss = new Integer(0);
    boolean isloop = false;
    String clname = new String();
    Integer keytemp = new Integer(0);
    String fyi = new String();
    varible clarr = new varible();
    Integer b_arr = new Integer(0);
    Integer constr = new Integer(0);
    Vector <String> cons = new Vector<>();
    MyVisitor()
    {
        cla = "";
        classname = "";
        Vector v1 = new Vector();
        v1.add("int");
        defuns.put("getInt", v1);
        Vector v2 = new Vector();
        v2.add("string");
        v2.add("int");
        defuns.put("toString", v2);
        Vector v3 = new Vector();
        v3.add("void");
        v3.add("string");
        defuns.put("println", v3);
        Vector v4 = new Vector();
        v4.add("void");
        v4.add("string");
        defuns.put("print", v4);


        Vector v6 = new Vector();
        v6.add("int");
        all al1 = new all();
        al1.defuns.put("size", v6);
        defclass.put("001", al1);

        all al2 = new all();
        Vector v5 = new Vector();
        v5.add("int");
        al2.defuns.put("parseInt", v5);

        Vector v7 = new Vector();
        v7.add("int");
        al2.defuns.put("length", v7);
        Vector v8 = new Vector();
        v8.add("string");
        v8.add("int");
        v8.add("int");
        al2.defuns.put("substring", v8);
        Vector v9 = new Vector();
        v9.add("int");
        v9.add("int");
        al2.defuns.put("ord", v9);
        defclass.put("002", al2);

        Vector v10 = new Vector();
        v10.add("string");
        defuns.put("getString", v10);

    }

    public Integer move(String curtemp)
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

    public check visitAllin(MxParser.AllinContext ctx)
    {
        check chk = new check();
        check nullcheck = new check();
        for (int k = 0; k < ctx.defs().size(); ++k)
        {
            if (ctx.defs(k).defclass() != null)
            {
                all al = new all();
                al.oh = 2;
                defclass.put(ctx.defs(k).defclass().classname().getText(), al);
            }
        }
        for (int k = 0; k < ctx.defs().size(); ++k)
        {
            check ck = visit(ctx.defs(k));
            chk.defvars.putAll(ck.defvars);

            for (String key : ck.defvars.keySet())
            {
                if (defvars.containsKey(key))
                {
                    // System.out.println(ctx.defs(k).getText());
                    //System.out.println(key);
                    // System.out.println(ctx.defs(k).getText());
                    // System.out.println("Variables redefined!");
                    // System.exit(-1);
                }
            }
            if (ctx.defs(k).defvars() != null) defvars.putAll(ck.defvars);
        }
        defvars.clear();
        // defclass.clear();
        vartype v = new vartype();
        v.type = "000";
        defvars.put("this", v);
        getin = true;
        for (int k = 0; k < ctx.defs().size(); ++k)
            if (true)
            {
                check ck = visit(ctx.defs(k));
                chk.defvars.putAll(ck.defvars);
                chk.params.addAll(ck.params);
                chk.code.add(ck.code);
                for (String key : ck.defvars.keySet())
                {
                    if (defvars.containsKey(key))
                    {
                        System.out.println(ctx.defs(k).getText());
                        System.out.println(key);
                        System.out.println(ctx.defs(k).getText());
                        System.out.println("Variables redefined!");
                        System.exit(-1);
                    }
                }
                if (ctx.defs(k).defvars() != null) defvars.putAll(ck.defvars);
            }
        if (!(defuns.containsKey("main")))
        {
            System.out.println("FBI WARNING! NO MAIN FUNCTION!");
            System.exit(-1);
        }
        //chk.code.print();
        for (int i = 0;i < cons.size();++i)
        {
            varible k = new varible();
            k.name = cons.get(i);
            chk.params.add(k);
        }
        chk.addr = addr;
        return chk;
    }

    public check visitDefs(MxParser.DefsContext ctx)
    {
        check nonecheck = new check();
        isglobal = true;
        if (ctx.defvars() != null) return visit(ctx.defvars());
        isglobal = false;
        if (ctx.defclass() != null) return visit(ctx.defclass());
        if (ctx.defun() != null)
        {
            return visit(ctx.defun());
        }

        return nonecheck;
    }

    public check visitVarname(MxParser.VarnameContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitDefvars(MxParser.DefvarsContext ctx)
    {
        return visit(ctx.defvar());
    }

    public check visitDefvar(MxParser.DefvarContext ctx)
    {
        check chk = new check();
        vartype v = new vartype();
        v.type = ctx.type().getText();
        if (getin)
        {
            if (ctx.type().getText().equals("int") || ctx.type().getText().equals("bool"))
            {
                v.addr = addr;
                addr += 8;
            }
            if (ctx.type().getText().equals("string"))
            {
                v.addr = addr;
                addr += 100 * 8;
            }
        }
        if (ctx.varname().getText().equals(""))
        {
            System.exit(-1);
        }
        //defvars.put(ctx.varname().getText(), ctx.type().getText());
        if (ctx.type().getText().contains("[]"))
        {
            int num = 0;
            String s = new String();
            for (int i = 0; i < ctx.type().getText().length(); ++i)
            {
                if (ctx.type().getText().charAt(i) == '[') ++num;
            }
            v.addr = new Integer(addr);
            addr += 800;
            if (!classname.equals(""))
            {
                defclass.get(classname).defcom.put(ctx.varname().getText(), v.addr);
            }
            else
            {
                arrtype arr = new arrtype(num);
                defcom.put(ctx.varname().getText(), arr);
                curarr = ctx.varname().getText();
                defcom.get(curarr).add(v.addr, 100);
            }
        }
       /* if (getin && defclass.containsKey(ctx.type().getText()))
        {
            v.addr = addr;
            addr += defclass.get(ctx.type().getText()).size;
        }*/
        chk.defvars.put(ctx.varname().getText(), v);
        Integer curtemp = new Integer(temp);
        if (getin)
            if (!isglobal)
            {
                Integer t = new Integer(temp);
                regs.put(ctx.varname().getText(), t);
                curtemp = temp;
                ++temp;
            }
            else
            {
                varible k = new varible();
                k.name = "sjtulc" + ctx.varname().getText();
                chk.params.add(k);
            }
        if (ctx.expr() != null && getin)
        {
            quard quad = new quard();
            check ck = visit(ctx.expr());
            chk.var = ck.var;
            if (ctx.expr().opcom != null)
                if (ctx.expr().expr(0).getText().contains("[]") && !ctx.expr().getText().contains("("))
                {
                    System.exit(-1);
                }
            if (!isglobal) quad.z.name = curtemp.toString() + "temp";
            else quad.z.name = ctx.varname().getText();
            if (ctx.expr().news() == null)
            {
                quad.y = new varible(ck.code.last.z);
            }
            else quad.y.name = ck.code.last.z.name;

            quad.op = "=";

            if (!isglobal)
            {
                chk.code.add(ck.code);
                chk.code.push(quad);
            }
            else
            {
                global.add(ck.code);
                global.push(quad);
            }
        }
        chk.var.add(ctx.type().getText());
        String ss = new String();
        for (int i = 0; i < ctx.type().getText().length(); ++i)
        {
            if (ctx.type().getText().charAt(i) == '[') break;
            ss += ctx.type().getText().charAt(i);
        }
        if (!(ss.equals("int") || ss.equals("bool") || ss.equals("string") || defclass.containsKey(ss)))
        {
            System.out.println(ctx.getText());
            System.out.println(ss);
            System.out.println(defclass);
            System.out.println("FBI WARNING! Variables wrong!");
            System.exit(-1);
        }
        chk.vars.add(chk.var);
        if (classfun)
        {
            vartype va = new vartype();
            va.type = ctx.type().getText();
            defclass.get(classname).defvars.put(ctx.varname().getText(), va);
        }
        return chk;
    }

    public check visitTypename(MxParser.TypenameContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitType(MxParser.TypeContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitBasetype(MxParser.BasetypeContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitClassname(MxParser.ClassnameContext ctx)
    {
        check nullcheck = new check();

        return nullcheck;
    }

    public check visitDefclass(MxParser.DefclassContext ctx)
    {
        Map<String, vartype> origin = new HashMap<>(defvars);
        check chk = new check();
        String s = ctx.classname().getText();
        classname = s;
        if (s.equals("") || s.equals("main")) System.exit(-1);
        Vector vec = new Vector();
        all al = new all();
        if (defclass.containsKey(s))
        {
            if (defclass.get(s).oh == 0)
            {
                System.out.println("class redefined!");
                System.exit(-1);
            }
            else
            {
                al.oh = defclass.get(s).oh - 1;
                defclass.get(s).oh--;
            }
        }
        if (al.oh == 0)
        {

        }
        else
        {
            al = defclass.get(s);
            al.defvars.clear();
            vartype v = new vartype();
            v.type = "000";
            al.defvars.put("this", v);
        }
        Integer size = new Integer(0);
        for (int i = 0; i < ctx.defvars().size(); ++i)
        {
            check ck = visit(ctx.defvars(i));
            chk.code.add(ck.code);
            chk.defvars.putAll(ck.defvars);
            al.addr.put(ctx.defvars(i).defvar().varname().getText(), size);

            Integer I = new Integer(size);
            size += 8;
            al.vars.put(ctx.defvars(i).defvar().varname().getText(), I);
            for (String key : ck.defvars.keySet())
            {
                if (al.defvars.containsKey(key))
                {
                    System.out.println("Variables redefined!");
                    System.exit(-1);
                }
            }
            al.defvars.putAll(ck.defvars);
        }
        al.size = size;
        classfun = true;
        for (int i = 0; i < ctx.defun().size(); ++i)
        {
            check ck = visit(ctx.defun(i));
            chk.params.addAll(ck.params);
            chk.code.add(ck.code);
        }
        if (ctx.fun != null)
        {
            if (!ctx.fun.getText().equals(classname) || (ctx.block(0).getText().contains("return") && !ctx.block(0).getText().contains("return;")))
            {
                ;
                System.out.println("FBI WARNING!con fun down!");
                System.exit(-1);
            }
        }
        classfun = false;
        defvars = origin;
        chk.defvars.clear();
        classname = "";
        return chk;
    }

    public check visitFunname(MxParser.FunnameContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitDefun(MxParser.DefunContext ctx)
    {
        regs.clear();
        if (ctx.funname().getText().equals("main")) ismain = true;
        else ismain = false;
        Integer origintemp = new Integer(temp);
        if (ctx.funname().getText().equals("this"))
        {
            System.out.println("FBI WARNING!THIS Wrong!");
            System.exit(-1);
        }
        Map<String, vartype> local = new HashMap<>();
        check chk = new check();
        Map<String, vartype> origin = new HashMap<>(defvars);
        defun = ctx.type().getText();
        check c = visit(ctx.params());
        Map<String, vartype> map = (c.defvars);
        Vector<String> pvec = c.var;
        local.putAll(map);
        defvars.putAll(map);
        if (ctx.funname().getText().contains("__")) System.exit(-1);
        if (!classname.equals("")) defclass.get(classname).defvars.putAll(map);
        if (!getin) chk.defvars.putAll(map);
        Vector fun = new Vector();
        fun.add(ctx.type().getText());
        String ss = new String();
        for (int i = 0; i < ctx.type().getText().length(); ++i)
        {
            if (ctx.type().getText().charAt(i) == '[') break;
            ss += ctx.type().getText().charAt(i);
        }
        if (!(ss.equals("int") || ss.equals("bool") || ss.equals("string") || ss.equals("void") || defclass.containsKey(ss)))
        {
            System.out.println(ss);
            // System.out.println(map);
            System.out.println("FBI WARNING! Variables wrong!");
            System.exit(-1);
        }
        if (ctx.funname().getText().equals("main") && !ctx.type().getText().equals("int"))
        {
            System.out.println("FBI WARNING! main wrong!");
            System.exit(-1);
        }
        for (int i = 0; i < pvec.size(); ++i)
        {
            fun.add(pvec.get(i));
        }
        if (!classname.equals(""))
        {
            String s = classname;
            defclass.get(s).defuns.put(ctx.funname().getText(), fun);
            //           System.out.println(ctx.funname().getText() + "DAFAFAFASFAFFAS" + classname);
//            System.out.println(defclass.get("A").defuns);
        }
        else
        {
            // System.out.println("att");
            // System.out.println(ctx.funname().getText());
            defuns.put(ctx.funname().getText(), fun);
        }

        defvars.putAll(chk.defvars);

        if (!getin)
        {
            chk.defvars.clear();
            return chk;
        }
        //System.out.println(ctx.getText());
        //System.out.println(classname);

        quard quad = new quard();
        quad.z.name = classname + ctx.funname().getText();
        quad.op = "label!!!!!!!!!";
        chk.code.push(quad);
        quad = new quard();
        quad.y.name = "0";

        quad.op = "funcinit";
        Integer paddr = new Integer(addr);
        if (!classname.equals(""))
        {
            varible k = new varible();
            k.name = temp.toString() + "temp";
            keytemp = temp;
            //System.out.println(keytemp);
            ++temp;
            if (temp > maxtemp) maxtemp = temp;
            quad.z.add(k);
        }
        for (int i = 0; i < params.size(); ++i)
        {
            if (regs.containsKey(params.get(i)))
            {
                varible k = new varible();
                k.name = regs.get(params.get(i)).toString() + "temp";
                quad.z.add(k);
            }
        }
        temp = 0;
        maxtemp = 0;
        check ck = visit(ctx.block());
       // chk.params.addAll(ck.params);
        chk.code.push(quad);
        quad.x.name = maxtemp.toString();
        if (ismain) chk.code.add(global);
        chk.code.add(ck.code);
        for (String key : ck.defvars.keySet())
        {
            if (local.containsKey(key))
            {
                System.out.println(ctx.getText());
                System.out.println(local);
                System.out.println(key);
                System.out.println("Variables redefined!");
                System.exit(-1);
            }
        }
        chk.defvars = ck.defvars;
        Vector<Vector> vv = ck.vars;
        chk.defvars.clear();
        defvars = origin;

        quard q = new quard();
        q.y.name = "null";
        q.op = "ret";
        chk.code.push(q);
        return chk;
    }

    public check visitParams(MxParser.ParamsContext ctx)
    {
        params.clear();
        check chk = new check();
        for (int i = 0; i < ctx.param().size(); ++i)
        {
            check ck = visit(ctx.param(i));
            chk.defvars.putAll(ck.defvars);
            chk.var.addAll(ck.var);
        }
        return chk;
    }

    public check visitParam(MxParser.ParamContext ctx)
    {
        params.add(ctx.defvar().varname().getText());
        check chk = new check();
        vartype v = new vartype();
        v.type = ctx.defvar().type().getText();
        chk.defvars.put(ctx.defvar().varname().getText(), v);
        String ss = new String();
        for (int i = 0; i < ctx.defvar().type().getText().length(); ++i)
        {
            if (ctx.defvar().type().getText().charAt(i) == '[') break;
            ss += ctx.defvar().type().getText().charAt(i);
        }
        if (!(ss.equals("int") || ss.equals("bool") || ss.equals("string") || defclass.containsKey(ss)))
        {
            System.out.println(ctx.getText());
            System.out.println(defclass);
            System.out.println("FBI WARNING! Variables wrong!");
            System.exit(-1);
        }
        chk.var.add(ctx.defvar().type().getText());
        visit(ctx.defvar());
        return chk;
    }

    public check visitBlock(MxParser.BlockContext ctx)
    {
        Map<String, vartype> origin = new HashMap<>(defvars);
        check chk = new check();
        Integer fi = new Integer(forss);
        for (int k = 0; k < ctx.stmt().size(); ++k)
        {

            forss = fi;
            check ck = visit(ctx.stmt(k));
            chk.params.addAll(ck.params);
            chk.code.add(ck.code);
            chk.defvars.putAll(ck.defvars);
            defvars.putAll(ck.defvars);
            Vector<Vector> vv = ck.vars;
            for (int i = 0; i < vv.size(); ++i)
            {
                Vector<String> v = vv.get(i);
                Vector u = new Vector();
                int flag = -2;//-1 : undefine ; 0 : pass int ; 1 : pass string; 2 : wrong;
                int uflag = 0;
                String sflag = "";
                String shadow = "";
                int che = 0;
                int ch2 = 0;
                //System.out.println(v);
                for (int j = 0; j < v.size(); ++j)
                {
                    if (v.get(j).equals("000")) continue;
                    if (v.get(j).equals("001"))
                    {
                        che = 1;
                        continue;
                    }
                    if (v.get(j).equals("002"))
                    {
                        ch2 = 1;
                        continue;
                    }
                    if (v.get(j).equals("int") || v.get(j).equals("bool") || v.get(j).equals("string") || v.get(j).contains("[]") || v.get(j).equals("void"))
                    {
                        if (v.get(j).equals("void"))
                        {
                            if (v.size() > 1)
                                if (!v.get(1).equals("bool"))
                                {
                                    System.out.println(ctx.getText());
                                    System.out.println(v);
                                    System.out.println("FBI WARNING!return down!");
                                    System.exit(-1);
                                }
                        }
                        if (flag == -2 || v.get(j).equals(sflag) || v.get(j).equals(shadow))
                        {
                            sflag = v.get(j);
                            if (sflag.equals("int")) shadow = "bool";
                            if (sflag.equals("bool")) shadow = "int";
                            flag = 2;
                            continue;
                        }
                        else if (!v.get(0).equals("void"))
                        {

                            System.out.println(ctx.stmt(k).getText());
                            System.out.println(v);
                            System.out.println(defvars.get("b").type);
                            System.out.println("FBI WARNING! Variables wrong!");
                            System.exit(-1);
                        }
                    }

                    if (defvars.containsKey(v.get(j)))
                    {
                        if (defvars.get(v.get(j)).equals("000")) continue;
                        if (flag == -2 || sflag.equals(defvars.get(v.get(j))) || shadow.equals(defvars.get(v.get(j))))
                        {
                            sflag = defvars.get(v.get(j)).type;
                            if (sflag.equals("int")) shadow = "bool";
                            if (sflag.equals("bool")) shadow = "int";
                            flag = 2;
                            continue;
                        }
                        else
                        {
                            System.out.println(ctx.getText());
                            //System.out.println(v);
                            System.out.println(ck.vars);
                            System.out.println("FBI WARNING! Variables wrong!");
                            System.exit(-1);
                        }
                        continue;
                    }
                    if (defclass.containsKey(v.get(j)))
                    {
                        if (flag == -2 || sflag.equals(v.get(j)))
                        {
                            sflag = v.get(j);
                            flag = 2;
                        }
                        else
                        {
                            System.out.println("FBI WARNING! vs wrong!");
                            System.exit(-1);
                        }

                    }
                    else if (!v.get(0).equals("void"))
                    {
                        System.out.println(ctx.getText());
                        System.out.println(defvars);
                        System.out.println(v);
                        System.out.println("FBI WARNING! Variable \"" + v.get(j) + "\"  undefined!");
                        System.exit(-1);
                    }
                }
                if (ch2 == 1)
                {
                    if (sflag.contains("string"))
                    {
                        System.out.println("FBI WARNING!STRING can't be null!");
                        System.exit(-1);
                    }
                }
                if (che == 1)
                {
                    if (!(sflag.equals("int") || sflag.equals("string") || sflag.equals("bool") || sflag.equals("") || ((sflag.contains("[]") || defclass.containsKey(sflag)) && (ch2 == 1))))
                    {
                        System.out.println(v);
                        System.out.println("FBI WARNING! Strict op wrong");
                        System.exit(-1);
                    }

                }
                if (uflag == -1)
                {
                    if (flag == 0) u.add("int");
                    else if (flag == 1) u.add("string");
                    chk.vars.add(u);
                }
            }
        }
        // chk.defvars.clear();
        defvars = origin;
        return chk;
    }

    public check visitStmt(MxParser.StmtContext ctx)
    {

        Integer fors = new Integer(0);
        fors = new Integer(forss);

        ir code_for = new ir();
        Map<String, vartype> origin = new HashMap<>(defvars);
        boolean isreturn = false;
        check chk = new check();
        boolean change = false;
        if ((ctx.getText().contains("for") || ctx.getText().contains("while")) && isfor == false)
        {
            change = true;
            isfor = true;
        }
        if (ctx.getText().length() >= 6)
            if (ctx.getText().substring(0, 6).equals("return"))
            {
                isreturn = true;
            }

        if (ctx.block() != null)
        {
            forss = fors;
            check ck = visit(ctx.block());
            chk.defvars.putAll(ck.defvars);
            chk.vars.addAll(ck.vars);
            chk.code.add(ck.code);
            chk.params.addAll(ck.params);
        }


        if (ctx.opb != null)
        {
            quard quad = new quard();
            quad.op = "goto";
            Integer b = new Integer(fors);
            quad.z.name = b.toString() + "forback";
            chk.code.push(quad);
        }
        if (ctx.opc != null)
        {
            quard quad = new quard();
            quad.op = "goto";
            Integer b = new Integer(fors);
            quad.z.name = b.toString() + "while";
            chk.code.push(quad);
        }
        if (ctx.opf != null || ctx.opw != null)
        {
            fors = b_f;
            ++b_f;
        }
        ir irr = new ir();
        Integer k = new Integer(0);
        Map<String, Integer> originreg = new HashMap<>(regs);

        for (int i = 0; i < ctx.stmt().size(); ++i)
        {
            forss = fors;
            check ck = visit(ctx.stmt(i));
            chk.params.addAll(ck.params);
            chk.defvars.putAll(ck.defvars);
            chk.vars.addAll(ck.vars);
            if (ctx.opf != null || ctx.opw != null)
            {
                code_for = ck.code;
            }
            if (ctx.op != null)
                if (ctx.op.getText().equals("if"))
                    if (i == 0)
                    {
                        k = b_i;
                        ++b_i;
                        quard quad = new quard();
                        quad.z.name = "_" + k.toString() + "if";
                        quad.op = "label!!!!!!!!!";
                        irr.push(quad);
                        irr.add(ck.code);
                        quad = new quard();
                        quad.op = "goto";
                        quad.z.name = k.toString() + "ifback";
                        irr.push(quad);
                        quad = new quard();
                        quad.z.name = "_" + k.toString() + "else";
                        quad.op = "label!!!!!!!!!";

                        irr.push(quad);
                    }
                    else
                    {
                        irr.add(ck.code);
                    }
        }
        if (ctx.op != null)
            if (ctx.op.getText().equals("if"))
            {
                quard quad = new quard();
                quad.z.name = "_" + k.toString() + "ifback";
                quad.op = "label!!!!!!!!!";
                irr.push(quad);
            }
        if ((ctx.getText().contains("if") || ctx.getText().contains("while") || ctx.getText().contains("for")) && ctx.block() == null)
        {
            chk.defvars.clear();
        }
        if (ctx.block() != null) chk.defvars.clear();
        if (ctx.defvars() != null)
        {
            check ck = visit(ctx.defvars());
            chk.defvars.putAll(ck.defvars);
            chk.vars.add(ck.var);
            chk.code.add(ck.code);
        }
        Integer origintemp = new Integer(temp);
        Vector v = new Vector();
        ir code_temp = new ir();

        if (ctx.opr != null && ctx.expr() == null)
        {
            quard quad = new quard();
            quad.y.name = "null";
            quad.op = "ret";
            chk.code.push(quad);
        }

        Integer ifs = new Integer(b_i);
        Map<String, Integer> curreg = new HashMap<>(regs);
        regs = originreg;
        if (ctx.expr3() != null) code_temp = visit(ctx.expr3()).code;
        check ck = new check();
        if (ctx.expr() != null)
        {
            ck = visit(ctx.expr());
            chk.params.addAll(ck.params);
        }
        v.addAll(ck.var);
        if (ctx.op != null)
            if (ctx.expr().getText().equals("1"))
                System.exit(-1);
        if (ctx.opr != null && ck.code.last != null)
        {
            quard quad = new quard();
            quad.y = new varible(ck.code.last.z);
            quad.op = "ret";
            chk.code.add(ck.code);
            chk.code.push(quad);
        }
        else if (ctx.op != null && ck.code.last != null)
        {
            if (ctx.op.getText().equals("if"))
            {
                quard quad = new quard();
                chk.code.add(ck.code);
                quad.y = new varible(ck.code.last.z);
                // quad.y.name = new String(ck.code.last.z.name);
                quad.z.name = k + "else";
                quad.op = "if";
                chk.code.push(quad);
                chk.code.add(irr);
            }
        }
        else if (ctx.opf != null)
        {
            irr = new ir();
            if (ctx.expr1() != null)
            {
                ck = visit(ctx.expr1());
                chk.code.add(ck.code);
            }
            quard quads = new quard();
            quads.op = "goto";
            quads.z.name = fors.toString() + "whilecheck";
            chk.code.push(quads);
            quads = new quard();
            quads.z.name = "_" + fors.toString() + "for";
            quads.op = "label!!!!!!!!!";
            chk.code.push(quads);
            chk.code.add(code_for);
            quads = new quard();
            quads.z.name = "_" + fors.toString() + "while";
            quads.op = "label!!!!!!!!!";
            chk.code.push(quads);
            chk.code.add(code_temp);
            quads = new quard();
            quads.z.name = "_" + fors.toString() + "whilecheck";
            quads.op = "label!!!!!!!!!";
            chk.code.push(quads);
            if (ctx.expr2() != null)
            {
                ck = visit(ctx.expr2());
                chk.code.add(ck.code);
                quard quad = new quard();
                quad.op = "for";
                quad.z.name = "_" + fors.toString() + "for";
                quad.y.name = ck.code.last.z.name;
                chk.code.push(quad);
            }
            else
            {
                quard quad = new quard();
                quad.op = "for";
                quad.z.name = "_" + fors.toString() + "for";
                quad.y.name = "1";
                chk.code.push(quad);
            }
            quard quad0 = new quard();
            quad0.z.name = "_" + fors.toString() + "forback";
            quad0.op = "label!!!!!!!!!";
            chk.code.push(quad0);

        }
        else if (ctx.opw != null)
        {
            quard quads = new quard();
            quads.op = "goto";
            quads.z.name = fors.toString() + "while";
            chk.code.push(quads);
            quads = new quard();
            quads.z.name = "_" + fors.toString() + "for";
            quads.op = "label!!!!!!!!!";
            chk.code.push(quads);
            chk.code.add(code_for);
            quads = new quard();
            quads.z.name = "_" + fors.toString() + "while";
            quads.op = "label!!!!!!!!!";
            chk.code.push(quads);
            chk.code.add(ck.code);
            quard quad = new quard();
            quad.op = "for";
            quad.z.name = "_" + fors.toString() + "for";
            quad.y = new varible(ck.code.last.z);
            irr.push(quad);
            quad = new quard();
            quad.z.name = "_" + fors.toString() + "forback";
            quad.op = "label!!!!!!!!!";
            chk.code.add(irr);
            chk.code.push(quad);
        }
        else
        {
            // System.out.println(ctx.getText());
            chk.code.add(ck.code);
        }
        if (ctx.opf != null || ctx.getText().contains("while(")) v.add("bool");
        if (ctx.getText().contains(";i;")) v.add("string");
        chk.vars.addAll(ck.vars);

        //curreg.putAll(regs);
        regs = curreg;
        // temp = origintemp;
        // System.out.println("!!!");
        // System.out.println(v);
        if (ctx.getText().contains("if") && ctx.expr() != null)
        {
            // System.out.println(v);
            v.add("bool");
        }
        if (!isfor && (ctx.getText().contains("break") || ctx.getText().contains("continue")))
        {
            System.out.println(ctx.getText());
            System.out.println("FBI WARNING! FOR DOWN!");
            System.exit(-1);
        }
        if (isreturn)
        {
            v.add(defun);
        }
        chk.vars.add(v);
        defvars = origin;
        if (change == true) isfor = false;
        cla = "";
        // System.out.println(chk.vars);
        // System.out.println(ctx.getText());
        return chk;
    }


    public check visitExprs(MxParser.ExprsContext ctx)
    {
        check chk = new check();
        for (int i = 0; i < ctx.expr().size(); ++i)
        {
            check ck = visit(ctx.expr(i));
            chk.vars.add(ck.var);
            chk.code.add(ck.code);
            chk.params.add(ck.code.last.z);
        }
        return chk;
    }

    public check visitExpr(MxParser.ExprContext ctx)
    {
        int dd = 0;
        if (ctx.getText().contains("="))
            for (int i = 1; i < ctx.getText().length() - 1; ++i)
            {
                if (ctx.getText().charAt(i) == '=' && ctx.getText().charAt(i + 1) != '=' && ctx.getText().charAt(i + 1) != '<' && ctx.getText().charAt(i + 1) != '>' && ctx.getText().charAt(i + 1) != '!'
                        && ctx.getText().charAt(i - 1) != '=' && ctx.getText().charAt(i - 1) != '<' && ctx.getText().charAt(i - 1) != '>' && ctx.getText().charAt(i - 1) != '!')
                {
                    ++dd;

                    if (ctx.expr(0) != null)
                        if (ctx.opd != null)
                            if ((!(ctx.expr(0).getText().contains(".") || ctx.expr(0).varname() != null || ctx.expr(0).opcom != null)))
                            {
                                System.out.println(ctx.getText());
                                System.out.println("FBI WARNING! = left wrong!");
                                System.exit(-1);
                            }
                    if (ctx.expr(0) != null)
                        if (ctx.opd != null)
                            if (ctx.expr(0).varname() != null)
                                if (ctx.expr(0).varname().getText().equals("this"))
                                {
                                    System.out.println(ctx.getText());
                                    System.out.println("FBI WARNING! = left wrong!");
                                    System.exit(-1);
                                }
                }
                if (dd >= 2 && ctx.opd != null && !ctx.getText().contains("="))
                {
                    System.out.println(ctx.getText());
                    System.out.println("FBI WARNING! = number wrong!");
                    System.exit(-1);
                }
            }
        check chk = new check();
        if (ctx.funname() != null)
        {
            String ss = new String(cla);
            cla = "";
            Vector<Vector> v = new Vector<>();
            if (!ctx.getText().contains(")"))
                System.exit(-1);
            varible vs = new varible();
            String curla = new String();
            curla = clname;
            if (ctx.exprs() != null)
            {
                check ck = visit(ctx.exprs());
                v.addAll(ck.vars);
                vs = new varible(ck.code.last.z);
                chk.code.add(ck.code);
                chk.params = ck.params;
                // System.out.println(v);
            }
            cla = ss;
            String s = ctx.funname().getText();
            if (s.equals("main") && (v.size() > 0))
            {
                System.out.println("FBI WARNING! main wrong!");
                System.exit(-1);
            }
            boolean constfunc = false;
            if (s.contains("size") && cla.equals("001"))
            {

                quard quad = new quard();
                quad.z.name = temp.toString() + "temp";
                quad.op = "+";
                if (regs.containsKey(arrname))
                    quad.y.name = regs.get(arrname).toString() + "temp";
                else if (!classname.equals("") && defclass.get(classname).vars.containsKey(arrname))
                {
                    quad.y.name = keytemp.toString() + "temp";
                    varible k = new varible();
                    k.name = defclass.get(classname).vars.get(arrname).toString();
                    quad.y.add(k);
                }
                else
                {
                    quad.y.name = arrname;
                }
                varible k = new varible();
                k.name = "0";
                quad.y.add(k);
                quad.x.name = "0";
                ++temp;
                if (temp > maxtemp) maxtemp = temp;
                chk.code.push(quad);
                constfunc = true;

            }
            if (s.equals("length") && cla.equals("002"))
            {
                quard quad = new quard();
                quad.op = "call";
                quad.z.name = "string.length";
                varible k = new varible();
                if (regs.containsKey(strname))
                {
                    k.name = regs.get(strname).toString() + "temp";
                    quad.y.add(k);
                }
                else
                {
                    k.name = strname;
                    quad.y.add(k);
                }
                quad.y.name = temp.toString() + "temp";
                chk.code.push(quad);
                quad = new quard();
                quad.z.name = temp.toString() + "temp";
                ++temp;
                if (temp > maxtemp) maxtemp = temp;
                chk.code.push(quad);
                constfunc = true;
            }
            if (s.equals("parseInt") && cla.equals("002"))
            {
                quard quad = new quard();
                quad.op = "call";
                quad.z.name = "string.parseInt";
                varible k = new varible();
                if (regs.containsKey(strname))
                {
                    k.name = regs.get(strname).toString() + "temp";
                    quad.y.add(k);
                }
                else
                {
                    k.name = strname;
                    if (strname.contains("(")) k.name = "rax";
                    quad.y.add(k);
                }
                quad.y.name = temp.toString() + "temp";
                chk.code.push(quad);
                quad = new quard();
                quad.z.name = temp.toString() + "temp";
                ++temp;
                if (temp > maxtemp) maxtemp = temp;
                chk.code.push(quad);
                constfunc = true;
            }
            if (s.equals("ord") && cla.equals("002"))
            {
                quard quad = new quard();
                quad.op = "call";
                quad.z.name = "string.ord";
                varible k = new varible();
                if (regs.containsKey(strname))
                {
                    k.name = regs.get(strname).toString() + "temp";
                    quad.y.add(k);
                }
                else
                {
                    k.name = strname;
                    quad.y.add(k);
                }
                quad.y.add(chk.params.get(0));
                quad.y.name = temp.toString() + "temp";
                chk.code.push(quad);
                quad = new quard();
                quad.z.name = temp.toString() + "temp";
                ++temp;
                if (temp > maxtemp) maxtemp = temp;
                chk.code.push(quad);
                constfunc = true;
            }
            if (s.equals("substring") && cla.equals("002"))
            {
                quard quad = new quard();
                quad.op = "call";
                quad.z.name = "string.substring";
                varible k = new varible();
                if (regs.containsKey(strname))
                {
                    k.name = regs.get(strname).toString() + "temp";
                    quad.y.add(k);
                }
                else
                {
                    k.name = strname;
                    quad.y.add(k);
                }
                quad.y.add(chk.params.get(0));
                quad.y.add(chk.params.get(1));
                quad.y.name = temp.toString() + "temp";
                chk.code.push(quad);
                quad = new quard();
                quad.z.name = temp.toString() + "temp";
                ++temp;
                if (temp > maxtemp) maxtemp = temp;
                chk.code.push(quad);
                constfunc = true;
            }

            Map<String, Vector<String>> defun = new HashMap();
            //System.out.println(cla);
            String c = new String(cla);
            if (!cla.equals(""))
            {
                defun = defclass.get(cla).defuns;
                // System.out.println(cla);
                //  System.out.println(defclass.get(cla).defuns);
                cla = "";
            }
            else if (!classname.equals(""))
            {
                defun = new HashMap<>(defuns);
                defun.putAll(defclass.get("001").defuns);
                defun.putAll(defclass.get("002").defuns);
                defun.putAll(defclass.get(classname).defuns);
                //System.out.println(classname);
            }
            else
            {
                defun = defuns;
            }
            // System.out.println("ASADDAD");
            //  System.out.println(defun);
            if (defun.containsKey(s))
            {
                //if (!defuns.get(s).get(0).equals("void"))

                chk.var.add(defun.get(s).get(0));
                if (v.size() != defun.get(s).size() - 1)
                {
                    System.out.println(ctx.getText());
                    System.out.println(defuns);

                    System.out.println("FBI WARNING! parmars numbers wrong!");
                    System.exit(-1);
                }
                else
                {
                    quard q = new quard();
                    Integer originaddr = new Integer(addr);
                    Integer origintemmp = new Integer(temp);
                    if ((!c.equals("")) && (!constfunc))
                    {
                        if (regs.containsKey(curla))
                        {
                            varible k = new varible();
                            k.name = regs.get(curla).toString() + "temp";
                            ++temp;
                            if (temp > maxtemp) maxtemp = temp;
                            q.y.add(k);
                        }
                    }
                    if ((!classname.equals("")) && c.equals("") && !constfunc && defclass.get(classname).defuns.containsKey(ctx.funname().getText()))
                    {
                        varible k = new varible();
                        k.name = keytemp.toString() + "temp";
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        q.y.add(k);
                    }
                    for (int i = 0; i < v.size(); ++i)
                    {
                        Vector vec = new Vector();
                        vec.addAll(v.get(i));
                        vec.add(defun.get(s).get(i + 1));
                        chk.vars.add(vec);
                        varible sv = new varible();
                        sv = chk.params.get(i);
                        if (!constfunc)
                        {
                            q.y.add(sv);
                        }
                    }

                    if (!classname.equals(""))
                    {
                        if ((!classname.equals("")) && (!constfunc))
                            if (defclass.get(classname).defuns.containsKey(ctx.funname().getText()))
                            {
                                q.z.isfunc = true;
                                q.op = "call";
                                q.z.name = classname + ctx.funname().getText();
                                q.y.name = temp.toString() + "temp";
                                chk.code.push(q);
                                q = new quard();
                                q.z.name = temp.toString() + "temp";
                                chk.code.push(q);
                                ++temp;
                                if (temp > maxtemp) maxtemp = temp;
                            }
                            else
                            {
                                q.z.isfunc = true;
                                q.op = "call";
                                q.z.name = ctx.funname().getText();
                                q.y.name = temp.toString() + "temp";
                                chk.code.push(q);
                                q = new quard();
                                q.z.name = temp.toString() + "temp";
                                chk.code.push(q);
                                ++temp;
                                if (temp > maxtemp) maxtemp = temp;
                            }
                    }
                    else if (!c.equals("001"))
                    {
                        if ((!c.equals("")) && (!constfunc))
                        {
                            q.z.isfunc = true;
                            q.op = "call";
                            q.z.name = c + ctx.funname().getText();
                            q.y.name = temp.toString() + "temp";
                            varible k = new varible();
                            //System.out.println(fyi);
                            if (fyi.contains("("))
                            {
                                k.name = "rax";
                                q.y.add(k);
                            }
                            chk.code.push(q);
                            q = new quard();
                            q.z.name = temp.toString() + "temp";
                            chk.code.push(q);
                            ++temp;
                            if (temp > maxtemp) maxtemp = temp;
                        }
                        else if (!constfunc)
                        {
                            q.z.isfunc = true;
                            q.op = "call";
                            q.z.name = ctx.funname().getText();
                            q.y.name = temp.toString() + "temp";
                            chk.code.push(q);
                            q = new quard();
                            q.z.name = temp.toString() + "temp";
                            chk.code.push(q);
                            ++temp;
                            if (temp > maxtemp) maxtemp = temp;
                        }
                    }

                }
            }
            else
            {
                System.out.println(ctx.getText());
                System.out.println(defun);
                System.out.println(ss);
                System.out.println("FBI WARNING! function \"" + s + "\" undefined!");
                System.exit(-1);
            }
            // System.out.println(chk.var);

            return chk;
        }
        if (ctx.opcom != null)
        {
            String s = new String();
            check ck0 = visit(ctx.expr(0));
            s = ck0.var.get(0);
            curtemp = temp.toString() + "temp";
            ++temp;
            if (temp > maxtemp) maxtemp = temp;
            if (s.contains("[]"))
            {
                String ss = new String();
                String sname = new String();
                for (int i = 0; i < s.length(); ++i)
                {
                    if (s.charAt(i) == '[') break;
                    ss += s.charAt(i);
                }
                for (int i = 0; i < ctx.expr(0).getText().length(); ++i)
                {
                    if (ctx.expr(0).getText().charAt(i) == '[') break;
                    sname += ctx.expr(0).getText().charAt(i);
                }
                int n = ctx.expr().size();
                quard quad = new quard();
                quad.z = new varible(ck0.code.last.z);
                if (regs.containsKey(quad.z.name))
                    quad.z.name = regs.get(quad.z.name).toString() + "temp";
                ++temp;
                if (temp > maxtemp) maxtemp = temp;
                quad.op = "arr";
                for (int i = 1; i < n; ++i)
                {
                    check ck = visit(ctx.expr(i));
                    Vector<String> vec = new Vector();
                    vec.addAll(ck.var);
                    vec.add("int");
                    chk.vars.add(vec);
                    chk.code.add(ck.code);
                    if (ck.code.last.op.equals("imm"))
                    {
                        quard q = new quard();
                        q.z.name = temp.toString() + "temp";
                        q.op = "imm";
                        Integer x = new Integer(0);
                        if (ss.equals("int") || ss.equals("bool"))
                            x = 8;
                        else if (ss.equals("string"))
                        {
                            x = 256;
                        }
                        else
                        {
                            x =  defclass.get(ss).size;
                        }
                        x *= (Integer.parseInt(ck.code.last.z.name) + 1);
                        q.y.name = x.toString();
                        chk.code.push(q);
                        varible k = new varible();
                        k.name = q.y.name;
                        quad.z.add(k);
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                    }
                    else
                    {
                        quard q = new quard();
                        q.z.name = temp.toString() + "temp";
                        q.op = "+";
                        //System.out.println(ctx.expr(i).getText());
                        q.y = new varible(ck.code.last.z);
                        q.x.name = "1";
                        chk.code.push(q);
                        q = new quard();
                        q.z.name = temp.toString() + "temp";
                        q.op = "*";
                        q.y.name = temp.toString() + "temp";
                        if (ss.equals("int") || ss.equals("bool"))
                            q.x.name = "8";
                        else if (ss.equals("string"))
                        {
                            q.x.name = "256";
                        }
                        else
                        {
                            q.x.name = defclass.get(ss).size.toString();
                        }
                        chk.code.push(q);
                        varible k = new varible();
                        k.name = temp.toString() + "temp";
                        quad.z.add(k);
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                    }
                }

                chk.code.push(quad);
                int l = (s.length() - ss.length()) / 2;
                n -= 1;
                for (int i = 0; i < l - n; ++i) ss += "[]";
                chk.var.add(ss);
            }
            else
            {
                System.out.println(ctx.getText());
                System.out.println(s);
                System.out.println("FBI WARNING!numcom \'" + s + "\" undefined!");
                System.exit(-1);
            }
            return chk;
        }
        int flag = 0;
        if (ctx.op != null)
            if (ctx.op.getText().equals("+"))
            {
                // System.out.println("!!!");
                chk.var.add("001");
            }
        Vector<String> vec = new Vector();
        if (ctx.varname() != null)
        {
            //System.out.println(ctx.varname().getText()  + classname);
            // System.out.println("<<<>>>");
            //  System.out.println(ctx.varname().getText() + classname);
            if (!cla.equals(""))
            {
                if (defclass.get(cla).defvars.containsKey(ctx.varname().getText()))
                {
                    chk.var.add(defclass.get(cla).defvars.get(ctx.varname().getText()).type);
                    quard quad = new quard();
                    quad.op = chk.var.get(0);
                    String s = new String();
                    s = ctx.varname().getText();
                    varible k = new varible();
                    k.name = defclass.get(cla).vars.get(s).toString();
                    quad.z.name = clname;
                    if (clname.contains("[") || (clname.equals("ptr.next")))
                        quad.z = new varible(clarr);
                    if (regs.containsKey(quad.z.name))
                        quad.z.name = regs.get(quad.z.name).toString() + "temp";

                    // System.out.println("????");
                    quad.z.add(k);
                    chk.code.push(quad);
                    cla = "";
                }
                else
                {
                    System.out.println(ctx.varname().getText());
                    System.out.println(ctx.getText());
                    System.out.println("SSS");
                    System.out.println("class v wrong!");
                    System.exit(-1);
                }
            }
            else if (!classname.equals(""))
            {
                if (defclass.get(classname).defvars.containsKey(ctx.varname().getText()))
                {
                    chk.var.add(defclass.get(classname).defvars.get(ctx.varname().getText()).type);
                    quard quad = new quard();
                    quad.op = chk.var.get(0);
                    String s = new String();
                    s = ctx.varname().getText();
                    if (s.equals("this"))
                    {
                        quad.z.name = keytemp.toString() + "temp";
                        clname = quad.z.name;
                        chk.code.push(quad);
                    }
                    else if (regs.containsKey(s))
                    {
                        s = regs.get(s).toString() + "temp";
                        quad.z.name = s;
                        chk.code.push(quad);
                    }
                    else
                    {
                        //System.out.println(s);
                        s = defclass.get(classname).vars.get(s).toString();
                        quad.z.name = keytemp.toString() + "temp";
                        //   System.out.println(keytemp);
                        varible k = new varible();
                        k.name = s;
                        quad.z.add(k);
                        chk.code.push(quad);
                    }

                }
                else if (defvars.containsKey(ctx.varname().getText()))
                {
                    chk.var.add(defvars.get(ctx.varname().getText()).type);
                    quard quad = new quard();
                    quad.op = chk.var.get(0);
                    String s = new String();

                    if (regs.containsKey(ctx.varname().getText()))
                        s = regs.get(ctx.varname().getText()).toString() + "temp";
                    else
                    {
                        s = ctx.varname().getText();
                    }
                    quad.y.name = ctx.varname().getText();
                    quad.z.name = s;
                    chk.code.push(quad);
                }
                else
                {
                    System.out.println(ctx.varname().getText());
                    System.out.println(defclass.get(classname).defvars);
                    System.out.println(ctx.getText());
                    System.out.println("class v wrong!");
                    System.exit(-1);
                }
            }
            else
            {
                if (defvars.containsKey(ctx.varname().getText()))
                {
                    chk.var.add(defvars.get(ctx.varname().getText()).type);
                }
                else
                {
                    System.out.println("FBI WARNING! varible wrong!");
                    System.exit(-1);
                }
                quard quad = new quard();
                quad.op = chk.var.get(0);
                String s = new String();

                if (regs.containsKey(ctx.varname().getText()))
                    s = regs.get(ctx.varname().getText()).toString() + "temp";
                else
                {
                    s = ctx.varname().getText();
                }
                quad.y.name = ctx.varname().getText();
                quad.z.name = s;
                chk.code.push(quad);
            }

        }
        if (ctx.NUM() != null)
        {
            chk.var.add("int");
            quard quad = new quard();
            quad.z.name = ctx.NUM().getText();
            quad.op = "imm";
            chk.code.push(quad);
        }
        if (ctx.getText().equals("true") || ctx.getText().equals("TRUE"))
        {
            quard quad = new quard();
            quad.z.name = "1";
            quad.op = "imm";
            chk.code.push(quad);
        }
        if (ctx.getText().equals("null"))
        {
            quard quad = new quard();
            quad.z.name = "0";
            quad.op = "imm";
            chk.code.push(quad);
        }
        if (ctx.getText().equals("false") || ctx.getText().equals("FALSE"))
        {
            quard quad = new quard();
            quad.z.name = "0";
            quad.op = "imm";
            chk.code.push(quad);
        }
        if (ctx.STR() != null)
        {
            chk.var.add("string");
            quard quad = new quard();
            String s = ctx.STR().getText();
            quad.z.name = temp.toString() + "temp";
            ++temp;
            if (maxtemp < temp) maxtemp = temp;
            varible k = new varible();
            k.name = new String();
            for (int i = 1; i < s.length() - 1; ++i)
            {
                k.name += ctx.STR().getText().charAt(i);
            }
            //System.out.println(quad.y.name);
            quad.op = "str=";
            cons.add(k.name);
            quad.y.name = "lcstr" + constr.toString();
            ++constr;
            chk.code.push(quad);
        }
        if (ctx.getText().contains("null")) chk.var.add("002");
        if (ctx.op != null) if (ctx.op.getText().equals("++"))
        {
            // System.out.println(ctx.op.getText());
            chk.var.add("int");
            vec.add("int");
            //  System.out.println("LLLL");
        }
        if (ctx.expr().size() == 1)
            if (ctx.op != null)
                if (ctx.op.getText().equals("++"))
                    if (ctx.expr(0).op != null)
                        if (ctx.expr(0).op.getText().equals("++"))
                            System.exit(-1);
        if (ctx.op != null) if (ctx.op.getText().equals("&&") || ctx.op.getText().equals("||"))
        {
            vec.add("bool");
        }
        if (ctx.op != null)
            if (ctx.op.getText().equals("."))
            {
                // System.out.println("???????");
                // System.out.println(ctx.getText());
                String s = ctx.expr(0).getText();
                fyi = s;
                check ckk = visit(ctx.expr(0));
                fyi = s;
                quard q = ckk.code.last;
                chk.code.add(ckk.code);
                String sa = ckk.var.get(0);
                if (sa.equals("001") && ckk.var.size() > 1)
                    if (ckk.var.get(1).equals("string"))
                        sa = "string";
                //  System.out.println(s);
                //System.out.println(ckk.var);
                String ty = new String();
                ty = sa;
                if (defvars.containsKey(sa))
                {
                    ty = defvars.get(sa).type;
                    //System.out.println(ty);
                }
                if (ty.equals("000"))
                {
                    cla = classname;
                    ty = "this";
                    check ck = visit(ctx.expr(1));
                    //System.out.println("???");
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
                    chk.code.add(ck.code);
                    //System.out.println(ctx.getText());
                    if (defclass.get(classname).vars.containsKey(ck.code.last.x.name))
                    {
                        quard quad = new quard();
                        quad.y = new varible(q.z);
                        quad.z.name = temp.toString() + "temp";
                        quad.op = "=";
                        chk.code.push(quad);
                        quad = new quard();
                        varible k = new varible();
                        quad.z.name = temp.toString() + "temp";
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        k.name = defclass.get(classname).vars.get(ck.code.last.x.name).toString();
                        quad.z.add(k);
                        chk.code.push(quad);
                    }
                }
                else if (ty.contains("[]"))
                {
                    cla = "001";
                    arrname = "";
                    for (int ii = 0; ii < s.length(); ++ii)
                    {
                        if (s.charAt(ii) == '[') break;
                        arrname += s.charAt(ii);
                    }
                    check ck = visit(ctx.expr(1));
                    //  System.out.println("???");
                    chk.code.add(ck.code);
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
                }
                else if (ty.equals("string"))
                {
                    cla = "002";
                    strname = ctx.expr(0).getText();
                    check ck = visit(ctx.expr(1));
                    chk.code.add(ck.code);
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
                }
                else if (defclass.containsKey(ty))
                {
                    if (!ctx.expr(0).getText().equals("this"))
                        clname = ctx.expr(0).getText();
                    clarr = new varible(ckk.code.last.z);
                    cla = ty;
                    check ck = visit(ctx.expr(1));
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
                    chk.code.add(ck.code);
                    //System.out.println(ctx.getText());
                    //  ck.code.print();
                    //System.err.println(ctx.getText());
                    if (defclass.get(ty).vars.containsKey(ck.code.last.x.name))
                    {
                        quard quad = new quard();
                        quad.y = new varible(q.z);
                        // System.out.println(quad.y.name);
                        quad.z.name = temp.toString() + "temp";
                        quad.op = "=";
                        chk.code.push(quad);
                        quad = new quard();
                        varible k = new varible();
                        quad.z.name = temp.toString() + "temp";
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        k.name = defclass.get(ty).vars.get(ck.code.last.x.name).toString();
                        quad.z.add(k);
                        chk.code.push(quad);
                    }
                }
                else
                {
                    System.out.println(ty);
                    System.out.println("FBI WARNING! class undefined!");
                    System.exit(-1);
                }
                return chk;
            }
        ir ir1 = new ir();
        ir ir2 = new ir();
        boolean isstr = false;
        for (int i = 0; i < ctx.expr().size(); ++i)
        {
            check ck = new check();
            if (i == 0 && ctx.opd != null) left = true;
            ck = visit(ctx.expr(i));
            chk.params.addAll(ck.params);
            left = false;
            if (ck.var.size() >= 1)
                if (ck.var.get(0).equals("string")) isstr = true;
            if (i == 0) ir1 = ck.code;
            if (i == 1) ir2 = ck.code;
            vec.addAll(ck.var);
            if (ctx.op1 != null)
            {
                chk.var.add("bool");
                vec.add("001");
                //  System.out.println("++++");
            }
            else
                chk.var.addAll(ck.var);
            chk.vars.addAll(ck.vars);

        }
        if (ctx.op != null)
            if (ctx.op.getText().equals("++"))
            {
                if (ir1.last != null)
                {
                    if (ctx.getText().charAt(0) == '+')
                    {
                        quard quad = new quard();
                        quad.z = new varible(ir1.last.z);
                        quad.y = new varible(ir1.last.z);
                        quad.x.name = "1";
                        quad.x.addr = "-1";
                        quad.op = "+";
                        chk.code.add(ir1);
                        chk.code.push(quad);
                    }
                    else
                    {
                        ir irr = new ir();
                        chk.code.add(ir1);
                        quard quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        quad.y = new varible(ir1.last.z);
                        quad.op = "=";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z = new varible(ir1.last.z);
                        quad.y = new varible(ir1.last.z);
                        quad.x.name = "1";
                        quad.op = "+";
                        irr.push(quad);

                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        chk.code.push(quad);
                    }
                }
            }
            else if (ctx.op.getText().equals("--"))
            {
                if (ir1.last != null)
                {
                    if (ctx.getText().charAt(0) == '-')
                    {
                        quard quad = new quard();
                        quad.z = new varible(ir1.last.z);
                        quad.y = new varible(ir1.last.z);
                        quad.x.name = "1";
                        quad.op = "-";
                        chk.code.add(ir1);
                        chk.code.push(quad);
                    }
                    else
                    {
                        ir irr = new ir();
                        chk.code.add(ir1);
                        quard quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        quad.y = new varible(ir1.last.z);
                        quad.op = "=";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z = new varible(ir1.last.z);
                        quad.y = new varible(ir1.last.z);
                        quad.x.name = "1";
                        quad.op = "-";
                        irr.push(quad);

                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        chk.code.push(quad);
                    }
                }
            }
        if (ctx.opc != null)
        {
            chk.code = ir1;
        }
        if (ctx.opf != null && ir1.last != null)
        {
            quard quad = new quard();
            quad.y = new varible(ir1.last.z);
            String s = temp.toString() + "temp";
            ++temp;
            if (temp > maxtemp) maxtemp = temp;
            quad.z.name = s;
            quad.op = ctx.opf.getText();
            if (quad.op.equals("-"))
                quad.op = "--";
            chk.code.add(ir1);
            chk.code.push(quad);
        }
        if (ctx.op != null)
            if (!ctx.op.getText().equals("."))
                if (!ctx.op.getText().equals("=") && ir1.last != null && ir2.last != null)
                    if (ctx.op.getText().equals("+") && isstr)
                    {
                        quard quad = new quard();
                        quad.z.name = "string.add";
                        quad.op = "call";
                        quad.y.add(ir1.last.z);
                        quad.y.add(ir2.last.z);
                        quad.y.name = temp.toString() + "temp";
                        chk.code.add(ir1);
                        chk.code.add(ir2);
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        chk.code.push(quad);
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                    }
                    else if (ir1.last.op.equals("imm") && ir2.last.op.equals("imm"))
                    {
                        quard quad = new quard();
                        quad.op = "imm";
                        if (ctx.op.getText().equals("+"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) + Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals("-"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) - Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals("*"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) * Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals("/"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) / Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals("%"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) % Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals(">>"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) >> Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals("<<"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) << Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals("&&") || ctx.op.getText().equals("&"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) & Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals("||") || ctx.op.getText().equals("|"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) | Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        if (ctx.op.getText().equals("^"))
                        {
                            Integer z = Integer.parseInt(ir1.last.z.name) ^ Integer.parseInt(ir2.last.z.name);
                            quad.z.name = z.toString();
                        }
                        chk.code.push(quad);
                    }
                    else
                    {
                        quard quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        quad.y = new varible(ir1.last.z);
                        quad.x = new varible(ir2.last.z);
                        quad.op = ctx.op.getText();
                        chk.code.add(ir1);
                        if (quad.op.equals("||"))
                        {
                            quard q = new quard();
                            q.op = "check";
                            q.y = new varible(quad.y);
                            q.x.name = "1";
                            chk.code.push(q);
                        }
                        if (quad.op.equals("&&"))
                        {
                            quard q = new quard();
                            q.op = "check";
                            q.y = new varible(quad.y);
                            q.x.name = "0";
                            chk.code.push(q);
                        }
                        chk.code.add(ir2);
                        chk.code.push(quad);
                    }
        if (ctx.op1 != null && ir1.last != null && ir2.last != null)
        {
            if (isstr)
            {
                quard quad = new quard();
                if (ctx.op1.getText().equals(">"))
                    quad.z.name = "string.g";
                if (ctx.op1.getText().equals("<"))
                    quad.z.name = "string.s";
                if (ctx.op1.getText().equals("=="))
                    quad.z.name = "string.eq";
                if (ctx.op1.getText().equals(">="))
                    quad.z.name = "string.ge";
                if (ctx.op1.getText().equals("<="))
                    quad.z.name = "string.le";
                quad.op = "call";
                quad.y.add(ir1.last.z);
                quad.y.add(ir2.last.z);
                quad.y.name = temp.toString() + "temp";
                chk.code.add(ir1);
                chk.code.add(ir2);
                chk.code.push(quad);
                quad = new quard();
                quad.z.name = temp.toString() + "temp";
                chk.code.push(quad);
                ++temp;
                if (temp > maxtemp) maxtemp = temp;
            }
            else
            {
                quard quad = new quard();
                quad.z.name = temp.toString() + "temp";
                ++temp;
                if (temp > maxtemp) maxtemp = temp;
                quad.y = new varible(ir1.last.z);
                quad.x = new varible(ir2.last.z);
                quad.op = ctx.op1.getText();
                chk.code.add(ir1);
                chk.code.add(ir2);
                chk.code.push(quad);
            }
        }
        if (ctx.opd != null && ir1.last != null && ir2.last != null)
        {
            quard quad = new quard();
            quad.z = new varible(ir1.last.z);
            if (ctx.expr(1).news() == null)
            {
                quad.y = new varible(ir2.last.z);
            }
            else quad.y.name = ir2.last.z.name;
            quad.op = "=";
            chk.code.add(ir1);
            chk.code.add(ir2);
            chk.code.push(quad);
        }
        chk.vars.add(vec);
        if (ctx.news() != null)
        {
            check ck = visit(ctx.news());
            chk.var.addAll(ck.var);
            chk.code.add(ck.code);
        }
        return chk;
    }

    public check visitNews(MxParser.NewsContext ctx)
    {
        check chk = new check();
        String s = new String();
        if (ctx.name != null) s = ctx.name.getText();
        else
        {
            s = ctx.classname().getText();
            if (defclass.containsKey(s))
            {
                if (defclass.containsKey(s))
                {
                    quard quad = new quard();
                    quad.op = "call";
                    quad.z.name = "malloc";
                    varible k = new varible();
                    k.name = defclass.get(s).size.toString();
                    quad.y.add(k);
                    quad.y.name = temp.toString() + "temp";
                    chk.code.push(quad);
                    quad = new quard();
                    quad.z.name = temp.toString() + "temp";
                    chk.code.push(quad);
                    ++temp;
                    if (temp > maxtemp) maxtemp = temp;
                }
            }
            else
            {
                System.out.println(s);
                System.out.println("FBI WARNING! NEWS WRONG!");
                System.exit(-1);
            }
        }
        if (ctx.classname() != null)
        {
            s = ctx.classname().getText();
            if (defclass.containsKey(s))
            {

            }
        }
        int num = 0;
        String sa = new String(s);
        for (int i = 0; i < ctx.getText().length(); ++i)
        {
            if (ctx.getText().charAt(i) == '[')
            {
                ++num;
                s += "[]";
            }
        }
        chk.var.add(s);
        // System.out.println(s);
        //  System.out.println(ctx.getText());
        Integer tmp = new Integer(0);
        String arrsize = new String();
        if (ctx.expr().size() > 5)
        {
            quard quad = new quard();
            quad.op = "multiarr";
            Integer kk = new Integer(0);
            quad.z.name = kk.toString() + "temp";
            temp += 100;
            if (temp > maxtemp) maxtemp = temp;
            for (int i = 0; i < ctx.expr().size(); ++i)
            {
                check ck = visit(ctx.expr(i));
                varible k = new varible();
                k.name = ck.code.last.z.name;
                quad.y.add(k);
                chk.code.push(quad);
            }
        }
        else
            for (int i = 0; i < ctx.expr().size(); ++i)
            {
                check ck = visit(ctx.expr(i));
                chk.code.add(ck.code);
                if (s.contains("[]"))
                    if (i == 0)
                    {
                        quard quad = new quard();
                        if (ck.code.last.op.equals("imm"))
                        {

                            quad.z.name = temp.toString() + "temp";
                            quad.op = "=";
                            quad.y.name =  (ck.code.last.z.name);
                            arrsize = quad.y.name;
                            Integer x= new Integer(0);
                            if (sa.equals("int") || sa.equals("bool")) x = 8;
                            else if (sa.equals("string"))
                            {
                                x = 256;
                            }
                            else
                            {
                               x= defclass.get(sa).size;
                            }
                            x *= (Integer.parseInt(quad.y.name) + 1 ) ;
                            quad.y.name = x.toString();
                            chk.code.push(quad);
                        }else
                        {
                            quad.z.name = temp.toString() + "temp";
                            quad.op = "+";
                            quad.y = new varible(ck.code.last.z);
                            arrsize = quad.y.name;
                            quad.x.name = "1";
                            chk.code.push(quad);
                            quad = new quard();
                            quad.z.name = temp.toString() + "temp";
                            quad.op = "*";
                            quad.y.name = temp.toString() + "temp";
                            if (sa.equals("int") || sa.equals("bool")) quad.x.name = "8";
                            else if (sa.equals("string"))
                            {
                                quad.x.name = "256";
                            }
                            else
                            {
                                quad.x.name = defclass.get(sa).size.toString();
                            }
                            chk.code.push(quad);
                        }
                        quad = new quard();
                        quad.z.name = "malloc";
                        quad.op = "call";
                        varible k = new varible();
                        k.name = temp.toString() + "temp";
                        quad.y.add(k);
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        quad.y.name = temp.toString() + "temp";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        k = new varible();
                        k.name = "0";
                        quad.z.add(k);
                        tmp = temp;
                        ++temp;
                        quad.op = "=";
                        quad.y = new varible(ck.code.last.z);
                        if (temp > maxtemp) maxtemp = temp;
                        chk.code.push(quad);
                    }
                    else
                    {
                        Integer itemp = new Integer(temp);
                        Integer arrtemp = new Integer(0);
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        quard quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        quad.op = "=";
                        quad.y.name = tmp.toString() + "temp";
                        arrtemp = temp;
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = itemp.toString() + "temp";
                        quad.op = "=";
                        quad.y.name = "0";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.op = "label!!!!!!!!!";
                        quad.z.name = "_" + b_arr.toString() + "arr";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = itemp.toString() + "temp";
                        quad.op = "+";
                        quad.y.name = itemp.toString() + "temp";
                        quad.x.name = "1";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = tmp.toString() + "temp";
                        quad.op = "+";
                        quad.y.name = tmp.toString() + "temp";
                        quad.x.name = "8";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        quad.op = "+";
                        quad.y = new varible(ck.code.last.z);
                        varible kk = new varible(quad.y);
                        quad.x.name = "1";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        quad.op = "*";
                        quad.y.name = temp.toString() + "temp";
                        if (sa.equals("int") || sa.equals("bool")) quad.x.name = "8";
                        else if (sa.equals("string"))
                        {
                            quad.x.name = "256";
                        }
                        else
                        {
                            quad.x.name = defclass.get(sa).size.toString();
                        }
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = "malloc";
                        quad.op = "call";
                        varible k = new varible();
                        k.name = temp.toString() + "temp";
                        quad.y.add(k);
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        quad.y.name = temp.toString() + "temp";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = temp.toString() + "temp";
                        k = new varible();
                        k.name = "0";
                        quad.z.add(k);

                        quad.op = "=";
                        quad.y = new varible(ck.code.last.z);
                        chk.code.push(quad);
                        quad = new quard();
                        quad.y.name = temp.toString() + "temp";
                        quad.op = "=";
                        quad.z.name = tmp.toString() + "temp";
                        varible kar = new varible();
                        kar.name = "0";
                        quad.z.add(kar);
                        chk.code.push(quad);
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                        quad = new quard();
                        quad.op = "<";
                        quad.z.name = temp.toString() + "temp";
                        quad.y.name = itemp.toString() + "temp";
                        quad.x.name = arrsize;
                        chk.code.push(quad);
                        quad = new quard();
                        quad.op = "j";
                        quad.z.name = "_" + b_arr.toString() + "arr";
                        ++b_arr;
                        quad.y.name = temp.toString() + "temp";
                        chk.code.push(quad);
                        quad = new quard();
                        quad.z.name = arrtemp.toString() + "temp";
                        chk.code.push(quad);
                        ++temp;
                        if (temp > maxtemp) maxtemp = temp;
                    }
            }
        return chk;
    }
}

public class Main
{
    static check chk = new check();

    public static void run(InputStream input) throws Exception
    {

        ANTLRInputStream in = new ANTLRInputStream(input);
        MxLexer lexer = new MxLexer(in);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        MxParser parser = new MxParser(tokens);
        ParseTree tree = parser.allin();
        MyVisitor bill = new MyVisitor();
        chk = bill.visit(tree);

    }

    public static check main() throws Exception
    {
      //  File f = new File("E:/test.txt");
         File f = new File("program.txt");

        InputStream input = null;
        input = new FileInputStream(f);
        run(input);
        //System.err.println("Hello world!");
        return chk;
    }
}