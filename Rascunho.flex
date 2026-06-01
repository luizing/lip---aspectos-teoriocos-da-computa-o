%%
%standalone

Letra = [a-zA-Z]
Digito = [0-9]
Especial = [ç#]
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
Op_diferente = '=

Lim_Pe = \(
Lim_Pd = \)
Lim_aspa = "'"
Lim_coment = "<c>"


%%
{Kw_If}     { System.out.println("<if>"); }
{Kw_Else}   { System.out.println("<else>"); }
{Kw_While}  { System.out.println("<while>"); }
{Kw_Return} { System.out.println("<return>"); }
{Kw_Const}  { System.out.println("<const>"); }
{Kw_Var}    { System.out.println("<var>"); }

{Ident} {System.out.print("<identificador>");}
{Numero} {System.out.print("<numero>");}
{Especial} {System.out.print("<especial>");}
[ \t\r\n]+ {/* ignora espaços */}

{Op_add} {System.out.println("<op_add>");}
{Op_sub} {System.out.println("<op_sub>");}
{Op_mult} {System.out.println("<op_mult>");}
{Op_div} {System.out.println("<op_div>");}
{Op_igual} {System.out.println("<op_igual>");}
{Op_diferente} {System.out.println("<op_diferente>");}
{Lim_Pe} {System.out.println("<paren_esq>");}
{Lim_Pd} {System.out.println("<paren_dir>");}
{Lim_aspa} {System.out.println("<aspa>");}
{Lim_coment} {System.out.println("<lim_coment>");}

. {System.out.println("<erro> " + yytext());}