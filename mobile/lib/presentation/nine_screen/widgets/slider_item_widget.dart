import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/slider_item_model.dart';

// ignore_for_file: must_be_immutable
class SliderItemWidget extends StatelessWidget {
  SliderItemWidget(this.sliderItemModelObj, {Key? key})
      : super(
          key: key,
        );

  SliderItemModel sliderItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 152.h,
                margin: EdgeInsets.only(top: 26.h),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle,
                      height: 94.h,
                      width: 58.h,
                      alignment: Alignment.bottomLeft,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 32.h,
                        bottom: 60.h,
                      ),
                      child: Text(
                        sliderItemModelObj.tf!,
                        style: CustomTextStyles.labelLargeOnPrimary,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 6.h,
                          right: 12.h,
                        ),
                        child: Text(
                          sliderItemModelObj.forty!,
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        sliderItemModelObj.tf1!,
                        style: CustomTextStyles.titleSmallOnPrimary,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.img02,
            height: 132.h,
            width: 156.h,
            margin: EdgeInsets.only(top: 6.h),
          )
        ],
      ),
    );
  }
}
