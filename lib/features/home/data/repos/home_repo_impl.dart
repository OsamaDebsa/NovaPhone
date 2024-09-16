import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nova_phone/core/failures/failures.dart';
import 'package:nova_phone/core/utils/api_service.dart';
import 'package:nova_phone/features/home/data/models/all_devices_model/all_devices_model.dart';
import 'package:nova_phone/features/home/data/models/brand_model.dart';
import 'package:nova_phone/features/home/data/models/device_by_brand_model/device_by_brand_model.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/data/models/recommended_model/recommended.dart';
import 'package:nova_phone/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(this.apiService);
  final ApiService apiService;
  @override
  Future<Either<Failure, List<BrandModel>>> getPhoneBrands() async {
    try {
      var data = await apiService.get(endpoint: "?route=brand-list");
      List<BrandModel> brandsList = [];
      for (var item in data['data']) {
        brandsList.add(BrandModel.fromJson(item));
      }
      return right(brandsList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AllDevicesModel>>> getAllDevices() async {
    try {
      var response = await apiService.get(endpoint: "?route=device-list");

      // Ensure 'data' key exists and is not null
      if (response['data'] == null) {
        return left(ServerFailure('Unexpected response format'));
      }

      // Initialize a list to hold all device brand data
      List<AllDevicesModel> allDevicesList = [];

      // Iterate through each item in the data array
      for (var item in response['data']) {
        Map<String, dynamic> brandData = item as Map<String, dynamic>? ?? {};

        // Parse the AllDevicesModel object from the data
        AllDevicesModel allDevices = AllDevicesModel.fromJson(brandData);
        allDevicesList.add(allDevices);
      }

      return right(allDevicesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Recommended>> getRecommended() async {
    try {
      var response = await apiService.get(endpoint: "?route=recommended");

      // Ensure 'data' key exists and is not null
      if (response['data'] == null) {
        return left(ServerFailure('Unexpected response format'));
      }

      // Extract the 'recommended_1' data
      Map<String, dynamic> recommendedData =
          response['data'] as Map<String, dynamic>? ?? {};

      // Parse the Recommended1 object from the data
      Recommended recommended = Recommended.fromJson(recommendedData);
      return right(recommended);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MobileDetails>> postDeviceDetail(
      {required String mobileKey}) async {
    try {
      var data = {
        "route": "device-detail",
        "key": mobileKey,
      };
      var response = await apiService.post(
        data: data,
      );
      MobileDetails mobileDetails = MobileDetails.fromJson(response['data']);
      return right(mobileDetails);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeviceByBrandModel>> fetchDeviceListByBrand({
    required String brandName,
    required int page,
    required int brandId,
  }) async {
    try {
      // Prepare request data
      var data = {
        "route": "device-list-by-brand",
        "brand_id": brandId,
        "brand_name": brandName,
        "page": page,
      };

      // Fetch the device list
      var response = await apiService.post(data: data);

      // Parse the response data
      DeviceByBrandModel deviceByBrandModel =
          DeviceByBrandModel.fromJson(response['data']);

      // Check if the device list is empty
      if (deviceByBrandModel.deviceList == null ||
          deviceByBrandModel.deviceList!.isEmpty) {
        // Log or handle the case where the device list is empty
        // print(
        //     'Device list is empty for page $page. Fetching data from page 1.');

        // Make a request to page 1 if the device list is empty
        var pageOneData = {
          "route": "device-list-by-brand",
          "brand_id": brandId,
          "brand_name": brandName,
          "page": 1,
        };
        var pageOneResponse = await apiService.post(data: pageOneData);
        DeviceByBrandModel pageOneModel =
            DeviceByBrandModel.fromJson(pageOneResponse['data']);

        // Check if page 1 has devices
        if (pageOneModel.deviceList == null ||
            pageOneModel.deviceList!.isEmpty) {
          // If page 1 also has an empty device list, return an appropriate failure
          return left(ServerFailure('No devices found for brand $brandName.'));
        }

        // Return page 1 results if available
        return right(pageOneModel);
      }

      // Return the parsed data if the initial response has devices
      return right(deviceByBrandModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, ComparisonModel>> compareUsingDeviceID({
  //   required String firstMobileId,
  //   String? secondMobileId,
  // }) async {
  //   try {
  //     String deviceId = secondMobileId != null && secondMobileId.isNotEmpty
  //         ? '$firstMobileId,$secondMobileId'
  //         : firstMobileId;

  //     var data = {
  //       'route': 'compare',
  //       'device_id': deviceId,
  //     };

  //     var response = await apiService.post(data: data, isFormData: true);
  //     print("Response: $response");
  //     ComparisonModel comparisonModel =
  //         ComparisonModel.fromJson(response['data']);
  //     print(comparisonModel);
  //     return right(comparisonModel);
  //   } catch (e) {
  //     if (e is ServerFailure) {
  //       print("Error: $e");
  //       return left(e);
  //     }
  //     print("Error: $e");
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}
