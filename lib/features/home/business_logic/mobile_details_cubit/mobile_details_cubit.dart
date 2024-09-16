import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/data/repos/home_repo.dart';

part 'mobile_details_state.dart';

class MobileDetailsCubit extends Cubit<MobileDetailsState> {
  MobileDetailsCubit(this.homeRepo) : super(MobileDetailsInitial());
  final HomeRepo homeRepo;
  Future<void> getMobileDetails({required String mobileKey}) async {
    emit(MobileDetailsLoading());

    var result = await homeRepo.postDeviceDetail(mobileKey: mobileKey);
    result.fold((failure) => emit(MobileDetailsFailure(failure.errMessage)),
        (mobileDetails) => emit(MobileDetailsSuccess(mobileDetails)));
  }
}
