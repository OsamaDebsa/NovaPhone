import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/prices.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/price_item_list_view.dart';

class PericeListView extends StatelessWidget {
  const PericeListView({super.key, required this.prices});
  final Prices prices;

  @override
  Widget build(BuildContext context) {
    final memoryPrices = prices.memoryPrices?.entries.toList() ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: memoryPrices.length,
      itemBuilder: (context, index) {
        final entry = memoryPrices[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    "Price for ${entry.key}",
                    style: Styles.styleHeavy18,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: entry.value.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PriceItemListView(price: entry.value[i]),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
