import 'language_samples_spacecraft.dart';

class Orbiter extends Spacecraft {
  num altitude = 100;

  Orbiter(String name, DateTime launchDate, this.altitude) : super(name, launchDate) {
    print('Orbiter name: $name, launchDate: $launchDate, altitude: $altitude');
  }


  Orbiter.unlaunched(String name) : super.unlaunched(name) {
    print('Orbiter altitude: $altitude after unlaunched');
  }

  @override
  void describe() {
    print('Orbiter: $name');
  }
}