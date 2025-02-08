import 'package:flutter/material.dart';
import 'package:graduatioproject/presentation/seventeen_page/seventeen_page.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/arshf_one_screen/arshf_one_screen.dart';
import '../presentation/arshf_screen/arshf_screen.dart';
import '../presentation/confrmashn_one_screen/confrmashn_one_screen.dart';
import '../presentation/confrmashn_screen/confrmashn_screen.dart';
import '../presentation/four_screen/four_screen.dart';
import '../presentation/nine_screen/nine_screen.dart';
import '../presentation/prtfoleo_steng_one_screen/prtfoleo_steng_one_screen.dart';
import '../presentation/prtfoleo_steng_screen/prtfoleo_steng_screen.dart';
import '../presentation/prtfoleo_steng_two_screen/prtfoleo_steng_two_screen.dart';
import '../presentation/resfshn_screen/resfshn_screen.dart';
import '../presentation/six_screen/six_screen.dart';
import '../presentation/twenty_screen/twenty_screen.dart';
import '../presentation/twentyfive_screen/twentyfive_screen.dart';
import '../presentation/two_screen/two_screen.dart';
import '../presentation/zero_screen/zero_screen.dart';

class AppRoutes {
  static const String zeroScreen = '/zero_screen';

  static const String twoScreen = '/two_screen';

  static const String fourScreen = '/four_screen';

  static const String twentyfiveScreen = '/twentyfive_screen';

  static const String sixScreen = '/six_screen';

  static const String nineScreen = '/nine_screen';

  static const String nineInitialPage = '/nine_initial_page';

  static const String confrmashnScreen = '/confrmashn_screen';

  static const String resfshnScreen = '/resfshn_screen';

  static const String prtfoleoStengScreen = '/prtfoleo_steng_screen';

  static const String seventeenPage = '/seventeen_page';

  static const String seventeenTabPage = '/seventeen_tab_page';

  static const String twentyScreen = '/twenty_screen';

  static const String twentyonePage = '/twentyone_page';

  static const String prtfoleoStengOneScreen = '/prtfoleo_steng_one_screen';

  static const String confrmashnOneScreen = '/confrmashn_one_screen';

  static const String prtfoleoStengTwoScreen = '/prtfoleo_steng_two_screen';

  static const String arshfScreen = '/arshf_screen';

  static const String arshfTabPage = '/arshf_tab_page';

  static const String resfshnOnePage = '/resfshn_one_page';

  static const String arshfOneScreen = '/arshf_one_screen';

  static const String arshfoneTabPage = '/arshfone_tab_page';

  static const String resfshnTwoPage = '/resfshn_two_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        zeroScreen: ZeroScreen.builder,
        twoScreen: TwoScreen.builder,
        fourScreen: FourScreen.builder,
        twentyfiveScreen: TwentyfiveScreen.builder,
        seventeenPage: SeventeenPage.builder,
        sixScreen: SixScreen.builder,
        nineScreen: NineScreen.builder,
        confrmashnScreen: ConfrmashnScreen.builder,
        resfshnScreen: ResfshnScreen.builder,
        prtfoleoStengScreen: PrtfoleoStengScreen.builder,
        twentyScreen: TwentyScreen.builder,
        prtfoleoStengOneScreen: PrtfoleoStengOneScreen.builder,
        confrmashnOneScreen: ConfrmashnOneScreen.builder,
        prtfoleoStengTwoScreen: PrtfoleoStengTwoScreen.builder,
        arshfScreen: ArshfScreen.builder,
        arshfOneScreen: ArshfOneScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: ZeroScreen.builder
      };
}
