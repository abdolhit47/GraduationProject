import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/twentyone_one_item_model.dart';

// ignore_for_file: must_be_immutable
class TwentyoneOneItemWidget extends StatelessWidget {
  TwentyoneOneItemWidget(this.twentyoneOneItemModelObj, {Key? key})
      : super(
          key: key,
        );

  TwentyoneOneItemModel twentyoneOneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: twentyoneOneItemModelObj.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            height: 16.h,
            width: 18.h,
          ),
          Spacer(),
          Text(
            twentyoneOneItemModelObj.tf!,
            style: CustomTextStyles.bodySmallGray90005_1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: CustomIconButton(
              height: 32.h,
              width: 32.h,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.fillGray,
              child: CustomImageView(
                imagePath: twentyoneOneItemModelObj.iconuserOne!,
              ),
            ),
          )
        ],
      ),
    );
  }
}
