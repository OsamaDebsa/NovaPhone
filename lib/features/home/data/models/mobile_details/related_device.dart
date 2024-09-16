import 'package:equatable/equatable.dart';

class RelatedDevice extends Equatable {
  final String? deviceName;
  final String? deviceImage;
  final String? key;

  const RelatedDevice({this.deviceName, this.deviceImage, this.key});

  factory RelatedDevice.fromJson(Map<String, dynamic> json) => RelatedDevice(
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
