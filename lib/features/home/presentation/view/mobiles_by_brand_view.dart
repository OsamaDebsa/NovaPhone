import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';
import 'package:nova_phone/features/home/business_logic/mobile_by_brand_cubit/mobile_by_brand_cubit.dart';
import 'package:nova_phone/features/home/data/models/brand_model.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/mobiles_by_brand_view_body.dart';

class MobilesByBrandView extends StatelessWidget {
  const MobilesByBrandView({super.key, required this.brandModel});
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          title: brandModel.brandName ?? '',
        ),
      ),
      body: BlocBuilder<MobileByBrandCubit, MobileByBrandState>(
        builder: (context, state) {
          if (state is MobileByBrandSuccess) {
            return MobilesByBrandViewBody(
              state: state,
              brandModel: brandModel,
            );
          } else if (state is MobileByBrandFailure) {
            return _buildErrorMessage(state.message);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Center(
      child: Text(message),
    );
  }
}
