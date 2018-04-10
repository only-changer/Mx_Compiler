// Generated from E:/Java_Files/IDE/src\Mx.g4 by ANTLR 4.7
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, T__33=34, T__34=35, T__35=36, T__36=37, T__37=38, 
		T__38=39, T__39=40, T__40=41, T__41=42, T__42=43, T__43=44, T__44=45, 
		T__45=46, T__46=47, T__47=48, T__48=49, T__49=50, T__50=51, T__51=52, 
		T__52=53, T__53=54, STR=55, ID=56, NUM=57, WS=58, LINE_COMMENT=59;
	public static final int
		RULE_allin = 0, RULE_defs = 1, RULE_varname = 2, RULE_defvars = 3, RULE_typename = 4, 
		RULE_type = 5, RULE_basetype = 6, RULE_classname = 7, RULE_defclass = 8, 
		RULE_funname = 9, RULE_defun = 10, RULE_params = 11, RULE_param = 12, 
		RULE_block = 13, RULE_stmt = 14, RULE_exprs = 15, RULE_expr = 16, RULE_news = 17;
	public static final String[] ruleNames = {
		"allin", "defs", "varname", "defvars", "typename", "type", "basetype", 
		"classname", "defclass", "funname", "defun", "params", "param", "block", 
		"stmt", "exprs", "expr", "news"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'='", "';'", "'[]'", "'int'", "'bool'", "'void'", "'string'", "'class'", 
		"'{'", "'}'", "'('", "')'", "','", "'if'", "'else'", "'for'", "'while'", 
		"'return'", "'break'", "'continue'", "'new'", "'['", "']'", "'.'", "'++'", 
		"'--'", "'-'", "'!'", "'~'", "'*'", "'/'", "'%'", "'+'", "'>>'", "'<<'", 
		"'&'", "'^'", "'|'", "'>'", "'<'", "'>='", "'<='", "'=='", "'!='", "'&&'", 
		"'||'", "'?'", "':'", "'NULL'", "'null'", "'TRUE'", "'true'", "'FALSE'", 
		"'false'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, "STR", "ID", "NUM", "WS", "LINE_COMMENT"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "Mx.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public MxParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class AllinContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(MxParser.EOF, 0); }
		public List<DefsContext> defs() {
			return getRuleContexts(DefsContext.class);
		}
		public DefsContext defs(int i) {
			return getRuleContext(DefsContext.class,i);
		}
		public AllinContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_allin; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterAllin(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitAllin(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitAllin(this);
			else return visitor.visitChildren(this);
		}
	}

	public final AllinContext allin() throws RecognitionException {
		AllinContext _localctx = new AllinContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_allin);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(39);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << T__4) | (1L << T__5) | (1L << T__6) | (1L << T__7) | (1L << ID))) != 0)) {
				{
				{
				setState(36);
				defs();
				}
				}
				setState(41);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(42);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DefsContext extends ParserRuleContext {
		public DefunContext defun() {
			return getRuleContext(DefunContext.class,0);
		}
		public DefvarsContext defvars() {
			return getRuleContext(DefvarsContext.class,0);
		}
		public DefclassContext defclass() {
			return getRuleContext(DefclassContext.class,0);
		}
		public DefsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_defs; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterDefs(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitDefs(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitDefs(this);
			else return visitor.visitChildren(this);
		}
	}

	public final DefsContext defs() throws RecognitionException {
		DefsContext _localctx = new DefsContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_defs);
		try {
			setState(47);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(44);
				defun();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(45);
				defvars();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(46);
				defclass();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VarnameContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(MxParser.ID, 0); }
		public VarnameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_varname; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterVarname(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitVarname(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitVarname(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VarnameContext varname() throws RecognitionException {
		VarnameContext _localctx = new VarnameContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_varname);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(49);
			match(ID);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DefvarsContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public VarnameContext varname() {
			return getRuleContext(VarnameContext.class,0);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public DefvarsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_defvars; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterDefvars(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitDefvars(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitDefvars(this);
			else return visitor.visitChildren(this);
		}
	}

	public final DefvarsContext defvars() throws RecognitionException {
		DefvarsContext _localctx = new DefvarsContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_defvars);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(51);
			type();
			setState(52);
			varname();
			setState(55);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__0) {
				{
				setState(53);
				match(T__0);
				setState(54);
				expr(0);
				}
			}

			setState(57);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TypenameContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(MxParser.ID, 0); }
		public TypenameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_typename; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterTypename(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitTypename(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitTypename(this);
			else return visitor.visitChildren(this);
		}
	}

	public final TypenameContext typename() throws RecognitionException {
		TypenameContext _localctx = new TypenameContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_typename);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(59);
			match(ID);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TypeContext extends ParserRuleContext {
		public BasetypeContext basetype() {
			return getRuleContext(BasetypeContext.class,0);
		}
		public TypenameContext typename() {
			return getRuleContext(TypenameContext.class,0);
		}
		public TypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_type; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final TypeContext type() throws RecognitionException {
		TypeContext _localctx = new TypeContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_type);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(63);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__3:
			case T__4:
			case T__5:
			case T__6:
				{
				setState(61);
				basetype();
				}
				break;
			case ID:
				{
				setState(62);
				typename();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(68);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__2) {
				{
				{
				setState(65);
				match(T__2);
				}
				}
				setState(70);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BasetypeContext extends ParserRuleContext {
		public BasetypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_basetype; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterBasetype(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitBasetype(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitBasetype(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BasetypeContext basetype() throws RecognitionException {
		BasetypeContext _localctx = new BasetypeContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_basetype);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(71);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << T__4) | (1L << T__5) | (1L << T__6))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassnameContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(MxParser.ID, 0); }
		public ClassnameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classname; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterClassname(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitClassname(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitClassname(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassnameContext classname() throws RecognitionException {
		ClassnameContext _localctx = new ClassnameContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_classname);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(73);
			match(ID);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DefclassContext extends ParserRuleContext {
		public ClassnameContext classname() {
			return getRuleContext(ClassnameContext.class,0);
		}
		public List<DefunContext> defun() {
			return getRuleContexts(DefunContext.class);
		}
		public DefunContext defun(int i) {
			return getRuleContext(DefunContext.class,i);
		}
		public List<DefvarsContext> defvars() {
			return getRuleContexts(DefvarsContext.class);
		}
		public DefvarsContext defvars(int i) {
			return getRuleContext(DefvarsContext.class,i);
		}
		public DefclassContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_defclass; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterDefclass(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitDefclass(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitDefclass(this);
			else return visitor.visitChildren(this);
		}
	}

	public final DefclassContext defclass() throws RecognitionException {
		DefclassContext _localctx = new DefclassContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_defclass);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(75);
			match(T__7);
			setState(76);
			classname();
			setState(77);
			match(T__8);
			setState(82);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << T__4) | (1L << T__5) | (1L << T__6) | (1L << ID))) != 0)) {
				{
				setState(80);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,5,_ctx) ) {
				case 1:
					{
					setState(78);
					defun();
					}
					break;
				case 2:
					{
					setState(79);
					defvars();
					}
					break;
				}
				}
				setState(84);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(85);
			match(T__9);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FunnameContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(MxParser.ID, 0); }
		public FunnameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_funname; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterFunname(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitFunname(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitFunname(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunnameContext funname() throws RecognitionException {
		FunnameContext _localctx = new FunnameContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_funname);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(87);
			match(ID);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DefunContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public FunnameContext funname() {
			return getRuleContext(FunnameContext.class,0);
		}
		public ParamsContext params() {
			return getRuleContext(ParamsContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public DefunContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_defun; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterDefun(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitDefun(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitDefun(this);
			else return visitor.visitChildren(this);
		}
	}

	public final DefunContext defun() throws RecognitionException {
		DefunContext _localctx = new DefunContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_defun);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(89);
			type();
			setState(90);
			funname();
			setState(91);
			match(T__10);
			setState(92);
			params();
			setState(93);
			match(T__11);
			setState(94);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParamsContext extends ParserRuleContext {
		public List<ParamContext> param() {
			return getRuleContexts(ParamContext.class);
		}
		public ParamContext param(int i) {
			return getRuleContext(ParamContext.class,i);
		}
		public ParamsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_params; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterParams(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitParams(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitParams(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParamsContext params() throws RecognitionException {
		ParamsContext _localctx = new ParamsContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_params);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(104);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << T__4) | (1L << T__5) | (1L << T__6) | (1L << ID))) != 0)) {
				{
				setState(96);
				param();
				setState(101);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__12) {
					{
					{
					setState(97);
					match(T__12);
					setState(98);
					param();
					}
					}
					setState(103);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParamContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public TerminalNode ID() { return getToken(MxParser.ID, 0); }
		public ParamContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_param; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterParam(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitParam(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitParam(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParamContext param() throws RecognitionException {
		ParamContext _localctx = new ParamContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_param);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(106);
			type();
			setState(107);
			match(ID);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockContext extends ParserRuleContext {
		public List<StmtContext> stmt() {
			return getRuleContexts(StmtContext.class);
		}
		public StmtContext stmt(int i) {
			return getRuleContext(StmtContext.class,i);
		}
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterBlock(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitBlock(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitBlock(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_block);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(109);
			match(T__8);
			setState(113);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__3) | (1L << T__4) | (1L << T__5) | (1L << T__6) | (1L << T__8) | (1L << T__10) | (1L << T__13) | (1L << T__15) | (1L << T__16) | (1L << T__17) | (1L << T__18) | (1L << T__19) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
				{
				{
				setState(110);
				stmt();
				}
				}
				setState(115);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(116);
			match(T__9);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StmtContext extends ParserRuleContext {
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public List<StmtContext> stmt() {
			return getRuleContexts(StmtContext.class);
		}
		public StmtContext stmt(int i) {
			return getRuleContext(StmtContext.class,i);
		}
		public DefvarsContext defvars() {
			return getRuleContext(DefvarsContext.class,0);
		}
		public StmtContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_stmt; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitStmt(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StmtContext stmt() throws RecognitionException {
		StmtContext _localctx = new StmtContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_stmt);
		int _la;
		try {
			setState(164);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(118);
				block();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(119);
				match(T__13);
				setState(120);
				match(T__10);
				setState(121);
				expr(0);
				setState(122);
				match(T__11);
				setState(123);
				stmt();
				setState(126);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,10,_ctx) ) {
				case 1:
					{
					setState(124);
					match(T__14);
					setState(125);
					stmt();
					}
					break;
				}
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(128);
				match(T__15);
				setState(129);
				match(T__10);
				setState(131);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__10) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(130);
					expr(0);
					}
				}

				setState(133);
				match(T__1);
				setState(135);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__10) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(134);
					expr(0);
					}
				}

				setState(137);
				match(T__1);
				setState(139);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__10) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(138);
					expr(0);
					}
				}

				setState(141);
				match(T__11);
				setState(142);
				stmt();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(143);
				match(T__16);
				setState(144);
				match(T__10);
				setState(146);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__10) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(145);
					expr(0);
					}
				}

				setState(148);
				match(T__11);
				setState(149);
				stmt();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(150);
				match(T__17);
				setState(152);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__10) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(151);
					expr(0);
					}
				}

				setState(154);
				match(T__1);
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(155);
				match(T__18);
				setState(156);
				match(T__1);
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(157);
				match(T__19);
				setState(158);
				match(T__1);
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(159);
				defvars();
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(160);
				match(T__1);
				}
				break;
			case 10:
				enterOuterAlt(_localctx, 10);
				{
				setState(161);
				expr(0);
				setState(162);
				match(T__1);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExprsContext extends ParserRuleContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public ExprsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_exprs; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExprs(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExprs(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExprs(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExprsContext exprs() throws RecognitionException {
		ExprsContext _localctx = new ExprsContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_exprs);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(166);
			expr(0);
			setState(171);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__12) {
				{
				{
				setState(167);
				match(T__12);
				setState(168);
				expr(0);
				}
				}
				setState(173);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExprContext extends ParserRuleContext {
		public FunnameContext funname() {
			return getRuleContext(FunnameContext.class,0);
		}
		public ExprsContext exprs() {
			return getRuleContext(ExprsContext.class,0);
		}
		public NewsContext news() {
			return getRuleContext(NewsContext.class,0);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public VarnameContext varname() {
			return getRuleContext(VarnameContext.class,0);
		}
		public TerminalNode NUM() { return getToken(MxParser.NUM, 0); }
		public TerminalNode STR() { return getToken(MxParser.STR, 0); }
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitExpr(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 32;
		enterRecursionRule(_localctx, 32, RULE_expr, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(195);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,18,_ctx) ) {
			case 1:
				{
				setState(175);
				funname();
				setState(176);
				match(T__10);
				setState(177);
				exprs();
				setState(178);
				match(T__11);
				}
				break;
			case 2:
				{
				setState(180);
				match(T__20);
				setState(181);
				news();
				}
				break;
			case 3:
				{
				setState(182);
				_la = _input.LA(1);
				if ( !(_la==T__24 || _la==T__25) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(183);
				expr(20);
				}
				break;
			case 4:
				{
				setState(184);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__26) | (1L << T__27) | (1L << T__28))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(185);
				expr(19);
				}
				break;
			case 5:
				{
				setState(186);
				varname();
				}
				break;
			case 6:
				{
				setState(187);
				match(NUM);
				}
				break;
			case 7:
				{
				setState(188);
				match(STR);
				}
				break;
			case 8:
				{
				setState(189);
				_la = _input.LA(1);
				if ( !(_la==T__48 || _la==T__49) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 9:
				{
				setState(190);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 10:
				{
				setState(191);
				match(T__10);
				setState(192);
				expr(0);
				setState(193);
				match(T__11);
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(249);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,21,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(247);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,20,_ctx) ) {
					case 1:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(197);
						if (!(precpred(_ctx, 21))) throw new FailedPredicateException(this, "precpred(_ctx, 21)");
						setState(198);
						match(T__23);
						setState(199);
						expr(22);
						}
						break;
					case 2:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(200);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(201);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__29) | (1L << T__30) | (1L << T__31))) != 0)) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(202);
						expr(18);
						}
						break;
					case 3:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(203);
						if (!(precpred(_ctx, 16))) throw new FailedPredicateException(this, "precpred(_ctx, 16)");
						setState(204);
						_la = _input.LA(1);
						if ( !(_la==T__26 || _la==T__32) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(205);
						expr(17);
						}
						break;
					case 4:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(206);
						if (!(precpred(_ctx, 15))) throw new FailedPredicateException(this, "precpred(_ctx, 15)");
						setState(207);
						_la = _input.LA(1);
						if ( !(_la==T__33 || _la==T__34) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(208);
						expr(16);
						}
						break;
					case 5:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(209);
						if (!(precpred(_ctx, 14))) throw new FailedPredicateException(this, "precpred(_ctx, 14)");
						setState(210);
						match(T__35);
						setState(211);
						expr(15);
						}
						break;
					case 6:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(212);
						if (!(precpred(_ctx, 13))) throw new FailedPredicateException(this, "precpred(_ctx, 13)");
						setState(213);
						match(T__36);
						setState(214);
						expr(14);
						}
						break;
					case 7:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(215);
						if (!(precpred(_ctx, 12))) throw new FailedPredicateException(this, "precpred(_ctx, 12)");
						setState(216);
						match(T__37);
						setState(217);
						expr(13);
						}
						break;
					case 8:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(218);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(219);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__38) | (1L << T__39) | (1L << T__40) | (1L << T__41) | (1L << T__42) | (1L << T__43))) != 0)) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(220);
						expr(12);
						}
						break;
					case 9:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(221);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(222);
						match(T__44);
						setState(223);
						expr(11);
						}
						break;
					case 10:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(224);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(225);
						match(T__45);
						setState(226);
						expr(10);
						}
						break;
					case 11:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(227);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(228);
						match(T__46);
						setState(229);
						expr(0);
						setState(230);
						match(T__47);
						setState(231);
						expr(9);
						}
						break;
					case 12:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(233);
						if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
						setState(234);
						match(T__0);
						setState(235);
						expr(1);
						}
						break;
					case 13:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(236);
						if (!(precpred(_ctx, 22))) throw new FailedPredicateException(this, "precpred(_ctx, 22)");
						setState(241); 
						_errHandler.sync(this);
						_alt = 1;
						do {
							switch (_alt) {
							case 1:
								{
								{
								setState(237);
								match(T__21);
								setState(238);
								expr(0);
								setState(239);
								match(T__22);
								}
								}
								break;
							default:
								throw new NoViableAltException(this);
							}
							setState(243); 
							_errHandler.sync(this);
							_alt = getInterpreter().adaptivePredict(_input,19,_ctx);
						} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
						}
						break;
					case 14:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(245);
						if (!(precpred(_ctx, 18))) throw new FailedPredicateException(this, "precpred(_ctx, 18)");
						setState(246);
						_la = _input.LA(1);
						if ( !(_la==T__24 || _la==T__25) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						break;
					}
					} 
				}
				setState(251);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,21,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class NewsContext extends ParserRuleContext {
		public VarnameContext varname() {
			return getRuleContext(VarnameContext.class,0);
		}
		public ExprsContext exprs() {
			return getRuleContext(ExprsContext.class,0);
		}
		public ClassnameContext classname() {
			return getRuleContext(ClassnameContext.class,0);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public NewsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_news; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).enterNews(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxListener ) ((MxListener)listener).exitNews(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxVisitor ) return ((MxVisitor<? extends T>)visitor).visitNews(this);
			else return visitor.visitChildren(this);
		}
	}

	public final NewsContext news() throws RecognitionException {
		NewsContext _localctx = new NewsContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_news);
		try {
			int _alt;
			setState(286);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,27,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(252);
				varname();
				setState(253);
				match(T__10);
				setState(254);
				exprs();
				setState(255);
				match(T__11);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(260);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case ID:
					{
					setState(257);
					classname();
					}
					break;
				case T__3:
					{
					setState(258);
					match(T__3);
					}
					break;
				case T__6:
					{
					setState(259);
					match(T__6);
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(266); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(262);
						match(T__21);
						setState(263);
						expr(0);
						setState(264);
						match(T__22);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(268); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(273);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,24,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(270);
						match(T__2);
						}
						} 
					}
					setState(275);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,24,_ctx);
				}
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(279);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case ID:
					{
					setState(276);
					classname();
					}
					break;
				case T__3:
					{
					setState(277);
					match(T__3);
					}
					break;
				case T__6:
					{
					setState(278);
					match(T__6);
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(282); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(281);
						match(T__2);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(284); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,26,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 16:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 21);
		case 1:
			return precpred(_ctx, 17);
		case 2:
			return precpred(_ctx, 16);
		case 3:
			return precpred(_ctx, 15);
		case 4:
			return precpred(_ctx, 14);
		case 5:
			return precpred(_ctx, 13);
		case 6:
			return precpred(_ctx, 12);
		case 7:
			return precpred(_ctx, 11);
		case 8:
			return precpred(_ctx, 10);
		case 9:
			return precpred(_ctx, 9);
		case 10:
			return precpred(_ctx, 8);
		case 11:
			return precpred(_ctx, 1);
		case 12:
			return precpred(_ctx, 22);
		case 13:
			return precpred(_ctx, 18);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3=\u0123\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\3\2\7\2(\n\2\f\2\16\2+\13\2\3\2\3\2\3\3\3\3\3\3\5\3\62\n\3"+
		"\3\4\3\4\3\5\3\5\3\5\3\5\5\5:\n\5\3\5\3\5\3\6\3\6\3\7\3\7\5\7B\n\7\3\7"+
		"\7\7E\n\7\f\7\16\7H\13\7\3\b\3\b\3\t\3\t\3\n\3\n\3\n\3\n\3\n\7\nS\n\n"+
		"\f\n\16\nV\13\n\3\n\3\n\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\r\3\r"+
		"\3\r\7\rf\n\r\f\r\16\ri\13\r\5\rk\n\r\3\16\3\16\3\16\3\17\3\17\7\17r\n"+
		"\17\f\17\16\17u\13\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\5\20\u0081\n\20\3\20\3\20\3\20\5\20\u0086\n\20\3\20\3\20\5\20\u008a\n"+
		"\20\3\20\3\20\5\20\u008e\n\20\3\20\3\20\3\20\3\20\3\20\5\20\u0095\n\20"+
		"\3\20\3\20\3\20\3\20\5\20\u009b\n\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\5\20\u00a7\n\20\3\21\3\21\3\21\7\21\u00ac\n\21\f\21\16"+
		"\21\u00af\13\21\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\5\22\u00c6\n\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\22\6\22\u00f4\n\22\r\22\16\22\u00f5\3\22\3\22\7\22\u00fa\n\22\f\22"+
		"\16\22\u00fd\13\22\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\5\23\u0107"+
		"\n\23\3\23\3\23\3\23\3\23\6\23\u010d\n\23\r\23\16\23\u010e\3\23\7\23\u0112"+
		"\n\23\f\23\16\23\u0115\13\23\3\23\3\23\3\23\5\23\u011a\n\23\3\23\6\23"+
		"\u011d\n\23\r\23\16\23\u011e\5\23\u0121\n\23\3\23\2\3\"\24\2\4\6\b\n\f"+
		"\16\20\22\24\26\30\32\34\36 \"$\2\13\3\2\6\t\3\2\33\34\3\2\35\37\3\2\63"+
		"\64\3\2\658\3\2 \"\4\2\35\35##\3\2$%\3\2).\2\u014c\2)\3\2\2\2\4\61\3\2"+
		"\2\2\6\63\3\2\2\2\b\65\3\2\2\2\n=\3\2\2\2\fA\3\2\2\2\16I\3\2\2\2\20K\3"+
		"\2\2\2\22M\3\2\2\2\24Y\3\2\2\2\26[\3\2\2\2\30j\3\2\2\2\32l\3\2\2\2\34"+
		"o\3\2\2\2\36\u00a6\3\2\2\2 \u00a8\3\2\2\2\"\u00c5\3\2\2\2$\u0120\3\2\2"+
		"\2&(\5\4\3\2\'&\3\2\2\2(+\3\2\2\2)\'\3\2\2\2)*\3\2\2\2*,\3\2\2\2+)\3\2"+
		"\2\2,-\7\2\2\3-\3\3\2\2\2.\62\5\26\f\2/\62\5\b\5\2\60\62\5\22\n\2\61."+
		"\3\2\2\2\61/\3\2\2\2\61\60\3\2\2\2\62\5\3\2\2\2\63\64\7:\2\2\64\7\3\2"+
		"\2\2\65\66\5\f\7\2\669\5\6\4\2\678\7\3\2\28:\5\"\22\29\67\3\2\2\29:\3"+
		"\2\2\2:;\3\2\2\2;<\7\4\2\2<\t\3\2\2\2=>\7:\2\2>\13\3\2\2\2?B\5\16\b\2"+
		"@B\5\n\6\2A?\3\2\2\2A@\3\2\2\2BF\3\2\2\2CE\7\5\2\2DC\3\2\2\2EH\3\2\2\2"+
		"FD\3\2\2\2FG\3\2\2\2G\r\3\2\2\2HF\3\2\2\2IJ\t\2\2\2J\17\3\2\2\2KL\7:\2"+
		"\2L\21\3\2\2\2MN\7\n\2\2NO\5\20\t\2OT\7\13\2\2PS\5\26\f\2QS\5\b\5\2RP"+
		"\3\2\2\2RQ\3\2\2\2SV\3\2\2\2TR\3\2\2\2TU\3\2\2\2UW\3\2\2\2VT\3\2\2\2W"+
		"X\7\f\2\2X\23\3\2\2\2YZ\7:\2\2Z\25\3\2\2\2[\\\5\f\7\2\\]\5\24\13\2]^\7"+
		"\r\2\2^_\5\30\r\2_`\7\16\2\2`a\5\34\17\2a\27\3\2\2\2bg\5\32\16\2cd\7\17"+
		"\2\2df\5\32\16\2ec\3\2\2\2fi\3\2\2\2ge\3\2\2\2gh\3\2\2\2hk\3\2\2\2ig\3"+
		"\2\2\2jb\3\2\2\2jk\3\2\2\2k\31\3\2\2\2lm\5\f\7\2mn\7:\2\2n\33\3\2\2\2"+
		"os\7\13\2\2pr\5\36\20\2qp\3\2\2\2ru\3\2\2\2sq\3\2\2\2st\3\2\2\2tv\3\2"+
		"\2\2us\3\2\2\2vw\7\f\2\2w\35\3\2\2\2x\u00a7\5\34\17\2yz\7\20\2\2z{\7\r"+
		"\2\2{|\5\"\22\2|}\7\16\2\2}\u0080\5\36\20\2~\177\7\21\2\2\177\u0081\5"+
		"\36\20\2\u0080~\3\2\2\2\u0080\u0081\3\2\2\2\u0081\u00a7\3\2\2\2\u0082"+
		"\u0083\7\22\2\2\u0083\u0085\7\r\2\2\u0084\u0086\5\"\22\2\u0085\u0084\3"+
		"\2\2\2\u0085\u0086\3\2\2\2\u0086\u0087\3\2\2\2\u0087\u0089\7\4\2\2\u0088"+
		"\u008a\5\"\22\2\u0089\u0088\3\2\2\2\u0089\u008a\3\2\2\2\u008a\u008b\3"+
		"\2\2\2\u008b\u008d\7\4\2\2\u008c\u008e\5\"\22\2\u008d\u008c\3\2\2\2\u008d"+
		"\u008e\3\2\2\2\u008e\u008f\3\2\2\2\u008f\u0090\7\16\2\2\u0090\u00a7\5"+
		"\36\20\2\u0091\u0092\7\23\2\2\u0092\u0094\7\r\2\2\u0093\u0095\5\"\22\2"+
		"\u0094\u0093\3\2\2\2\u0094\u0095\3\2\2\2\u0095\u0096\3\2\2\2\u0096\u0097"+
		"\7\16\2\2\u0097\u00a7\5\36\20\2\u0098\u009a\7\24\2\2\u0099\u009b\5\"\22"+
		"\2\u009a\u0099\3\2\2\2\u009a\u009b\3\2\2\2\u009b\u009c\3\2\2\2\u009c\u00a7"+
		"\7\4\2\2\u009d\u009e\7\25\2\2\u009e\u00a7\7\4\2\2\u009f\u00a0\7\26\2\2"+
		"\u00a0\u00a7\7\4\2\2\u00a1\u00a7\5\b\5\2\u00a2\u00a7\7\4\2\2\u00a3\u00a4"+
		"\5\"\22\2\u00a4\u00a5\7\4\2\2\u00a5\u00a7\3\2\2\2\u00a6x\3\2\2\2\u00a6"+
		"y\3\2\2\2\u00a6\u0082\3\2\2\2\u00a6\u0091\3\2\2\2\u00a6\u0098\3\2\2\2"+
		"\u00a6\u009d\3\2\2\2\u00a6\u009f\3\2\2\2\u00a6\u00a1\3\2\2\2\u00a6\u00a2"+
		"\3\2\2\2\u00a6\u00a3\3\2\2\2\u00a7\37\3\2\2\2\u00a8\u00ad\5\"\22\2\u00a9"+
		"\u00aa\7\17\2\2\u00aa\u00ac\5\"\22\2\u00ab\u00a9\3\2\2\2\u00ac\u00af\3"+
		"\2\2\2\u00ad\u00ab\3\2\2\2\u00ad\u00ae\3\2\2\2\u00ae!\3\2\2\2\u00af\u00ad"+
		"\3\2\2\2\u00b0\u00b1\b\22\1\2\u00b1\u00b2\5\24\13\2\u00b2\u00b3\7\r\2"+
		"\2\u00b3\u00b4\5 \21\2\u00b4\u00b5\7\16\2\2\u00b5\u00c6\3\2\2\2\u00b6"+
		"\u00b7\7\27\2\2\u00b7\u00c6\5$\23\2\u00b8\u00b9\t\3\2\2\u00b9\u00c6\5"+
		"\"\22\26\u00ba\u00bb\t\4\2\2\u00bb\u00c6\5\"\22\25\u00bc\u00c6\5\6\4\2"+
		"\u00bd\u00c6\7;\2\2\u00be\u00c6\79\2\2\u00bf\u00c6\t\5\2\2\u00c0\u00c6"+
		"\t\6\2\2\u00c1\u00c2\7\r\2\2\u00c2\u00c3\5\"\22\2\u00c3\u00c4\7\16\2\2"+
		"\u00c4\u00c6\3\2\2\2\u00c5\u00b0\3\2\2\2\u00c5\u00b6\3\2\2\2\u00c5\u00b8"+
		"\3\2\2\2\u00c5\u00ba\3\2\2\2\u00c5\u00bc\3\2\2\2\u00c5\u00bd\3\2\2\2\u00c5"+
		"\u00be\3\2\2\2\u00c5\u00bf\3\2\2\2\u00c5\u00c0\3\2\2\2\u00c5\u00c1\3\2"+
		"\2\2\u00c6\u00fb\3\2\2\2\u00c7\u00c8\f\27\2\2\u00c8\u00c9\7\32\2\2\u00c9"+
		"\u00fa\5\"\22\30\u00ca\u00cb\f\23\2\2\u00cb\u00cc\t\7\2\2\u00cc\u00fa"+
		"\5\"\22\24\u00cd\u00ce\f\22\2\2\u00ce\u00cf\t\b\2\2\u00cf\u00fa\5\"\22"+
		"\23\u00d0\u00d1\f\21\2\2\u00d1\u00d2\t\t\2\2\u00d2\u00fa\5\"\22\22\u00d3"+
		"\u00d4\f\20\2\2\u00d4\u00d5\7&\2\2\u00d5\u00fa\5\"\22\21\u00d6\u00d7\f"+
		"\17\2\2\u00d7\u00d8\7\'\2\2\u00d8\u00fa\5\"\22\20\u00d9\u00da\f\16\2\2"+
		"\u00da\u00db\7(\2\2\u00db\u00fa\5\"\22\17\u00dc\u00dd\f\r\2\2\u00dd\u00de"+
		"\t\n\2\2\u00de\u00fa\5\"\22\16\u00df\u00e0\f\f\2\2\u00e0\u00e1\7/\2\2"+
		"\u00e1\u00fa\5\"\22\r\u00e2\u00e3\f\13\2\2\u00e3\u00e4\7\60\2\2\u00e4"+
		"\u00fa\5\"\22\f\u00e5\u00e6\f\n\2\2\u00e6\u00e7\7\61\2\2\u00e7\u00e8\5"+
		"\"\22\2\u00e8\u00e9\7\62\2\2\u00e9\u00ea\5\"\22\13\u00ea\u00fa\3\2\2\2"+
		"\u00eb\u00ec\f\3\2\2\u00ec\u00ed\7\3\2\2\u00ed\u00fa\5\"\22\3\u00ee\u00f3"+
		"\f\30\2\2\u00ef\u00f0\7\30\2\2\u00f0\u00f1\5\"\22\2\u00f1\u00f2\7\31\2"+
		"\2\u00f2\u00f4\3\2\2\2\u00f3\u00ef\3\2\2\2\u00f4\u00f5\3\2\2\2\u00f5\u00f3"+
		"\3\2\2\2\u00f5\u00f6\3\2\2\2\u00f6\u00fa\3\2\2\2\u00f7\u00f8\f\24\2\2"+
		"\u00f8\u00fa\t\3\2\2\u00f9\u00c7\3\2\2\2\u00f9\u00ca\3\2\2\2\u00f9\u00cd"+
		"\3\2\2\2\u00f9\u00d0\3\2\2\2\u00f9\u00d3\3\2\2\2\u00f9\u00d6\3\2\2\2\u00f9"+
		"\u00d9\3\2\2\2\u00f9\u00dc\3\2\2\2\u00f9\u00df\3\2\2\2\u00f9\u00e2\3\2"+
		"\2\2\u00f9\u00e5\3\2\2\2\u00f9\u00eb\3\2\2\2\u00f9\u00ee\3\2\2\2\u00f9"+
		"\u00f7\3\2\2\2\u00fa\u00fd\3\2\2\2\u00fb\u00f9\3\2\2\2\u00fb\u00fc\3\2"+
		"\2\2\u00fc#\3\2\2\2\u00fd\u00fb\3\2\2\2\u00fe\u00ff\5\6\4\2\u00ff\u0100"+
		"\7\r\2\2\u0100\u0101\5 \21\2\u0101\u0102\7\16\2\2\u0102\u0121\3\2\2\2"+
		"\u0103\u0107\5\20\t\2\u0104\u0107\7\6\2\2\u0105\u0107\7\t\2\2\u0106\u0103"+
		"\3\2\2\2\u0106\u0104\3\2\2\2\u0106\u0105\3\2\2\2\u0107\u010c\3\2\2\2\u0108"+
		"\u0109\7\30\2\2\u0109\u010a\5\"\22\2\u010a\u010b\7\31\2\2\u010b\u010d"+
		"\3\2\2\2\u010c\u0108\3\2\2\2\u010d\u010e\3\2\2\2\u010e\u010c\3\2\2\2\u010e"+
		"\u010f\3\2\2\2\u010f\u0113\3\2\2\2\u0110\u0112\7\5\2\2\u0111\u0110\3\2"+
		"\2\2\u0112\u0115\3\2\2\2\u0113\u0111\3\2\2\2\u0113\u0114\3\2\2\2\u0114"+
		"\u0121\3\2\2\2\u0115\u0113\3\2\2\2\u0116\u011a\5\20\t\2\u0117\u011a\7"+
		"\6\2\2\u0118\u011a\7\t\2\2\u0119\u0116\3\2\2\2\u0119\u0117\3\2\2\2\u0119"+
		"\u0118\3\2\2\2\u011a\u011c\3\2\2\2\u011b\u011d\7\5\2\2\u011c\u011b\3\2"+
		"\2\2\u011d\u011e\3\2\2\2\u011e\u011c\3\2\2\2\u011e\u011f\3\2\2\2\u011f"+
		"\u0121\3\2\2\2\u0120\u00fe\3\2\2\2\u0120\u0106\3\2\2\2\u0120\u0119\3\2"+
		"\2\2\u0121%\3\2\2\2\36)\619AFRTgjs\u0080\u0085\u0089\u008d\u0094\u009a"+
		"\u00a6\u00ad\u00c5\u00f5\u00f9\u00fb\u0106\u010e\u0113\u0119\u011e\u0120";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}