import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ANTLRInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
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

    MyVisitor() { }
    public check visitAllin(MxParser.AllinContext ctx)
    {
        check chk = new check();
        check nullcheck = new check();
        for (int i = 0;i < ctx.defun().size();++i)
        {
            chk.defvars.putAll(visit(ctx.defun(i)).defvars);
        }

       /* for (int i = 0;i < ctx.defclass().size();++i)
        {
            chk.defvars.putAll(visit(ctx.defclass(i)).defvars);
        }*/
        for (int i = 0;i < ctx.defvars().size();++i)
        {
            chk.defvars.putAll(visit(ctx.defvars(i)).defvars);
        }
        for (Entry<String,String> entry : chk.defvars.entrySet()) {
            System.out.println(entry.getKey() + " : " + entry.getValue());
        }
        return nullcheck;
    }

    public check visitVarname(MxParser.VarnameContext ctx)
    {
        check nullcheck = new check();
        return nullcheck;
    }

    public check visitDefvars(MxParser.DefvarsContext ctx)
    {
        check nullcheck = new check();
        check chk = new check();
        chk.defvars.put(ctx.varname().getText(),ctx.type().getText());
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

   // public check visitBasetype(MxParser.BasetypeContext ctx){}
   // public check visitClassname(MxParser.ClassnameContext ctx){}
   //public check visitDefclass(MxParser.DefclassContext ctx){}
   // public check visitFunname(MxParser.FunnameContext ctx){}
    public check visitDefun(MxParser.DefunContext ctx)
    {
       return visit(ctx.block());
    }
   /* public check visitParams(MxParser.ParamsContext ctx){}
    public check visitParam(MxParser.ParamContext ctx){}*/
    public check visitBlock(MxParser.BlockContext ctx)
    {
        Vector<Vector> vv = new Vector<>();
        check chk = new check();
        //System.out.println(ctx.getText());
        for (int i = 0;i < ctx.stmt().size();++i)
        {
            chk.defvars.putAll(visit(ctx.stmt(i)).defvars);
            vv.addAll(visit(ctx.stmt(i)).vars);
        }
        for (int i = 0;i < vv.size();++i)
        {
            System.out.println(ctx.getText());
            System.out.println(i);
            System.out.println(vv.get(i).toString());
            Vector v = vv.get(i);
            Vector u = new Vector();
            int flag = -2;//-1 : undefine ; 0 : pass int ; 1 : pass string; 2 : wrong;
            int uflag = 0;
            for (int j = 0;j < v.size();++j)
            {
                if (v.get(j)  == "int")
                {
                    if (flag == -2) flag = 0;
                    if (flag == 1)
                    {
                        flag = 2;
                        System.out.println("FBI WARNING!");
                        break;
                    }
                    continue;
                }
                if (v.get(j) == "string")
                {
                    if (flag == -2) flag = 1;
                    if (flag == 0)
                    {
                        flag = 2;
                        System.out.println("FBI WARNING!");
                        break;
                    }
                    continue;
                }
                if (chk.defvars.containsKey(v.get(j)))
                {
                    String s = chk.defvars.get(v.get(j));
                    if (s  == "int")
                    {
                        if (flag == -2) flag = 0;
                        if (flag == 1)
                        {
                            flag = 2;
                            System.out.println("FBI WARNING!");
                            break;
                        }
                    }
                    if (s == "string")
                    {
                        if (flag == -2) flag = 1;
                        if (flag == 0)
                        {
                            flag = 2;
                            System.out.println("FBI WARNING!");
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
                if (flag == 0) u.add("int"); else u.add("string");
                chk.vars.add(u);
            }
        }
        return chk;
    }
    public check visitStmt(MxParser.StmtContext ctx)
    {
        check chk = new check();
        if (ctx.block() != null)
        {
            chk.defvars.putAll((visit(ctx.block())).defvars);
            chk.vars.addAll(visit(ctx.block()).vars);
        }
        for (int i = 0;i < ctx.stmt().size();++i)
        {
            chk.defvars.putAll(visit(ctx.stmt(i)).defvars);
            chk.vars.addAll(visit(ctx.stmt(i)).vars);
        }
        if (ctx.defvars() != null) chk.defvars.putAll(visit(ctx.defvars()).defvars);
        Vector v = new Vector();
        for (int i = 0;i < ctx.expr().size();++i)
        {
            v.add(visit(ctx.expr(i)).var);
        }
        chk.vars.add(v);
        return chk;
    }
   // public check visitExprs(MxParser.ExprsContext ctx){}
    public check visitExpr(MxParser.ExprContext ctx)
    {
        check chk = new check();
        if (ctx.varname() != null) chk.var.add(ctx.varname().getText());
        if (ctx.NUM() != null) chk.var.add("int");
        if (ctx.STR() != null) chk.var.add("string");
        for (int i = 0;i < ctx.expr().size();++i)
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
        ParseTree tree =parser.allin();
        MyVisitor bill = new MyVisitor();
        bill.visit(tree);
    }

    public static void main(String[] args) throws Exception
    {
        File f = new File("E:\\test.txt");
        InputStream input = null;
        input = new FileInputStream(f);
        run(input);
    }
}