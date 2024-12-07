class FactorialCalculator {
  
  int calculateFactorial(int number) {
    if (number < 0) {
      throw ArgumentError("No existe el factorial de un número negativo.");
    }
    int factorial = 1;

    for (number; number>0; number--) {
      factorial *= number;
    }

    return factorial;
  }
}
