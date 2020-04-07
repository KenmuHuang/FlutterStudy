import 'package:flutter_app/catalog/animation_and_motion/animated_builder.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_container.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_cross_fade.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_default_text_style.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_list_state.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_modal_barrier.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_opacity.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_physical_model.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_positioned.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_size.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_widget.dart';
import 'package:flutter_app/catalog/animation_and_motion/animated_widget_base_state.dart';
import 'package:flutter_app/catalog/animation_and_motion/decorated_box_transition.dart';
import 'package:flutter_app/catalog/animation_and_motion/fade_transition.dart';
import 'package:flutter_app/catalog/animation_and_motion/hero.dart';
import 'package:flutter_app/catalog/animation_and_motion/positioned_transition.dart';
import 'package:flutter_app/catalog/animation_and_motion/rotation_transition.dart';
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

    pageTitle = 'AnimatedListState class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'The state for a scrolling container that animates items when they are inserted or removed.',
        pageClass: AnimatedListStatePage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedModalBarrier class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'A widget that prevents the user from interacting with widgets behind itself, and can be configured with an animated color value.',
        pageClass: AnimatedModalBarrierPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedOpacity class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animated version of Opacity which automatically transitions the child\'s opacity over a given duration whenever the given opacity changes.',
        pageClass: AnimatedOpacityPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedPhysicalModel class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animated version of PhysicalModel.',
        pageClass: AnimatedPhysicalModelPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedPositioned class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animated version of Positioned which automatically transitions the child\'s position over a given duration whenever the given position changes.',
        pageClass: AnimatedPositionedPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedSize class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animated widget that automatically transitions its size over a given duration whenever the given child\'s size changes.',
        pageClass: AnimatedSizePage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedWidget class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'A widget that rebuilds when the given Listenable changes value.',
        pageClass: AnimatedWidgetPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'AnimatedWidgetBaseState<T extends ImplicitlyAnimatedWidget> class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'A base class for widgets with implicit animations that need to rebuild their widget tree as the animation runs.',
        pageClass: AnimatedWidgetBaseStatePage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'DecoratedBoxTransition class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animated version of a DecoratedBox that animates the different properties of its Decoration.',
        pageClass: DecoratedBoxTransitionPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'FadeTransition class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animates the opacity of a widget.',
        pageClass: FadeTransitionPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'Hero class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'A widget that marks its child as being a candidate for hero animations.',
        pageClass: HeroPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'PositionedTransition class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animated version of Positioned which takes a specific Animation<RelativeRect> to transition the child\'s position from a start position to an end position over the lifetime of the animation.',
        pageClass: PositionedTransitionPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    pageTitle = 'RotationTransition class';
    pageInfoModel = PageInfoModel(
        title: pageTitle,
        subtitle: 'Animates the rotation of a widget.',
        pageClass: RotationTransitionPage(
          title: pageTitle,
        )
    );
    _pageInfoModelList.add(pageInfoModel);

    return Main.loadData(title, _pageInfoModelList);
  }
}
