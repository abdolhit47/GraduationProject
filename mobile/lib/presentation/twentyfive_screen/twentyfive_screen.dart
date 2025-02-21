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
import 'bloc/twentyfive_bloc.dart';
import 'models/twentyfive_model.dart';

// ignore_for_file: must_be_immutable
class TwentyfiveScreen extends StatelessWidget {
  TwentyfiveScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<TwentyfiveBloc>(
      create: (context) => TwentyfiveBloc(TwentyfiveState(
        twentyfiveModelObj: TwentyfiveModel(),
      ))
        ..add(TwentyfiveInitialEvent()),
      child: TwentyfiveScreen(),
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
                padding: EdgeInsets.symmetric(horizontal: 22.h),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
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
                          SizedBox(height: 16.h),
                          _buildUsernameInputColumn(context),
                          SizedBox(height: 16.h),
                          _buildFullNameInputColumn(context),
                          SizedBox(height: 16.h),
                          _buildPhoneNumberInputColumn(context),
                          SizedBox(height: 16.h),
                          _buildEmailInputColumn(context),
                          SizedBox(height: 16.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "lbl8".tr,
                              style: CustomTextStyles.labelLargeBluegray800,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          _buildPasswordInputField(context),
                          SizedBox(height: 16.h),
                          _buildCreateAccountButton(context),
                          SizedBox(height: 18.h),
                          _buildAlternativeLoginOptions(context),
                          SizedBox(height: 82.h),
                          GestureDetector(
                            onTap: () {
                              onTapTxttf(context);
                            },
                            child: Text(
                              "msg9".tr,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildGoogleLoginColumn(context),
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
  Widget _buildUsernameInputField(BuildContext context) {
    return BlocSelector<TwentyfiveBloc, TwentyfiveState,
        TextEditingController?>(
      selector: (state) => state.usernameInputFieldController,
      builder: (context, usernameInputFieldController) {
        return CustomTextFormField(
          controller: usernameInputFieldController,
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
  Widget _buildUsernameInputColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "lbl10".tr,
            style: CustomTextStyles.labelLargeBluegray800,
          ),
          _buildUsernameInputField(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFullNameInputField(BuildContext context) {
    return BlocSelector<TwentyfiveBloc, TwentyfiveState,
        TextEditingController?>(
      selector: (state) => state.fullNameInputFieldController,
      builder: (context, fullNameInputFieldController) {
        return CustomTextFormField(
          controller: fullNameInputFieldController,
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
  Widget _buildFullNameInputColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "lbl6".tr,
            style: CustomTextStyles.labelLargeBluegray800,
          ),
          _buildFullNameInputField(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberInputField(BuildContext context) {
    return BlocSelector<TwentyfiveBloc, TwentyfiveState,
        TextEditingController?>(
      selector: (state) => state.phoneNumberInputFieldController,
      builder: (context, phoneNumberInputFieldController) {
        return CustomTextFormField(
          controller: phoneNumberInputFieldController,
          hintText: "lbl_0922681902".tr,
          textInputType: TextInputType.phone,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.h,
          ),
          validator: (value) {
            if (!isValidPhone(value)) {
              return "err_msg_please_enter_valid_phone_number".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberInputColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "lbl11".tr,
            style: CustomTextStyles.labelLargeBluegray800,
          ),
          _buildPhoneNumberInputField(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInputField(BuildContext context) {
    return BlocSelector<TwentyfiveBloc, TwentyfiveState,
        TextEditingController?>(
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
  Widget _buildEmailInputColumn(BuildContext context) {
    return Container(
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
    );
  }

  /// Section Widget
  Widget _buildPasswordInputField(BuildContext context) {
    return BlocSelector<TwentyfiveBloc, TwentyfiveState,
        TextEditingController?>(
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
  Widget _buildAlternativeLoginOptions(BuildContext context) {
    return SizedBox(
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
    );
  }

  /// Section Widget
  Widget _buildGoogleLoginButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "msg8".tr,
      margin: EdgeInsets.only(bottom: 12.h),
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
  Widget _buildGoogleLoginColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildGoogleLoginButton(context)],
      ),
    );
  }

  /// Navigates to the sixScreen when the action is triggered.
  onTapCreateAccountButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sixScreen,
    );
  }

  /// Navigates to the fourScreen when the action is triggered.
  onTapTxttf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.fourScreen,
    );
  }
}
