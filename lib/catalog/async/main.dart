import 'package:flutter_app/catalog/async/future_builder.dart';
import 'package:flutter_app/catalog/base_main.dart';
import 'package:flutter_app/catalog/page_info_model.dart';

final String routeNameOfMainPage = '/async/main_page';
final String title = 'Async widgets';

class Main extends BaseMain {
  Main.loadData(String title, List<PageInfoModel> pageInfoModelList) : super(title: title, pageInfoModelList: pageInfoModelList);

  static Main shareInstance() {
    List<PageInfoModel> _pageInfoModelList = [];

    String pageTitle = 'FutureBuilder<T> class';
    PageInfoModel pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Widget that builds itself based on the latest snapshot of interaction with a Future.',
        pageClass: FutureBuilderPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    return Main.loadData(title, _pageInfoModelList);
  }
}
