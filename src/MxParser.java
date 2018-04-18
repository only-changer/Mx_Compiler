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
		"'{'", "'('", "')'", "'}'", "','", "'if'", "'else'", "'for'", "'while'", 
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
		public List<TerminalNode> ID() { return getTokens(MxParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(MxParser.ID, i);
		}
		public List<BlockContext> block() {
			return getRuleContexts(BlockContext.class);
		}
		public BlockContext block(int i) {
			return getRuleContext(BlockContext.class,i);
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
			setState(86);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << T__4) | (1L << T__5) | (1L << T__6) | (1L << ID))) != 0)) {
				{
				setState(84);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,5,_ctx) ) {
				case 1:
					{
					setState(78);
					match(ID);
					setState(79);
					match(T__9);
					setState(80);
					match(T__10);
					setState(81);
					block();
					}
					break;
				case 2:
					{
					setState(82);
					defun();
					}
					break;
				case 3:
					{
					setState(83);
					defvars();
					}
					break;
				}
				}
				setState(88);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(89);
			match(T__11);
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
			setState(91);
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
			setState(93);
			type();
			setState(94);
			funname();
			setState(95);
			match(T__9);
			setState(96);
			params();
			setState(97);
			match(T__10);
			setState(98);
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
			setState(108);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << T__4) | (1L << T__5) | (1L << T__6) | (1L << ID))) != 0)) {
				{
				setState(100);
				param();
				setState(105);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__12) {
					{
					{
					setState(101);
					match(T__12);
					setState(102);
					param();
					}
					}
					setState(107);
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
		public DefvarsContext defvars() {
			return getRuleContext(DefvarsContext.class,0);
		}
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
			setState(110);
			defvars();
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
			setState(112);
			match(T__8);
			setState(116);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__3) | (1L << T__4) | (1L << T__5) | (1L << T__6) | (1L << T__8) | (1L << T__9) | (1L << T__13) | (1L << T__15) | (1L << T__16) | (1L << T__17) | (1L << T__18) | (1L << T__19) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
				{
				{
				setState(113);
				stmt();
				}
				}
				setState(118);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(119);
			match(T__11);
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
		public Token op;
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
			setState(167);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(121);
				block();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(122);
				((StmtContext)_localctx).op = match(T__13);
				setState(123);
				match(T__9);
				setState(124);
				expr(0);
				setState(125);
				match(T__10);
				setState(126);
				stmt();
				setState(129);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,10,_ctx) ) {
				case 1:
					{
					setState(127);
					match(T__14);
					setState(128);
					stmt();
					}
					break;
				}
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(131);
				match(T__15);
				setState(132);
				match(T__9);
				setState(134);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__9) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(133);
					expr(0);
					}
				}

				setState(136);
				match(T__1);
				setState(138);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__9) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(137);
					expr(0);
					}
				}

				setState(140);
				match(T__1);
				setState(142);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__9) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(141);
					expr(0);
					}
				}

				setState(144);
				match(T__10);
				setState(145);
				stmt();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(146);
				match(T__16);
				setState(147);
				match(T__9);
				setState(149);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__9) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(148);
					expr(0);
					}
				}

				setState(151);
				match(T__10);
				setState(152);
				stmt();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(153);
				match(T__17);
				setState(155);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__9) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(154);
					expr(0);
					}
				}

				setState(157);
				match(T__1);
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(158);
				match(T__18);
				setState(159);
				match(T__1);
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(160);
				match(T__19);
				setState(161);
				match(T__1);
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(162);
				defvars();
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(163);
				match(T__1);
				}
				break;
			case 10:
				enterOuterAlt(_localctx, 10);
				{
				setState(164);
				expr(0);
				setState(165);
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
			setState(169);
			expr(0);
			setState(174);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__12) {
				{
				{
				setState(170);
				match(T__12);
				setState(171);
				expr(0);
				}
				}
				setState(176);
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
		public Token op;
		public Token op1;
		public Token opcom;
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
			setState(200);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,19,_ctx) ) {
			case 1:
				{
				setState(178);
				funname();
				setState(179);
				match(T__9);
				setState(181);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__9) | (1L << T__20) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__48) | (1L << T__49) | (1L << T__50) | (1L << T__51) | (1L << T__52) | (1L << T__53) | (1L << STR) | (1L << ID) | (1L << NUM))) != 0)) {
					{
					setState(180);
					exprs();
					}
				}

				setState(183);
				match(T__10);
				}
				break;
			case 2:
				{
				setState(185);
				match(T__20);
				setState(186);
				news();
				}
				break;
			case 3:
				{
				setState(187);
				((ExprContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__24 || _la==T__25) ) {
					((ExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(188);
				expr(20);
				}
				break;
			case 4:
				{
				setState(189);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__26) | (1L << T__27) | (1L << T__28))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(190);
				expr(19);
				}
				break;
			case 5:
				{
				setState(191);
				varname();
				}
				break;
			case 6:
				{
				setState(192);
				match(NUM);
				}
				break;
			case 7:
				{
				setState(193);
				match(STR);
				}
				break;
			case 8:
				{
				setState(194);
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
				setState(195);
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
				setState(196);
				match(T__9);
				setState(197);
				expr(0);
				setState(198);
				match(T__10);
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(254);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,22,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(252);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,21,_ctx) ) {
					case 1:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(202);
						if (!(precpred(_ctx, 21))) throw new FailedPredicateException(this, "precpred(_ctx, 21)");
						setState(203);
						((ExprContext)_localctx).op = match(T__23);
						setState(204);
						expr(22);
						}
						break;
					case 2:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(205);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(206);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__29) | (1L << T__30) | (1L << T__31))) != 0)) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(207);
						expr(18);
						}
						break;
					case 3:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(208);
						if (!(precpred(_ctx, 16))) throw new FailedPredicateException(this, "precpred(_ctx, 16)");
						setState(209);
						((ExprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__26 || _la==T__32) ) {
							((ExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(210);
						expr(17);
						}
						break;
					case 4:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(211);
						if (!(precpred(_ctx, 15))) throw new FailedPredicateException(this, "precpred(_ctx, 15)");
						setState(212);
						_la = _input.LA(1);
						if ( !(_la==T__33 || _la==T__34) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(213);
						expr(16);
						}
						break;
					case 5:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(214);
						if (!(precpred(_ctx, 14))) throw new FailedPredicateException(this, "precpred(_ctx, 14)");
						setState(215);
						match(T__35);
						setState(216);
						expr(15);
						}
						break;
					case 6:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(217);
						if (!(precpred(_ctx, 13))) throw new FailedPredicateException(this, "precpred(_ctx, 13)");
						setState(218);
						match(T__36);
						setState(219);
						expr(14);
						}
						break;
					case 7:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(220);
						if (!(precpred(_ctx, 12))) throw new FailedPredicateException(this, "precpred(_ctx, 12)");
						setState(221);
						match(T__37);
						setState(222);
						expr(13);
						}
						break;
					case 8:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(223);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(224);
						((ExprContext)_localctx).op1 = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__38) | (1L << T__39) | (1L << T__40) | (1L << T__41) | (1L << T__42) | (1L << T__43))) != 0)) ) {
							((ExprContext)_localctx).op1 = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(225);
						expr(12);
						}
						break;
					case 9:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(226);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(227);
						((ExprContext)_localctx).op = match(T__44);
						setState(228);
						expr(11);
						}
						break;
					case 10:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(229);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(230);
						((ExprContext)_localctx).op = match(T__45);
						setState(231);
						expr(10);
						}
						break;
					case 11:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(232);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(233);
						match(T__46);
						setState(234);
						expr(0);
						setState(235);
						match(T__47);
						setState(236);
						expr(9);
						}
						break;
					case 12:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(238);
						if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
						setState(239);
						match(T__0);
						setState(240);
						expr(1);
						}
						break;
					case 13:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(241);
						if (!(precpred(_ctx, 22))) throw new FailedPredicateException(this, "precpred(_ctx, 22)");
						setState(246); 
						_errHandler.sync(this);
						_alt = 1;
						do {
							switch (_alt) {
							case 1:
								{
								{
								setState(242);
								((ExprContext)_localctx).opcom = match(T__21);
								setState(243);
								expr(0);
								setState(244);
								match(T__22);
								}
								}
								break;
							default:
								throw new NoViableAltException(this);
							}
							setState(248); 
							_errHandler.sync(this);
							_alt = getInterpreter().adaptivePredict(_input,20,_ctx);
						} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
						}
						break;
					case 14:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(250);
						if (!(precpred(_ctx, 18))) throw new FailedPredicateException(this, "precpred(_ctx, 18)");
						setState(251);
						((ExprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__24 || _la==T__25) ) {
							((ExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
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
				setState(256);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,22,_ctx);
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
		public Token name;
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
			setState(294);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,28,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(257);
				varname();
				setState(258);
				match(T__9);
				setState(259);
				exprs();
				setState(260);
				match(T__10);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(266);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case ID:
					{
					setState(262);
					classname();
					}
					break;
				case T__3:
					{
					setState(263);
					((NewsContext)_localctx).name = match(T__3);
					}
					break;
				case T__6:
					{
					setState(264);
					((NewsContext)_localctx).name = match(T__6);
					}
					break;
				case T__4:
					{
					setState(265);
					((NewsContext)_localctx).name = match(T__4);
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(272); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(268);
						match(T__21);
						setState(269);
						expr(0);
						setState(270);
						match(T__22);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(274); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,24,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(279);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(276);
						match(T__2);
						}
						} 
					}
					setState(281);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
				}
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(286);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case ID:
					{
					setState(282);
					classname();
					}
					break;
				case T__3:
					{
					setState(283);
					((NewsContext)_localctx).name = match(T__3);
					}
					break;
				case T__6:
					{
					setState(284);
					((NewsContext)_localctx).name = match(T__6);
					}
					break;
				case T__4:
					{
					setState(285);
					((NewsContext)_localctx).name = match(T__4);
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(291);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(288);
						match(T__2);
						}
						} 
					}
					setState(293);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
				}
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3=\u012b\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\3\2\7\2(\n\2\f\2\16\2+\13\2\3\2\3\2\3\3\3\3\3\3\5\3\62\n\3"+
		"\3\4\3\4\3\5\3\5\3\5\3\5\5\5:\n\5\3\5\3\5\3\6\3\6\3\7\3\7\5\7B\n\7\3\7"+
		"\7\7E\n\7\f\7\16\7H\13\7\3\b\3\b\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3"+
		"\n\3\n\7\nW\n\n\f\n\16\nZ\13\n\3\n\3\n\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3"+
		"\f\3\f\3\r\3\r\3\r\7\rj\n\r\f\r\16\rm\13\r\5\ro\n\r\3\16\3\16\3\17\3\17"+
		"\7\17u\n\17\f\17\16\17x\13\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\5\20\u0084\n\20\3\20\3\20\3\20\5\20\u0089\n\20\3\20\3\20\5"+
		"\20\u008d\n\20\3\20\3\20\5\20\u0091\n\20\3\20\3\20\3\20\3\20\3\20\5\20"+
		"\u0098\n\20\3\20\3\20\3\20\3\20\5\20\u009e\n\20\3\20\3\20\3\20\3\20\3"+
		"\20\3\20\3\20\3\20\3\20\3\20\5\20\u00aa\n\20\3\21\3\21\3\21\7\21\u00af"+
		"\n\21\f\21\16\21\u00b2\13\21\3\22\3\22\3\22\3\22\5\22\u00b8\n\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\22\3\22\5\22\u00cb\n\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\6\22\u00f9\n\22\r\22\16\22\u00fa\3"+
		"\22\3\22\7\22\u00ff\n\22\f\22\16\22\u0102\13\22\3\23\3\23\3\23\3\23\3"+
		"\23\3\23\3\23\3\23\3\23\5\23\u010d\n\23\3\23\3\23\3\23\3\23\6\23\u0113"+
		"\n\23\r\23\16\23\u0114\3\23\7\23\u0118\n\23\f\23\16\23\u011b\13\23\3\23"+
		"\3\23\3\23\3\23\5\23\u0121\n\23\3\23\7\23\u0124\n\23\f\23\16\23\u0127"+
		"\13\23\5\23\u0129\n\23\3\23\2\3\"\24\2\4\6\b\n\f\16\20\22\24\26\30\32"+
		"\34\36 \"$\2\13\3\2\6\t\3\2\33\34\3\2\35\37\3\2\63\64\3\2\658\3\2 \"\4"+
		"\2\35\35##\3\2$%\3\2).\2\u0158\2)\3\2\2\2\4\61\3\2\2\2\6\63\3\2\2\2\b"+
		"\65\3\2\2\2\n=\3\2\2\2\fA\3\2\2\2\16I\3\2\2\2\20K\3\2\2\2\22M\3\2\2\2"+
		"\24]\3\2\2\2\26_\3\2\2\2\30n\3\2\2\2\32p\3\2\2\2\34r\3\2\2\2\36\u00a9"+
		"\3\2\2\2 \u00ab\3\2\2\2\"\u00ca\3\2\2\2$\u0128\3\2\2\2&(\5\4\3\2\'&\3"+
		"\2\2\2(+\3\2\2\2)\'\3\2\2\2)*\3\2\2\2*,\3\2\2\2+)\3\2\2\2,-\7\2\2\3-\3"+
		"\3\2\2\2.\62\5\26\f\2/\62\5\b\5\2\60\62\5\22\n\2\61.\3\2\2\2\61/\3\2\2"+
		"\2\61\60\3\2\2\2\62\5\3\2\2\2\63\64\7:\2\2\64\7\3\2\2\2\65\66\5\f\7\2"+
		"\669\5\6\4\2\678\7\3\2\28:\5\"\22\29\67\3\2\2\29:\3\2\2\2:;\3\2\2\2;<"+
		"\7\4\2\2<\t\3\2\2\2=>\7:\2\2>\13\3\2\2\2?B\5\16\b\2@B\5\n\6\2A?\3\2\2"+
		"\2A@\3\2\2\2BF\3\2\2\2CE\7\5\2\2DC\3\2\2\2EH\3\2\2\2FD\3\2\2\2FG\3\2\2"+
		"\2G\r\3\2\2\2HF\3\2\2\2IJ\t\2\2\2J\17\3\2\2\2KL\7:\2\2L\21\3\2\2\2MN\7"+
		"\n\2\2NO\5\20\t\2OX\7\13\2\2PQ\7:\2\2QR\7\f\2\2RS\7\r\2\2SW\5\34\17\2"+
		"TW\5\26\f\2UW\5\b\5\2VP\3\2\2\2VT\3\2\2\2VU\3\2\2\2WZ\3\2\2\2XV\3\2\2"+
		"\2XY\3\2\2\2Y[\3\2\2\2ZX\3\2\2\2[\\\7\16\2\2\\\23\3\2\2\2]^\7:\2\2^\25"+
		"\3\2\2\2_`\5\f\7\2`a\5\24\13\2ab\7\f\2\2bc\5\30\r\2cd\7\r\2\2de\5\34\17"+
		"\2e\27\3\2\2\2fk\5\32\16\2gh\7\17\2\2hj\5\32\16\2ig\3\2\2\2jm\3\2\2\2"+
		"ki\3\2\2\2kl\3\2\2\2lo\3\2\2\2mk\3\2\2\2nf\3\2\2\2no\3\2\2\2o\31\3\2\2"+
		"\2pq\5\b\5\2q\33\3\2\2\2rv\7\13\2\2su\5\36\20\2ts\3\2\2\2ux\3\2\2\2vt"+
		"\3\2\2\2vw\3\2\2\2wy\3\2\2\2xv\3\2\2\2yz\7\16\2\2z\35\3\2\2\2{\u00aa\5"+
		"\34\17\2|}\7\20\2\2}~\7\f\2\2~\177\5\"\22\2\177\u0080\7\r\2\2\u0080\u0083"+
		"\5\36\20\2\u0081\u0082\7\21\2\2\u0082\u0084\5\36\20\2\u0083\u0081\3\2"+
		"\2\2\u0083\u0084\3\2\2\2\u0084\u00aa\3\2\2\2\u0085\u0086\7\22\2\2\u0086"+
		"\u0088\7\f\2\2\u0087\u0089\5\"\22\2\u0088\u0087\3\2\2\2\u0088\u0089\3"+
		"\2\2\2\u0089\u008a\3\2\2\2\u008a\u008c\7\4\2\2\u008b\u008d\5\"\22\2\u008c"+
		"\u008b\3\2\2\2\u008c\u008d\3\2\2\2\u008d\u008e\3\2\2\2\u008e\u0090\7\4"+
		"\2\2\u008f\u0091\5\"\22\2\u0090\u008f\3\2\2\2\u0090\u0091\3\2\2\2\u0091"+
		"\u0092\3\2\2\2\u0092\u0093\7\r\2\2\u0093\u00aa\5\36\20\2\u0094\u0095\7"+
		"\23\2\2\u0095\u0097\7\f\2\2\u0096\u0098\5\"\22\2\u0097\u0096\3\2\2\2\u0097"+
		"\u0098\3\2\2\2\u0098\u0099\3\2\2\2\u0099\u009a\7\r\2\2\u009a\u00aa\5\36"+
		"\20\2\u009b\u009d\7\24\2\2\u009c\u009e\5\"\22\2\u009d\u009c\3\2\2\2\u009d"+
		"\u009e\3\2\2\2\u009e\u009f\3\2\2\2\u009f\u00aa\7\4\2\2\u00a0\u00a1\7\25"+
		"\2\2\u00a1\u00aa\7\4\2\2\u00a2\u00a3\7\26\2\2\u00a3\u00aa\7\4\2\2\u00a4"+
		"\u00aa\5\b\5\2\u00a5\u00aa\7\4\2\2\u00a6\u00a7\5\"\22\2\u00a7\u00a8\7"+
		"\4\2\2\u00a8\u00aa\3\2\2\2\u00a9{\3\2\2\2\u00a9|\3\2\2\2\u00a9\u0085\3"+
		"\2\2\2\u00a9\u0094\3\2\2\2\u00a9\u009b\3\2\2\2\u00a9\u00a0\3\2\2\2\u00a9"+
		"\u00a2\3\2\2\2\u00a9\u00a4\3\2\2\2\u00a9\u00a5\3\2\2\2\u00a9\u00a6\3\2"+
		"\2\2\u00aa\37\3\2\2\2\u00ab\u00b0\5\"\22\2\u00ac\u00ad\7\17\2\2\u00ad"+
		"\u00af\5\"\22\2\u00ae\u00ac\3\2\2\2\u00af\u00b2\3\2\2\2\u00b0\u00ae\3"+
		"\2\2\2\u00b0\u00b1\3\2\2\2\u00b1!\3\2\2\2\u00b2\u00b0\3\2\2\2\u00b3\u00b4"+
		"\b\22\1\2\u00b4\u00b5\5\24\13\2\u00b5\u00b7\7\f\2\2\u00b6\u00b8\5 \21"+
		"\2\u00b7\u00b6\3\2\2\2\u00b7\u00b8\3\2\2\2\u00b8\u00b9\3\2\2\2\u00b9\u00ba"+
		"\7\r\2\2\u00ba\u00cb\3\2\2\2\u00bb\u00bc\7\27\2\2\u00bc\u00cb\5$\23\2"+
		"\u00bd\u00be\t\3\2\2\u00be\u00cb\5\"\22\26\u00bf\u00c0\t\4\2\2\u00c0\u00cb"+
		"\5\"\22\25\u00c1\u00cb\5\6\4\2\u00c2\u00cb\7;\2\2\u00c3\u00cb\79\2\2\u00c4"+
		"\u00cb\t\5\2\2\u00c5\u00cb\t\6\2\2\u00c6\u00c7\7\f\2\2\u00c7\u00c8\5\""+
		"\22\2\u00c8\u00c9\7\r\2\2\u00c9\u00cb\3\2\2\2\u00ca\u00b3\3\2\2\2\u00ca"+
		"\u00bb\3\2\2\2\u00ca\u00bd\3\2\2\2\u00ca\u00bf\3\2\2\2\u00ca\u00c1\3\2"+
		"\2\2\u00ca\u00c2\3\2\2\2\u00ca\u00c3\3\2\2\2\u00ca\u00c4\3\2\2\2\u00ca"+
		"\u00c5\3\2\2\2\u00ca\u00c6\3\2\2\2\u00cb\u0100\3\2\2\2\u00cc\u00cd\f\27"+
		"\2\2\u00cd\u00ce\7\32\2\2\u00ce\u00ff\5\"\22\30\u00cf\u00d0\f\23\2\2\u00d0"+
		"\u00d1\t\7\2\2\u00d1\u00ff\5\"\22\24\u00d2\u00d3\f\22\2\2\u00d3\u00d4"+
		"\t\b\2\2\u00d4\u00ff\5\"\22\23\u00d5\u00d6\f\21\2\2\u00d6\u00d7\t\t\2"+
		"\2\u00d7\u00ff\5\"\22\22\u00d8\u00d9\f\20\2\2\u00d9\u00da\7&\2\2\u00da"+
		"\u00ff\5\"\22\21\u00db\u00dc\f\17\2\2\u00dc\u00dd\7\'\2\2\u00dd\u00ff"+
		"\5\"\22\20\u00de\u00df\f\16\2\2\u00df\u00e0\7(\2\2\u00e0\u00ff\5\"\22"+
		"\17\u00e1\u00e2\f\r\2\2\u00e2\u00e3\t\n\2\2\u00e3\u00ff\5\"\22\16\u00e4"+
		"\u00e5\f\f\2\2\u00e5\u00e6\7/\2\2\u00e6\u00ff\5\"\22\r\u00e7\u00e8\f\13"+
		"\2\2\u00e8\u00e9\7\60\2\2\u00e9\u00ff\5\"\22\f\u00ea\u00eb\f\n\2\2\u00eb"+
		"\u00ec\7\61\2\2\u00ec\u00ed\5\"\22\2\u00ed\u00ee\7\62\2\2\u00ee\u00ef"+
		"\5\"\22\13\u00ef\u00ff\3\2\2\2\u00f0\u00f1\f\3\2\2\u00f1\u00f2\7\3\2\2"+
		"\u00f2\u00ff\5\"\22\3\u00f3\u00f8\f\30\2\2\u00f4\u00f5\7\30\2\2\u00f5"+
		"\u00f6\5\"\22\2\u00f6\u00f7\7\31\2\2\u00f7\u00f9\3\2\2\2\u00f8\u00f4\3"+
		"\2\2\2\u00f9\u00fa\3\2\2\2\u00fa\u00f8\3\2\2\2\u00fa\u00fb\3\2\2\2\u00fb"+
		"\u00ff\3\2\2\2\u00fc\u00fd\f\24\2\2\u00fd\u00ff\t\3\2\2\u00fe\u00cc\3"+
		"\2\2\2\u00fe\u00cf\3\2\2\2\u00fe\u00d2\3\2\2\2\u00fe\u00d5\3\2\2\2\u00fe"+
		"\u00d8\3\2\2\2\u00fe\u00db\3\2\2\2\u00fe\u00de\3\2\2\2\u00fe\u00e1\3\2"+
		"\2\2\u00fe\u00e4\3\2\2\2\u00fe\u00e7\3\2\2\2\u00fe\u00ea\3\2\2\2\u00fe"+
		"\u00f0\3\2\2\2\u00fe\u00f3\3\2\2\2\u00fe\u00fc\3\2\2\2\u00ff\u0102\3\2"+
		"\2\2\u0100\u00fe\3\2\2\2\u0100\u0101\3\2\2\2\u0101#\3\2\2\2\u0102\u0100"+
		"\3\2\2\2\u0103\u0104\5\6\4\2\u0104\u0105\7\f\2\2\u0105\u0106\5 \21\2\u0106"+
		"\u0107\7\r\2\2\u0107\u0129\3\2\2\2\u0108\u010d\5\20\t\2\u0109\u010d\7"+
		"\6\2\2\u010a\u010d\7\t\2\2\u010b\u010d\7\7\2\2\u010c\u0108\3\2\2\2\u010c"+
		"\u0109\3\2\2\2\u010c\u010a\3\2\2\2\u010c\u010b\3\2\2\2\u010d\u0112\3\2"+
		"\2\2\u010e\u010f\7\30\2\2\u010f\u0110\5\"\22\2\u0110\u0111\7\31\2\2\u0111"+
		"\u0113\3\2\2\2\u0112\u010e\3\2\2\2\u0113\u0114\3\2\2\2\u0114\u0112\3\2"+
		"\2\2\u0114\u0115\3\2\2\2\u0115\u0119\3\2\2\2\u0116\u0118\7\5\2\2\u0117"+
		"\u0116\3\2\2\2\u0118\u011b\3\2\2\2\u0119\u0117\3\2\2\2\u0119\u011a\3\2"+
		"\2\2\u011a\u0129\3\2\2\2\u011b\u0119\3\2\2\2\u011c\u0121\5\20\t\2\u011d"+
		"\u0121\7\6\2\2\u011e\u0121\7\t\2\2\u011f\u0121\7\7\2\2\u0120\u011c\3\2"+
		"\2\2\u0120\u011d\3\2\2\2\u0120\u011e\3\2\2\2\u0120\u011f\3\2\2\2\u0121"+
		"\u0125\3\2\2\2\u0122\u0124\7\5\2\2\u0123\u0122\3\2\2\2\u0124\u0127\3\2"+
		"\2\2\u0125\u0123\3\2\2\2\u0125\u0126\3\2\2\2\u0126\u0129\3\2\2\2\u0127"+
		"\u0125\3\2\2\2\u0128\u0103\3\2\2\2\u0128\u010c\3\2\2\2\u0128\u0120\3\2"+
		"\2\2\u0129%\3\2\2\2\37)\619AFVXknv\u0083\u0088\u008c\u0090\u0097\u009d"+
		"\u00a9\u00b0\u00b7\u00ca\u00fa\u00fe\u0100\u010c\u0114\u0119\u0120\u0125"+
		"\u0128";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}