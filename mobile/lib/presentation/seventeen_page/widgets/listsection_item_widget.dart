import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/listsection_item_model.dart';

// ignore_for_file: must_be_immutable
class ListsectionItemWidget extends StatelessWidget {
  ListsectionItemWidget(this.listsectionItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ListsectionItemModel listsectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                listsectionItemModelObj.price!,
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                listsectionItemModelObj.tf!,
                style: theme.textTheme.bodySmall,
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  listsectionItemModelObj.seventyfourmill!,
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  listsectionItemModelObj.tf1!,
                  style: theme.textTheme.bodySmall,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 22.h),
            padding: EdgeInsets.symmetric(
              horizontal: 2.h,
              vertical: 10.h,
            ),
            decoration: AppDecoration.fillTeal.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Text(
              listsectionItemModelObj.tf2!,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodySmallTeal400,
            ),
          )
        ],
      ),
    );
  }
}
