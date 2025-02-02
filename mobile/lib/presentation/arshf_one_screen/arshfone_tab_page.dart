import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import 'bloc/arshf_one_bloc.dart';
import 'models/arshfone_tab_model.dart';

class ArshfoneTabPage extends StatefulWidget {
  const ArshfoneTabPage({Key? key})
      : super(
          key: key,
        );

  @override
  ArshfoneTabPageState createState() => ArshfoneTabPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ArshfOneBloc>(
      create: (context) => ArshfOneBloc(ArshfOneState(
        arshfoneTabModelObj: ArshfoneTabModel(),
      ))
        ..add(ArshfOneInitialEvent()),
      child: ArshfoneTabPage(),
    );
  }
}

class ArshfoneTabPageState extends State<ArshfoneTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 32.h,
      ),
      child: Column(
        children: [_buildTransactionDetailsColumn(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildTransactionDetailsColumn(BuildContext context) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 32.h,
                  child: Text(
                    "lbl18".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: CustomTextStyles.titleMediumBluegray200Medium,
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
                    padding: EdgeInsets.only(left: 12.h),
                    child: Text(
                      "msg29".tr,
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
                  padding: EdgeInsets.only(left: 16.h),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 78.h,
                  child: Text(
                    "lbl_20000".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Container(
                  width: 80.h,
                  margin: EdgeInsets.only(left: 32.h),
                  child: Text(
                    "lbl80".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: CustomTextStyles.titleMediumBluegray200,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 22.h),
          CustomOutlinedButton(
            height: 40.h,
            text: "lbl75".tr,
            buttonStyle: CustomButtonStyles.outlineBlueGray,
            buttonTextStyle: CustomTextStyles.titleSmallCairoBluegray600,
          )
        ],
      ),
    );
  }
}
