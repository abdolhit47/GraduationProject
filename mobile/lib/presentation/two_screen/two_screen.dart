import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/two_bloc.dart';
import 'models/two_model.dart';

class TwoScreen extends StatelessWidget {
  const TwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<TwoBloc>(
      create: (context) => TwoBloc(TwoState(
        twoModelObj: TwoModel(),
      ))
        ..add(TwoInitialEvent()),
      child: TwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppbar(context),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 26.h),
          child: Column(
            children: [
              _buildMainContent(context),
              SizedBox(height: 94.h),
              Text(
                "msg3".tr,
                style: CustomTextStyles.titleMediumPoppinsGray90005,
              ),
              Text(
                "msg4".tr,
                style: CustomTextStyles.bodySmallGray600,
              ),
              SizedBox(height: 56.h),
              CustomElevatedButton(
                text: "lbl4".tr,
                margin: EdgeInsets.symmetric(horizontal: 24.h),
                buttonStyle: CustomButtonStyles.fillPrimary,
                onPressed: () {
                  onTaptf(context);
                },
              ),
              SizedBox(height: 24.h)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitleImage(
        imagePath: ImageConstant.imgGroup,
        height: 4.h,
        width: 84.h,
      ),
    );
  }

  /// Section Widget
  Widget _buildMainContent(BuildContext context) {
    return Container(
      height: 378.h,
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img06,
            height: 248.h,
            width: double.maxFinite,
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 26.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child:
                      BlocSelector<TwoBloc, TwoState, TextEditingController?>(
                    selector: (state) => state.group157oneController,
                    builder: (context, group157oneController) {
                      return CustomTextFormField(
                        width: 218.h,
                        controller: group157oneController,
                        hintText: "msg".tr,
                        hintStyle: CustomTextStyles.labelLargePrimary,
                        textInputAction: TextInputAction.done,
                        contentPadding:
                            EdgeInsets.fromLTRB(22.h, 22.h, 22.h, 8.h),
                        borderDecoration:
                            TextFormFieldStyleHelper.outlineIndigo,
                      );
                    },
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder4,
                    ),
                    child: Container(
                      height: 84.h,
                      width: 204.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      decoration: AppDecoration.neutralWhiteWhite10.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder4,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: SizedBox(
                                height: 50.h,
                                child: VerticalDivider(
                                  width: 1.h,
                                  thickness: 1.h,
                                  color: appTheme.gray50,
                                  indent: 22.h,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: SizedBox(
                                height: 24.h,
                                child: VerticalDivider(
                                  width: 1.h,
                                  thickness: 1.h,
                                  color: appTheme.gray50,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgUser,
                                      height: 8.h,
                                      width: 10.h,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 168.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "lbl".tr,
                                                  style: CustomTextStyles
                                                      .poppinsGray600,
                                                ),
                                                Text(
                                                  "msg2".tr,
                                                  style: CustomTextStyles
                                                      .poppinsBluegray30001,
                                                )
                                              ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                spacing: 2,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "lbl_18".tr,
                                                    style: CustomTextStyles
                                                        .poppinsBluegray30001Medium,
                                                  ),
                                                  Text(
                                                    "lbl_10_15".tr,
                                                    style: CustomTextStyles
                                                        .poppinsBluegray30001,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 12.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgUserGray50,
                                              height: 8.h,
                                              width: 10.h,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 170.h,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 76.h,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            "lbl2".tr,
                                                            style: CustomTextStyles
                                                                .poppinsPrimaryBold,
                                                          ),
                                                          Text(
                                                            "lbl3".tr,
                                                            style: CustomTextStyles
                                                                .poppinsBluegray30001,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      spacing: 2,
                                                      children: [
                                                        Text(
                                                          "lbl_25".tr,
                                                          style: CustomTextStyles
                                                              .poppinsPrimary,
                                                        ),
                                                        Text(
                                                          "lbl_10_00".tr,
                                                          style: CustomTextStyles
                                                              .poppinsPrimaryRegular,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
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
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Navigates to the fourScreen when the action is triggered.
  onTaptf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.fourScreen,
    );
  }
}
