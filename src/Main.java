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
        defuns.put("print",v4);
    }

    public check visitAllin(MxParser.AllinContext ctx)
    {
        check chk = new check();
        check nullcheck = new check();
        for (int k = 0; k < ctx.defs().size(); ++k)
        {
            check ck = visit(ctx.defs(k));
            chk.defvars.putAll(ck.defvars);
            defvars.putAll(ck.defvars);
        }
        return nullcheck;
    }

    public check visitDefs(MxParser.DefsContext ctx)
    {
        check nonecheck = new check();
        if (ctx.defclass() != null) return visit(ctx.defvars());
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
        defvars.put(ctx.varname().getText(), ctx.type().getText());
        if (ctx.type().getText().contains("[]"))
        {
            int num = 0;
            String s = new String();
            for (int i = 0;i < ctx.type().getText().length();++i)
            {
                if (ctx.type().getText().charAt(i) == '[') ++num;
            }
            defcom.put(ctx.varname().getText(),num);
        }
        if (ctx.expr() != null) chk.var = visit(ctx.expr()).var;
        chk.var.add(ctx.type().getText());
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

    //public check visitDefclass(MxParser.DefclassContext ctx){}
    public check visitFunname(MxParser.FunnameContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitDefun(MxParser.DefunContext ctx)
    {
        check chk = new check();
        Map<String, String> origin = new HashMap<>(defvars);
        defun = ctx.type().getText();
        Map<String, String> map = (visit(ctx.params()).defvars);
        defvars.putAll(map);
        check ck = visit(ctx.block());
        chk.defvars = ck.defvars;
        Vector<Vector> vv = ck.vars;
        chk.defvars.putAll(map);
        Vector fun = new Vector();
        fun.add(ctx.type().getText());
        for (String value : map.values())
        {
            fun.add(value);
        }
        defuns.put(ctx.funname().getText(), fun);
        defvars.putAll(chk.defvars);
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
                for (int j = 0; j < v.size(); ++j)
                {
                    if (v.get(j).equals("int") || v.get(j).equals("bool") || v.get(j).equals("string") || v.get(j).contains("[]"))
                    {
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
                            System.out.println(ctx.getText());
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
                    System.out.println(defvars);
                    System.out.println("FBI WARNING! Variable \"" + v.get(j) + "\"  undefined!");
                    System.exit(-1);
                }
                if (uflag == -1)
                {
                    if (flag == 0) u.add("int");
                    else if (flag == 1) u.add("string");
                    chk.vars.add(u);
                }
            }
        }
        chk.defvars.clear();
        defvars = origin;
        return chk;
    }

    public check visitStmt(MxParser.StmtContext ctx)
    {
        boolean isreturn = false;
        check chk = new check();
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
            chk.vars.addAll(ck.vars);
        }
        if (isreturn)
        {
            v.add(defun);
        }
        chk.vars.add(v);
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
        check chk = new check();
        if (ctx.funname() != null)
        {
            Vector<Vector> v = new Vector<>();
            if (ctx.exprs() != null)
            {
                v.addAll(visit(ctx.exprs()).vars);
            }
            String s = ctx.funname().getText();
            if (defuns.containsKey(s))
            {
                if (!defuns.get(s).get(0).equals("void")) chk.var.add(defuns.get(s).get(0));
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
                for (int i = 0;i < n;++i)
                {
                    check ck = visit(ctx.combine().expr(i));
                    Vector<String> vec = new Vector();
                    vec.addAll(chk.var);
                    vec.add("int");
                    chk.vars.add(vec);
                }
                for (int i = 0;i < defvars.get(s).length();++i)
                {
                    if (defvars.get(s).charAt(i) == '[') break;
                    ss += defvars.get(s).charAt(i);
                }
                for (int i = 0;i < defcom.get(s) - n;++i) ss += "[]";
                chk.var.add(ss);
            }
            else
            {
                System.out.println("FBI WARNING!numcom \'" + s + "\" undefined!");
                System.exit(-1);
            }
        }
        if (ctx.varname() != null) chk.var.add(ctx.varname().getText());
        if (ctx.NUM() != null) chk.var.add("int");
        if (ctx.STR() != null) chk.var.add("string");
        for (int i = 0; i < ctx.expr().size(); ++i)
        {
            chk.var.addAll(visit(ctx.expr(i)).var);
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
        System.err.println("Hello world");
        System.exit(0);
    }
}