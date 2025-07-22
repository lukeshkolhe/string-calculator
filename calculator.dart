class Calculator {
  int add(String numbers) {
    
    List<String> numberList = numbers.split(',');
    int sum = 0;
    
    for (String number in numberList) {
      sum += int.parse(number);
    }
    
    return sum;
  }
}
