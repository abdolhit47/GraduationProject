import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image_one.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/prtfoleo_steng_one_bloc.dart';
import 'models/prtfoleo_steng_one_model.dart';

class PrtfoleoStengOneScreen extends StatelessWidget {
  const PrtfoleoStengOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<PrtfoleoStengOneBloc>(
      create: (context) => PrtfoleoStengOneBloc(PrtfoleoStengOneState(
        prtfoleoStengOneModelObj: PrtfoleoStengOneModel(),
      ))
        ..add(PrtfoleoStengOneInitialEvent()),
      child: PrtfoleoStengOneScreen(),
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
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 64.h,
                width: 66.h,
              ),
              SizedBox(height: 24.h),
              Text(
                "msg22".tr,
                style: CustomTextStyles.headlineSmallCairo,
              ),
              SizedBox(height: 8.h),
              _buildPasswordChangeSection(context)
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
  Widget _buildPasswordChangeSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 18.h,
      ),
      decoration: AppDecoration.shdo.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 6.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "msg23".tr,
              style: CustomTextStyles.titleSmallCairoBluegray200_1,
            ),
          ),
          SizedBox(height: 2.h),
          BlocSelector<PrtfoleoStengOneBloc, PrtfoleoStengOneState,
              TextEditingController?>(
            selector: (state) => state.twoController,
            builder: (context, twoController) {
              return CustomTextFormField(
                controller: twoController,
                hintText: "lbl68".tr,
                hintStyle: CustomTextStyles.labelLargeCairoPrimary,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 10.h,
                ),
                borderDecoration: TextFormFieldStyleHelper.outlineBlack,
                fillColor: appTheme.blueGray50,
              );
            },
          ),
          SizedBox(height: 22.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "msg24".tr,
              style: CustomTextStyles.titleSmallCairoBluegray200_1,
            ),
          ),
          SizedBox(height: 4.h),
          BlocSelector<PrtfoleoStengOneBloc, PrtfoleoStengOneState,
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
          SizedBox(height: 32.h),
          CustomElevatedButton(
            text: "lbl69".tr,
            buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
          ),
          SizedBox(height: 20.h),
          Text(
            "msg25".tr,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: CustomTextStyles.titleMediumBluegray200,
          )
        ],
      ),
    );
  }
}
