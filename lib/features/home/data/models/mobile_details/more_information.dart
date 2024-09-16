import 'package:equatable/equatable.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/popular_devices.dart';
import 'related_device.dart';

class MoreInformation extends Equatable {
  final List<RelatedDevice>? relatedDevices;
  final List<PopularDevice>? popularDevices;

  const MoreInformation({this.relatedDevices, this.popularDevices});

  factory MoreInformation.fromJson(Map<String, dynamic> json) {
    List<PopularDevice>? extractPopularDevices(Map<String, dynamic> json) {
      for (var key in json.keys) {
        if (key.toLowerCase().contains('popular')) {
          return (json[key] as List<dynamic>?)
              ?.map((e) => PopularDevice.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      }
      return null;
    }

    return MoreInformation(
      relatedDevices: (json['Related Devices'] as List<dynamic>?)
          ?.map((e) => RelatedDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularDevices: extractPopularDevices(json),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'Related Devices': relatedDevices?.map((e) => e.toJson()).toList(),
    };

    if (popularDevices != null) {
      json['Popular Devices'] = popularDevices?.map((e) => e.toJson()).toList();
    }

    return json;
  }

  @override
  List<Object?> get props => [relatedDevices, popularDevices];
}
