part of 'mobile_details_cubit.dart';

sealed class MobileDetailsState extends Equatable {
  const MobileDetailsState();

  @override
  List<Object> get props => [];
}

final class MobileDetailsInitial extends MobileDetailsState {}

final class MobileDetailsLoading extends MobileDetailsState {}

final class MobileDetailsSuccess extends MobileDetailsState {
  final MobileDetails mobileDetails;

  const MobileDetailsSuccess(this.mobileDetails);
}

final class MobileDetailsFailure extends MobileDetailsState {
  final String message;

  const MobileDetailsFailure(this.message);
}
