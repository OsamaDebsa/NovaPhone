import 'package:equatable/equatable.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/phone_memory_price.dart';

class Prices extends Equatable {
  final Map<String, List<PhoneMemoryPrice>>? memoryPrices;

  const Prices({this.memoryPrices});

  factory Prices.fromJson(Map<String, dynamic> json) {
    final Map<String, List<PhoneMemoryPrice>> memoryPrices = {};
    json.forEach((key, value) {
      if (value is List) {
        memoryPrices[key] = value
            .map((e) => PhoneMemoryPrice.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    });
    return Prices(memoryPrices: memoryPrices);
  }

  Map<String, dynamic>? toJson() => memoryPrices?.map(
      (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()));

  @override
  List<Object?> get props => [memoryPrices];
}
