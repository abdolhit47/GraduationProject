import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/slider_item_model.dart';

class SliderWidget extends StatefulWidget {
  final List<SliderItemModel> sliderItems;

  const SliderWidget({Key? key, required this.sliderItems}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 180,
          width: double.infinity,
          child: CarouselSlider.builder(
            controller: _carouselController,
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemCount: widget.sliderItems.length,
            itemBuilder: (context, index, realIndex) {
              SliderItemModel model = widget.sliderItems[index];
              return _buildSliderItem(model);
            },
          ),
        ),
        const SizedBox(height: 10),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.sliderItems.length,
          effect: WormEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSliderItem(SliderItemModel model) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueAccent,
      ),
      child: Center(
        child: Text(
          model.tf ?? '',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
