import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final String? title;
  final List<String>? data;
  final List<Datum>? subData; // Add this field to handle nested data

  const Datum({this.title, this.data, this.subData});

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      title: json['title'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subData: (json['subData'] as List<dynamic>?) // Handle nested data
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'data': data,
        'subData': subData?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [title, data, subData];
}
