import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/features/home/business_logic/mobile_details_cubit/mobile_details_cubit.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_auto_scroll_list_view.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/popular_devices.dart';
import 'package:nova_phone/features/home/data/models/mobile_model.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/mobile_item.dart';

class PopularDevicesList extends StatelessWidget {
  const PopularDevicesList({super.key, required this.popularDevicesList});
  final List<PopularDevice> popularDevicesList;

  @override
  Widget build(BuildContext context) {
    return CustomAutoScrollListView(
      items: popularDevicesList.map((device) {
        return MobileItem(
          mobileModel: MobileModel(
            imageUrl: device.deviceImage ?? '',
            title: device.deviceName ?? '',
            mobileKey: device.key ?? '',
          ),
          imageAspectRatio: 1.1,
        );
      }).toList(),
      onItemTap: (index) {
        AppAd().showInterstitialAd();
        BlocProvider.of<MobileDetailsCubit>(context).getMobileDetails(
          mobileKey: popularDevicesList[index].key ?? '',
        );
      },
    );
  }
}
