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
    check(){}
    Map<String, String> defvars = new HashMap();
    Vector<Vector> vars = new Vector<>();
    Vector var = new Vector();
	
}

class MyVisitor extends MxBaseVisitor<check>
{
    Map<String,Vector> defuns = new HashMap<>();
    String defun = new String();
    MyVisitor() { }
    public check visitAllin(MxParser.AllinContext ctx)
    {
        check chk = new check();
        check nullcheck = new check();
        for (int k = 0;k < ctx.defs().size();++k)
        {
            check ck = visit(ctx.defs(k));
            chk.defvars.putAll(ck.defvars);
            Vector<Vector> vv =ck.vars;
            for (int i = 0;i < vv.size();++i)
            {
                Vector v = vv.get(i);
                int flag = -2;//-1 : undefine ; 0 : pass int ; 1 : pass string; 2 : wrong;
                for (int j = 0; j < v.size(); ++j)
                {
                    if (v.get(j).equals("int"))
                    {
                        if (flag == -2) flag = 0;
                        if (flag == 1)
                        {
                            flag = 2;
                          //  System.out.println("FBI WARNING! Variables wrong!");
                            break;
                        }
                        continue;
                    }
                    if (v.get(j).equals("string"))
                    {
                        if (flag == -2) flag = 1;
                        if (flag == 0)
                        {
                            flag = 2;
                          //  System.out.println("FBI WARNING! Variables wrong!");
                            break;
                        }
                        continue;
                    }
                    if (chk.defvars.containsKey(v.get(j)))
                    {
                        String s = chk.defvars.get(v.get(j));
                        if (s.equals("int"))
                        {
                            if (flag == -2) flag = 0;
                            if (flag == 1)
                            {
                                flag = 2;
                             //   System.out.println("FBI WARNING! Variables wrong!");
                                break;
                            }
                        }
                        if (s.equals("string"))
                        {
                            if (flag == -2) flag = 1;
                            if (flag == 0)
                            {
                                flag = 2;
                             //   System.out.println("FBI WARNING! Variables wrong!");
                                break;
                            }
                        }
                        continue;
                    }
                    System.out.println("FBI WARNING! Variable \""+v.get(j)+"\" undefined!\n");
                    break;
                }
            }
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
        chk.defvars.put(ctx.varname().getText(),ctx.type().getText());
        if (ctx.expr() != null)chk.var = visit(ctx.expr()).var;
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
        defun = ctx.type().getText();
        Map<String,String> map = (visit(ctx.params()).defvars);
        check ck = visit(ctx.block());
        chk.defvars = ck.defvars;
        Vector<Vector> vv  = ck.vars;
        chk.defvars.putAll(map);
        Vector fun = new Vector();
        fun.add(ctx.type().getText());
        for (String value : map.values())
        {
            fun.add(value);
        }
        defuns.put(ctx.funname().getText(),fun);
        for (int i = 0;i < vv.size();++i)
        {
            Vector v = vv.get(i);
            Vector u = new Vector();
            int flag = -2;//-1 : undefine ; 0 : pass int ; 1 : pass string; 2 : wrong;
            int uflag = 0;
            for (int j = 0;j < v.size();++j)
            {
                if (v.get(j).equals("int"))
                {
                    if (flag == -2) flag = 0;
                    if (flag == 1)
                    {
                        flag = 2;
                     //   System.out.println("FBI WARNING! Variables wrong!");
                        break;
                    }
                    continue;
                }
                if (v.get(j).equals("string"))
                {
                    if (flag == -2) flag = 1;
                    if (flag == 0)
                    {
                        flag = 2;
                      //  System.out.println("FBI WARNING! Variables wrong!");
                        break;
                    }
                    continue;
                }
                if (chk.defvars.containsKey(v.get(j)))
                {
                    String s = chk.defvars.get(v.get(j));
                    if (s.equals("int"))
                    {
                        if (flag == -2) flag = 0;
                        if (flag == 1)
                        {
                            flag = 2;
                          //  System.out.println("FBI WARNING! Variables wrong!");
                            break;
                        }
                    }
                    if (s.equals("string"))
                    {
                        if (flag == -2) flag = 1;
                        if (flag == 0)
                        {
                            flag = 2;
                          //  System.out.println("FBI WARNING! Variables wrong!");
                            break;
                        }
                    }
                    continue;
                }
                uflag = -1;
                u.add(v.get(j));
            }
            if (uflag == -1)
            {
                if (flag == 0) u.add("int"); else if (flag == 1) u.add("string");
                chk.vars.add(u);
            }
        }

        return chk;
    }
    public check visitParams(MxParser.ParamsContext ctx)
    {
        check chk = new check();
        for (int i = 0;i < ctx.param().size();++i)
        {
            chk.defvars.putAll(visit(ctx.param(i)).defvars);
        }
        return chk;
    }
    public check visitParam(MxParser.ParamContext ctx)
    {
        check chk = new check();
        chk.defvars.put(ctx.ID().getText(),ctx.type().getText());
        return chk;
    }
    public check visitBlock(MxParser.BlockContext ctx)
    {

        check chk = new check();
        for (int k= 0;k < ctx.stmt().size();++k)
        {
            check ck = visit(ctx.stmt(k));
            chk.defvars.putAll(ck.defvars);
            Vector<Vector> vv  = ck.vars;
            for (int i = 0;i < vv.size();++i)
            {
                Vector v = vv.get(i);
                Vector u = new Vector();
                int flag = -2;//-1 : undefine ; 0 : pass int ; 1 : pass string; 2 : wrong;
                int uflag = 0;
                for (int j = 0;j < v.size();++j)
                {
                    if (v.get(j).equals("int"))
                    {
                        if (flag == -2) flag = 0;
                        if (flag == 1)
                        {
                            flag = 2;
                          //  System.out.println("FBI WARNING! Variables wrong!");
                            break;
                        }
                        continue;
                    }
                    if (v.get(j).equals("string"))
                    {
                        if (flag == -2) flag = 1;
                        if (flag == 0)
                        {
                            flag = 2;
                          //  System.out.println("FBI WARNING! Variables wrong!");
                            break;
                        }
                        continue;
                    }
                    if (chk.defvars.containsKey(v.get(j)))
                    {
                        String s = chk.defvars.get(v.get(j));
                        if (s.equals("int"))
                        {
                            if (flag == -2) flag = 0;
                            if (flag == 1)
                            {
                                flag = 2;
                               // System.out.println("FBI WARNING! Variables wrong!");
                                break;
                            }
                        }
                        if (s.equals("string"))
                        {
                            if (flag == -2) flag = 1;
                            if (flag == 0)
                            {
                                flag = 2;
                               // System.out.println("FBI WARNING! Variables wrong!");
                                break;
                            }
                        }
                        continue;
                    }
                    uflag = -1;
                    u.add(v.get(j));
                }
                if (uflag == -1)
                {
                    if (flag == 0) u.add("int"); else if (flag == 1) u.add("string");
                    chk.vars.add(u);
                }
            }
        }
        chk.defvars.clear();
        return chk;
    }
    public check visitStmt(MxParser.StmtContext ctx)
    {
        boolean isreturn = false;
        check chk = new check();
        if (ctx.getText().length() >= 6)
        if (ctx.getText().substring(0,6).equals("return"))
        {
            isreturn = true;
        }
        if (ctx.block() != null)
        {
            check ck = visit(ctx.block());
            chk.defvars.putAll(ck.defvars);
            chk.vars.addAll(ck.vars);
        }
        for (int i = 0;i < ctx.stmt().size();++i)
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
        for (int i = 0;i < ctx.expr().size();++i)
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

        for (int i = 0;i < ctx.expr().size();++i)
        {
            chk.var.addAll(visit(ctx.expr(i)).var);
        }
        return chk;
    }
    public check visitExpr(MxParser.ExprContext ctx)
    {
        check chk = new check();
        if (ctx.funname() != null)
        {
            Vector v = new Vector();
            v.addAll(visit(ctx.exprs()).var);
            String s = ctx.funname().getText();
            if (defuns.containsKey(s) )
            {
                chk.var.add(defuns.get(s).get(0));
                if (v.size() != defuns.get(s).size() - 1)
                {
                    //System.out.println("FBI WARNING! parmars numbers wrong!");
                }
                else
                {
                    for (int i = 0;i < v.size();++i)
                    {
                        Vector vec = new Vector();
                        vec.add(v.get(i));
                        vec.add(defuns.get(s).get(i + 1));
                        chk.vars.add(vec);
                    }
                }
            }
            else
            {
                //System.out.println("FBI WARNING! function \""+s+ "\" undefined!");
            }
        }
        if (ctx.varname() != null) chk.var.add(ctx.varname().getText());
        if (ctx.NUM() != null) chk.var.add("int");
        if (ctx.STR() != null) chk.var.add("string");
        for (int i = 0;i < ctx.expr().size();++i)
        {
            chk.var.addAll(visit(ctx.expr(i)).var);
        }
        //System.out.println(chk.funs);
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
        File f = new File("program.txt");
        InputStream input = null;
        input = new FileInputStream(f);
        run(input);
        System.err.println("Hello world");
        
    }
}