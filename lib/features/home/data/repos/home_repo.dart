import 'package:dartz/dartz.dart';
import 'package:nova_phone/core/failures/failures.dart';
import 'package:nova_phone/features/home/data/models/all_devices_model/all_devices_model.dart';
import 'package:nova_phone/features/home/data/models/brand_model.dart';
import 'package:nova_phone/features/home/data/models/device_by_brand_model/device_by_brand_model.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/data/models/recommended_model/recommended.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BrandModel>>> getPhoneBrands();
  Future<Either<Failure, Recommended>> getRecommended();
  Future<Either<Failure, List<AllDevicesModel>>> getAllDevices();
  Future<Either<Failure, MobileDetails>> postDeviceDetail(
      {required String mobileKey});
  Future<Either<Failure, DeviceByBrandModel>> fetchDeviceListByBrand(
      {required String brandName, required int page, required int brandId});
//   Future<Either<Failure, ComparisonModel>> compareUsingDeviceID(
//       {required String firstMobileId, String secondMobileId});
}
