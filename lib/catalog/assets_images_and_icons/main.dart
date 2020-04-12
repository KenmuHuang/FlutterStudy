import 'package:flutter_app/catalog/assets_images_and_icons/asset_bundle.dart';
import 'package:flutter_app/catalog/assets_images_and_icons/icon.dart';
import 'package:flutter_app/catalog/base_main.dart';
import 'package:flutter_app/catalog/page_info_model.dart';

final String routeNameOfMainPage = '/assets_images_and_icons/main_page';
final String title = 'Assets, images, and icon widgets';

class Main extends BaseMain {
  Main.loadData(String title, List<PageInfoModel> pageInfoModelList) : super(title: title, pageInfoModelList: pageInfoModelList);

  static Main shareInstance() {
    List<PageInfoModel> _pageInfoModelList = [];

    String pageTitle = 'AssetBundle class';
    PageInfoModel pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'A collection of resources used by the application.',
        pageClass: AssetBundlePage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'Icon class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'A graphical icon widget drawn with a glyph from a font described in an IconData such as material\'s predefined IconDatas in Icons.',
        pageClass: IconPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    return Main.loadData(title, _pageInfoModelList);
  }
}
