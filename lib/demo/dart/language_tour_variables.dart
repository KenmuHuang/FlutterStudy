class LanguageTourVariables {
  void describe() {
    // Define variable
    var name1 = 'Bob';
    dynamic name2 = 'Bob';
    String name3 = 'Bob';

//    name1 = 12; // Error
    name2 = 12;
//    name3 = 12; // Error
    print('name1: $name1, name2: $name2, name3: $name3');


    // Default value
    int lineCount;
    assert(lineCount == null);


    // Final and const
    final name = 'Bob'; // Without a type annotation
    final String nickname = 'Bobby';
//    name = 'Alice'; // Error: a final variable can only be set once.
    assert(name is String);

    const bar = 1000000; // Unit of pressure (dynes/cm2)
    const double atm = 1.01325 * bar; // Standard atmosphere
    var fooList = const [];
    final barList = const [];
    const bazList = []; // Equivalent to `const []`

    fooList = [1, 2, 3]; // Was const []
//    barList = [42]; // Error: Constant variables can't be assigned a value.


    // Type check
    // Valid compile-time constants as of Dart 2.5.
    const Object i = 3;
    const dynamic j = '4';
    const list = [i as int, j as String];
    const map = {if (i is int) i: 'int', if (j is String) j: 'String'};
    const set = {if (list is! List<int>) ...list};
    print('list: $list, map: $map, set: $set');
  }
}
