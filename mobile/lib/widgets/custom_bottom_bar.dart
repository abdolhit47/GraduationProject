import 'package:flutter/material.dart';
import 'package:graduatioproject/presentation/nine_screen/nine_initial_page.dart';
import 'package:graduatioproject/presentation/resfshn_screen/resfshn_screen.dart';
import 'package:graduatioproject/presentation/seventeen_page/seventeen_page.dart';
import 'package:graduatioproject/presentation/twenty_screen/twenty_screen.dart';
import 'package:graduatioproject/presentation/twentyone_page/twentyone_page.dart';
import 'package:graduatioproject/widgets/app_bar/appbar_leading_image_one.dart';
import 'package:graduatioproject/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:graduatioproject/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:graduatioproject/widgets/app_bar/appbar_trailing_image_one.dart';
import 'package:graduatioproject/widgets/app_bar/custom_app_bar.dart';
import '../core/app_export.dart';

enum BottomBarEnum { tf }

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  final List<Widget> _screens = [
    NineInitialPage(),
    SeventeenPage(),
    TwentyScreen(),
    TwentyonePage(),
    ResfshnScreen(),
  ];
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavPrimary24x24,
      activeIcon: ImageConstant.imgNavPrimary24x24,
      title: "lbl21".tr,
      type: BottomBarEnum.tf,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavBlueGray30001,
      activeIcon: ImageConstant.imgNavBlueGray30001,
      title: "lbl22".tr,
      type: BottomBarEnum.tf,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavBlueGray3000124x24,
      activeIcon: ImageConstant.imgNavBlueGray3000124x24,
      title: "lbl23".tr,
      type: BottomBarEnum.tf,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNav24x24,
      activeIcon: ImageConstant.imgNav24x24,
      title: "lbl24".tr,
      type: BottomBarEnum.tf,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: _screens[selectedIndex],
      // decoration: BoxDecoration(
      //   color: theme.colorScheme.onPrimary,
      //   border: Border(
      //     top: BorderSide(
      //       color: appTheme.gray20001,
      //       width: 1.h,
      //     ),
      //   ),
      //   boxShadow: [
      //     BoxShadow(
      //       color: appTheme.blueGray3001e,
      //       spreadRadius: 2.h,
      //       blurRadius: 2.h,
      //       offset: Offset(
      //         0,
      //         0,
      //       ),
      //     )
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24.h,
                  width: 24.h,
                  color: appTheme.blueGray30001,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: appTheme.blueGray30001,
                  ),
                )
              ],
            ),
            activeIcon: Column(
              spacing: 2,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 24.h,
                  width: 24.h,
                  color: theme.colorScheme.primary,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: CustomTextStyles.labelLargePrimary_1.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                )
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

onTapImagetwo(BuildContext context) {
  NavigatorService.pushNamed(
    AppRoutes.confrmashnScreen,
  );
}

PreferredSizeWidget buildAppBar(BuildContext context) {
  return CustomAppBar(
    height: 120,
    leadingWidth: 48.h,
    leading: AppbarLeadingImageOne(
      imagePath: ImageConstant.imgFrameBlueGray30001,
      margin: EdgeInsets.only(left: 24.h),
      onTap: () {
        onTapImagetwo(context);
      },
    ),
    title: Column(
      children: [
        AppbarSubtitleFive(
          text: "lbl13".tr,
          margin: EdgeInsets.only(left: 36.h),
        ),
        AppbarSubtitleTwo(
          text: "lbl14".tr,
        )
      ],
    ),
    actions: [
      AppbarTrailingImageOne(
        imagePath: ImageConstant.imgEllipse1,
        height: 42.h,
        width: 42.h,
        margin: EdgeInsets.only(
          top: 5.h,
          right: 24.h,
          bottom: 8.h,
        ),
      )
    ],
  );
}

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      this.title,
      required this.type});

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
