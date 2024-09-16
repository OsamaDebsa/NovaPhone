import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';
import 'package:nova_phone/features/home/business_logic/rewarded_video_ad_cubit/rewarded_video_ad_cubit.dart';

class RewardedVideoAd extends StatelessWidget {
  const RewardedVideoAd({super.key, required this.viewRoute});
  final String viewRoute;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RewardedVideoAdCubit, RewardedVideoAdState>(
      listener: (context, state) {
        if (state is RewardedVideoAdStateLoaded) {
          context.read<RewardedVideoAdCubit>().showRewardedAd();
        } else if (state is RewardedVideoAdStateWatched) {
          context.pushReplacement(viewRoute);
        } else if (state is RewardedVideoAdStateDismissed ||
            state is RewardedVideoAdStateFailedToShow ||
            state is RewardedVideoAdStateFailedToLoad) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ad issue encountered')),
          );
          context.pushReplacement(
              viewRoute); // Navigate to viewRoute in case of any ad issue
        }
      },
      child: const Scaffold(
        body: Center(
          child: CustomLoadingIndicator(),
        ),
      ),
    );
  }
}
