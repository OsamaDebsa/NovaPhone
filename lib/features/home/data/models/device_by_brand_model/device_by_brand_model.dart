import 'package:equatable/equatable.dart';

import 'device_list.dart';

class DeviceByBrandModel extends Equatable {
  final List<DeviceList>? deviceList;
  final int? totalPage;

  const DeviceByBrandModel({this.deviceList, this.totalPage});

  factory DeviceByBrandModel.fromJson(Map<String, dynamic> json) {
    return DeviceByBrandModel(
      deviceList: (json['device_list'] as List<dynamic>?)
          ?.map((e) => DeviceList.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPage: json['total_page'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'device_list': deviceList?.map((e) => e.toJson()).toList(),
        'total_page': totalPage,
      };

  @override
  List<Object?> get props => [deviceList, totalPage];
}
