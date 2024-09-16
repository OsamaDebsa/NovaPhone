import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nova_phone/core/utils/app_router.dart';
import 'package:nova_phone/core/utils/service_locator.dart';
import 'package:nova_phone/features/home/business_logic/saved_unsaved_cubit/saved_unsaved_cubit.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const NovaPhone());
}

class NovaPhone extends StatelessWidget {
  const NovaPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedUnsavedCubit(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'NovaPhone App',
      ),
    );
  }
}
