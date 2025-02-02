import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image_one.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/prtfoleo_steng_two_bloc.dart';
import 'models/prtfoleo_steng_two_model.dart';

class PrtfoleoStengTwoScreen extends StatelessWidget {
  const PrtfoleoStengTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<PrtfoleoStengTwoBloc>(
      create: (context) => PrtfoleoStengTwoBloc(PrtfoleoStengTwoState(
        prtfoleoStengTwoModelObj: PrtfoleoStengTwoModel(),
      ))
        ..add(PrtfoleoStengTwoInitialEvent()),
      child: PrtfoleoStengTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 18.h,
            top: 28.h,
            right: 18.h,
          ),
          child: Column(
            spacing: 22,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 64.h,
                width: 66.h,
              ),
              Text(
                "msg28".tr,
                style: CustomTextStyles.headlineSmallCairo,
              ),
              _buildPasswordResetColumn(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImageOne(
        imagePath: ImageConstant.imgArrowDownBlueGray90004,
        height: 18.h,
        width: 22.h,
        margin: EdgeInsets.only(left: 23.h),
      ),
      actions: [
        AppbarTitle(
          text: "lbl8".tr,
          margin: EdgeInsets.only(right: 18.h),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildPasswordResetColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 30.h,
      ),
      decoration: AppDecoration.shdo.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg24".tr,
            style: CustomTextStyles.titleSmallCairoBluegray200_1,
          ),
          SizedBox(height: 4.h),
          BlocSelector<PrtfoleoStengTwoBloc, PrtfoleoStengTwoState,
              TextEditingController?>(
            selector: (state) => state.oneController,
            builder: (context, oneController) {
              return CustomTextFormField(
                controller: oneController,
                hintText: "lbl68".tr,
                hintStyle: CustomTextStyles.labelLargeCairoPrimary,
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 10.h,
                ),
                borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                fillColor: appTheme.blueGray50,
              );
            },
          ),
          SizedBox(height: 48.h),
          CustomElevatedButton(
            text: "lbl69".tr,
            buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
          )
        ],
      ),
    );
  }
}
