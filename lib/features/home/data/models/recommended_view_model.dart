import 'package:flutter/material.dart';
import 'package:nova_phone/features/home/data/models/recommended_model/datum.dart';

class RecommendedViewModel {
  final String title;
  final List<Datum> data;
  final VoidCallback onTap;

  RecommendedViewModel({
    required this.title,
    required this.data,
    required this.onTap,
  });
}
