import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/four_bloc.dart';
import 'models/four_model.dart';

// ignore_for_file: must_be_immutable
class FourScreen extends StatelessWidget {
  FourScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FourBloc>(
      create: (context) => FourBloc(FourState(
        fourModelObj: FourModel(),
      ))
        ..add(FourInitialEvent()),
      child: FourScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: _buildAppBar(context),
      body: SafeArea(
        top: false,
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 22.h,
                  top: 16.h,
                  right: 22.h,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl5".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "msg5".tr,
                        style: CustomTextStyles.titleSmallGray600,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    _buildLoginForm(context),
                    SizedBox(height: 78.h),
                    _buildSignInOptions(context),
                    SizedBox(height: 38.h),
                    GestureDetector(
                      onTap: () {
                        onTapTxttf(context);
                      },
                      child: Text(
                        "msg9".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(height: 30.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgWhatsappImage2024111636x36,
        height: 36.h,
        width: 36.h,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 10.h,
          bottom: 10.h,
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconClose,
          margin: EdgeInsets.only(right: 23.h),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildFirstNameInputField(BuildContext context) {
    return BlocSelector<FourBloc, FourState, TextEditingController?>(
      selector: (state) => state.nameInputFieldController,
      builder: (context, nameInputFieldController) {
        return CustomTextFormField(
          controller: nameInputFieldController,
          hintText: "first_name".tr,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.h,
          ),
        );
      },
    );
  }

  Widget _buildLastNameInputField(BuildContext context) {
    return BlocSelector<FourBloc, FourState, TextEditingController?>(
      selector: (state) => state.nameInputFieldController,
      builder: (context, nameInputFieldController) {
        return CustomTextFormField(
          controller: nameInputFieldController,
          hintText: "lbl7".tr,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.h,
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEmailInputField(BuildContext context) {
    return BlocSelector<FourBloc, FourState, TextEditingController?>(
      selector: (state) => state.emailInputFieldController,
      builder: (context, emailInputFieldController) {
        return CustomTextFormField(
          controller: emailInputFieldController,
          hintText: "msg_pyotrk1_email_com".tr,
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.h,
          ),
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPasswordInputField(BuildContext context) {
    return BlocSelector<FourBloc, FourState, TextEditingController?>(
      selector: (state) => state.passwordInputFieldController,
      builder: (context, passwordInputFieldController) {
        return CustomTextFormField(
          controller: passwordInputFieldController,
          textInputAction: TextInputAction.done,
          prefix: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 12.h,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconEyeclose,
              height: 16.h,
              width: 20.h,
              fit: BoxFit.contain,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 48.h,
          ),
          obscureText: true,
          contentPadding: EdgeInsets.fromLTRB(16.h, 6.h, 20.h, 6.h),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "first_name".tr,
                  style: CustomTextStyles.labelLargeBluegray800,
                ),
                _buildFirstNameInputField(context)
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "last_name".tr,
                  style: CustomTextStyles.labelLargeBluegray800,
                ),
                _buildLastNameInputField(context)
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "msg6".tr,
                  style: CustomTextStyles.labelLargeBluegray800,
                ),
                _buildEmailInputField(context)
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "lbl8".tr,
            style: CustomTextStyles.labelLargeBluegray800,
          ),
          SizedBox(height: 8.h),
          _buildPasswordInputField(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateAccountButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl9".tr,
      buttonStyle: CustomButtonStyles.fillPrimary,
      onPressed: () {
        onTapCreateAccountButton(context);
      },
    );
  }

  /// Section Widget
  Widget _buildGoogleSignInButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "msg8".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: 16.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      buttonTextStyle: CustomTextStyles.titleSmallBluegray700,
    );
  }

  /// Section Widget
  Widget _buildSignInOptions(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 18,
        children: [
          _buildCreateAccountButton(context),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: appTheme.gray20001,
                  ),
                ),
                Text(
                  "msg7".tr,
                  style: CustomTextStyles.labelLargeBold,
                ),
                Expanded(
                  child: Divider(
                    color: appTheme.gray20001,
                  ),
                )
              ],
            ),
          ),
          _buildGoogleSignInButton(context)
        ],
      ),
    );
  }

  /// Navigates to the sixScreen when the action is triggered.
  onTapCreateAccountButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sixScreen,
    );
  }

  /// Navigates to the twentyfiveScreen when the action is triggered.
  onTapTxttf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.twentyfiveScreen,
    );
  }
}
