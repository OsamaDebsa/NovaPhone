part of 'all_devices_cubit.dart';

sealed class AllDevicesState extends Equatable {
  const AllDevicesState();

  @override
  List<Object> get props => [];
}

final class AllDevicesInitial extends AllDevicesState {}

final class AllDevicesLoading extends AllDevicesState {}

final class AllDevicesFaliure extends AllDevicesState {
  final String message;
  const AllDevicesFaliure(this.message);
}

final class AllDevicesSuccess extends AllDevicesState {
  final List<AllDevicesModel> allDevices;
  const AllDevicesSuccess(this.allDevices);
}
