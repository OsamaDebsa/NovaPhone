import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';
import 'package:nova_phone/features/home/business_logic/mobile_details_cubit/mobile_details_cubit.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/mobile_details_view_body.dart';

class MobileDetailsView extends StatelessWidget {
  const MobileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MobileDetailsCubit, MobileDetailsState>(
        builder: (context, state) {
          if (state is MobileDetailsSuccess) {
            return MobileDetailsViewBody(mobileDetails: state.mobileDetails);
          } else if (state is MobileDetailsFailure) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CustomLoadingIndicator());
          }
        },
      ),
    );
  }
}
