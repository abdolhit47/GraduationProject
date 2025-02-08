import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image_one.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/confrmashn_bloc.dart';
import 'models/confirmationlist_item_model.dart';
import 'models/confrmashn_model.dart';
import 'widgets/confirmationlist_item_widget.dart';

class ConfrmashnScreen extends StatelessWidget {
  const ConfrmashnScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ConfrmashnBloc>(
      create: (context) => ConfrmashnBloc(ConfrmashnState(
        confrmashnModelObj: ConfrmashnModel(),
      ))
        ..add(ConfrmashnInitialEvent()),
      child: ConfrmashnScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      appBar: _buildAppBar(context),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 16.h,
            top: 12.h,
            right: 16.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildConfirmationList(context)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 37.h,
      leading: AppbarLeadingImageOne(
        imagePath: ImageConstant.imgArrowDown,
        height: 20.h,
        onTap: () {
          NavigatorService.goBack();
        },
        margin: EdgeInsets.only(left: 13.h),
      ),
      title: AppbarSubtitleOne(
        text: "lbl25".tr,
        margin: EdgeInsets.only(left: 20.h),
        onTap: () {
          onTapOne(context);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmationList(BuildContext context) {
    return Expanded(
      child: BlocSelector<ConfrmashnBloc, ConfrmashnState, ConfrmashnModel?>(
        selector: (state) => state.confrmashnModelObj,
        builder: (context, confrmashnModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemCount: confrmashnModelObj?.confirmationlistItemList.length ?? 0,
            itemBuilder: (context, index) {
              ConfirmationlistItemModel model =
                  confrmashnModelObj?.confirmationlistItemList[index] ??
                      ConfirmationlistItemModel();
              return ConfirmationlistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Navigates to the nineScreen when the action is triggered.
  onTapOne(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.nineScreen,
    );
  }
}
