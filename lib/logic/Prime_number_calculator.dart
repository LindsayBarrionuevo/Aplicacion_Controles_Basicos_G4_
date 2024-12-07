import 'dart:math';
class PrimeNumberCalculator {

  List<int> generatePrimes(int start, int end) {
    List<int> primes = [];

    for (int number = start; number <= end; number++) {
      if (_isPrime(number)) {
        primes.add(number);
      }
    }

    return primes;
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    int sqrtNumber = sqrt(number).toInt(); 

    for (int i = 2; i <= sqrtNumber; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }
}
