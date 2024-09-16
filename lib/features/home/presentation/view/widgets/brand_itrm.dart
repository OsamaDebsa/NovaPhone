import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/data/models/brand_model.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({super.key, required this.brandModel, required this.onTap});
  final BrandModel brandModel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.secondaryColor,
          shadowColor: ColorManager.softGrayColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8.0),
        ),
        child: Center(
          child: Text(
            brandModel.brandName!,
            style: Styles.styleBold20,
          ),
        ),
      ),
    );
  }
}
