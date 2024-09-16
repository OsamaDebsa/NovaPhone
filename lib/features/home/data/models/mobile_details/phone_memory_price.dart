import 'package:equatable/equatable.dart';

class PhoneMemoryPrice extends Equatable {
  final String? shopImage;
  final String? price;
  final String? buyUrl;

  const PhoneMemoryPrice({this.shopImage, this.price, this.buyUrl});

  factory PhoneMemoryPrice.fromJson(Map<String, dynamic> json) =>
      PhoneMemoryPrice(
        shopImage: json['shop_image'] as String?,
        price: json['price'] as String?,
        buyUrl: json['buy_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'shop_image': shopImage,
        'price': price,
        'buy_url': buyUrl,
      };

  @override
  List<Object?> get props => [shopImage, price, buyUrl];
}
