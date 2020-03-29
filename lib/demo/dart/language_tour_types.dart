import 'package:characters/characters.dart';

import 'language_tour_describable.dart';

typedef Remove = bool Function(int element);

class LanguageTourTypes extends LanguageTourDescribable {
  Remove _remove;

  @override
  void describe() {
    /*
    numbers
    strings
    booleans
    lists (also known as arrays)
    sets
    maps
    runes (for expressing Unicode characters in a string)
    symbols
     */
    // Numbers, both int and double are subtypes of num
    _describeNumber();

    // Strings
    _describeString();

    // Booleans
    _describeBoolean();

    // Lists
    _describeList();

    // Sets
    _describeSet();

    // Maps
    _describeMap();

    // Runes and grapheme clusters
    _describeRunes();
  }

  void _describeNumber() {
    var x = 1;
    var hex = 0xDEADBEEF;
    var y = 1.1;
    var exponents = 1.42e5;
    double z = 1; // Equivalent to double z = 1.0.


    // String -> int
    var one = int.parse('1');
    assert(one == 1);

    // String -> double
    var onePointOne = double.parse('1.1');
    assert(onePointOne == 1.1);

    // int -> String
    String oneAsString = 1.toString();
    assert(oneAsString == '1');

    // double -> String
    String piAsString = 3.14159.toStringAsFixed(2);
    assert(piAsString == '3.14');


    assert((3 << 1) == 6); // 0011 << 1 == 0110
    assert((3 >> 1) == 1); // 0011 >> 1 == 0001
    assert((3 | 4) == 7); // 0011 | 0100 == 0111


    const msPerSecond = 1000;
    const secondsUntilRetry = 5;
    const msUntilRetry = secondsUntilRetry * msPerSecond;
    print('msUntilRetry: $msUntilRetry');
  }

  void _describeString() {
    var s1 = 'Single quotes work well for string literals.';
    var s2 = "Double quotes work just as well.";
    var s3 = 'It\'s easy to escape the string delimiter.';
    var s4 = "It's even easier to use the other delimiter.";


    var s = 'string interpolation';
    assert('Dart has $s, which is very handy.' ==
        'Dart has string interpolation, ' + 'which is very handy.');
    assert('That deserves all caps. ' + '${s.toUpperCase()} is very handy!' ==
        'That deserves all caps. ' + 'STRING INTERPOLATION is very handy!');


    var s5 = 'String '
        'concatenation'
        " works even over line breaks.";
    assert(s5 ==
        'String concatenation works even over '
            'line breaks.');

    var s6 = 'The + operator ' + 'works, as well.';
    assert(s6 == 'The + operator works, as well.');

    s5 = '''
    You can create
    multi-line strings like this one.
    ''';

    s6 = """This is also a
    multi-line string.""";


    var sRaw = r'In a raw string, not even \n gets special treatment.';


    // These work in a const string.
    const aConstNum = 0;
    const aConstBool = true;
    const aConstString = 'a constant string';

    // These do NOT work in a const string.
    var aNum = 0;
    var aBool = true;
    var aString = 'a string';
    const aConstList = [1, 2, 3];

    const validConstString = '$aConstNum $aConstBool $aConstString';
    final String validVariableString = '$aNum $aBool $aString $aConstList';
//    const invalidConstString = '$aNum $aBool $aString $aConstList'; // Error
    print('validConstString: $validConstString, validVariableString: $validVariableString');
  }

  void _describeBoolean() {
    // Check for an empty string or a not empty string.
    var fullName = '';
    assert(fullName.isEmpty);
    fullName = 'Kenmu Huang';
    assert(fullName.isNotEmpty);


    // Check for zero.
    var hitPoints = 0;
    assert(hitPoints <= 0);


    // Check for null.
    var unicorn;
    assert(unicorn == null);


    // Check for NaN.
    var iMeantToDoThis = 0 / 0;
    assert(iMeantToDoThis.isNaN);


    // Check for an finite negative.
    iMeantToDoThis = -10;
    assert(iMeantToDoThis.isNegative);
    assert(iMeantToDoThis.isFinite);
    assert(!iMeantToDoThis.isInfinite);
  }

