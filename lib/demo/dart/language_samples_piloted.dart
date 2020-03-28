import 'package:flutter/cupertino.dart';

import 'language_samples_spacecraft.dart';

class Piloted {
  int astronauts = 1;

  void _describeCrew({String className = 'Piloted'}) {
    print('$className Number of astronauts: $astronauts');
  }
}

class Transport {
  String _describeText = 'Number of products';
  int products = 2;

  void _describeProduct({@required String className}) {
    print('$className $_describeText: $products');
  }
}

class PilotedCraft extends Spacecraft with Piloted, Transport {
  String className = '';

  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);

  @override
  void describe() {
    super.describe();

    _describeCrew(className: className);
    _describeProduct(className: className);
  }
}