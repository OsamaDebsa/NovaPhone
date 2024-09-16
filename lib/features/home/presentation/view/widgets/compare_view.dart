import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/core/ad/banner_ad.dart';
import 'package:nova_phone/core/utils/assets.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/widgets/custom_elevated_button.dart';
import 'package:nova_phone/core/widgets/custom_image_display.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';
import 'package:nova_phone/features/home/business_logic/mobile_details_cubit/mobile_details_cubit.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/mobile_details.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/comparison_result_list_view.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/custom_app_bar.dart';

class CompareView extends StatefulWidget {
  final String? mobileKey;

  const CompareView({super.key, this.mobileKey});

  @override
  State<CompareView> createState() => _CompareViewState();
}

class _CompareViewState extends State<CompareView> {
  String? firstDeviceKey;
  String? secondDeviceKey;

  MobileDetails? firstDeviceDetails;
  MobileDetails? secondDeviceDetails;

  bool isLoadingFirstDevice = false;
  bool isLoadingSecondDevice = false;

  @override
  void initState() {
    super.initState();
    if (widget.mobileKey != null) {
      _setDeviceKey(
          widget.mobileKey!, true); // Automatically set the first device
    }
  }

  void _setDeviceKey(String selectedDeviceKey, bool isFirstDevice) {
    setState(() {
      if (isFirstDevice) {
        firstDeviceKey = selectedDeviceKey;
        isLoadingFirstDevice = true;
      } else {
        secondDeviceKey = selectedDeviceKey;
        isLoadingSecondDevice = true;
      }

      BlocProvider.of<MobileDetailsCubit>(context, listen: false)
          .getMobileDetails(mobileKey: selectedDeviceKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBar(title: "Compare"),
      ),
      backgroundColor: ColorManager.whiteColor,
      body: BlocListener<MobileDetailsCubit, MobileDetailsState>(
        listener: _blocListener,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const BannerAdView(),
                Row(
                  children: [
                    _buildDeviceColumn(isFirstDevice: true),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(Assets.assetsVsWord),
                      ),
                    ),
                    _buildDeviceColumn(isFirstDevice: false),
                  ],
                ),
                ComparisonResultListView(
                  firstDeviceDetails: firstDeviceDetails,
                  secondDeviceDetails: secondDeviceDetails,
                ),
                if (firstDeviceDetails != null && secondDeviceDetails != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomElevatedButton(
                          label: StringManager.moreDetail,
                          onPressed: () =>
                              _navigateToDeviceDetails(firstDeviceKey),
                        ),
                        CustomElevatedButton(
                          label: StringManager.moreDetail,
                          onPressed: () =>
                              _navigateToDeviceDetails(secondDeviceKey),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _blocListener(BuildContext context, MobileDetailsState state) {
    if (state is MobileDetailsSuccess) {
      setState(() {
        if (state.mobileDetails.key == firstDeviceKey) {
          firstDeviceDetails = state.mobileDetails;
          isLoadingFirstDevice = false;
        } else if (state.mobileDetails.key == secondDeviceKey) {
          secondDeviceDetails = state.mobileDetails;
          isLoadingSecondDevice = false;
        }
      });
    } else if (state is MobileDetailsFailure) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  Widget _buildDeviceColumn({required bool isFirstDevice}) {
    String? deviceKey = isFirstDevice ? firstDeviceKey : secondDeviceKey;
    MobileDetails? deviceDetails =
        isFirstDevice ? firstDeviceDetails : secondDeviceDetails;
    bool isLoading =
        isFirstDevice ? isLoadingFirstDevice : isLoadingSecondDevice;

    return Expanded(
      key: ValueKey(isFirstDevice ? 'firstDeviceColumn' : 'secondDeviceColumn'),
      flex: 12,
      child: InkWell(
        onTap: () => _navigateToDeviceSelection(isFirstDevice),
        child: Column(
          children: [
            const SizedBox(height: 15),
            AspectRatio(
              aspectRatio: .7,
              child: isLoading
                  ? const CustomLoadingIndicator()
                  : (deviceKey == null
                      ? Image.asset(Assets.assetsAddPhone)
                      : CustomImageDisplay(
                          imageUrl: _getDeviceImage(deviceKey))),
            ),
            const SizedBox(height: 10),
            _buildDeviceName(deviceDetails),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceName(MobileDetails? deviceDetails) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 80, // the minimum height to prevent shifting
      ),
      child: Text(
        deviceDetails?.deviceName ?? 'Select a device',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String _getDeviceImage(String deviceKey) {
    if (deviceKey == firstDeviceKey && firstDeviceDetails != null) {
      return firstDeviceDetails!.deviceImage ?? StringManager.novaImage;
    } else if (deviceKey == secondDeviceKey && secondDeviceDetails != null) {
      return secondDeviceDetails!.deviceImage ?? StringManager.novaPhone;
    }
    return StringManager.addPhone;
  }

  void _navigateToDeviceSelection(bool isFirstDevice) {
    context.push(
      StringManager.searchViewRoute,
      extra: (String selectedId) => _setDeviceKey(selectedId, isFirstDevice),
    );
  }

  void _navigateToDeviceDetails(String? deviceKey) {
    if (deviceKey != null) {
      AppAd().showInterstitialAd();
      context.push(
        StringManager.mobileDetailsRoute,
        extra: deviceKey,
      );
    }
  }
}
