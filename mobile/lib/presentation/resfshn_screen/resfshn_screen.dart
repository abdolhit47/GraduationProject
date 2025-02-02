import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/resfshn_bloc.dart';
import 'models/listsection_item_model.dart';
import 'models/resfshn_model.dart';
import 'widgets/listsection_item_widget.dart';

class ResfshnScreen extends StatelessWidget {
  const ResfshnScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ResfshnBloc>(
      create: (context) => ResfshnBloc(ResfshnState(
        resfshnModelObj: ResfshnModel(),
      ))
        ..add(ResfshnInitialEvent()),
      child: ResfshnScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHorizontalScrollSection(context),
              _buildListSection(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScrollSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(right: 152.h),
          decoration: AppDecoration.shdo,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 18.h),
                child: Text(
                  "lbl27".tr,
                  style: CustomTextStyles.titleMediumPoppinsBlack900,
                ),
              ),
              Text(
                "msg14".tr,
                style: CustomTextStyles.bodyMediumBluegray30001_1,
              ),
              SizedBox(height: 48.h)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildListSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 26.h,
          right: 22.h,
        ),
        child: BlocSelector<ResfshnBloc, ResfshnState, ResfshnModel?>(
          selector: (state) => state.resfshnModelObj,
          builder: (context, resfshnModelObj) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16.h,
                );
              },
              itemCount: resfshnModelObj?.listsectionItemList.length ?? 0,
              itemBuilder: (context, index) {
                ListsectionItemModel model =
                    resfshnModelObj?.listsectionItemList[index] ??
                        ListsectionItemModel();
                return ListsectionItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
