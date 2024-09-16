import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_phone/core/widgets/custom_loading_indicator.dart';

class CustomImageDisplay extends StatelessWidget {
  final String imageUrl;
  final double aspectRatio;

  const CustomImageDisplay({
    super.key,
    required this.imageUrl,
    this.aspectRatio = 16 / 9,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) =>
            const Center(child: CustomLoadingIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
