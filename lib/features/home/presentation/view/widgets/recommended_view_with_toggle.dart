import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/data/models/recommended_view_model.dart';

class RecommendedViewWithToggle extends StatefulWidget {
  const RecommendedViewWithToggle({super.key, required this.recommended});
  final RecommendedViewModel recommended;

  @override
  RecommendedViewWithToggleState createState() =>
      RecommendedViewWithToggleState();
}

class RecommendedViewWithToggleState extends State<RecommendedViewWithToggle>
    with TickerProviderStateMixin {
  bool _isCapsuleOpen = false;
  late final AnimationController _controller;
  late final Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _heightAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggleCapsule() {
    setState(() {
      if (_isCapsuleOpen) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isCapsuleOpen = !_isCapsuleOpen;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleCapsule,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.mainColor, // Primary color for the header
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.recommended.title,
                      style: Styles.styleBold16,
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                  ),
                  Icon(
                    _isCapsuleOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: ColorManager.lightGrayColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),

        // Capsule that opens/closes based on the _isCapsuleOpen state
        SizeTransition(
          sizeFactor: _heightAnimation,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.recommended.data.length,
                itemBuilder: (context, index) {
                  final device = widget.recommended.data[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        StringManager.mobileDetailsRoute,
                        extra: device.key ?? '',
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: ColorManager.mainColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                device.deviceName ?? '',
                                style: Styles.styleBold14,
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: ColorManager.whiteColor,
                              size: 16.0, 
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
