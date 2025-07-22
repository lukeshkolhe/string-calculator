class Calculator {
  int add(String numbers) {
    
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
