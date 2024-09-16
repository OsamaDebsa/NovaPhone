import 'package:equatable/equatable.dart';

import 'recommended1.dart';
import 'recommended2.dart';
import 'recommended3.dart';
import 'recommended4.dart';

class Recommended extends Equatable {
  final Recommended1? recommended1;
  final Recommended2? recommended2;
  final Recommended3? recommended3;
  final Recommended4? recommended4;

  const Recommended({
    this.recommended1,
    this.recommended2,
    this.recommended3,
    this.recommended4,
  });

  factory Recommended.fromJson(Map<String, dynamic> json) => Recommended(
        recommended1: json['recommended_1'] == null
            ? null
            : Recommended1.fromJson(
                json['recommended_1'] as Map<String, dynamic>),
        recommended2: json['recommended_2'] == null
            ? null
            : Recommended2.fromJson(
                json['recommended_2'] as Map<String, dynamic>),
        recommended3: json['recommended_3'] == null
            ? null
            : Recommended3.fromJson(
                json['recommended_3'] as Map<String, dynamic>),
        recommended4: json['recommended_4'] == null
            ? null
            : Recommended4.fromJson(
                json['recommended_4'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'recommended_1': recommended1?.toJson(),
        'recommended_2': recommended2?.toJson(),
        'recommended_3': recommended3?.toJson(),
        'recommended_4': recommended4?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      recommended1,
      recommended2,
      recommended3,
      recommended4,
    ];
  }
}
