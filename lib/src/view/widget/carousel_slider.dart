import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/app_color.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min, // Overflow oldini oladi
      children: [
        SizedBox(
          height: height * 0.35,
          width: double.infinity,
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (int currentIndex) {
              setState(() {
                newIndex = currentIndex;
              });
            },
            itemBuilder: (_, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.items[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5), // ✅ Bo'sh joyni kamaytirdik
        Center(
          child: AnimatedSmoothIndicator(
            effect: const WormEffect(
              dotColor: Colors.white,
              activeDotColor: AppColor.primary,
            ),
            count: widget.items.length,
            activeIndex: newIndex,
          ),
        ),
      ],
    );
  }
}
