import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/seventeen_bloc.dart';
import 'models/seventeen_model.dart';
import 'seventeen_tab_page.dart'; // ignore_for_file: must_be_immutable

class SeventeenPage extends StatefulWidget {
  const SeventeenPage({Key? key})
      : super(
          key: key,
        );

  @override
  SeventeenPageState createState() => SeventeenPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<SeventeenBloc>(
      create: (context) => SeventeenBloc(SeventeenState(
        seventeenModelObj: SeventeenModel(),
      ))
        ..add(SeventeenInitialEvent()),
      child: SeventeenPage(),
    );
  }
}

// ignore_for_file: must_be_immutable
class SeventeenPageState extends State<SeventeenPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "lbl27".tr,
                style: CustomTextStyles.titleMediumPoppinsBlack900,
              ),
              Text(
                "msg14".tr,
                style: CustomTextStyles.bodyMediumBluegray30001_1,
              ),
              SizedBox(height: 8.h),
              Expanded(child: SeventeenTabPage.builder(context)),
              // _buildTabview(context),
              // Expanded(
              //   child: Container(
              //     child: TabBarView(
              //       controller: tabviewController,
              //       children: [
              //         SeventeenTabPage.builder(context),
              //         SeventeenTabPage.builder(context)
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray100,
            width: 1.h,
          ),
        ),
      ),
      width: double.maxFinite,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appTheme.gray600,
        unselectedLabelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.colorScheme.primary,
              width: 3.h,
            ),
          ),
        ),
        dividerHeight: 0.0,
        tabs: [
          Tab(
            height: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Text(
                "lbl41".tr,
              ),
            ),
          ),
          Tab(
            height: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Text(
                "lbl42".tr,
              ),
            ),
          )
        ],
      ),
    );
  }
}
