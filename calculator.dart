class Calculator {
  int add(String numbers) {
    // if the string is empty, return 0
    if (numbers.isEmpty) {
      return 0;
    }

    // if the string starts with //, the delimiter is the character after the //
    final String? delimiter;
    if (numbers.startsWith('//')) {
      // extract the delimiter
      delimiter = numbers.substring(2, 3);

      // remove the delimiter and the new line from the numbers string
      numbers = numbers.substring(4);
    } else {
      delimiter = null;
    }
    
    // split the string by commas and new lines or the delimiter using regex and parse numbers
    List<int> numberList;
    if (delimiter != null) {
      numberList = numbers.split(RegExp('[,\\n${RegExp.escape(delimiter)}]')).map(int.parse).toList();
    } else {
      numberList = numbers.split(RegExp(r'[,\n]')).map(int.parse).toList();
    }

    // check for negative numbers
    final List<int> negativeNumbers = [];
    for (int number in numberList) {
      if (number < 0) {
        negativeNumbers.add(number);
      }
    }

    // throw an exception if there are negative numbers
    if (negativeNumbers.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negativeNumbers.join(',')}');
    }


    int sum = 0;

    // add the numbers to the sum
    for (int number in numberList) {
      sum += number;
    }
    
    return sum;
  }
}
