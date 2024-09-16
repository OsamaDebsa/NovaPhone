import 'package:equatable/equatable.dart';

class BrandModel extends Equatable {
  final int? brandId;
  final String? brandName;
  final String? key;

  const BrandModel({this.brandId, this.brandName, this.key});

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        brandId: json['brand_id'] as int?,
        brandName: json['brand_name'] as String?,
        key: json['key'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'brand_id': brandId,
        'brand_name': brandName,
        'key': key,
      };

  @override
  List<Object?> get props => [brandId, brandName, key];
}
