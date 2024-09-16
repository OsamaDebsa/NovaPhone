import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nova_phone/features/home/data/models/all_devices_model/all_devices_model.dart';
import 'package:nova_phone/features/home/data/repos/home_repo.dart';

part 'all_devices_state.dart';

class AllDevicesCubit extends Cubit<AllDevicesState> {
  AllDevicesCubit(this.homeRepo) : super(AllDevicesInitial());
  final HomeRepo homeRepo;
  Future<void> getAllDevices() async {
    emit(AllDevicesLoading());
    var result = await homeRepo.getAllDevices();
    result.fold((failure) => emit(AllDevicesFaliure(failure.errMessage)),
        (allDevices) => emit(AllDevicesSuccess(allDevices)));
  }
}
