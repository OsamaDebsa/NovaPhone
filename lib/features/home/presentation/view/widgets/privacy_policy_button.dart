import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/widgets/custom_elevated_button.dart';

class PrivacyPolicyButton extends StatelessWidget {
  const PrivacyPolicyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: StringManager.showPrivacyPolicy,
      onPressed: () {
        context.push(StringManager.webViewRoute,
            extra: StringManager.privacyPolicyUrl);
      },
    );
  }
}
