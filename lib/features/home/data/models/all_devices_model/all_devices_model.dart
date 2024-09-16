import 'package:equatable/equatable.dart';

import 'device_list.dart';

class AllDevicesModel extends Equatable {
  final int? brandId;
  final String? brandName;
  final String? key;
  final List<DeviceList>? deviceList;

  const AllDevicesModel({
    this.brandId,
    this.brandName,
    this.key,
    this.deviceList,
  });

  factory AllDevicesModel.fromJson(Map<String, dynamic> json) {
    return AllDevicesModel(
      brandId: json['brand_id'] as int?,
      brandName: json['brand_name'] as String?,
      key: json['key'] as String?,
      deviceList: (json['device_list'] as List<dynamic>?)
          ?.map((e) => DeviceList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'brand_id': brandId,
        'brand_name': brandName,
        'key': key,
        'device_list': deviceList?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [brandId, brandName, key, deviceList];
}
