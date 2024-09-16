import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nova_phone/features/home/data/repos/home_repo.dart';
import 'package:nova_phone/features/home/data/models/recommended_model/recommended.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit(this.homeRepo) : super(RecommendedInitial());
  final HomeRepo homeRepo;
  Future<void> getRecommended() async {
    emit(RecommendedLoading());
    var result = await homeRepo.getRecommended();
    result.fold((failure) => emit(RecommendedFailure(failure.errMessage)),
        (recommended) => emit(RecommendedSuccess(recommended)));
  }
}
