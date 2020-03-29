import 'language_tour_types.dart';
import 'language_tour_variables.dart';

class LanguageTour {
  void testVariables() {
    LanguageTourVariables languageTourVariables = LanguageTourVariables();
    languageTourVariables.describe();
  }

  void testTypes() {
    LanguageTourTypes languageTourTypes = LanguageTourTypes();
    languageTourTypes.describe();
  }
}