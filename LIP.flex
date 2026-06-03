import java_cup.runtime.*;

%%

%class scanner
%unicode
%cup
%state COMENT

Especial = [$]
Letra = [a-zA-Z]
Digito = [0-9]
Numero = {Digito}{Digito}*
Ident = {Letra}({Letra}|{Digito})*

Kw_If = if
Kw_Else = else
Kw_While = while
Kw_Return = return
Kw_Const = const
Kw_Var = var

Op_add = \+
Op_sub = \-
Op_mult = \*
Op_div = \/
Op_igual = =
Op_diferente = ,=

Lim_Pe = \(
Lim_Pd = \)
Lim_aspa = "'"
Lim_coment = "<c>"

StringLiteral = \'[^\']*\'


%%
{Kw_If}     {return new Symbol(sym.IF);}
{Kw_Else}   {return new Symbol(sym.ELSE);}
{Kw_While}  {return new Symbol(sym.WHILE);}
{Kw_Return} {return new Symbol(sym.RETURN);}
{Kw_Const}  {return new Symbol(sym.CONST);}
{Kw_Var}    {return new Symbol(sym.VAR);}

{Ident} {return new Symbol(sym.IDENT, yytext());}

{Numero} {return new Symbol(sym.NUMERO, Integer.parseInt(yytext()));}

[ \t\r\n]+ {}

{Op_add} {return new Symbol(sym.ADD);}

{Op_sub} {return new Symbol(sym.SUB);}

{Op_mult} {return new Symbol(sym.MULT);}

{Op_div} {return new Symbol(sym.DIV);}

{Op_igual} {return new Symbol(sym.IGUAL);}

{Op_diferente} {return new Symbol(sym.DIFERENTE);}

{Lim_Pe} {return new Symbol(sym.LPAREN);}

{Lim_Pd} {return new Symbol(sym.RPAREN);}

{Lim_aspa} {return new Symbol(sym.ASPA);}

{Lim_coment} {yybegin(COMENT);}

{Especial} {return new Symbol(sym.ESPECIAL);}

{StringLiteral} {
    return new Symbol(
        sym.STRING,
        yytext().substring(
            1,
            yytext().length()-1
        )
    );
}

. {System.err.println("Erro léxico: " + yytext());}

<COMENT> {

    {Lim_coment} {
        yybegin(YYINITIAL);
    }

    .|\n {
        /* ignora tudo */
    }

}