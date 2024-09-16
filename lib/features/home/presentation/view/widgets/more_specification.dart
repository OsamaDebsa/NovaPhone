import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/datum.dart';
import 'package:nova_phone/features/home/data/models/mobile_details/more_specification.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({super.key, required this.moreSpecificationList});
  final List<MoreSpecification>? moreSpecificationList;

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  late List<bool> _expandedStates;

  @override
  void initState() {
    super.initState();
    _expandedStates =
        List.filled(widget.moreSpecificationList?.length ?? 0, false);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.moreSpecificationList == null ||
        widget.moreSpecificationList!.isEmpty) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              StringManager.moreDetail,
              style: Styles.styleBold24,
            ),
          ),
          const SizedBox(height: 8.0),
          ...widget.moreSpecificationList!.asMap().entries.map((entry) {
            int index = entry.key;
            MoreSpecification spec = entry.value;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: _buildSpecificationCard(spec, index),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSpecificationCard(MoreSpecification spec, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedStates[index] = !_expandedStates[index];
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: ColorManager.mainColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: ColorManager.lightGrayColor,
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(spec),
            const SizedBox(height: 4.0),
            if (_expandedStates[index]) _buildSpecificationDetails(spec),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(MoreSpecification spec) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          child: Text(
            spec.title ?? '',
            style: Styles.styleBold16,
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorManager.whiteColor,
        ),
      ],
    );
  }

  Widget _buildSpecificationDetails(MoreSpecification spec) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: spec.data?.map((datum) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
              child: _buildDatum(datum),
            );
          }).toList() ??
          [],
    );
  }

  Widget _buildDatum(Datum datum) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            datum.title ?? '',
            style: Styles.styleBold16.copyWith(
              color: ColorManager.lightSilverColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (datum.data != null)
            ...datum.data!.map((item) => Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 2.0),
                  child: Text(
                    item,
                    style: Styles.styleRegular16.copyWith(
                      color: ColorManager.lightSilverColor,
                    ),
                  ),
                )),
          if (datum.subData != null)
            ...datum.subData!.map((subDatum) => Padding(
                  padding: const EdgeInsets.only(left: 24.0, bottom: 2.0),
                  child: _buildDatum(subDatum),
                )),
        ],
      ),
    );
  }
}
