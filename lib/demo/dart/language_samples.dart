class LanguageSamples {
  Map<String, Object> testVariables() {
    var name = 'Kenmu';
    var year = 1977;
    var antennaDiameter = 3.7;
    var flybyObjects = ['Jupiter 木星', 'Saturn 土星', 'Uranus 天王星', 'Neptune 海王星'];
    var info = {
      'name' : name,
      'year' : year,
      'antennaDiameter' : antennaDiameter,
      'flybyObjects' : flybyObjects,
      'tags' : ['saturn'],
      'url' : '//path/to/saturn.jpg'
    };

    return info;
  }

  void testControlFlowStatements() {
    Map<String, Object> info = testVariables();
    String name = info['name'];
    int year = info['year'];
    List flybyObjects = info['flybyObjects'];

    switch (name) {
      case 'Kenmu':
        {
          name = '$name Huang';
          print('name: $name');
        }
        break;
      case 'KK':
        {

        }
        break;
      default:
        {

        }
    }

    if (year >= 2001) {
      print('21st century');
    } else if (year >= 1901) {
      print('20th century');
    }

    for (var flybyObject in flybyObjects) {
      print(flybyObject);
    }

    flybyObjects.forEach((flybyObject) {
      print('${flybyObjects.indexOf(flybyObject)}: $flybyObject');
    });

    for (int month = 1; month <= 12; month++) {
        print('month: $month');
    }

    do {
      year += 10;
    } while (year < 2016);
    print('year: $year');

    while (year > 2010) {
      year -= 5;
    }
    print('year: $year');

    flybyObjects.where((flybyObject) => flybyObject.contains('王星')).forEach(print);
  }

  void testFunctions() {
    // 斐波纳契数列：0，1，1，2，3，5，8，13，21，34，.
    var result = fibonacci(20);
    print('fibonacci(20) result: $result');
  }

  int fibonacci(int n) {
    if (n <= 1) {
      return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}