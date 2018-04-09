import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ANTLRInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
class check
{
    check(){}
    Map<String, String> defvars = new HashMap();
    Map<String, String> vars = new HashMap();
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
        check chk = new check();
        //System.out.println(ctx.getText());
        for (int i = 0;i < ctx.stmt().size();++i)
        {
            chk.defvars.putAll(visit(ctx.stmt(i)).defvars);
            chk.vars.putAll(visit(ctx.stmt(i)).vars);
        }
        return chk;
    }
    public check visitStmt(MxParser.StmtContext ctx)
    {
        check chk = new check();
        if (ctx.block() != null) chk.defvars.putAll((visit(ctx.block())).defvars);
        for (int i = 0;i < ctx.stmt().size();++i)
        {
            chk.defvars.putAll(visit(ctx.stmt(i)).defvars);
        }
        for (int i = 0;i < ctx.expr().size();++i)
        {
            chk.vars.putAll(visit((ctx.expr(i))).vars);
        }
         if (ctx.defvars() != null) chk.defvars.putAll(visit(ctx.defvars()).defvars);
        return chk;
    }
   /* public check visitExprs(MxParser.ExprsContext ctx){}
    public check visitExpr(MxParser.ExprContext ctx){}
    public check visitNews(MxParser.NewsContext ctx){}*/
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