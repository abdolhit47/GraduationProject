import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image_one.dart';
import '../../widgets/app_bar/appbar_subtitle_six.dart';
import '../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../widgets/app_bar/appbar_title_image_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/twenty_bloc.dart';
import 'models/twenty_model.dart';

class TwentyScreen extends StatelessWidget {
  const TwentyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TwentyBloc>(
      create: (context) => TwentyBloc(TwentyState(
        twentyModelObj: TwentyModel(),
      ))
        ..add(TwentyInitialEvent()),
      child: TwentyScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TwentyBloc>(
      create: (context) => TwentyBloc(TwentyState(
        twentyModelObj: TwentyModel(),
      ))
        ..add(TwentyInitialEvent()),
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        appBar: _buildAppBar(context),
        body: SafeArea(
          top: false,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: BlocBuilder<TwentyBloc, TwentyState>(
                      builder: (context, state) {
                        if (state.messageList == null ||
                            state.chatUser == null) {
                          return Container();
                        }
                        return Chat(
                          showUserNames: false,
                          disableImageGallery: false,
                          dateHeaderThreshold: 86400000,
                          messages: state.messageList ?? [],
                          user: state.chatUser!,
                          bubbleBuilder: (child,
                              {required message, required nextMessageInGroup}) {
                            return message.author.id == state.chatUser!.id
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        4.h,
                                      ),
                                    ),
                                    child: child)
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        4.h,
                                      ),
                                    ),
                                    child: child,
                                  );
                          },
                          textMessageBuilder: (textMessage,
                              {required messageWidth, required showName}) {
                            return textMessage.author.id == state.chatUser!.id
                                ? Container(
                                    width: double.maxFinite,
                                    padding: EdgeInsets.only(
                                      top: 10.h,
                                      right: 12.h,
                                      bottom: 10.h,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 226.h,
                                          child: Text(
                                            textMessage.text.toString(),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: CustomTextStyles
                                                .bodySmallOnPrimary
                                                .copyWith(
                                              color:
                                                  theme.colorScheme.onPrimary,
                                              height: 1.50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 22.h)
                                      ],
                                    ))
                                : Row(
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgGroupGray20001,
                                        height: 24.h,
                                        width: 24.h,
                                        alignment: Alignment.bottomCenter,
                                      ),
                                      Container(
                                        width: 196.h,
                                        margin: EdgeInsets.only(left: 8.h),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.h,
                                          vertical: 8.h,
                                        ),
                                        decoration: AppDecoration.neutralBlack20
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              textMessage.text.toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                              style: CustomTextStyles
                                                  .bodySmallBlack900
                                                  .copyWith(
                                                color: appTheme.black900,
                                                height: 1.50,
                                              ),
                                            ),
                                            SizedBox(height: 2.h)
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                          },
                          onSendPressed: (types.PartialText text) {},
                          customBottomWidget: Container(
                            height: 96.h,
                            padding: EdgeInsets.all(24.h),
                            decoration: AppDecoration.semanticWhite.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: BlocSelector<TwentyBloc, TwentyState,
                                      TextEditingController?>(
                                    selector: (state) => state.oneController,
                                    builder: (context, oneController) {
                                      return CustomTextFormField(
                                        controller: oneController,
                                        hintText: "lbl50".tr,
                                        textInputAction: TextInputAction.done,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.h,
                                          vertical: 10.h,
                                        ),
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineGrayTL8,
                                        fillColor: appTheme.gray5001,
                                      );
                                    },
                                  ),
                                ),
                                CustomIconButton(
                                  height: 48.h,
                                  width: 48.h,
                                  padding: EdgeInsets.all(10.h),
                                  decoration:
                                      IconButtonStyleHelper.outlineBlack,
                                  child: CustomImageView(
                                    imagePath:
                                        ImageConstant.imgFluentSend16Filled,
                                  ),
                                )
                              ],
                            ),
                          ),
                          customStatusBuilder: (message, {required context}) {
                            return Container();
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImageOne(
        imagePath: ImageConstant.imgIconArrowLeft,
        margin: EdgeInsets.only(left: 24.h),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: Row(
          children: [
            AppbarTitleImageOne(
              imagePath: ImageConstant.imgRectangle40x40,
              height: 40.h,
              width: 40.h,
            ),
            Container(
              height: 39.h,
              width: 76.h,
              margin: EdgeInsets.only(left: 12.h),
              child: Stack(
                children: [
                  AppbarSubtitleThree(
                    text: "lbl48".tr,
                    margin: EdgeInsets.only(bottom: 17.h),
                  ),
                  Container(
                    height: 6.h,
                    width: 6.h,
                    margin: EdgeInsets.only(
                      top: 27.h,
                      right: 70.h,
                      bottom: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.teal400,
                      borderRadius: BorderRadius.circular(
                        3.h,
                      ),
                    ),
                  ),
                  AppbarSubtitleSix(
                    text: "lbl49".tr,
                    margin: EdgeInsets.only(
                      left: 14.h,
                      top: 21.h,
                      right: 4.h,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
