import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/exit_confirmation_dialog.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool canPop = false;

    return Scaffold(
      body: PopScope(
        canPop: canPop,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            canPop = await showExitConfirmationDialog(context);
            if (canPop) {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            }
          });
        },
        child: const HomeViewBody(),
      ),
    );
  }
}
