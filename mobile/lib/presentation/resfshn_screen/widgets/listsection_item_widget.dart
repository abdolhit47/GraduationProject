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
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 14.h,
      ),
      decoration: AppDecoration.semanticWhite.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            listsectionItemModelObj.threehundredfor!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 32.h,
                  child: Text(
                    listsectionItemModelObj.tf!,
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
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 40.h,
                  child: Text(
                    listsectionItemModelObj.price!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 54.h),
                  child: Text(
                    listsectionItemModelObj.tf1!,
                    style: CustomTextStyles.titleMediumBluegray200,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                SizedBox(
                  width: 44.h,
                  child: Text(
                    listsectionItemModelObj.twentyfour!,
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
                    listsectionItemModelObj.tf2!,
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
                      listsectionItemModelObj.tf3!,
                      style: CustomTextStyles.titleMediumBluegray200,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                SizedBox(
                  width: 36.h,
                  child: Text(
                    listsectionItemModelObj.time!,
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
                    listsectionItemModelObj.timeOne!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    listsectionItemModelObj.tf4!,
                    style: CustomTextStyles.titleMediumBluegray200,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
