import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../resfshn_one_page/resfshn_one_page.dart';
import 'arshf_tab_page.dart';
import 'bloc/arshf_bloc.dart';
import 'models/arshf_model.dart';

class ArshfScreen extends StatefulWidget {
  const ArshfScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ArshfScreenState createState() => ArshfScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ArshfBloc>(
      create: (context) => ArshfBloc(ArshfState(
        arshfModelObj: ArshfModel(),
      ))
        ..add(ArshfInitialEvent()),
      child: ArshfScreen(),
    );
  }
}

// ignore_for_file: must_be_immutable
class ArshfScreenState extends State<ArshfScreen>
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
    return BlocBuilder<ArshfBloc, ArshfState>(
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
                          ArshfTabPage.builder(context),
                          ResfshnOnePage.builder(context)
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
                  "lbl71".tr,
                ),
              ),
              Tab(
                child: Text(
                  "lbl72".tr,
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
