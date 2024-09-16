import 'package:equatable/equatable.dart';

import 'news_list.dart';
import 'review_list.dart';

class SearchModel extends Equatable {
  final List<NewsList>? newsList;
  final List<ReviewList>? reviewList;

  const SearchModel({this.newsList, this.reviewList});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        newsList: (json['news_list'] as List<dynamic>?)
            ?.map((e) => NewsList.fromJson(e as Map<String, dynamic>))
            .toList(),
        reviewList: (json['review_list'] as List<dynamic>?)
            ?.map((e) => ReviewList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'news_list': newsList?.map((e) => e.toJson()).toList(),
        'review_list': reviewList?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [newsList, reviewList];
}
