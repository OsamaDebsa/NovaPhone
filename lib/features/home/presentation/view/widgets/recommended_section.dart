import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/features/home/business_logic/recommended_cubit/recommended_cubit.dart';
import 'package:nova_phone/features/home/data/models/recommended_view_model.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_compare_image.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/recommended_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/recommended_view_with_toggle.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCubit, RecommendedState>(
      builder: (context, state) {
        if (state is RecommendedSuccess) {
          return Padding(
            padding: const EdgeInsets.all(17),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                RecommendedViewWithGrid(
                  recommended: RecommendedViewModel(
                    title: state.recommended.recommended1?.title ?? '',
                    data: state.recommended.recommended1?.data ?? [],
                    onTap: () {
                      AppAd().showInterstitialAd();
                      context.push(
                        StringManager.recommende1SeeMoreRoute,
                        extra: state.recommended.recommended1,
                      );
                    },
                  ),
                ),
                RecommendedViewWithToggle(
                  recommended: RecommendedViewModel(
                    title: state.recommended.recommended3?.title ?? '',
                    data: state.recommended.recommended3?.data ?? [],
                    onTap: () {},
                  ),
                ),
                RecommendedViewWithToggle(
                  recommended: RecommendedViewModel(
                    title: state.recommended.recommended4?.title ?? '',
                    data: state.recommended.recommended4?.data ?? [],
                    onTap: () {},
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: CustomCompareImage(),
                ),
                RecommendedViewWithGrid(
                  recommended: RecommendedViewModel(
                    title: state.recommended.recommended2?.title ?? '',
                    data: state.recommended.recommended2?.data ?? [],
                    onTap: () {
                      AppAd().showInterstitialAd();
                      context.push(
                        StringManager.recommende1SeeMoreRoute,
                        extra: state.recommended.recommended2,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        } else if (state is RecommendedFailure) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
