import 'language_samples_spacecraft.dart';

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class MockSpacecraft implements Spacecraft, Describable {
  @override
  DateTime launchDate;

  @override
  String name;

  @override
  int get launchYear => launchDate?.year;

  @override
  void describe() {
    print('MockSpaceship: $name, launchYear: $launchYear');
  }

  @override
  void describeWithEmphasis() {
    print('*********');
    describe();
    print('*********');
  }

  MockSpacecraft(this.name, this.launchDate);
}

class MockSpaceship extends Describable {
  String name;

  MockSpaceship(this.name);

  @override
  void describe() {
    print('MockSpaceship: $name');
  }
}