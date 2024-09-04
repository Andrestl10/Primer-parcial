#!/usr/bin/awk -f

{
    # Recorrer cada línea del archivo
    for (i = 1; i <= NF; i++) {
        # Expresión para token "SUMA"
        if ($i == "+") {
            print $i, "SUMA"
        }
        # Expresión para token "INCR"
        else if ($i == "++") {
            print $i, "INCR"
        }
        # Expresión para token "ENTERO"
        else if ($i ~ /^[0-9]+$/) {
            print $i, "ENTERO"
        }
        # Expresión para token "REAL"
        else if ($i ~ /^[0-9]+\.[0-9]+$/) {
            print $i, "REAL"
        }
        else {
            print $i, "TOKEN DESCONOCIDO"
        }
    }
}
