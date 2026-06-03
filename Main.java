import java.io.*;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        try {

            // Modo arquivo
            if (args.length > 0) {

                FileReader reader =
                    new FileReader(args[0]);

                scanner lexer =
                    new scanner(reader);

                parser parser =
                    new parser(lexer);

                parser.parse();

                return;
            }

            // Modo interativo
            System.out.println("LIP Interpreter");
            System.out.println("Digite 'exit' para sair.");

            Scanner teclado =
                new Scanner(System.in);

            while (true) {

                System.out.print("> ");

                String linha =
                    teclado.nextLine();

                if (linha.equals("exit")) {
                    break;
                }

                try {

                    scanner lexer =
                        new scanner(
                            new StringReader(linha)
                        );

                    parser parser =
                        new parser(lexer);

                    parser.parse();

                }
                catch (Exception e) {

                    System.out.println(
                        "Erro ao interpretar comando."
                    );
                }
            }

            teclado.close();

        }
        catch (Exception e) {

            e.printStackTrace();
        }
    }
}