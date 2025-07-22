class Calculator {
  int add(String numbers) {
    // if the string is empty, return 0
    if (numbers.isEmpty) {
      return 0;
    }
    
    // split the string by commas and parse numbers
    List<int> numberList = numbers.split(',').map(int.parse).toList();

    int sum = 0;

    // add the numbers to the sum
    for (int number in numberList) {
      sum += number;
    }
    
    return sum;
  }
}
