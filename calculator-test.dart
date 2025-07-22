import 'package:test/test.dart';
import 'calculator.dart';

void main() {
  group('Calculator Tests', () {
    test('sum of numbers in a string', () {
      final calculator = Calculator();
      expect(calculator.add("1,2"), equals(3));
      expect(calculator.add("10,20,30"), equals(60));
    });

    test('empty string returns 0', () {
      final calculator = Calculator();
      expect(calculator.add(""), equals(0));
    });

    test('single number returns the number itself', () {
      final calculator = Calculator();
      expect(calculator.add("5"), equals(5));
    });

  });
}