import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/twentyone_bloc.dart';
import 'models/twentyone_model.dart';
import 'models/twentyone_one_item_model.dart';
import 'widgets/twentyone_one_item_widget.dart'; // ignore_for_file: must_be_immutable

class TwentyonePage extends StatelessWidget {
  const TwentyonePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return TwentyonePage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TwentyoneBloc>(
      create: (context) => TwentyoneBloc(TwentyoneState(
        twentyoneModelObj: TwentyoneModel(),
      ))
        ..add(TwentyoneInitialEvent()),
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        body: SafeArea(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.semanticWhite,
            child: Column(
              children: [
                _buildProfileStack(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: Column(
                        children: [
                          SizedBox(height: 74.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "lbl53".tr,
                                    style:
                                        CustomTextStyles.bodySmallGray9000511,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                _buildSettingsColumn(context),
                                SizedBox(height: 22.h),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "lbl60".tr,
                                    style:
                                        CustomTextStyles.bodySmallGray9000511,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                _buildInfoColumn(context),
                                SizedBox(height: 12.h),
                                _buildLogoutButton(context),
                                SizedBox(height: 12.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "lbl64".tr,
                                      style: CustomTextStyles
                                          .bodyMediumBluegray30001_1,
                                    ),
                                    Text(
                                      "lbl65".tr,
                                      style: CustomTextStyles
                                          .bodyMediumBluegray30001_1,
                                    )
                                  ],
                                )
                              ],
                            ),
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
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileStack(BuildContext context) {
    return SizedBox(
      height: 182.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CustomAppBar(
              height: 126.h,
              title: AppbarSubtitle(
                text: "lbl51".tr,
                margin: EdgeInsets.only(left: 21.h),
              ),
              actions: [
                AppbarTrailingImage(
                  imagePath: ImageConstant.imgHeroiconsSolidGray600,
                  margin: EdgeInsets.only(
                    top: 30.h,
                    right: 23.h,
                    bottom: 71.h,
                  ),
                )
              ],
              styleType: Style.bgFillGray5001,
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "lbl52".tr,
                  style: CustomTextStyles.headlineSmallBluegray90003,
                ),
                Text(
                  "msg_pyotrk1_email_com2".tr,
                  style: CustomTextStyles.titleLargePoppinsBluegray30001,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSettingsColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocSelector<TwentyoneBloc, TwentyoneState, TwentyoneModel?>(
            selector: (state) => state.twentyoneModelObj,
            builder: (context, twentyoneModelObj) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
                itemCount: twentyoneModelObj?.twentyoneOneItemList.length ?? 0,
                itemBuilder: (context, index) {
                  TwentyoneOneItemModel model =
                      twentyoneModelObj?.twentyoneOneItemList[index] ??
                          TwentyoneOneItemModel();
                  if (index == 2) {
                    model = model.copyWith(onTap: () {
                      Navigator.pushNamed(context, AppRoutes.seventeenPage);
                    });
                  }
                  return TwentyoneOneItemWidget(model);
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildInfoColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 18.h,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 22,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: _buildPrivacyRow(
              context,
              prop: "lbl61".tr,
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: _buildPrivacyRow(
              context,
              prop: "lbl62".tr,
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: _buildPrivacyRow(
              context,
              prop: "lbl63".tr,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        top: 12.h,
        right: 62.h,
        bottom: 12.h,
      ),
      decoration: AppDecoration.semanticWhite.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg21".tr,
            style: CustomTextStyles.bodyMediumRed400,
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildPrivacyRow(
    BuildContext context, {
    required String prop,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          prop,
          style: CustomTextStyles.bodySmallGray90005_1.copyWith(
            color: appTheme.gray90005,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 16.h,
          width: 18.h,
        )
      ],
    );
  }
}
