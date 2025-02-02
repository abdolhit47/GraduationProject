import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../resfshn_two_page/resfshn_two_page.dart';
import 'arshfone_tab_page.dart';
import 'bloc/arshf_one_bloc.dart';
import 'models/arshf_one_model.dart';

class ArshfOneScreen extends StatefulWidget {
  const ArshfOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ArshfOneScreenState createState() => ArshfOneScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ArshfOneBloc>(
      create: (context) => ArshfOneBloc(ArshfOneState(
        arshfOneModelObj: ArshfOneModel(),
      ))
        ..add(ArshfOneInitialEvent()),
      child: ArshfOneScreen(),
    );
  }
}

// ignore_for_file: must_be_immutable
class ArshfOneScreenState extends State<ArshfOneScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArshfOneBloc, ArshfOneState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colorScheme.primaryContainer,
          body: SafeArea(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHorizontalScrollSection(context),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: tabviewController,
                        children: [
                          ArshfoneTabPage.builder(context),
                          ResfshnTwoPage.builder(context)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            width: double.maxFinite,
            child: _buildBottomNavigationBar(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildHorizontalScrollSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            boxShadow: [
              BoxShadow(
                color: appTheme.black900.withValues(
                  alpha: 0.15,
                ),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(
                  0,
                  0,
                ),
              )
            ],
          ),
          child: TabBar(
            controller: tabviewController,
            labelPadding: EdgeInsets.zero,
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: appTheme.blueGray200,
            tabs: [
              Tab(
                child: Text(
                  "msg30".tr,
                ),
              ),
              Tab(
                child: Text(
                  "msg31".tr,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavigationBar(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(
              navigatorKey.currentContext!, getCurrentRoute(type));
        },
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.tf:
        return AppRoutes.nineInitialPage;
      default:
        return "/";
    }
  }
}
