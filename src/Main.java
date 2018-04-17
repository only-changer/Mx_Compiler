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

class check
{
    check()
    {
    }

    Map<String, String> defvars = new HashMap();
    Vector<Vector> vars = new Vector<>();
    Vector<String> var = new Vector();

}

class all
{
    Map<String, Vector<String>> defuns = new HashMap<>();
    Map<String, String> defvars = new HashMap<>();
    Map<String, Integer> defcom = new HashMap<>();

    all()
    {
        defvars.put("this", "this");
    }
}

class MyVisitor extends MxBaseVisitor<check>
{
    Map<String, Vector<String>> defuns = new HashMap<>();
    String defun = new String();
    Map<String, String> defvars = new HashMap<>();
    Map<String, Integer> defcom = new HashMap<>();
    Map<String, all> defclass = new HashMap<>();
    boolean isfor = false;
    boolean getin = false;
    String classname = new String();
    String cla = new String();
    boolean classfun = false;

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

        defvars.put("this", "000");
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
        defvars.put("this", "000");
        getin = true;
        for (int k = 0; k < ctx.defs().size(); ++k)
            if (ctx.defs(k).defclass() == null)
            {
                check ck = visit(ctx.defs(k));
                chk.defvars.putAll(ck.defvars);
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
                // System.out.println(defvars);
            }
        // System.out.println(defuns);
        if (!(defuns.containsKey("main")))
        {
            System.out.println("FBI WARNING! NO MAIN FUNCTION!");
            System.exit(-1);
        }
        return nullcheck;
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
        check chk = new check();
        chk.defvars.put(ctx.varname().getText(), ctx.type().getText());
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
        if (ctx.expr() != null) chk.var = visit(ctx.expr()).var;
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
            System.out.println(defclass);
            System.out.println("FBI WARNING! Variables wrong!");
            System.exit(-1);
        }
        chk.vars.add(chk.var);
        if (classfun) defclass.get(classname).defvars.put(ctx.varname().getText(), ctx.type().getText());
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
        getin = true;
        Map<String, String> origin = new HashMap<>(defvars);
        check chk = new check();
        String s = ctx.classname().getText();
        classname = s;

        Vector vec = new Vector();
        if (defclass.containsKey(s))
        {
            System.out.println("class redefined!");
            System.exit(-1);
        }
        all al = new all();
        defclass.put(s, al);
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
        classfun = false;
        defvars = origin;
        chk.defvars.clear();
        classname = "";
        getin = false;
        return chk;
    }

    public check visitFunname(MxParser.FunnameContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitDefun(MxParser.DefunContext ctx)
    {
        Map<String, String> local = new HashMap<>();
        check chk = new check();
        Map<String, String> origin = new HashMap<>(defvars);
        defun = ctx.type().getText();
        check c = visit(ctx.params());
        Map<String, String> map = (c.defvars);
        Vector<String> pvec = c.var;
        local.putAll(map);
        defvars.putAll(map);
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
            System.out.println(map);
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

        check ck = visit(ctx.block());
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
        chk.defvars.put(ctx.defvars().varname().getText(), ctx.defvars().type().getText());
        String ss = new String();
        for (int i = 0; i < ctx.defvars().type().getText().length(); ++i)
        {
            if (ctx.defvars().type().getText().charAt(i) == '[') break;
            ss += ctx.defvars().type().getText().charAt(i);
        }
        if (!(ss.equals("int") || ss.equals("bool") || ss.equals("string") || defclass.containsKey(ss)))
        {
            System.out.println(ctx.getText());
           // System.out.println(defclass);
            System.out.println("FBI WARNING! Variables wrong!");
            System.exit(-1);
        }
        chk.var.add(ctx.defvars().type().getText());
        visit(ctx.defvars());
        return chk;
    }

    public check visitBlock(MxParser.BlockContext ctx)
    {
        Map<String, String> origin = new HashMap<>(defvars);
        check chk = new check();
        for (int k = 0; k < ctx.stmt().size(); ++k)
        {
            check ck = visit(ctx.stmt(k));
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
                            {
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
                        else
                        {
                            System.out.println(ctx.stmt(k).getText());
                            System.out.println(v);
                            System.out.println("FBI WARNING! Variables wrong!");
                            System.exit(-1);
                        }
                    }
                    if (defvars.containsKey(v.get(j)))
                    {
                        if (defvars.get(v.get(j)).equals("000")) continue;
                        if (flag == -2 || sflag.equals(defvars.get(v.get(j))) || shadow.equals(defvars.get(v.get(j))))
                        {
                            sflag = defvars.get(v.get(j));
                            if (sflag.equals("int")) shadow = "bool";
                            if (sflag.equals("bool")) shadow = "int";
                            flag = 2;
                            continue;
                        }
                        else
                        {
                            System.out.println(ctx.getText());
                            System.out.println(v);
                            System.out.println(ck.vars);
                            System.out.println("FBI WARNING! Variables wrong!");
                            System.exit(-1);
                        }
                        continue;
                    }
                    if (defclass.containsKey(v.get(j)))
                    {

                    }
                    else
                    {
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
                    if (!(sflag.equals("int") || sflag.equals("string") || sflag.equals("bool") || sflag.equals("")))
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
        Map<String, String> origin = new HashMap<>(defvars);
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
        }
        for (int i = 0; i < ctx.stmt().size(); ++i)
        {
            check ck = visit(ctx.stmt(i));
            chk.defvars.putAll(ck.defvars);
            chk.vars.addAll(ck.vars);
        }
        if ((ctx.getText().contains("if") || ctx.getText().contains("while") || ctx.getText().contains("for")) && ctx.block() == null)
        {
            chk.defvars.clear();
        }
        if (ctx.defvars() != null)
        {
            check ck = visit(ctx.defvars());
            chk.defvars.putAll(ck.defvars);
            chk.vars.add(ck.var);
        }
        Vector v = new Vector();

        for (int i = 0; i < ctx.expr().size(); ++i)
        {
            check ck = visit(ctx.expr(i));
            v.addAll(ck.var);
            if (ctx.op != null)
                    if (ctx.expr(0).getText().equals("1"))
                        System.exit(-1);
            if (ctx.getText().contains("for(") || ctx.getText().contains("while(")) v.add("bool");
            chk.vars.addAll(ck.vars);
        }
       // System.out.println("!!!");
       // System.out.println(v);
        if (ctx.getText().contains("if") && ctx.expr() != null)
        {
            System.out.println(v);
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
            System.out.println(ctx.getText());
            System.out.println(v);
            System.out.println(defuns);
        }
        chk.vars.add(v);
        defvars = origin;
        if (change == true) isfor = false;
        cla = "";
        System.out.println(chk.vars);
        System.out.println(ctx.getText());
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
                        if (!(ctx.expr(0).getText().contains(".") || ctx.expr(0).varname() != null || ctx.expr(0).opcom != null))
                        {
                            System.out.println(ctx.getText());
                            System.out.println("FBI WARNING! = left wrong!");
                            System.exit(-1);
                        }
                }
                if (dd >= 2)
                {
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
            if (!classname.equals(""))
            {
                defun = new HashMap<>(defuns);
                defun.putAll(defclass.get("001").defuns);
                defun.putAll(defclass.get("002").defuns);
                defun.putAll(defclass.get(classname).defuns);
                System.out.println(classname);
            }
            else if (!cla.equals(""))
            {
                defun = defclass.get(cla).defuns;
                System.out.println(cla);
                cla = "";
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
                System.out.println(cla);
                System.out.println("FBI WARNING! function \"" + s + "\" undefined!");
                System.exit(-1);
            }
            System.out.println(chk.var);

            return chk;
        }
        if (ctx.opcom != null)
        {
            String s = new String();
            s = visit(ctx.expr(0)).var.get(0);
           // System.out.println("LLLLL"+s);
            if (!classname.equals(""))
            {
                if (defclass.get(classname).defvars.containsKey(s))
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
                    }
                    for (int i = 0; i < defclass.get(classname).defvars.get(s).length(); ++i)
                    {
                        if (defclass.get(classname).defvars.get(s).charAt(i) == '[') break;
                        ss += defclass.get(classname).defvars.get(s).charAt(i);
                    }
                    n -= 1;
                    //System.out.println(s);
                    //System.out.println(defclass.get(classname).defcom);
                    for (int i = 0; i < defclass.get(classname).defcom.get(s) - n; ++i) ss += "[]";
                    chk.var.add(ss);
                 System.out.println(ctx.getText());
               //     System.out.println(chk.var);
                }
                else
                {
                    System.out.println(ctx.getText());
                    System.out.println("FBI WARNING!numcom \'" + s + "\" undefined!");
                    System.exit(-1);
                }
            } else
            if (!cla.equals(""))
            {
                if (defclass.get(cla).defvars.containsKey(s))
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
                    }
                    for (int i = 0; i < defclass.get(cla).defvars.get(s).length(); ++i)
                    {
                        if (defclass.get(cla).defvars.get(s).charAt(i) == '[') break;
                        ss += defclass.get(cla).defvars.get(s).charAt(i);
                    }
                    //System.out.println(s);
                   // System.out.println(defclass.get(cla).defcom);
                    n -= 1;
                    for (int i = 0; i < defclass.get(cla).defcom.get(s) - n; ++i) ss += "[]";
                    chk.var.add(ss);
                    System.out.println(ctx.getText());
                   // System.out.println(chk.var);
                }
                else
                {
                    System.out.println(ctx.getText());
                    System.out.println("FBI WARNING!numcom \'" + s + "\" undefined!");
                    System.exit(-1);
                }
                cla = "";
            }
            else if (defvars.containsKey(s))
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
                    System.out.println("SSS");
                    System.out.println(vec);
                }
                for (int i = 0; i < defvars.get(s).length(); ++i)
                {
                    if (defvars.get(s).charAt(i) == '[') break;
                    ss += defvars.get(s).charAt(i);
                }
                n -= 1;
                //System.out.println(s);
               // System.out.println(defcom);
                for (int i = 0; i < defcom.get(s) - n; ++i) ss += "[]";
                chk.var.add(ss);
                System.out.println(n);
                System.out.println(chk.var);
                System.out.println(chk.vars);
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
                System.out.println("!!!");
                chk.var.add("001");
            }
        Vector<String> vec = new Vector();
        if (ctx.varname() != null)
        {
           // System.out.println("<<<>>>");
          //  System.out.println(ctx.varname().getText() + classname);
            if (!classname.equals(""))
            {
                if (defclass.get(classname).defvars.containsKey(ctx.varname().getText()))
                {
                    System.out.println(defclass.get(classname).defvars);
                    System.out.println(">><<<<<");
                    if (defclass.get(classname).defcom.containsKey(ctx.varname().getText()))chk.var.add(ctx.varname().getText());
                     else   chk.var.add(defclass.get(classname).defvars.get(ctx.varname().getText()));

                }
                else
                {
                    System.out.println(ctx.varname().getText());
                    System.out.println(defclass.get(classname).defvars);
                    System.out.println("class v wrong!");
                    System.exit(-1);
                }
            }
            else if (!cla.equals(""))
            {
                if (defclass.get(cla).defvars.containsKey(ctx.varname().getText()))
                {
                    chk.var.add(defclass.get(cla).defvars.get(ctx.varname().getText()));
                    if (defclass.get(cla).defcom.containsKey(ctx.varname().getText()))chk.var.add(ctx.varname().getText());
                    else
                    {
                        chk.var.add(defclass.get(cla).defvars.get(ctx.varname().getText()));
                        cla = "";
                    }
                }
                else
                {
                    System.out.println(ctx.varname().getText());
                    System.out.println(ctx.getText());
                    System.out.println("class v wrong!");
                    System.exit(-1);
                }
            }
            else
            {
                chk.var.add(ctx.varname().getText());
            }
        }
        if (ctx.NUM() != null) chk.var.add("int");
        if (ctx.STR() != null) chk.var.add("string");
        if (ctx.getText().contains("null")) chk.var.add("002");
        if (ctx.op != null) if (ctx.op.getText().equals("++"))
        {
            System.out.println(ctx.op.getText());
            chk.var.add("int");
            vec.add("int");
            System.out.println("LLLL");
        }
        if (ctx.op != null) if (ctx.op.getText().equals("&&") || ctx.op.getText().equals("||"))
        {
            vec.add("bool");
        }
        if (ctx.op != null)
            if (ctx.op.getText().equals("."))
            {
                System.out.println("???????");

                String s = ctx.expr(0).getText();

                check ckk = visit(ctx.expr(0));
                String sa = ckk.var.get(0);
                s = sa;
                System.out.println(s);
                System.out.println(defclass);
                String ty = new String();
                ty = sa;
                if (defvars.containsKey(sa))
                {
                    ty = defvars.get(sa);
                    System.out.println(ty);
                }
                if (ty.equals("000"))
                {
                    cla = classname;
                    ty = "this";
                    check ck = visit(ctx.expr(1));
                    System.out.println("???");
                    chk.var.addAll(ck.var);
                    chk.vars.addAll(ck.vars);
                }
                else if (ty.contains("[]"))
                {
                    cla = "001";
                    check ck = visit(ctx.expr(1));
                    System.out.println("???");
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
                    System.out.println("???");
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
        for (int i = 0; i < ctx.expr().size(); ++i)

        {
            check ck = new check();
            ck = visit(ctx.expr(i));
            vec.addAll(ck.var);
            chk.vars.addAll(ck.vars);
            if (ctx.op1 != null)
            {
                chk.var.add("bool");
            }
            else
                chk.var.addAll(ck.var);

        }
        chk.vars.add(vec);
        return chk;
    }
// public check visitNews(MxParser.NewsContext ctx){}
}

public class Main
{

    public static void run(InputStream input) throws Exception
    {
        ANTLRInputStream in = new ANTLRInputStream(input);
        MxLexer lexer = new MxLexer(in);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        MxParser parser = new MxParser(tokens);
        ParseTree tree = parser.allin();
        MyVisitor bill = new MyVisitor();
        bill.visit(tree);
    }

    public static void main(String[] args) throws Exception
    {
       // File f = new File("E:/test.txt");
        File f = new File("program.txt");
        InputStream input = null;
        input = new FileInputStream(f);
        run(input);
        System.err.println("Hello world!");
        System.exit(0);
    }
}