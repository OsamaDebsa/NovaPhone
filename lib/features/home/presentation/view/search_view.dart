import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_phone/core/ad/app_ad.dart';
import 'package:nova_phone/core/ad/banner_ad.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/core/widgets/custom_image_display.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';
import 'package:nova_phone/features/home/business_logic/all_devices_cubit/all_devices_cubit.dart';
import 'package:fuzzy/fuzzy.dart';
import 'dart:async';

class SearchView extends StatefulWidget {
  final void Function(String)? onItemSelected;

  const SearchView({super.key, this.onItemSelected});

  @override
  State<StatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final Duration _debounceDuration = const Duration(milliseconds: 300);
  Timer? _debounce;
  final Map<String, String> _itemKeys = {};
  final Map<String, String> _itemImages = {};
  List<String> _searchResults = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchDevices();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  Future<void> _fetchDevices() async {
    try {
      await context.read<AllDevicesCubit>().getAllDevices();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  void _updateDeviceLists(AllDevicesSuccess state) {
    _itemKeys.clear();
    _itemImages.clear();

    for (var brand in state.allDevices) {
      for (var deviceItem in brand.deviceList ?? []) {
        final itemName =
            '${brand.brandName ?? ''} ${deviceItem.deviceName ?? ''}';
        _itemKeys[itemName] = deviceItem.key ?? '';
        _itemImages[itemName] = deviceItem.deviceImage ?? '';
      }
    }
  }

  void _search(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(_debounceDuration, () {
      final fuzzy = Fuzzy(_itemKeys.keys.toList());
      final results = fuzzy.search(query);
      setState(() {
        _searchResults = results.map((result) => result.item).toList();
      });
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchResults.clear();
    });
  }

  void _handleTap({required String itemKey}) {
    if (widget.onItemSelected != null) {
      widget.onItemSelected!(itemKey);

      context.pop();
    } else {
      context.push(StringManager.mobileDetailsRoute, extra: itemKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AllDevicesCubit>().state;

    if (_isLoading) return _buildLoadingScreen();
    if (_hasError) return _buildErrorScreen();

    if (state is AllDevicesSuccess) _updateDeviceLists(state);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            _buildBackButton(),
            const Text(StringManager.loading, style: Styles.styleMedium20),
          ],
        ),
      ),
      body: const Center(child: CustomLoadingIndicator()),
    );
  }

  Widget _buildErrorScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            _buildBackButton(),
            const Text(StringManager.error, style: Styles.styleMedium20),
          ],
        ),
      ),
      body: const Center(
        child: Text(StringManager.tryAganinLater, style: Styles.styleMedium20),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          _buildBackButton(),
          Expanded(child: _buildSearchField()),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new,
            color: ColorManager.secondaryColor),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: ColorManager.shadowBordrColor,
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        onChanged: _search,
        decoration: InputDecoration(
          hintText: StringManager.search,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          prefixIcon:
              const Icon(Icons.search, color: ColorManager.secondaryColor),
          suffixIcon: _searchController.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: _clearSearch,
                ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(height: 10),
        const BannerAdView(),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              final itemName = _searchResults[index];
              return ListTile(
                contentPadding: const EdgeInsets.all(8),
                title: Text(itemName),
                leading: _buildLeadingImage(itemName),
                onTap: () {
                  AppAd().showInterstitialAd();
                  _handleTap(itemKey: _itemKeys[itemName]!);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLeadingImage(String itemName) {
    final itemImage = _itemImages[itemName];
    return itemImage != null
        ? CustomImageDisplay(imageUrl: itemImage, aspectRatio: 1)
        : const Icon(Icons.image, size: 50);
  }
}
