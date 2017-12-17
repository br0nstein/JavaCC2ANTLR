lexer grammar JavaLexer;

SPACE : [ \t\f\u0085\u00A0\u1680\u180E\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200A\u200B\u200C\u200D\u2028\u2029\u202F\u205F\u2060\u3000\uFEFF] -> skip ;
WINDOWS_EOL : '\r\n' -> skip ;
UNIX_EOL : '\n' -> skip ;
OLD_MAC_EOL : '\r' -> skip ;
SINGLE_LINE_COMMENT : '//' (~[\n\r])* ('\n' | '\r' | '\r\n')? -> skip ;
ENTER_JAVADOC_COMMENT : '/**' ~[/] -> pushMode(IN_JAVADOC_COMMENT) ;
ENTER_MULTILINE_COMMENT : '/*' -> pushMode(IN_MULTI_LINE_COMMENT) ;
ABSTRACT : 'abstract'  ;
ASSERT : 'assert'  ;
BOOLEAN : 'boolean'  ;
BREAK : 'break'  ;
BYTE : 'byte'  ;
CASE : 'case'  ;
CATCH : 'catch'  ;
CHAR : 'char'  ;
CLASS : 'class'  ;
CONST : 'const'  ;
CONTINUE : 'continue'  ;
US__DEFAULT : 'default'  ;
DO : 'do'  ;
DOUBLE : 'double'  ;
ELSE : 'else'  ;
ENUM : 'enum'  ;
EXTENDS : 'extends'  ;
FALSE : 'false'  ;
FINAL : 'final'  ;
FINALLY : 'finally'  ;
FLOAT : 'float'  ;
FOR : 'for'  ;
GOTO : 'goto'  ;
IF : 'if'  ;
IMPLEMENTS : 'implements'  ;
IMPORT : 'import'  ;
INSTANCEOF : 'instanceof'  ;
INT : 'int'  ;
INTERFACE : 'interface'  ;
LONG : 'long'  ;
NATIVE : 'native'  ;
NEW : 'new'  ;
NULL : 'null'  ;
PACKAGE : 'package'  ;
PRIVATE : 'private'  ;
PROTECTED : 'protected'  ;
PUBLIC : 'public'  ;
RETURN : 'return'  ;
SHORT : 'short'  ;
STATIC : 'static'  ;
STRICTFP : 'strictfp'  ;
SUPER : 'super'  ;
SWITCH : 'switch'  ;
SYNCHRONIZED : 'synchronized'  ;
THIS : 'this'  ;
THROW : 'throw'  ;
THROWS : 'throws'  ;
TRANSIENT : 'transient'  ;
TRUE : 'true'  ;
TRY : 'try'  ;
VOID : 'void'  ;
VOLATILE : 'volatile'  ;
WHILE : 'while'  ;
REQUIRES : 'requires'  ;
TO : 'to'  ;
WITH : 'with'  ;
OPEN : 'open'  ;
OPENS : 'opens'  ;
USES : 'uses'  ;
MODULE : 'module'  ;
EXPORTS : 'exports'  ;
PROVIDES : 'provides'  ;
TRANSITIVE : 'transitive'  ;
LONG_LITERAL : DECIMAL_LITERAL [lL] | HEX_LITERAL [lL] | OCTAL_LITERAL [lL] | BINARY_LITERAL [lL]  ;
INTEGER_LITERAL : DECIMAL_LITERAL | HEX_LITERAL | OCTAL_LITERAL | BINARY_LITERAL  ;
DECIMAL_LITERAL : [0-9] (([0-9_])* [0-9])?  ;
HEX_LITERAL : '0' [xX] HEX_DIGITS  ;
OCTAL_LITERAL : '0' [0-7] (([0-7_])* [0-7])?  ;
BINARY_LITERAL : '0' [bB] [01] (([01_])* [01])?  ;
FLOATING_POINT_LITERAL : DECIMAL_FLOATING_POINT_LITERAL | HEXADECIMAL_FLOATING_POINT_LITERAL  ;
DECIMAL_FLOATING_POINT_LITERAL : DECIMAL_LITERAL '.' (DECIMAL_LITERAL)? (DECIMAL_EXPONENT)? ([fFdD])? | '.' DECIMAL_LITERAL (DECIMAL_EXPONENT)? ([fFdD])? | DECIMAL_LITERAL DECIMAL_EXPONENT ([fFdD])? | DECIMAL_LITERAL (DECIMAL_EXPONENT)? [fFdD]  ;
DECIMAL_EXPONENT : [eE] ([+-])? (DECIMAL_LITERAL)+  ;
HEXADECIMAL_FLOATING_POINT_LITERAL : HEX_LITERAL ('.')? HEXADECIMAL_EXPONENT ([fFdD])? | '0' [xX] (HEX_DIGITS)? '.' HEX_DIGITS HEXADECIMAL_EXPONENT ([fFdD])?  ;
HEXADECIMAL_EXPONENT : [pP] ([+-])? DECIMAL_LITERAL  ;
HEX_DIGITS : [0-9a-fA-F] (([0-9a-fA-F_])* [0-9a-fA-F])?  ;
UNICODE_ESCAPE : '\\u' [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f]  ;
CHARACTER_LITERAL : '\'' ~['\\\n\r] | '\\' [ntbrf\\'"] | [0-7] ([0-7])? | [0-3] [0-7] [0-7] | UNICODE_ESCAPE '\''  ;
STRING_LITERAL : '"' (~["\\\n\r] | '\\' [ntbrf\\'"] | [0-7] ([0-7])? | [0-3] [0-7] [0-7] | '\\u' [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f])* '"'  ;
IDENTIFIER : LETTER (PART_LETTER)*  ;
LETTER : [$A-Z_a-z¢-¥ªµºÀ-ÖØ-öø-ˁˆ-ˑˠ-ˤˬˮͰ-ʹͶ-ͷͺ-ͽΆΈ-ΊΌΎ-ΡΣ-ϵϷ-ҁҊ-ԧԱ-Ֆՙա-և֏א-תװ-ײ؋ؠ-يٮ-ٯٱ-ۓەۥ-ۦۮ-ۯۺ-ۼۿܐܒ-ܯݍ-ޥޱߊ-ߪߴ-ߵߺࠀ-ࠕࠚࠤࠨࡀ-ࡘࢠࢢ-ࢬऄ-हऽॐक़-ॡॱ-ॷॹ-ॿঅ-ঌএ-ঐও-নপ-রলশ-হঽৎড়-ঢ়য়-ৡৰ-৳৻ਅ-ਊਏ-ਐਓ-ਨਪ-ਰਲ-ਲ਼ਵ-ਸ਼ਸ-ਹਖ਼-ੜਫ਼ੲ-ੴઅ-ઍએ-ઑઓ-નપ-રલ-ળવ-હઽૐૠ-ૡ૱ଅ-ଌଏ-ଐଓ-ନପ-ରଲ-ଳଵ-ହଽଡ଼-ଢ଼ୟ-ୡୱஃஅ-ஊஎ-ஐஒ-கங-சஜஞ-டண-தந-பம-ஹௐ௹అ-ఌఎ-ఐఒ-నప-ళవ-హఽౘ-ౙౠ-ౡಅ-ಌಎ-ಐಒ-ನಪ-ಳವ-ಹಽೞೠ-ೡೱ-ೲഅ-ഌഎ-ഐഒ-ഺഽൎൠ-ൡൺ-ൿඅ-ඖක-නඳ-රලව-ෆก-ะา-ำ฿-ๆກ-ຂຄງ-ຈຊຍດ-ທນ-ຟມ-ຣລວສ-ຫອ-ະາ-ຳຽເ-ໄໆໜ-ໟༀཀ-ཇཉ-ཬྈ-ྌက-ဪဿၐ-ၕၚ-ၝၡၥ-ၦၮ-ၰၵ-ႁႎႠ-ჅჇჍა-ჺჼ-ቈቊ-ቍቐ-ቖቘቚ-ቝበ-ኈኊ-ኍነ-ኰኲ-ኵኸ-ኾዀዂ-ዅወ-ዖዘ-ጐጒ-ጕጘ-ፚᎀ-ᎏᎠ-Ᏼᐁ-ᙬᙯ-ᙿᚁ-ᚚᚠ-ᛪᛮ-ᛰᜀ-ᜌᜎ-ᜑᜠ-ᜱᝀ-ᝑᝠ-ᝬᝮ-ᝰក-ឳៗ៛-ៜᠠ-ᡷᢀ-ᢨᢪᢰ-ᣵᤀ-ᤜᥐ-ᥭᥰ-ᥴᦀ-ᦫᧁ-ᧇᨀ-ᨖᨠ-ᩔᪧᬅ-ᬳᭅ-ᭋᮃ-ᮠᮮ-ᮯᮺ-ᯥᰀ-ᰣᱍ-ᱏᱚ-ᱽᳩ-ᳬᳮ-ᳱᳵ-ᳶᴀ-ᶿḀ-ἕἘ-Ἕἠ-ὅὈ-Ὅὐ-ὗὙὛὝὟ-ώᾀ-ᾴᾶ-ᾼιῂ-ῄῆ-ῌῐ-ΐῖ-Ίῠ-Ῥῲ-ῴῶ-ῼ‿-⁀⁔ⁱⁿₐ-ₜ₠-₺ℂℇℊ-ℓℕℙ-ℝℤΩℨK-ℭℯ-ℹℼ-ℿⅅ-ⅉⅎⅠ-ↈⰀ-Ⱞⰰ-ⱞⱠ-ⳤⳫ-ⳮⳲ-ⳳⴀ-ⴥⴧⴭⴰ-ⵧⵯⶀ-ⶖⶠ-ⶦⶨ-ⶮⶰ-ⶶⶸ-ⶾⷀ-ⷆⷈ-ⷎⷐ-ⷖⷘ-ⷞⸯ々-〇〡-〩〱-〵〸-〼ぁ-ゖゝ-ゟァ-ヺー-ヿㄅ-ㄭㄱ-ㆎㆠ-ㆺㇰ-ㇿ㐀-䶵一-鿌ꀀ-ꒌꓐ-ꓽꔀ-ꘌꘐ-ꘟꘪ-ꘫꙀ-ꙮꙿ-ꚗꚠ-ꛯꜗ-ꜟꜢ-ꞈꞋ-ꞎꞐ-ꞓꞠ-Ɦꟸ-ꠁꠃ-ꠅꠇ-ꠊꠌ-ꠢ꠸ꡀ-ꡳꢂ-ꢳꣲ-ꣷꣻꤊ-ꤥꤰ-ꥆꥠ-ꥼꦄ-ꦲꧏꨀ-ꨨꩀ-ꩂꩄ-ꩋꩠ-ꩶꩺꪀ-ꪯꪱꪵ-ꪶꪹ-ꪽꫀꫂꫛ-ꫝꫠ-ꫪꫲ-ꫴꬁ-ꬆꬉ-ꬎꬑ-ꬖꬠ-ꬦꬨ-ꬮꯀ-ꯢ가-힣ힰ-ퟆퟋ-ퟻ?-?豈-舘並-龎ﬀ-ﬆﬓ-ﬗיִײַ-ﬨשׁ-זּטּ-לּמּנּ-סּףּ-פּצּ-ﮱﯓ-ﴽﵐ-ﶏﶒ-ﷇﷰ-﷼︳-︴﹍-﹏﹩ﹰ-ﹴﹶ-ﻼ＄Ａ-Ｚ＿ａ-ｚｦ-ﾾￂ-ￇￊ-ￏￒ-ￗￚ-ￜ￠-￡￥-￦] | UNICODE_ESCAPE  ;
PART_LETTER : [ --$0-9A-Z_a-z-¢-¥ª\u00ADµºÀ-ÖØ-öø-ˁˆ-ˑˠ-ˤˬˮ̀-ʹͶ-ͷͺ-ͽΆΈ-ΊΌΎ-ΡΣ-ϵϷ-ҁ҃-҇Ҋ-ԧԱ-Ֆՙա-և֏֑-ֽֿׁ-ׂׄ-ׇׅא-תװ-ײ؀-؄؋ؐ-ؚؠ-٩ٮ-ۓە-۝۟-۪ۨ-ۼۿ܏-݊ݍ-ޱ߀-ߵߺࠀ-࠭ࡀ-࡛ࢠࢢ-ࢬࣤ-ࣾऀ-ॣ०-९ॱ-ॷॹ-ॿঁ-ঃঅ-ঌএ-ঐও-নপ-রলশ-হ়-ৄে-ৈো-ৎৗড়-ঢ়য়-ৣ০-৳৻ਁ-ਃਅ-ਊਏ-ਐਓ-ਨਪ-ਰਲ-ਲ਼ਵ-ਸ਼ਸ-ਹ਼ਾ-ੂੇ-ੈੋ-੍ੑਖ਼-ੜਫ਼੦-ੵઁ-ઃઅ-ઍએ-ઑઓ-નપ-રલ-ળવ-હ઼-ૅે-ૉો-્ૐૠ-ૣ૦-૯૱ଁ-ଃଅ-ଌଏ-ଐଓ-ନପ-ରଲ-ଳଵ-ହ଼-ୄେ-ୈୋ-୍ୖ-ୗଡ଼-ଢ଼ୟ-ୣ୦-୯ୱஂ-ஃஅ-ஊஎ-ஐஒ-கங-சஜஞ-டண-தந-பம-ஹா-ூெ-ைொ-்ௐௗ௦-௯௹ఁ-ఃఅ-ఌఎ-ఐఒ-నప-ళవ-హఽ-ౄె-ైొ-్ౕ-ౖౘ-ౙౠ-ౣ౦-౯ಂ-ಃಅ-ಌಎ-ಐಒ-ನಪ-ಳವ-ಹ಼-ೄೆ-ೈೊ-್ೕ-ೖೞೠ-ೣ೦-೯ೱ-ೲം-ഃഅ-ഌഎ-ഐഒ-ഺഽ-ൄെ-ൈൊ-ൎൗൠ-ൣ൦-൯ൺ-ൿං-ඃඅ-ඖක-නඳ-රලව-ෆ්ා-ුූෘ-ෟෲ-ෳก-ฺ฿-๎๐-๙ກ-ຂຄງ-ຈຊຍດ-ທນ-ຟມ-ຣລວສ-ຫອ-ູົ-ຽເ-ໄໆ່-ໍ໐-໙ໜ-ໟༀ༘-༙༠-༩༹༵༷༾-ཇཉ-ཬཱ-྄྆-ྗྙ-ྼ࿆က-၉ၐ-ႝႠ-ჅჇჍა-ჺჼ-ቈቊ-ቍቐ-ቖቘቚ-ቝበ-ኈኊ-ኍነ-ኰኲ-ኵኸ-ኾዀዂ-ዅወ-ዖዘ-ጐጒ-ጕጘ-ፚ፝-፟ᎀ-ᎏᎠ-Ᏼᐁ-ᙬᙯ-ᙿᚁ-ᚚᚠ-ᛪᛮ-ᛰᜀ-ᜌᜎ-᜔ᜠ-᜴ᝀ-ᝓᝠ-ᝬᝮ-ᝰᝲ-ᝳក-៓ៗ៛-៝០-៩᠋-᠍᠐-᠙ᠠ-ᡷᢀ-ᢪᢰ-ᣵᤀ-ᤜᤠ-ᤫᤰ-᤻᥆-ᥭᥰ-ᥴᦀ-ᦫᦰ-ᧉ᧐-᧙ᨀ-ᨛᨠ-ᩞ᩠-᩿᩼-᪉᪐-᪙ᪧᬀ-ᭋ᭐-᭙᭫-᭳ᮀ-᯳ᰀ-᰷᱀-᱉ᱍ-ᱽ᳐-᳔᳒-ᳶᴀ-ᷦ᷼-ἕἘ-Ἕἠ-ὅὈ-Ὅὐ-ὗὙὛὝὟ-ώᾀ-ᾴᾶ-ᾼιῂ-ῄῆ-ῌῐ-ΐῖ-Ίῠ-Ῥῲ-ῴῶ-ῼ​-‏‪-‮‿-⁀⁔⁠-⁤⁪-⁯ⁱⁿₐ-ₜ₠-₺⃐-⃥⃜⃡-⃰ℂℇℊ-ℓℕℙ-ℝℤΩℨK-ℭℯ-ℹℼ-ℿⅅ-ⅉⅎⅠ-ↈⰀ-Ⱞⰰ-ⱞⱠ-ⳤⳫ-ⳳⴀ-ⴥⴧⴭⴰ-ⵧⵯ⵿-ⶖⶠ-ⶦⶨ-ⶮⶰ-ⶶⶸ-ⶾⷀ-ⷆⷈ-ⷎⷐ-ⷖⷘ-ⷞⷠ-ⷿⸯ々-〇〡-〯〱-〵〸-〼ぁ-ゖ゙-゚ゝ-ゟァ-ヺー-ヿㄅ-ㄭㄱ-ㆎㆠ-ㆺㇰ-ㇿ㐀-䶵一-鿌ꀀ-ꒌꓐ-ꓽꔀ-ꘌꘐ-ꘫꙀ-꙯ꙴ-꙽ꙿ-ꚗꚟ-꛱ꜗ-ꜟꜢ-ꞈꞋ-ꞎꞐ-ꞓꞠ-Ɦꟸ-ꠧ꠸ꡀ-ꡳꢀ-꣄꣐-꣙꣠-ꣷꣻ꤀-꤭ꤰ-꥓ꥠ-ꥼꦀ-꧀ꧏ-꧙ꨀ-ꨶꩀ-ꩍ꩐-꩙ꩠ-ꩶꩺ-ꩻꪀ-ꫂꫛ-ꫝꫠ-ꫯꫲ-꫶ꬁ-ꬆꬉ-ꬎꬑ-ꬖꬠ-ꬦꬨ-ꬮꯀ-ꯪ꯬-꯭꯰-꯹가-힣ힰ-ퟆퟋ-ퟻ?-?豈-舘並-龎ﬀ-ﬆﬓ-ﬗיִ-ﬨשׁ-זּטּ-לּמּנּ-סּףּ-פּצּ-ﮱﯓ-ﴽﵐ-ﶏﶒ-ﷇﷰ-﷼︀-️︠-︦︳-︴﹍-﹏﹩ﹰ-ﹴﹶ-ﻼ\uFEFF＄０-９Ａ-Ｚ＿ａ-ｚｦ-ﾾￂ-ￇￊ-ￏￒ-ￗￚ-ￜ￠-￡￥-￦￹-￻] | UNICODE_ESCAPE  ;
LPAREN : '('  ;
RPAREN : ')'  ;
LBRACE : '{'  ;
RBRACE : '}'  ;
LBRACKET : '['  ;
RBRACKET : ']'  ;
SEMICOLON : ';'  ;
COMMA : ','  ;
DOT : '.'  ;
AT : '@'  ;
ASSIGN : '='  ;
LT : '<'  ;
BANG : '!'  ;
TILDE : '~'  ;
HOOK : '?'  ;
COLON : ':'  ;
EQ : '=='  ;
LE : '<='  ;
GE : '>='  ;
NE : '!='  ;
SC_OR : '||'  ;
SC_AND : '&&'  ;
INCR : '++'  ;
DECR : '--'  ;
PLUS : '+'  ;
MINUS : '-'  ;
STAR : '*'  ;
SLASH : '/'  ;
BIT_AND : '&'  ;
BIT_OR : '|'  ;
XOR : '^'  ;
REM : '%'  ;
LSHIFT : '<<'  ;
PLUSASSIGN : '+='  ;
MINUSASSIGN : '-='  ;
STARASSIGN : '*='  ;
SLASHASSIGN : '/='  ;
ANDASSIGN : '&='  ;
ORASSIGN : '|='  ;
XORASSIGN : '^='  ;
REMASSIGN : '%='  ;
LSHIFTASSIGN : '<<='  ;
RSIGNEDSHIFTASSIGN : '>>='  ;
RUNSIGNEDSHIFTASSIGN : '>>>='  ;
ELLIPSIS : '...'  ;
ARROW : '->'  ;
DOUBLECOLON : '::'  ;
RUNSIGNEDSHIFT : '>>>'  ;
RSIGNEDSHIFT : '>>'  ;
GT : '>'  ;
CTRL_Z : '\u001A'  ;

mode IN_JAVADOC_COMMENT;
IN_JAVADOC_COMMENT_JAVADOC_COMMENT : '*/' -> popMode ;
IN_JAVADOC_COMMENT_COMMENT_CONTENT : .  ;

mode IN_MULTI_LINE_COMMENT;
IN_MULTI_LINE_COMMENT_MULTI_LINE_COMMENT : '*/' -> popMode ;
IN_MULTI_LINE_COMMENT_COMMENT_CONTENT : .  ;
