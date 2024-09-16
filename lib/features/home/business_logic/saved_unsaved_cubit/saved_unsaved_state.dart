part of 'saved_unsaved_cubit.dart';

abstract class SavedUnsavedState {}

class SavedUnsavedInitial extends SavedUnsavedState {}

class FavoriteSuccess extends SavedUnsavedState {
  final List<MobileModel> favorites;
  FavoriteSuccess(this.favorites);
}
