part of 'rewarded_video_ad_cubit.dart';

sealed class RewardedVideoAdState extends Equatable {
  const RewardedVideoAdState();

  @override
  List<Object> get props => [];
}

final class RewardedVideoAdInitial extends RewardedVideoAdState {}

class RewardedVideoAdStateLoaded extends RewardedVideoAdState {}

class RewardedVideoAdStateWatched extends RewardedVideoAdState {}

class RewardedVideoAdStateDismissed extends RewardedVideoAdState {}

class RewardedVideoAdStateFailedToLoad extends RewardedVideoAdState {}

class RewardedVideoAdStateFailedToShow extends RewardedVideoAdState {}
