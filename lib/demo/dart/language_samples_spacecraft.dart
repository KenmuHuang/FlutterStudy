class Spacecraft {
  String name;
  DateTime launchDate;

  Spacecraft(this.name, this.launchDate) {
    print('name: $name, launchDate: $launchDate');
  }

  Spacecraft.unlaunched(String name) : this(name, null);

  int get launchYear => launchDate?.year;

  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
        int years = DateTime.now().difference(launchDate).inDays ~/ 365;
        print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }

}