  void _describeList() {
    // Create a variable list
    var list = [1, 2, 3];
    assert(list.length == 3);
    assert(list[1] == 2);
    assert(list.isNotEmpty);

    list[1] = 1;
    assert(list[1] == 1);


    // Create a list that’s a compile-time constant
    var constantList = const [1, 2, 3];
//    constantList[1] = 1; // Uncommenting this causes an error.


    // Operation
    list.add(4);
    list.addAll([5, 6]);
    print('list: $list'); // Print: list: [1, 1, 3, 4, 5, 6]

    list.remove(1); // Only remove one matched element
    print('list: $list'); // Print: list: [1, 3, 4, 5, 6]
    list.removeLast();
    list.removeAt(1);
    print('list: $list'); // Print: list: [1, 4, 5]

    list.insert(0, 0);
    list.insertAll(list.length, [6, 7]);
    print('list: $list'); // Print: list: [0, 1, 4, 5, 6, 7]
    assert(list.contains(4));

    list.removeRange(1, 3);
    print('list: $list'); // Print: list: [0, 5, 6, 7]

    _remove = (int element) {
      return element.isOdd;
    };
    assert(_remove is Remove);
    list.removeWhere(_remove);
    print('list: $list'); // Print: list: [0, 6]
    list.removeWhere((int element) => element.isEven);
    print('list: $list'); // Print: list: []
    assert(list.isEmpty);


    // Spread operator (...) and the null-aware spread operator (...?)
    list = [1, 2, 3];
    var combineList = [0, ...list];
    print('combineList: $combineList'); // Print: combineList: [0, 1, 2, 3]
    assert(combineList.length == 4);

    list.clear();
    print('list: $list'); // Print: list: []
    list = null;
    print('list: $list'); // Print: list: null
    combineList = [0, ...?list];
    print('combineList: $combineList'); // Print: combineList: [0]
    assert(combineList.length == 1);


    // Collection if and collection for
    const bool promoActive = true;
    var nav = [
      'Home',
      'Furniture',
      'Plants',
      if (promoActive) 'Outlet'
    ];
    print('nav: $nav'); // Print: nav: [Home, Furniture, Plants, Outlet]

    var listOfInts = [1, 2, 3];
    var listOfStrings = [
      '#0',
      for (var i in listOfInts) '#$i',
      4,
      5,
      6.6,
      false
    ];
    print('listOfStrings: $listOfStrings'); // Print: listOfStrings: [#0, #1, #2, #3, 4, 5, 6.6, false]
    assert(listOfStrings[1] == '#1');
  }

  void _describeSet() {
    // Create a variable set
    var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'}; // As Set<String> halogens
//    halogens.add(2); // Error: add the wrong type of value to the set, the analyzer or runtime raises an error


    // Create an empty set
    var names = <String>{};
//    Set<String> names = {}; // This works, too.
    assert(names is Set);
    var nicknames = {}; // Creates a map, not a set.
    assert(nicknames is! Set);


    // Operation
    var elements = <String>{};
    elements.add('fluorine');
    elements.addAll(halogens);
    print('elements: $elements'); // Print: elements: {fluorine, chlorine, bromine, iodine, astatine}
    assert(elements.length == 5);
    elements.removeAll({'fluorine', 'bromine'});
    print('elements: $elements'); // Print: elements: {chlorine, iodine, astatine}


    // Create a set that’s a compile-time constant
    final constantSet = const {
      'fluorine',
      'chlorine',
      'bromine',
      'iodine',
      'astatine',
    };
//    constantSet.add('helium'); // Error: Uncommenting this causes an error.


    // Spread operator (...) and the null-aware spread operator (...?)
    var set = <int>{1, 2, 3};
    var combineSet = {0, 1, ...set};
    print('combineSet: $combineSet'); // Print: combineSet: {0, 1, 2, 3}
    assert(combineSet.length == 4);

    set.clear();
    print('set: $set'); // Print: set: {}
    set = null;
    print('set: $set'); // Print: set: null
    combineSet = {0, ...?set};
    print('combineSet: $combineSet'); // Print: combineSet: {0}
    assert(combineSet.length == 1);


    // Collection if and collection for
    const bool promoActive = true;
    var nav = <String>{
      'Home',
      'Furniture',
      'Plants',
      if (promoActive) 'Outlet'
    };
    print('nav: $nav'); // Print: nav: {Home, Furniture, Plants, Outlet}

    var listOfInts = <int>[1, 2, 3];
    var setOfStrings = <String>{
      '#0',
      for (var i in listOfInts) '#$i',
    };
    print('setOfStrings: $setOfStrings'); // Print: setOfStrings: {#0, #1, #2, #3}
  }

