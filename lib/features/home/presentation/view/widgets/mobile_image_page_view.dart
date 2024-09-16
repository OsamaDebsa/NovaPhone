import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:nova_phone/core/widgets/custom_image_display.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';

class MobileImagePageView extends StatefulWidget {
  const MobileImagePageView({super.key, required this.mobileDetails});
  final MobileDetails mobileDetails;

  @override
  State<MobileImagePageView> createState() => _MobileImagePageViewState();
}

class _MobileImagePageViewState extends State<MobileImagePageView> {
  late final LoopPageController _pageController;
  Timer? _timer;
  final Duration _scrollDuration = const Duration(seconds: 2);
  final Duration _resumeDuration = const Duration(seconds: 4);

  @override
  void initState() {
    super.initState();
    _pageController = LoopPageController();
    _startAutoScroll();

    // Add listener to detect manual page changes
    _pageController.addListener(_handleUserScroll);
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(_scrollDuration, (_) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _handleUserScroll() {
    if (_pageController.page != _pageController.initialPage) {
      _stopAutoScrollTemporary();
    }
  }

  void _stopAutoScrollTemporary() {
    _timer?.cancel();
    _timer = Timer(_resumeDuration, _startAutoScroll);
  }

  void _scrollToPreviousPage() {
    if (_pageController.hasClients) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      _stopAutoScrollTemporary(); // Stop auto-scrolling on manual navigation temporarily
    }
  }

  void _scrollToNextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _stopAutoScrollTemporary(); // Stop auto-scrolling on manual navigation temporarily
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.removeListener(_handleUserScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> allImages = [widget.mobileDetails.deviceImage ?? ''];
    if (widget.mobileDetails.pictures != null &&
        widget.mobileDetails.pictures!.isNotEmpty) {
      allImages.addAll(widget.mobileDetails.pictures!);
    }

    return Center(
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            LoopPageView.builder(
              controller: _pageController,
              itemCount: allImages.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageDisplay(
                    imageUrl: allImages[index],
                  ),
                );
              },
            ),
            Positioned(
              left: 4,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _scrollToPreviousPage,
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
            Positioned(
              right: 4,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _scrollToNextPage,
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
