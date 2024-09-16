import 'package:flutter/material.dart';
import 'package:nova_phone/features/home/data/models/recommended_view_model.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/recommended_grid_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/section_header.dart';

class RecommendedViewWithGrid extends StatelessWidget {
  const RecommendedViewWithGrid({super.key, required this.recommended});
  final RecommendedViewModel recommended;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecommendedSectionHeader(
          title: recommended.title,
          onTap: recommended.onTap,
        ),
        RecommendedGridView(
          recommendedList: recommended.data,
          itemCount: 4,
        ),
      ],
    );
  }
}
