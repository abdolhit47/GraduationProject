import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/resfshn_one_bloc.dart';
import 'models/resfshn_one_model.dart'; // ignore_for_file: must_be_immutable

class ResfshnOnePage extends StatefulWidget {
  const ResfshnOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  ResfshnOnePageState createState() => ResfshnOnePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ResfshnOneBloc>(
      create: (context) => ResfshnOneBloc(ResfshnOneState(
        resfshnOneModelObj: ResfshnOneModel(),
      ))
        ..add(ResfshnOneInitialEvent()),
      child: ResfshnOnePage(),
    );
  }
}

class ResfshnOnePageState extends State<ResfshnOnePage>
    with AutomaticKeepAliveClientMixin<ResfshnOnePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ResfshnOneBloc, ResfshnOneState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            width: double.maxFinite,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 22.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 32.h),
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          spacing: 24,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildOrderDetailsColumn(context),
                            _buildOrderDetailsColumn1(context)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildOrderDetailsColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 22.h,
      ),
      decoration: AppDecoration.semanticWhite.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "lbl_347824686".tr,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 6.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildLocationRow(
              context,
              one: "lbl18".tr,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                SizedBox(
                  width: 44.h,
                  child: Text(
                    "lbl_2_24".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: SizedBox(
                      width: 32.h,
                      child: Divider(
                        indent: 14.h,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48.h,
                  margin: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl29".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "lbl30".tr,
                      style: CustomTextStyles.titleMediumBluegray200,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 6.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                SizedBox(
                  width: 36.h,
                  child: Text(
                    "lbl_8_00".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: SizedBox(
                      width: 32.h,
                      child: Divider(
                        indent: 14.h,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 36.h,
                  margin: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_7_00".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    "lbl31".tr,
                    style: CustomTextStyles.titleMediumBluegray200,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildDeliveryStatusRow(
              context,
              one: "lbl78".tr,
              one1: "lbl74".tr,
            ),
          ),
          SizedBox(height: 22.h),
          CustomElevatedButton(
            height: 40.h,
            text: "lbl79".tr,
            buttonTextStyle: CustomTextStyles.titleSmallCairoOnPrimary,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOrderDetailsColumn1(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 22.h,
      ),
      decoration: AppDecoration.semanticWhite.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "lbl_347824686".tr,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 6.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildLocationRow(
              context,
              one: "lbl18".tr,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                SizedBox(
                  width: 44.h,
                  child: Text(
                    "lbl_2_24".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: SizedBox(
                      width: 32.h,
                      child: Divider(
                        indent: 14.h,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48.h,
                  margin: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl29".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "lbl30".tr,
                      style: CustomTextStyles.titleMediumBluegray200,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 6.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                SizedBox(
                  width: 36.h,
                  child: Text(
                    "lbl_8_00".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: SizedBox(
                      width: 32.h,
                      child: Divider(
                        indent: 14.h,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 36.h,
                  margin: EdgeInsets.only(left: 16.h),
                  child: Text(
                    "lbl_7_00".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    "lbl31".tr,
                    style: CustomTextStyles.titleMediumBluegray200,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildDeliveryStatusRow(
              context,
              one: "lbl78".tr,
              one1: "lbl74".tr,
            ),
          ),
          SizedBox(height: 22.h),
          CustomElevatedButton(
            height: 40.h,
            text: "lbl79".tr,
            buttonTextStyle: CustomTextStyles.titleSmallCairoOnPrimary,
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDeliveryStatusRow(
    BuildContext context, {
    required String one,
    required String one1,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 86.h,
          child: Text(
            one,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.gray90012,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32.h),
          child: Text(
            one1,
            style: CustomTextStyles.titleMediumBluegray200.copyWith(
              color: appTheme.blueGray200,
            ),
          ),
        )
      ],
    );
  }

  /// Common widget
  Widget _buildLocationRow(
    BuildContext context, {
    required String one,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 32.h,
          child: Text(
            one,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: CustomTextStyles.titleMediumBluegray200Medium.copyWith(
              color: appTheme.blueGray200,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgLinkedin,
          height: 20.h,
          width: 16.h,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
            left: 8.h,
            bottom: 6.h,
          ),
        )
      ],
    );
  }
}
