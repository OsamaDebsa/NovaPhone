import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/business_logic/brand_cubit/brand_cubit.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/brand_list_view.dart';

class SelectBrandSection extends StatelessWidget {
  const SelectBrandSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(builder: (context, state) {
      if (state is BrandSuccess) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 17),
              child: Text(StringManager.selectBrand, style: Styles.styleBold24),
            ),
            BrandListView(brandList: state.brands),
          ],
        );
      } else if (state is BrandFailure) {
        return Text(state.message);
      } else {
        return const SizedBox();
      }
    });
  }
}
