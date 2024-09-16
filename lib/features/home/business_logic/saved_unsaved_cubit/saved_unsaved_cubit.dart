import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:nova_phone/features/home/data/models/mobile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'saved_unsaved_state.dart';

class SavedUnsavedCubit extends Cubit<SavedUnsavedState> {
  SavedUnsavedCubit() : super(SavedUnsavedInitial()) {
    _loadFavorites();
  }

  final List<MobileModel> _favorites = [];

  List<MobileModel> get favorites => List.unmodifiable(_favorites);

  Future<void> addToFavorites(MobileModel device) async {
    if (!_favorites.any((item) => item.mobileKey == device.mobileKey)) {
      _favorites.add(device);
      await _saveFavorites();
      emit(FavoriteSuccess(List.unmodifiable(_favorites)));
    }
  }

  Future<void> removeFromFavorites(String deviceKey) async {
    _favorites.removeWhere((item) => item.mobileKey == deviceKey);
    await _saveFavorites();
    emit(FavoriteSuccess(List.unmodifiable(_favorites)));
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteJsonList = _favorites
        .map((item) => jsonEncode({
              'mobileKey': item.mobileKey,
              'imageUrl': item.imageUrl,
              'title': item.title,
            }))
        .toList();
    await prefs.setStringList('favorites', favoriteJsonList);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList('favorites') ?? [];
    _favorites.addAll(savedFavorites.map((item) {
      final json = jsonDecode(item);
      return MobileModel(
        mobileKey: json['mobileKey'],
        imageUrl: json['imageUrl'],
        title: json['title'],
      );
    }));
    emit(FavoriteSuccess(List.unmodifiable(_favorites)));
  }
}
