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
  }
}