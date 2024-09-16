import 'package:equatable/equatable.dart';

class DeviceList extends Equatable {
  final int? deviceId;
  final String? deviceName;
  final String? deviceType;
  final String? deviceImage;
  final String? key;

  const DeviceList({
    this.deviceId,
    this.deviceName,
    this.deviceType,
    this.deviceImage,
    this.key,
  });

  factory DeviceList.fromJson(Map<String, dynamic> json) => DeviceList(
        deviceId: json['device_id'] as int?,
        deviceName: json['device_name'] as String?,
        deviceType: json['device_type'] as String?,
        deviceImage: json['device_image'] as String?,
        key: json['key'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'device_id': deviceId,
        'device_name': deviceName,
        'device_type': deviceType,
        'device_image': deviceImage,
        'key': key,
      };

  @override
  List<Object?> get props {
    return [
      deviceId,
      deviceName,
      deviceType,
      deviceImage,
      key,
    ];
  }
}