  void _describeMap() {
    // Create a variable map
    var gifts = {
      // Key:    Value
      'first': 'partridge',
      'second': 'turtledoves',
      'fifth': 'golden rings'
    };
//    Map<String, String> gifts = {};

    var nobleGases = {
      2: 'helium',
      10: 'neon',
      18: 'argon',
    };
//    Map<int, String> nobleGases = {};


    // Map constructor
    gifts = Map();
    gifts['first'] = 'partridge';
    gifts['second'] = 'turtledoves';
    gifts['fifth'] = 'golden rings';
    print('gifts: $gifts'); // Print: gifts: {first: partridge, second: turtledoves, fifth: golden rings}
    assert(gifts is Map<String, String>);
    assert(gifts.length == 3);
    assert(gifts['thridth'] == null);

    nobleGases = {2: 'helium'};
    nobleGases[10] = 'neon';
    nobleGases[18] = 'argon';
    assert(nobleGases is Map);
    assert(nobleGases is Map<int, String>);
    assert(nobleGases is! Map<String, String>);
    print('nobleGases: $nobleGases'); // Print: nobleGases: {2: helium, 10: neon, 18: argon}
    assert(nobleGases.isNotEmpty);


    // Create a map that’s a compile-time constant
    final constantMap = const {
      2: 'helium',
      10: 'neon',
      18: 'argon',
    };
//    constantMap[2] = 'Helium'; // Uncommenting this causes an error.


    // Spread operator (...) and the null-aware spread operator (...?)
    var map = {1, 2, 3};
    var combineMap = {0, 1, ...map};
    print('combineMap: $combineMap'); // Print: combineMap: {0, 1, 2, 3}
    assert(combineMap.length == 4);

    map.clear();
    print('map: $map'); // Print: map: {}
    map = null;
    print('map: $map'); // Print: map: null
    combineMap = {0, ...?map};
    print('combineMap: $combineMap'); // Print: combineMap: {0}
    assert(combineMap.length == 1);


    // Collection if and collection for
    const bool promoActive = true;
    var nav = {
      'Home',
      'Furniture',
      'Plants',
      if (promoActive) 'Outlet'
    };
    print('nav: $nav'); // Print: nav: {Home, Furniture, Plants, Outlet}

    var listOfInts = <int>[1, 2, 3];
    var mapOfStrings = {
      '#0',
      for (var i in listOfInts) '#$i',
    };
    print('mapOfStrings: $mapOfStrings'); // Print: mapOfStrings: {#0, #1, #2, #3}
  }

  void _describeRunes() {
    String hi = 'Hi 🇩🇰';
    print('String is "$hi"\n'); // Print: String is "Hi 🇩🇰"

    // Length.
    print('String.length: ${hi.length}'); // Print: String.length: 7
    print('Characters.length: ${hi.characters.length}\n'); // Print: Characters.length: 4

    // Last character.
    print('The string ends with: ${hi.substring(hi.length - 1)}'); // Print: <compose failure [illegible log arguments]>
    print('The last character: ${hi.characters.last}\n'); // Print: The last character: 🇩🇰

    // Skip last character.
    print('Substring -1: "${hi.substring(0, hi.length - 1)}"'); // Print: <compose failure [illegible log arguments]>
    print('Skipping last character: "${hi.characters.skipLast(1)}"\n'); // Print: Skipping last character: "Hi "

    // Replace characters.
    Characters newHi =
    hi.characters.replaceAll('🇩🇰'.characters, '🇺🇸'.characters);
    print('Change flag: "$newHi"'); // Print: Change flag: "Hi 🇺🇸"


    // Symbols
//    #const
  }
}
