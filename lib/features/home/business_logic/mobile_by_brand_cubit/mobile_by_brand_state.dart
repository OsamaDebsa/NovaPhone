part of 'mobile_by_brand_cubit.dart';

sealed class MobileByBrandState extends Equatable {
  const MobileByBrandState();

  @override
  List<Object> get props => [];
}

final class MobileByBrandInitial extends MobileByBrandState {}

final class MobileByBrandLoading extends MobileByBrandState {}

final class MobileByBrandFailure extends MobileByBrandState {
  final String message;

  const MobileByBrandFailure(this.message);
}

final class MobileByBrandSuccess extends MobileByBrandState {
  final DeviceByBrandModel deviceByBrandModel;

  const MobileByBrandSuccess(this.deviceByBrandModel);
}
