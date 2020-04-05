import 'package:flutter_app/catalog/animation_and_motion/animated_builder.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_container.dart';
import 'package:flutter_app/catalog/base_main.dart';
import 'package:flutter_app/catalog/page_info_model.dart';

final String routeNameOfMainPage = '/animation_and_motion/main_page';
final String title = 'Animation and motion widgets';

class Main extends BaseMain {
  Main.loadData(String title, List<PageInfoModel> pageInfoModelList) : super(title: title, pageInfoModelList: pageInfoModelList);

  static Main shareInstance() {
    List<PageInfoModel> _pageInfoModelList = [];

    String pageTitle = 'AnimatedBuilder class';
    PageInfoModel pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'A general-purpose widget for building animations.',
        pageClass: AnimatedBuilderPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedContainer class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animated version of Container that gradually changes its values over a period of time.',
        pageClass: AnimatedContainerPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    return Main.loadData(title, _pageInfoModelList);
  }
}
