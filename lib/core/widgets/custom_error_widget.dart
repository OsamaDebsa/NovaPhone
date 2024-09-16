import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.styleBold20,
        textAlign: TextAlign.center,
      ),
    );
  }
}
