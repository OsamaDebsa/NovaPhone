import 'package:flutter/material.dart';
import 'package:nova_phone/core/ad/banner_ad.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';

Future<bool> showExitConfirmationDialog(BuildContext context) async {
  return (await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                backgroundColor: ColorManager.mainColor,
                title: const Center(
                  child: Text(
                    StringManager.exitConfirm,
                    style: Styles.styleBold20,
                  ),
                ),
                content: const FittedBox(
                  child: Text(
                    StringManager.areYouSureToExit,
                    style: Styles.styleBold16,
                  ),
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  _buildDialogButton(
                    context: context,
                    label: 'No',
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  _buildDialogButton(
                    context: context,
                    label: 'Yes',
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
              const BannerAdView(),
            ],
          );
        },
      )) ??
      false;
}

Widget _buildDialogButton({
  required BuildContext context,
  required String label,
  required VoidCallback onPressed,
}) {
  return Container(
    decoration: ShapeDecoration(
      color: ColorManager.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(label, style: Styles.styleBold16),
    ),
  );
}
