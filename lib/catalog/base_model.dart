class BaseModel {
  String title;
  String subtitle;
  Object pageClass;

  BaseModel(this.title, this.subtitle, this.pageClass);

  void description() {
    print('title: $title, subtitle: $subtitle, pageClass: $pageClass');
  }
}