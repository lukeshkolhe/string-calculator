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

    test('handle new lines between numbers (instead of commas)', () {
      final calculator = Calculator();
      expect(calculator.add("1\n2,3"), equals(6));
    });

    test('handle different delimiters', () {
      final calculator = Calculator();
      expect(calculator.add("//;\n1;2"), equals(3));
    });

    test('throw an exception: "negative numbers not allowed <negative_number>"', () {
      final calculator = Calculator();
      expect(() => calculator.add("-1"), throwsA(isA<Exception>()));
      expect(() => calculator.add("1,-2"), throwsA(isA<Exception>()));
      expect(() => calculator.add("1,-2,-3"), throwsA(isA<Exception>()));
    });

  });
}