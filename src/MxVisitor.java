// Generated from E:/Java_Files/IDE/src\Mx.g4 by ANTLR 4.7
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MxParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MxVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MxParser#allin}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAllin(MxParser.AllinContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#defs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefs(MxParser.DefsContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#varname}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVarname(MxParser.VarnameContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#defvars}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefvars(MxParser.DefvarsContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#typename}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTypename(MxParser.TypenameContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitType(MxParser.TypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#basetype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBasetype(MxParser.BasetypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#classname}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassname(MxParser.ClassnameContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#defclass}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefclass(MxParser.DefclassContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#funname}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunname(MxParser.FunnameContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#defun}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefun(MxParser.DefunContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#params}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParams(MxParser.ParamsContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#param}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParam(MxParser.ParamContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(MxParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStmt(MxParser.StmtContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#exprs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprs(MxParser.ExprsContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr(MxParser.ExprContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxParser#news}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNews(MxParser.NewsContext ctx);
}