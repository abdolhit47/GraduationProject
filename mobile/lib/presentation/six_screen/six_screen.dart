import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/six_bloc.dart';
import 'models/six_model.dart';

class SixScreen extends StatelessWidget {
  const SixScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SixBloc>(
      create: (context) => SixBloc(SixState(
        sixModelObj: SixModel(),
      ))
        ..add(SixInitialEvent()),
      child: SixScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SixBloc, SixState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colorScheme.onPrimary,
          body: SafeArea(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 38.h,
                vertical: 44.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgWhatsappImage2024111636x36,
                    height: 36.h,
                    width: 38.h,
                    radius: BorderRadius.circular(
                      4.h,
                    ),
                  ),
                  Spacer(
                    flex: 43,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgFrame,
                    height: 120.h,
                    width: 122.h,
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    "msg10".tr,
                    style: CustomTextStyles.headlineSmallGray90006,
                  ),
                  SizedBox(height: 28.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      "msg11".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          CustomTextStyles.bodyMediumBluegray30001_1.copyWith(
                        height: 1.60,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 56,
                  ),
                  CustomElevatedButton(
                    text: "lbl12".tr,
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    onPressed: () {
                      onTapContinueButton(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Navigates to the nineScreen when the action is triggered.
  onTapContinueButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.nineScreen,
    );
  }
}
