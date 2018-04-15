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
    Vector var = new Vector();

}

class MyVisitor extends MxBaseVisitor<check>
{
    Map<String, Vector> defuns = new HashMap<>();
    String defun = new String();
    Map<String, String> defvars = new HashMap<>();
    Map<String, Integer> defcom = new HashMap<>();
    Map<String, Vector> defclass = new HashMap<>();
    boolean isfor = false;

    MyVisitor()
    {
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
        Vector v5 = new Vector();
        v5.add("int");
        defuns.put("parseInt",v5);
        Vector v6 = new Vector();
        v6.add("int");
        defuns.put("size",v6);
        Vector v7 = new Vector();
        v7.add("int");
        defuns.put("length",v7);
        Vector v8 = new Vector();
        v8.add("string");
        v8.add("int");
        v8.add("int");
        defuns.put("substring",v8);
        Vector v9 = new Vector();
        v9.add("int");
        v9.add("int");
        defuns.put("ord",v9);
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
                    System.out.println(key);
                    System.out.println(ctx.defs(k).getText());
                    System.out.println("Variables redefined!");
                    System.exit(-1);
                }
            }
            defvars.putAll(ck.defvars);
            System.out.println(defvars);
        }
        System.out.println(defuns);
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
            defcom.put(ctx.varname().getText(), num);
        }
        if (ctx.expr() != null) chk.var = visit(ctx.expr()).var;
        chk.var.add(ctx.type().getText());
        String ss = new String();
        for (int i = 0;i < ctx.type().getText().length();++i)
        {
            if (ctx.type().getText().charAt(i) == '[') break;
            ss += ctx.type().getText().charAt(i);
        }
        if (!(ss.equals("int")  || ss.equals("bool")  || ss.equals("string") || defclass.containsKey(ss)))
        {
            System.out.println(ctx.getText());
            System.out.println(defclass);
            System.out.println("FBI WARNING! Variables wrong!");
            System.exit(-1);
        }
        chk.vars.add(chk.var);
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
        Map<String, String> origin = new HashMap<>(defvars);
        check chk = new check();
        String s = ctx.classname().getText();
        Vector vec = new Vector();
        if (defclass.containsKey(s))
        {
            System.out.println("class redefined!");
            System.exit(-1);
        }
        defclass.put(s, vec);
        for (int i = 0; i < ctx.defvars().size(); ++i)
        {
            check ck = visit(ctx.defvars(i));
            chk.defvars.putAll(ck.defvars);
            for (String key : ck.defvars.keySet())
            {
                if (defvars.containsKey(key))
                {
                    System.out.println("Variables redefined!");
                    System.exit(-1);
                }
            }
            defvars.putAll(ck.defvars);
        }
        for (int i = 0; i < ctx.defun().size(); ++i)
        {
            check ck = visit(ctx.defun(i));
        }
        defvars = origin;
        return chk;
    }

    public check visitFunname(MxParser.FunnameContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitDefun(MxParser.DefunContext ctx)
    {
        Map<String,String> local = new HashMap<>();
        check chk = new check();
        Map<String, String> origin = new HashMap<>(defvars);
        defun = ctx.type().getText();
        Map<String, String> map = (visit(ctx.params()).defvars);

        local.putAll(map);
        defvars.putAll(map);
        chk.defvars.putAll(map);
        Vector fun = new Vector();
        fun.add(ctx.type().getText());
        String ss = new String();
        for (int i = 0;i < ctx.type().getText().length();++i)
        {
            if (ctx.type().getText().charAt(i) == '[') break;
            ss += ctx.type().getText().charAt(i);
        }
        if (!(ss.equals("int")  || ss.equals("bool")  || ss.equals("string") || ss.equals("void") ||defclass.containsKey(ss)))
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
        for (String value : map.values())
        {
            fun.add(value);
        }
        defuns.put(ctx.funname().getText(), fun);

        defvars.putAll(chk.defvars);

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
            chk.defvars.putAll(visit(ctx.param(i)).defvars);
        }
        return chk;
    }

    public check visitParam(MxParser.ParamContext ctx)
    {
        check chk = new check();
        chk.defvars.put(ctx.ID().getText(), ctx.type().getText());
        String ss = new String();
        for (int i = 0;i < ctx.type().getText().length();++i)
        {
            if (ctx.type().getText().charAt(i) == '[') break;
            ss += ctx.type().getText().charAt(i);
        }
        if (!(ss.equals("int")  || ss.equals("bool")  || ss.equals("string") || defclass.containsKey(ss)))
        {
            System.out.println(ctx.getText());
            System.out.println(defclass);
            System.out.println("FBI WARNING! Variables wrong!");
            System.exit(-1);
        }
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
            if (ctx.getText().contains("for(") || ctx.getText().contains("while(")) v.add("bool");
            chk.vars.addAll(ck.vars);
        }

        if (ctx.getText().contains("if") && ctx.expr() != null)
            v.add("bool");
        if (!isfor && (ctx.getText().contains("break") || ctx.getText().contains("continue")))
        {
            System.out.println(ctx.getText());
            System.out.println("FBI WARNING! FOR DOWN!");
            System.exit(-1);
        }
        if (isreturn)
        {
            v.add(defun);
            System.out.println("???");
            System.out.println(v);
        }
        chk.vars.add(v);
        defvars = origin;
        if (change == true) isfor = false;
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
                    if (!(ctx.expr(0).getText().contains(".") || ctx.expr(0).varname() != null || ctx.expr(0).combine() != null))
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
            Vector<Vector> v = new Vector<>();
            if (ctx.exprs() != null)
            {
                v.addAll(visit(ctx.exprs()).vars);
            }
            String s = ctx.funname().getText();
            if (s.equals("main") && (v.size() > 0))
            {
                System.out.println("FBI WARNING! main wrong!");
                System.exit(-1);
            }
            if (defuns.containsKey(s))
            {
                //if (!defuns.get(s).get(0).equals("void"))
                    chk.var.add(defuns.get(s).get(0));
                if (v.size() != defuns.get(s).size() - 1)
                {
                    System.out.println(ctx.getText());
                    System.out.println(v);
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
                        vec.add(defuns.get(s).get(i + 1));
                        chk.vars.add(vec);
                    }
                }
            }
            else
            {
                System.out.println(ctx.getText());
                System.out.println(defuns);
                System.out.println("FBI WARNING! function \"" + s + "\" undefined!");
                System.exit(-1);
            }
        }
        if (ctx.combine() != null)
        {
            String s = ctx.combine().numname().getText();
            if (defvars.containsKey(s))
            {
                int n = ctx.combine().expr().size();
                String ss = new String();
                for (int i = 0; i < n; ++i)
                {
                    check ck = visit(ctx.combine().expr(i));
                    Vector<String> vec = new Vector();
                    vec.addAll(chk.var);
                    vec.add("int");
                    chk.vars.add(vec);
                }
                for (int i = 0; i < defvars.get(s).length(); ++i)
                {
                    if (defvars.get(s).charAt(i) == '[') break;
                    ss += defvars.get(s).charAt(i);
                }
                for (int i = 0; i < defcom.get(s) - n; ++i) ss += "[]";
                chk.var.add(ss);
                System.out.println(ctx.combine().getText());
                System.out.println(chk.var);
            }
            else
            {
                System.out.println("FBI WARNING!numcom \'" + s + "\" undefined!");
                System.exit(-1);
            }
        }
        int flag = 0;
        if (ctx.op != null)
        if (ctx.op.getText().equals("+"))
        {
            System.out.println("!!!");
            chk.var.add("001");
        }
        if (ctx.varname() != null) chk.var.add(ctx.varname().getText());
        if (ctx.NUM() != null) chk.var.add("int");
        if (ctx.STR() != null) chk.var.add("string");
        if (ctx.getText().contains("null")) chk.var.add("002");
        if (ctx.getText().contains("++")) chk.var.add("int");
        for (int i = 0; i < ctx.expr().size(); ++i)
        {
            if (ctx.getText().contains(".") && i == 0 && !ctx.expr(0).getText().contains("."))
            {

            }
            else
                chk.var.addAll(visit(ctx.expr(i)).var);
            System.out.println(ctx.expr(i).getText());
            System.out.println(i);
            System.out.println(chk.var);
        }
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
        //File f = new File("E:/test.txt");
         File f = new File("program.txt");
        InputStream input = null;
        input = new FileInputStream(f);
        run(input);
        System.err.println("Hello world!");
        System.exit(0);
    }
}