%{
#include <stdio.h>
%}

%option noyywrap

DIGITO  [0-9]+
ID      [a-zA-Z_][a-zA-Z0-9_]*
POTENCIA {ID}"\*\*"{DIGITO}

%%

"lambda"           { /* Detecta la palabra clave lambda */ }
{ID}               { /* Ignora identificador */ }
":"                { /* Ignora separador */ }
{POTENCIA}         { /* Detecta la expresión de potencia */ return 1; }

.|\n               { return 0; }

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Por favor, proporcione un archivo de entrada.\n");
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("No se pudo abrir el archivo %s\n", argv[1]);
        return 1;
    }

    yyin = file;
    int result = yylex();
    if (result) {
        printf("ACEPTA\n");
    } else {
        printf("NO ACEPTA\n");
    }

    fclose(file);
    return 0;
}

