import 'package:equatable/equatable.dart';

class NewsList extends Equatable {
  final String? newsTitle;
  final String? newsImage;
  final String? newsUrl;

  const NewsList({this.newsTitle, this.newsImage, this.newsUrl});

  factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
        newsTitle: json['news_title'] as String?,
        newsImage: json['news_image'] as String?,
        newsUrl: json['news_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'news_title': newsTitle,
        'news_image': newsImage,
        'news_url': newsUrl,
      };

  @override
  List<Object?> get props => [newsTitle, newsImage, newsUrl];
}
