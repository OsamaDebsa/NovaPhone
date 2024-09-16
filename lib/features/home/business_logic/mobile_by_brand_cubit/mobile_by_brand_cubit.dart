import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nova_phone/features/home/data/models/device_by_brand_model/device_by_brand_model.dart';
import 'package:nova_phone/features/home/data/repos/home_repo.dart';

part 'mobile_by_brand_state.dart';

class MobileByBrandCubit extends Cubit<MobileByBrandState> {
  MobileByBrandCubit(this.homeRepo) : super(MobileByBrandInitial());
  final HomeRepo homeRepo;

  Future<void> fetchDeviceListByBrand({
    required String brandName,
    required int page,
    required int brandId,
  }) async {
    emit(MobileByBrandLoading());

    var result = await homeRepo.fetchDeviceListByBrand(
      brandName: brandName,
      page: page,
      brandId: brandId,
    );
    result.fold((failure) => emit(MobileByBrandFailure(failure.errMessage)),
        (mobileByBrand) => emit(MobileByBrandSuccess(mobileByBrand)));
  }
}
/*import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nova_phone/features/home/data/models/device_by_brand_model/device_by_brand_model.dart';
import 'package:nova_phone/features/home/data/repos/home_repo.dart';

part 'mobile_by_brand_state.dart';

class MobileByBrandCubit extends Cubit<MobileByBrandState> {
  MobileByBrandCubit(this.homeRepo) : super(MobileByBrandInitial());
  final HomeRepo homeRepo;
  String? _brandName;
  int? _brandId;
  int _currentPage = 1; // Initialize with a default page number

  Future<void> _fetchPage(int page) async {
    if (_brandName == null || _brandId == null) {
      emit(const MobileByBrandFailure('Brand information is not available.'));
      return;
    }

    emit(MobileByBrandLoading());

    final result = await homeRepo.fetchDeviceListByBrand(
      brandName: _brandName!,
      page: page,
      brandId: _brandId!,
    );

    result.fold(
      (failure) => emit(MobileByBrandFailure(failure.errMessage)),
      (mobileByBrand) => emit(MobileByBrandSuccess(mobileByBrand)),
    );
  }

  Future<void> fetchDeviceListByBrand({
    required String brandName,
    required int page,
    required int brandId,
  }) async {
    _brandName = brandName;
    _brandId = brandId;
    _currentPage = page; // Update the current page
    await _fetchPage(page);
  }

  Future<void> fetchNextPage() async {
    if (_brandName == null || _brandId == null) {
      emit(const MobileByBrandFailure('Brand information is not available.'));
      return;
    }

    _currentPage += 1; // Increment page
    await _fetchPage(_currentPage);
  }

  Future<void> fetchPreviousPage() async {
    if (_brandName == null || _brandId == null) {
      emit(const MobileByBrandFailure('Brand information is not available.'));
      return;
    }

    if (_currentPage > 1) {
      _currentPage -= 1; // Decrement page
      await _fetchPage(_currentPage);
    } else {
      emit(const MobileByBrandFailure('No previous pages available.'));
    }
  }
}
*/
