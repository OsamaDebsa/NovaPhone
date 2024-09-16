import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_phone/core/utils/color_manager.dart';
import 'package:nova_phone/features/home/business_logic/saved_unsaved_cubit/saved_unsaved_cubit.dart';
import 'package:nova_phone/features/home/data/models/mobile_model.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key, required this.mobileModel});
  final MobileModel mobileModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedUnsavedCubit, SavedUnsavedState>(
      builder: (context, state) {
        final isFavorite = context
            .watch<SavedUnsavedCubit>()
            .favorites
            .any((item) => item.mobileKey == mobileModel.mobileKey);
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite
                ? ColorManager.secondaryColor
                : ColorManager.grayishPurpleColor,
          ),
          onPressed: () {
            if (isFavorite) {
              context
                  .read<SavedUnsavedCubit>()
                  .removeFromFavorites(mobileModel.mobileKey);
            } else {
              context.read<SavedUnsavedCubit>().addToFavorites(mobileModel);
            }
          },
        );
      },
    );
  }
}
