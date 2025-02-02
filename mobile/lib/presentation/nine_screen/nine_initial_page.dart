import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image_one.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../widgets/app_bar/appbar_trailing_image_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/nine_bloc.dart';
import 'models/nine_initial_model.dart';
import 'models/pricinglist_item_model.dart';
import 'models/slider_item_model.dart';
import 'widgets/pricinglist_item_widget.dart';
import 'widgets/slider_item_widget.dart';

class NineInitialPage extends StatefulWidget {
  const NineInitialPage({Key? key})
      : super(
          key: key,
        );

  @override
  NineInitialPageState createState() => NineInitialPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<NineBloc>(
      create: (context) => NineBloc(NineState(
        nineInitialModelObj: NineInitialModel(),
      ))
        ..add(NineInitialEvent()),
      child: NineInitialPage(),
    );
  }
}

class NineInitialPageState extends State<NineInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.semanticWhite,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: _buildAppBar(context),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 24.h,
                top: 16.h,
                right: 24.h,
              ),
              child: Column(
                spacing: 22,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildPromoSlider(context),
                  Text(
                    "lbl16".tr,
                    style: CustomTextStyles.titleSmallBluegray90003,
                  ),
                  _buildPricingList(context),
                  SizedBox(height: 26.h)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImageOne(
        imagePath: ImageConstant.imgFrameBlueGray30001,
        margin: EdgeInsets.only(left: 24.h),
        onTap: () {
          onTapImagetwo(context);
        },
      ),
      title: Column(
        children: [
          AppbarSubtitleFive(
            text: "lbl13".tr,
            margin: EdgeInsets.only(left: 36.h),
          ),
          AppbarSubtitleTwo(
            text: "lbl14".tr,
          )
        ],
      ),
      actions: [
        AppbarTrailingImageOne(
          imagePath: ImageConstant.imgEllipse1,
          height: 42.h,
          width: 42.h,
          margin: EdgeInsets.only(
            top: 5.h,
            right: 24.h,
            bottom: 8.h,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildPromoSlider(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BlocBuilder<NineBloc, NineState>(
            builder: (context, state) {
              return CarouselSlider.builder(
                options: CarouselOptions(
                  height: 180.h,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    context
                        .read<NineBloc>()
                        .add(ChangeSliderIndexEvent(value: index));
                  },
                ),
                itemCount:
                    state.nineInitialModelObj?.sliderItemList.length ?? 0,
                itemBuilder: (context, index, realIndex) {
                  SliderItemModel model =
                      state.nineInitialModelObj?.sliderItemList[index] ??
                          SliderItemModel();
                  return SliderItemWidget(
                    model,
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<NineBloc, NineState>(
              builder: (context, state) {
                return Container(
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 36.h),
                  child: AnimatedSmoothIndicator(
                    activeIndex: state.sliderIndex,
                    count:
                        state.nineInitialModelObj?.sliderItemList.length ?? 0,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      spacing: 6,
                      activeDotColor: theme.colorScheme.onPrimary,
                      dotColor: theme.colorScheme.onPrimary.withValues(
                        alpha: 0.5,
                      ),
                      dotHeight: 4.h,
                      dotWidth: 4.h,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPricingList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 36.h),
        child: BlocSelector<NineBloc, NineState, NineInitialModel?>(
          selector: (state) => state.nineInitialModelObj,
          builder: (context, nineInitialModelObj) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 44.h,
                );
              },
              itemCount: nineInitialModelObj?.pricinglistItemList.length ?? 0,
              itemBuilder: (context, index) {
                PricinglistItemModel model =
                    nineInitialModelObj?.pricinglistItemList[index] ??
                        PricinglistItemModel();
                return PricinglistItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Navigates to the confrmashnScreen when the action is triggered.
  onTapImagetwo(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.confrmashnScreen,
    );
  }
}
