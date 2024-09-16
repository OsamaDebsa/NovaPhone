import 'package:equatable/equatable.dart';

import 'datum.dart';

class Recommended3 extends Equatable {
  final String? title;
  final List<Datum>? data;

  const Recommended3({this.title, this.data});

  factory Recommended3.fromJson(Map<String, dynamic> json) => Recommended3(
        title: json['title'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override 
  List<Object?> get props => [title, data];
}
