part of 'recommended_cubit.dart';

sealed class RecommendedState extends Equatable {
  const RecommendedState();

  @override
  List<Object> get props => [];
}

final class RecommendedInitial extends RecommendedState {}

final class RecommendedLoading extends RecommendedState {}

final class RecommendedSuccess extends RecommendedState {
  final Recommended recommended;

  const RecommendedSuccess(this.recommended);
}

final class RecommendedFailure extends RecommendedState {
  final String message;

  const RecommendedFailure(this.message);
}
