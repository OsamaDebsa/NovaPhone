import 'package:flutter/material.dart';
import 'package:nova_phone/core/ad/banner_ad.dart';
import 'package:nova_phone/features/home/data/models/recommended_model/datum.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/recommended_grid_view.dart';

class RecommendeSeeMoreView extends StatelessWidget {
  const RecommendeSeeMoreView(
      {super.key, required this.recommendedList, required this.title});
  final List<Datum>? recommendedList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppBar(title: title),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const BannerAdView(),
            RecommendedGridView(
              recommendedList: recommendedList,
            ),
          ],
        ),
      ),
    );
  }
}
