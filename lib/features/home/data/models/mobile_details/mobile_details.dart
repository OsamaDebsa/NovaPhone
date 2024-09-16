import 'package:equatable/equatable.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/more_information.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/more_specification.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/prices.dart';

class MobileDetails extends Equatable {
  final String? key;
  final String? deviceName;
  final String? deviceImage;
  final String? displaySize;
  final String? displayRes;
  final String? camera;
  final String? video;
  final String? ram;
  final String? chipset;
  final String? battery;
  final String? batteryType;
  final String? releaseDate;
  final String? body;
  final String? osType;
  final String? storage;
  final String? comment;
  final List<MoreSpecification>? moreSpecification;
  final Prices? prices;
  final List<String>? pictures;
  final MoreInformation? moreInformation;

  const MobileDetails({
    this.key,
    this.deviceName,
    this.deviceImage,
    this.displaySize,
    this.displayRes,
    this.camera,
    this.video,
    this.ram,
    this.chipset,
    this.battery,
    this.batteryType,
    this.releaseDate,
    this.body,
    this.osType,
    this.storage,
    this.comment,
    this.moreSpecification,
    this.prices,
    this.pictures,
    this.moreInformation,
  });

  factory MobileDetails.fromJson(Map<String, dynamic> json) => MobileDetails(
        key: json['key'] as String?,
        deviceName: json['device_name'] as String?,
        deviceImage: json['device_image'] as String?,
        displaySize: json['display_size'] as String?,
        displayRes: json['display_res'] as String?,
        camera: json['camera'] as String?,
        video: json['video'] as String?,
        ram: json['ram'] as String?,
        chipset: json['chipset'] as String?,
        battery: json['battery'] as String?,
        batteryType: json['batteryType'] as String?,
        releaseDate: json['release_date'] as String?,
        body: json['body'] as String?,
        osType: json['os_type'] as String?,
        storage: json['storage'] as String?,
        comment: json['comment'] as String?,
        moreSpecification: (json['more_specification'] as List<dynamic>?)
            ?.map((e) => MoreSpecification.fromJson(e as Map<String, dynamic>))
            .toList(),
        prices: json['prices'] == null
            ? null
            : Prices.fromJson(json['prices'] as Map<String, dynamic>),
        pictures: (json['pictures'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        moreInformation: json['more_information'] == null
            ? null
            : MoreInformation.fromJson(
                json['more_information'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'device_name': deviceName,
        'device_image': deviceImage,
        'display_size': displaySize,
        'display_res': displayRes,
        'camera': camera,
        'video': video,
        'ram': ram,
        'chipset': chipset,
        'battery': battery,
        'batteryType': batteryType,
        'release_date': releaseDate,
        'body': body,
        'os_type': osType,
        'storage': storage,
        'comment': comment,
        'more_specification':
            moreSpecification?.map((e) => e.toJson()).toList(),
        'prices': prices?.toJson(),
        'pictures': pictures,
        'more_information': moreInformation?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      key,
      deviceName,
      deviceImage,
      displaySize,
      displayRes,
      camera,
      video,
      ram,
      chipset,
      battery,
      batteryType,
      releaseDate,
      body,
      osType,
      storage,
      comment,
      moreSpecification,
      prices,
      pictures,
      moreInformation,
    ];
  }
}
