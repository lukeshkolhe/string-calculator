class Calculator {
  int add(String numbers) {
    // if the string is empty, return 0
    if (numbers.isEmpty) {
      return 0;
    }
    
    final List<int> numberList = [];
    // split the string by commas
    final List<String> numberSeperatedByComma = numbers.split(',');

    for (String string in numberSeperatedByComma) {

    // split the string by new line
      final List<String> numberSeperatedByNewLine = string.split('\n');

      // add the final numbers to the number list
      for (String number in numberSeperatedByNewLine) { 
        numberList.add(int.parse(number));
      }
    }

    int sum = 0;

    // add the numbers to the sum
    for (int number in numberList) {
      sum += number;
    }
    
    return sum;
  }
}
