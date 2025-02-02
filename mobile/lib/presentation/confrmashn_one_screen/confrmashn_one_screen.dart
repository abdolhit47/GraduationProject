import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_pin_code_text_field.dart';
import 'bloc/confrmashn_one_bloc.dart';
import 'models/confrmashn_one_model.dart';

class ConfrmashnOneScreen extends StatelessWidget {
  const ConfrmashnOneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ConfrmashnOneBloc>(
      create: (context) => ConfrmashnOneBloc(ConfrmashnOneState(
        confrmashnOneModelObj: ConfrmashnOneModel(),
      ))
        ..add(ConfrmashnOneInitialEvent()),
      child: ConfrmashnOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 24.h,
            top: 162.h,
            right: 24.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgTelevision,
                    height: 14.h,
                    width: 18.h,
                  ),
                  Text(
                    "lbl70".tr,
                    style: CustomTextStyles.headlineSmallCairoPrimary,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgTelevisionPrimary,
                    height: 14.h,
                    width: 18.h,
                  )
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                "msg26".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallCairoBluegray200_1.copyWith(
                  height: 1.71,
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 4.h),
                child: BlocSelector<ConfrmashnOneBloc, ConfrmashnOneState,
                    TextEditingController?>(
                  selector: (state) => state.otpController,
                  builder: (context, otpController) {
                    return CustomPinCodeTextField(
                      context: context,
                      controller: otpController,
                      onChanged: (value) {
                        otpController?.text = value;
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 44.h),
              Text(
                "lbl_1_36".tr,
                style: CustomTextStyles.titleSmallCairoBluegray200,
              ),
              Text(
                "msg27".tr,
                style: CustomTextStyles.titleMediumBluegray200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
