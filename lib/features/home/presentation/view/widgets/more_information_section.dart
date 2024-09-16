import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/related_devices_list_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/popular_devices_list_view.dart';

class MoreInformationSection extends StatelessWidget {
  const MoreInformationSection({super.key, required this.mobileDetails});
  final MobileDetails mobileDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (mobileDetails.moreInformation?.relatedDevices != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                StringManager.relatedDevices,
                style: Styles.styleHeavy18,
              ),
              RelatedDevicesList(
                relatedDevicesList:
                    mobileDetails.moreInformation!.relatedDevices!,
              ),
            ],
          ),
        if (mobileDetails.moreInformation?.popularDevices != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                StringManager.popularDevices,
                style: Styles.styleHeavy18,
              ),
              PopularDevicesList(
                popularDevicesList:
                    mobileDetails.moreInformation!.popularDevices!,
              ),
            ],
          ),
      ],
    );
  }
}
