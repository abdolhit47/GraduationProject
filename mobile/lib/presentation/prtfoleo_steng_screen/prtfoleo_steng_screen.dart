import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/date_time_utils.dart';
import '../../core/utils/validation_functions.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image_one.dart';
import '../../widgets/app_bar/appbar_subtitle_four.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/prtfoleo_steng_bloc.dart';
import 'models/prtfoleo_steng_model.dart';

// ignore_for_file: must_be_immutable
class PrtfoleoStengScreen extends StatelessWidget {
  PrtfoleoStengScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<PrtfoleoStengBloc>(
      create: (context) => PrtfoleoStengBloc(PrtfoleoStengState(
        prtfoleoStengModelObj: PrtfoleoStengModel(),
      ))
        ..add(PrtfoleoStengInitialEvent()),
      child: PrtfoleoStengScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
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
                padding: EdgeInsets.symmetric(horizontal: 18.h),
                child: Column(
                  children: [
                    Container(
                      width: 112.h,
                      decoration: AppDecoration.outlinePrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder56,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: theme.colorScheme.primary,
                                  width: 5.h,
                                ),
                                borderRadius: BorderRadiusStyle.roundedBorder56,
                              ),
                              child: Container(
                                height: 114.h,
                                width: double.maxFinite,
                                decoration:
                                    AppDecoration.outlinePrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder56,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgFrame1261154415,
                                      height: 114.h,
                                      width: double.maxFinite,
                                      radius: BorderRadius.circular(
                                        54.h,
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgSolarCameraMi,
                                      height: 20.h,
                                      width: 22.h,
                                      alignment: Alignment.bottomRight,
                                      margin: EdgeInsets.only(right: 10.h),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildFirstNameSection(context),
                    SizedBox(height: 8.h),
                    _buildLastNameSection(context),
                    SizedBox(height: 8.h),
                    _buildUserNameSection(context),
                    SizedBox(height: 8.h),
                    _buildPhoneSection(context),
                    SizedBox(height: 10.h),
                    _buildEmailSection(context),
                    SizedBox(height: 4.h),
                    _buildBirthdateSection(context),
                    SizedBox(height: 8.h),
                    _buildGenderSection(context),
                    SizedBox(height: 26.h),
                    _buildSaveChangesButton(context),
                    SizedBox(height: 40.h),
                    GestureDetector(
                      onTap: () {
                        onTapTxttf(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl39".tr,
                              style: CustomTextStyles.titleMediumGray90013,
                            ),
                            TextSpan(
                              text: "lbl40".tr,
                              style: CustomTextStyles.titleMediumPrimary,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 38.h)
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
      leadingWidth: 40.h,
      leading: AppbarLeadingImageOne(
        imagePath: ImageConstant.imgArrow2,
        height: 1.h,
        width: 16.h,
        margin: EdgeInsets.only(left: 24.h),
      ),
      title: AppbarSubtitleFour(
        text: "lbl32".tr,
        margin: EdgeInsets.only(left: 6.h),
      ),
      actions: [
        AppbarTitle(
          text: "lbl33".tr,
          margin: EdgeInsets.only(right: 21.h),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildNameInput(BuildContext context) {
    return BlocSelector<PrtfoleoStengBloc, PrtfoleoStengState,
        TextEditingController?>(
      selector: (state) => state.nameInputController,
      builder: (context, nameInputController) {
        return CustomTextFormField(
          controller: nameInputController,
          hintText: "lbl34".tr,
          hintStyle: CustomTextStyles.titleSmallCairoErrorContainer,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.h,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlineErrorContainer,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildFirstNameSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Text(
              "first_name".tr,
              style: CustomTextStyles.titleSmallCairoGray40003,
            ),
          ),
          _buildNameInput(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLastNameSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Text(
              "last_name".tr,
              style: CustomTextStyles.titleSmallCairoGray40003,
            ),
          ),
          _buildNameInput(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserNameSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Text(
              "lbl10".tr,
              style: CustomTextStyles.titleSmallCairoGray40003,
            ),
          ),
          _buildNameInput(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneInput(BuildContext context) {
    return BlocSelector<PrtfoleoStengBloc, PrtfoleoStengState,
        TextEditingController?>(
      selector: (state) => state.phoneInputController,
      builder: (context, phoneInputController) {
        return CustomTextFormField(
          controller: phoneInputController,
          hintText: "lbl_0922681290".tr,
          hintStyle: CustomTextStyles.titleSmallCairoErrorContainer,
          textInputType: TextInputType.phone,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.h,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlineErrorContainer,
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
  Widget _buildPhoneSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Text(
              "lbl11".tr,
              style: CustomTextStyles.titleSmallCairoGray40003,
            ),
          ),
          _buildPhoneInput(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return BlocSelector<PrtfoleoStengBloc, PrtfoleoStengState,
        TextEditingController?>(
      selector: (state) => state.emailInputController,
      builder: (context, emailInputController) {
        return CustomTextFormField(
          controller: emailInputController,
          hintText: "msg_melpeters_gmail_com".tr,
          hintStyle: CustomTextStyles.titleSmallCairoErrorContainer,
          textInputType: TextInputType.emailAddress,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.h,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlineErrorContainer,
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
  Widget _buildEmailSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: Text(
              "msg15".tr,
              style: CustomTextStyles.titleSmallCairoGray40003,
            ),
          ),
          _buildEmailInput(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBirthdateInput(BuildContext context) {
    return BlocSelector<PrtfoleoStengBloc, PrtfoleoStengState,
        TextEditingController?>(
      selector: (state) => state.birthdateInputController,
      builder: (context, birthdateInputController) {
        return CustomTextFormField(
          readOnly: true,
          controller: birthdateInputController,
          hintText: "lbl_23_05_2002".tr,
          hintStyle: CustomTextStyles.titleSmallCairoErrorContainer,
          textInputAction: TextInputAction.done,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 10.h,
          ),
          borderDecoration: TextFormFieldStyleHelper.outlineErrorContainer,
          onTap: () {
            onTapBirthdateInput(context);
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBirthdateSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Text(
              "lbl35".tr,
              style: CustomTextStyles.titleSmallCairoGray40003,
            ),
          ),
          _buildBirthdateInput(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildGenderSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Text(
              "lbl36".tr,
              style: CustomTextStyles.titleSmallCairoGray40003,
            ),
          ),
          BlocSelector<PrtfoleoStengBloc, PrtfoleoStengState,
              PrtfoleoStengModel?>(
            selector: (state) => state.prtfoleoStengModelObj,
            builder: (context, prtfoleoStengModelObj) {
              return CustomDropDown(
                hintText: "lbl37".tr,
                items: prtfoleoStengModelObj?.dropdownItemList ?? [],
                prefix: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.h,
                    vertical: 12.h,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowdownBlack900,
                    height: 16.h,
                    width: 16.h,
                    fit: BoxFit.contain,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 44.h,
                ),
                contentPadding: EdgeInsets.fromLTRB(16.h, 6.h, 20.h, 6.h),
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSaveChangesButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl38".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL14,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
    );
  }

  /// Displays a date picker dialog and updates the selected date in the
  /// current [prtfoleoStengModelObj] object if the user selects a valid date.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapBirthdateInput(BuildContext context) async {
    var initialState = BlocProvider.of<PrtfoleoStengBloc>(context).state;
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      context.read<PrtfoleoStengBloc>().add(ChangeDateEvent(date: dateTime));
      initialState.birthdateInputController?.text =
          dateTime.format(pattern: D_M_Y);
    }
  }

  /// Navigates to the prtfoleoStengOneScreen when the action is triggered.
  onTapTxttf(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.prtfoleoStengOneScreen,
    );
  }
}
