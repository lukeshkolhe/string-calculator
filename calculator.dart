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
      numberList = extractNumbers(numbers, delimiter!);
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

  List<int> extractNumbers(String string, String delimiter) {
    // final stringNumberList = string.split(RegExp('[,\\n${RegExp.escape(delimiter)}]'));
    // final numberList = stringNumberList.map(int.parse).toList();
    String leftOver = string;
    final List<int> numberList = [];
    String currentString = '';
    while(leftOver.isNotEmpty) {
      if(leftOver.substring(0,1) == delimiter) {
        if(delimiter == '-' && currentString.isEmpty) {
          currentString = '-';
        } else {
          numberList.add(int.parse(currentString));
          currentString = '';
        }
      } else {
        currentString += leftOver.substring(0,1);
      }
      leftOver = leftOver.substring(1);
      print('curr: $currentString, leftOver: $leftOver');
    }
    if(currentString.isNotEmpty) {
      numberList.add(int.parse(currentString));
    }
    print('numberList: $numberList');
    return numberList;
  }

}
