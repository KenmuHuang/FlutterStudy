import 'package:flutter_app/catalog/base_main.dart';
import 'package:flutter_app/catalog/page_info_model.dart';

final String routeNameOfMainPage = '/material_components/main_page';
final String title = 'Material Components widgets';

class Main extends BaseMain {
  Main.loadData(String title, List<PageInfoModel> pageInfoModelList) : super(title: title, pageInfoModelList: pageInfoModelList);

  static Main shareInstance() {
    final List<PageInfoModel> _pageInfoModelList = [

    ];
    return Main.loadData(title, _pageInfoModelList);
  }
}
