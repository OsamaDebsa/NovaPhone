import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomAutoScrollListView extends StatelessWidget {
  final List<Widget> items;
  // final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  // final bool enlargeCenterPage;
  final double viewportFraction;
  final Axis scrollDirection;
  final void Function(int index)? onItemTap;

  const CustomAutoScrollListView({
    super.key,
    required this.items,
    // this.height = 230,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
    // this.enlargeCenterPage = true,
    this.viewportFraction = 0.5,
    this.scrollDirection = Axis.horizontal,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      options: CarouselOptions(
        // height: height,
        autoPlay: autoPlay,
        autoPlayInterval: autoPlayInterval,
        // enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
        scrollDirection: scrollDirection,
      ),
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: onItemTap != null ? () => onItemTap!(index) : null,
          child: items[index],
        );
      },
    );
  }
}
