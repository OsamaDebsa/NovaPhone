import 'package:equatable/equatable.dart';

class ReviewList extends Equatable {
  final String? reviewTitle;
  final String? reviewImage;
  final String? reviewUrl;

  const ReviewList({this.reviewTitle, this.reviewImage, this.reviewUrl});

  factory ReviewList.fromJson(Map<String, dynamic> json) => ReviewList(
        reviewTitle: json['review_title'] as String?,
        reviewImage: json['review_image'] as String?,
        reviewUrl: json['review_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'review_title': reviewTitle,
        'review_image': reviewImage,
        'review_url': reviewUrl,
      };

  @override
  List<Object?> get props => [reviewTitle, reviewImage, reviewUrl];
}
