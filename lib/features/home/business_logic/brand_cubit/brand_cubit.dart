import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nova_phone/features/home/data/models/brand_model.dart';
import 'package:nova_phone/features/home/data/repos/home_repo.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit(this.homeRepo) : super(BrandInitial());
  final HomeRepo homeRepo;
  Future<void> fetchPhoneBrands() async {
    emit(BrandLoading());
    var result = await homeRepo.getPhoneBrands();
    result.fold((failure) => emit(BrandFailure(failure.errMessage)),
        (brands) => emit(BrandSuccess(brands)));
  }
}
