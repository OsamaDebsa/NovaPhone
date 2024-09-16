part of 'brand_cubit.dart';

sealed class BrandState extends Equatable {
  const BrandState();

  @override
  List<Object> get props => [];
}

final class BrandInitial extends BrandState {}

final class BrandLoading extends BrandState {}

final class BrandSuccess extends BrandState {
  final List<BrandModel> brands;
  const BrandSuccess(this.brands);
}

final class BrandFailure extends BrandState {
  final String message;
  const BrandFailure(this.message);
}
