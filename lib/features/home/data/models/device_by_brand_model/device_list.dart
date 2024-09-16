import 'package:equatable/equatable.dart';

class DeviceList extends Equatable {
  final String? deviceName;
  final String? deviceImage;
  final String? key;

  const DeviceList({this.deviceName, this.deviceImage, this.key});

  factory DeviceList.fromJson(Map<String, dynamic> json) => DeviceList(
        deviceName: json['device_name'] as String?,
        deviceImage: json['device_image'] as String?,
        key: json['key'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'device_name': deviceName,
        'device_image': deviceImage,
        'key': key,
      };

  @override
  List<Object?> get props => [deviceName, deviceImage, key];
}
