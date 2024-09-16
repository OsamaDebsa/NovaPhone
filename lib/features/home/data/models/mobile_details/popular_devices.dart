import 'package:equatable/equatable.dart';

class PopularDevice extends Equatable {
  final String? deviceName;
  final String? deviceImage;
  final String? key;

  const PopularDevice({this.deviceName, this.deviceImage, this.key});

  factory PopularDevice.fromJson(Map<String, dynamic> json) {
    return PopularDevice(
      deviceName: json['device_name'] as String?,
      deviceImage: json['device_image'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'device_name': deviceName,
        'device_image': deviceImage,
        'key': key,
      };

  @override
  List<Object?> get props => [deviceName, deviceImage, key];
}
