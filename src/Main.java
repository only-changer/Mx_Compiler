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
    int com;
    boolean isconst;
    Integer addr;

    varible()
    {
        name = new String();
        addr = new Integer(-1);
    }
}

class quard
{
    String op;
    varible x;
    varible y;
    quard prev;
    quard next;

    quard()
    {
        op = new String();
        x = new varible();
        y = new varible();
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
                System.err.println(quad.y.name + ' ' + quad.y.addr + ' ' + quad.op + ' ' + quad.x.name + ' ' + quad.x.addr);
                if (quad.next == null) break;
                quad = quad.next;
            }
        }
    }
}

class check
{

    public ir code;
    Map<String, vartype> defvars = new HashMap();
    Vector<Vector> vars = new Vector<>();
    Vector<String> var = new Vector();

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

    all()
    {
        vartype v = new vartype();
        v.type = "this";
        defvars.put("this", v);
    }
}

class MyVisitor extends MxBaseVisitor<check>
{
    Integer templist[] = new Integer[30];
    Integer addr = 0;
    Map<String, Vector<String>> defuns = new HashMap<>();
    String defun = new String();
    Map<String, vartype> defvars = new HashMap<>();
    Map<String, Integer> defcom = new HashMap<>();
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
                    System.out.println(ctx.defs(k).getText());
                    //System.out.println(key);
                    System.out.println(ctx.defs(k).getText());
                    System.out.println("Variables redefined!");
                    System.exit(-1);
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
        return chk;
    }

    public check visitDefs(MxParser.DefsContext ctx)
    {
        check nonecheck = new check();
        if (ctx.defclass() != null) return visit(ctx.defclass());
        if (ctx.defun() != null)
        {
            return visit(ctx.defun());
        }
        if (ctx.defvars() != null) return visit(ctx.defvars());
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
                addr += 4;
            }
        }
        chk.defvars.put(ctx.varname().getText(), v);
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

            if (!classname.equals("")) defclass.get(classname).defcom.put(ctx.varname().getText(), num);
            else defcom.put(ctx.varname().getText(), num);
        }
        if (ctx.expr() != null && getin)
        {
            check ck = visit(ctx.expr());
            chk.var = ck.var;
            if (ctx.expr().opcom != null)
                if (ctx.expr().expr(0).getText().contains("[]") && !ctx.expr().getText().contains("("))
                {
                    System.exit(-1);
                }
            chk.code.add(ck.code);
            if (!ctx.getText().contains("[") && !ctx.getText().contains(".") && !ctx.getText().contains("string") && !ctx.getText().contains("bool") && ctx.expr().funname() == null)
                if ((ctx.getText().contains("int") || ctx.getText().contains("bool")))
                {
                    quard quad = new quard();
                    quad.op = chk.var.get(0);
                    Integer c = -1;
                    String s = new String();
                    s = temp.toString() + "temp";
                    ++temp;
                    quad.x.name = ctx.varname().getText();
                    // System.out.println(ctx.varname().getText());
                    quad.x.addr = chk.defvars.get(ctx.varname().getText()).addr;
                    quad.y.name = s;
                    quad.y.addr = quad.x.addr;
                    chk.code.push(quad);
                    if (ck.code != null)
                        if (ck.code.last != null)
                        {
                            chk.code.add(ck.code);
                            quard q = new quard();
                            q.y.name = ctx.varname().getText();
                            q.y.addr = chk.defvars.get(ctx.varname().getText()).addr;
                            q.op = "=";
                            q.x.name = ck.code.last.y.name;
                            q.x.addr = ck.code.last.y.addr;
                            chk.code.push(q);
                        }
                }
            // chk.code.print();
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
        for (int i = 0; i < ctx.defvars().size(); ++i)
        {
            check ck = visit(ctx.defvars(i));
            chk.defvars.putAll(ck.defvars);
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
        classfun = true;
        for (int i = 0; i < ctx.defun().size(); ++i)
        {
            check ck = visit(ctx.defun(i));
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
        quad.y.name = ctx.funname().getText();
        if (quad.y.name.equals("main"))
        {
            quad.y.name = "main";
        }
        quad.op = "label!!!!!!!!!";
        chk.code.push(quad);
        check ck = visit(ctx.block());
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
        return chk;
    }

    public check visitParams(MxParser.ParamsContext ctx)
    {
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
        for (int k = 0; k < ctx.stmt().size(); ++k)
        {
            Integer origins = temp;
            check ck = visit(ctx.stmt(k));
            temp = origins;
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
            check ck = visit(ctx.block());
            chk.defvars.putAll(ck.defvars);
            chk.vars.addAll(ck.vars);
            chk.code.add(ck.code);
        }
        ir irr = new ir();
        for (int i = 0; i < ctx.stmt().size(); ++i)
        {
            check ck = visit(ctx.stmt(i));
            chk.defvars.putAll(ck.defvars);
            chk.vars.addAll(ck.vars);
            if (ctx.opf != null)
            {
                irr.add(ck.code);
            }
            if (ctx.op != null)
                if (ctx.op.getText().equals("if"))
                    if (i == 0)
                    {
                        quard quad = new quard();
                        quad.y.name = "_" + b_i.toString() + "if";
                        quad.op = "label!!!!!!!!!";
                        irr.push(quad);
                        irr.add(ck.code);
                        quad = new quard();
                        quad.op = "goto";
                        quad.y.name = b_i.toString() + "ifback";
                        quad.x.name = "";
                        irr.push(quad);
                        quad = new quard();
                        quad.y.name = "_" + b_i.toString() + "else";
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
                quad.y.name = "_" + b_i.toString() + "ifback";
                ++b_i;
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
        Vector v = new Vector();
        for (int i = 0; i < ctx.expr().size(); ++i)
        {
            check ck = visit(ctx.expr(i));
            v.addAll(ck.var);
            if (ctx.op != null)
                if (ctx.expr(0).getText().equals("1"))
                    System.exit(-1);
            if (ctx.opr != null && ck.code.last != null)
            {
                quard quad = new quard();
                quad.x.name = ck.code.last.y.name;
                quad.x.addr = ck.code.last.y.addr;
                quad.op = "return";
                chk.code.add(ck.code);
                chk.code.push(quad);
                continue;
            }
            if (ctx.op != null && ck.code.last != null)
                if (ctx.op.getText().equals("if"))
                {
                    quard quad = new quard();
                    quad.x.name = b_i - 1 + "else";
                    quad.y.name = ck.code.last.y.name;
                    quad.op = "if";
                    chk.code.add(ck.code);
                    chk.code.push(quad);
                    chk.code.add(irr);
                    continue;
                }
            if (ctx.opf != null && ctx.expr().size() == 3)
            {
                if (i == 0)
                {
                    quard quads = new quard();
                    quads.y.name = "_" + b_f.toString() + "for";
                    quads.op = "label!!!!!!!!!";
                    chk.code.push(quads);
                    chk.code.add(ck.code);
                }
                if (i == 1)
                {
                    irr.add(ck.code);
                    quard quad = new quard();
                    quad.op = "for";
                    quad.y.name =  "_" + b_f.toString() + "for";
                    if (ck.code.last != null && ck.code.last.prev != null && ck.code.last.prev.y.name != null)
                    {
                        quad.x.name = ck.code.last.prev.y.name;
                        quad.x.addr = ck.code.last.prev.y.addr;
                        irr.push(quad);
                    }
                    quad = new quard();
                    quad.y.name = "_" + b_f.toString() + "forback";
                    ++b_f;
                    quad.op = "label!!!!!!!!!";
                    irr.push(quad);
                }
                if (i == 2)
                {
                    chk.code.add(ck.code);
                    chk.code.add(irr);
                }
                continue;
            }
            chk.code.add(ck.code);
            if (ctx.opf != null || ctx.getText().contains("while(")) v.add("bool");
            if (ctx.getText().contains(";i;")) v.add("string");
            chk.vars.addAll(ck.vars);
        }
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
            chk.vars.add(visit(ctx.expr(i)).var);
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
            if (ctx.exprs() != null)
            {
                v.addAll(visit(ctx.exprs()).vars);
                // System.out.println(v);
            }
            cla = ss;
            String s = ctx.funname().getText();
            if (s.equals("main") && (v.size() > 0))
            {
                System.out.println("FBI WARNING! main wrong!");
                System.exit(-1);
            }
            Map<String, Vector<String>> defun = new HashMap();
            //System.out.println(cla);
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
                    for (int i = 0; i < v.size(); ++i)
                    {
                        Vector vec = new Vector();
                        vec.addAll(v.get(i));
                        vec.add(defun.get(s).get(i + 1));
                        //  System.out.println(vec);
                        //  System.out.println(defuns.get(s));
                        chk.vars.add(vec);
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
            s = visit(ctx.expr(0)).var.get(0);
            // System.out.println("LLLLL"+s);
            if (s.contains("[]"))
            {
                int n = ctx.expr().size();
                String ss = new String();
                for (int i = 1; i < n; ++i)
                {
                    check ck = visit(ctx.expr(i));
                    Vector<String> vec = new Vector();
                    vec.addAll(ck.var);
                    vec.add("int");
                    chk.vars.add(vec);
                    //  System.out.println("SSS");
                    //  System.out.println(vec);
                }
                for (int i = 0; i < s.length(); ++i)
                {
                    if (s.charAt(i) == '[') break;
                    ss += s.charAt(i);
                }
                int l = (s.length() - ss.length()) / 2;
                n -= 1;
                //System.out.println(s);
                // System.out.println(defcom);
                for (int i = 0; i < l - n; ++i) ss += "[]";
                chk.var.add(ss);
                //System.out.println(n);
                // System.out.println(chk.var);
                // System.out.println(chk.vars);
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
            // System.out.println("<<<>>>");
            //  System.out.println(ctx.varname().getText() + classname);
            if (!cla.equals(""))
            {
                if (defclass.get(cla).defvars.containsKey(ctx.varname().getText()))
                {
                    chk.var.add(defclass.get(cla).defvars.get(ctx.varname().getText()).type);
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

                }
                else if (defvars.containsKey(ctx.varname().getText()))
                {
                    chk.var.add(defvars.get(ctx.varname().getText()).type);
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
                Integer c = -1;
                String s = new String();
                s = temp.toString() + "temp";
                ++temp;
                quad.x.name = ctx.varname().getText();
                // System.out.println(ctx.varname().getText());
                quad.x.addr = defvars.get(ctx.varname().getText()).addr;
                quad.y.name = s;
                quad.y.addr = quad.x.addr;
                chk.code.push(quad);
            }

        }
        if (ctx.NUM() != null)
        {
            chk.var.add("int");
            quard quad = new quard();
            quad.y.name = ctx.NUM().getText();
            quad.op = "imm";
            chk.code.push(quad);
        }
        if (ctx.STR() != null) chk.var.add("string");
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

                check ckk = visit(ctx.expr(0));
                String sa = ckk.var.get(0);
                if (sa.equals("001") && ckk.var.size() > 1)
                    if (ckk.var.get(1).equals("string"))
                        sa = "string";
                s = sa;
                //  System.out.println(s);
                //System.out.println(ckk.var);
                String ty = new String();
                ty = sa;
                if (defvars.containsKey(sa))
                {
                    ty = defvars.get(sa).type;
                    System.out.println(ty);
                }
                if (ty.equals("000"))
                {
                    cla = classname;
                    ty = "this";
                    check ck = visit(ctx.expr(1));
                    //System.out.println("???");
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
                }
                else if (ty.contains("[]"))
                {
                    cla = "001";
                    check ck = visit(ctx.expr(1));
                    //  System.out.println("???");
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
                }
                else if (ty.equals("string"))
                {
                    cla = "002";
                    check ck = visit(ctx.expr(1));
                    System.out.println("???");
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
                }
                else if (defclass.containsKey(ty))
                {
                    cla = ty;
                    check ck = visit(ctx.expr(1));
                    //  System.out.println("???");
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
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
        for (int i = 0; i < ctx.expr().size(); ++i)
        {
            check ck = new check();
            ck = visit(ctx.expr(i));
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
                    quard quad = new quard();
                    quad.y.name = ir1.last.y.name;
                    quad.y.addr = ir1.last.y.addr;
                    quad.x.name = "1";
                    quad.x.addr = -1;
                    quad.op = "+";
                    chk.code.add(ir1);
                    chk.code.push(quad);
                    quad = new quard();
                    quad.op = "=";
                    quad.y.addr = ir1.last.y.addr;
                    quad.x.name = ir1.last.y.name;
                    chk.code.push(quad);
                }
            }
        if (ctx.opc != null)
        {
            chk.code = ir1;
        }
        if (ctx.opf != null && ir1.last != null)
        {
            quard quad = new quard();
            quad.x.name = ir1.last.y.name;
            String s = temp.toString() + "temp";
            ++temp;
            quad.y.name = s;
            quad.op = ctx.opf.getText();
            chk.code.add(ir1);
            chk.code.push(quad);
        }
        if (ctx.op != null)
            if (!ctx.op.getText().equals("."))
                if (!ctx.op.getText().equals("=") && ir1.last != null && ir2.last != null)
                {
                    quard quad = new quard();
                    quad.y.name = ir1.last.y.name;
                    //  System.out.println(ctx.getText());
                    quad.x.name = ir2.last.y.name;
                    quad.op = ctx.op.getText();
                    chk.code.add(ir1);
                    chk.code.add(ir2);
                    chk.code.push(quad);
                }
        if (ctx.op1 != null && ir1.last != null && ir2.last != null)
        {
            quard quad = new quard();
            quad.y.name = ir1.last.y.name;
            //  System.out.println(ctx.getText());
            quad.x.name = ir2.last.y.name;
            quad.y.addr = -1;
            Integer ii = quad.y.name.charAt(0) - '0';
            quad.op = ctx.op1.getText();
            chk.code.add(ir1);
            chk.code.add(ir2);
            chk.code.push(quad);
            if (ctx.op1.getText().equals("<="))
            {
                quad = new quard();
                quad.op = "label!!!!!!!!!";
                quad.y.name = '_' + b.toString() + "cmp";
                chk.code.push(quad);
                quad = new quard();
                quad.op = "=";
                quad.y.name = ir1.last.y.name;
                quad.y.addr = -1;
                quad.x.name = "1";
                chk.code.push(quad);
                quad = new quard();
                quad.op = "label!!!!!!!!!";
                quad.y.name = '_' + b.toString() + "cmpback";
                ++b;
                chk.code.push(quad);
            }
        }
        if (ctx.opd != null && ir1.last != null && ir2.last != null)
        {
            quard quad = new quard();
            quad.y.name = ir1.last.y.name;
            quad.y.addr = ir1.last.y.addr;
            quad.x.name = ir2.last.y.name;
            quad.op = ctx.opd.getText();
            chk.code.add(ir1);
            chk.code.add(ir2);
            chk.code.push(quad);
        }
        chk.vars.add(vec);
        if (ctx.news() != null)
        {
            chk.var.addAll(visit(ctx.news()).var);
        }
        return chk;
    }

    public check visitNews(MxParser.NewsContext ctx)
    {
        //System.out.println("????");
        check chk = new check();
        String s = new String();
        if (ctx.name != null) s = ctx.name.getText();
        else
        {
            s = ctx.classname().getText();
            if (defclass.containsKey(s))
            {

            }
            else
            {
                System.out.println(s);
                System.out.println("FBI WARNING! NEWS WRONG!");
                System.exit(-1);
            }
        }
        int num = 0;
        String sa = new String();
        // System.out.println("::::::");
        // System.out.println(ctx.getText());
        for (int i = 0; i < ctx.getText().length(); ++i)
        {
            sa += ctx.getText().charAt(i);
            if (ctx.getText().charAt(i) == '[')
            {
                ++num;
                s += "[]";
            }
        }
        chk.var.add(s);
        // System.out.println(s);
        //  System.out.println(ctx.getText());
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
       //File f = new File("E:/test.txt");
        File f = new File("program.txt");
        InputStream input = null;
        input = new FileInputStream(f);
        run(input);
        //System.err.println("Hello world!");
        return chk;
    }
}