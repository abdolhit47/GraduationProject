import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/pricinglist_item_model.dart';

// ignore_for_file: must_be_immutable
class PricinglistItemWidget extends StatelessWidget {
  PricinglistItemWidget(this.pricinglistItemModelObj, {Key? key})
      : super(
          key: key,
        );

  PricinglistItemModel pricinglistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              pricinglistItemModelObj.tf!,
              style: theme.textTheme.titleSmall,
            ),
            Text(
              pricinglistItemModelObj.onehundredtwent!,
              style: theme.textTheme.bodySmall,
            )
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                pricinglistItemModelObj.tf1!,
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                pricinglistItemModelObj.ten!,
                style: theme.textTheme.bodySmall,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: CustomIconButton(
            height: 40.h,
            width: 40.h,
            padding: EdgeInsets.all(12.h),
            decoration: IconButtonStyleHelper.none,
            child: CustomImageView(
              imagePath: ImageConstant.imgHeroiconsSolid,
            ),
          ),
        )
      ],
    );
  }
}
