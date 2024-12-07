/* 
  Objetivo: Escribir en la salida estandar de la tabla de caracteres ASCII que se este utilizando.
*/

List<String> generateAsciiTable() {
  List<String> asciiTable = [];
  for (int i = 0; i < 256; i++) {
    asciiTable.add("$i: ${String.fromCharCode(i)}");
  }
  return asciiTable;
}


