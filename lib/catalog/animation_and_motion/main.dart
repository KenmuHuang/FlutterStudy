import 'package:flutter_app/catalog/animation_and_motion/animated_builder.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_container.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_cross_fade.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_default_text_style.dart';
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

    pageTitle = 'AnimatedCrossFade class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'A widget that cross-fades between two given children and animates itself between their sizes.',
        pageClass: AnimatedCrossFadePage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedDefaultTextStyle class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.',
        pageClass: AnimatedDefaultTextStylePage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    return Main.loadData(title, _pageInfoModelList);
  }
}
