import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/confirmationlist_item_model.dart';

// ignore_for_file: must_be_immutable
class ConfirmationlistItemWidget extends StatelessWidget {
  ConfirmationlistItemWidget(this.confirmationlistItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ConfirmationlistItemModel confirmationlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 8.h,
      ),
      decoration: AppDecoration.shdo.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 14,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 48.h,
                  child: Text(
                    confirmationlistItemModelObj.twentyone!,
                    maxLines: null,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: CustomTextStyles.bodySmallCairoBluegray200.copyWith(
                      height: 2.40,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 70.h,
                  child: Text(
                    confirmationlistItemModelObj.tf!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: CustomTextStyles.labelLargeCairoGray90012.copyWith(
                      height: 2.00,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgHeroiconsSolid,
                  height: 16.h,
                  width: 18.h,
                  margin: EdgeInsets.only(left: 4.h),
                )
              ],
            ),
          ),
          Text(
            confirmationlistItemModelObj.tf1!,
            maxLines: null,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: CustomTextStyles.bodySmallCairoGray90012.copyWith(
              height: 2.00,
            ),
          ),
          SizedBox(height: 10.h)
        ],
      ),
    );
  }
}
