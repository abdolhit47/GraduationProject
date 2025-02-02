import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          body: SafeArea(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: Text(
                            "App Navigation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text(
                            "Check your app's UI from the below demo screens of your app.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFF888888),
                              fontSize: 16.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(
                          height: 1.h,
                          thickness: 1.h,
                          color: Color(0XFF000000),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Zero",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.zeroScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Two",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.twoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Four",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.fourScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "TwentyFive",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.twentyfiveScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Six",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.sixScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Nine",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.nineScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "confrmashn",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.confrmashnScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "resfshn",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.resfshnScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "prtfoleo steng",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.prtfoleoStengScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Twenty",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.twentyScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "prtfoleo steng One",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.prtfoleoStengOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "confrmashn One",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.confrmashnOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "prtfoleo steng Two",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.prtfoleoStengTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "arshf",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.arshfScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "arshf One",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.arshfOneScreen),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 5.h),
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: Color(0XFF888888),
            )
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
