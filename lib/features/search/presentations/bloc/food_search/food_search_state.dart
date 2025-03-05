part of 'food_search_cubit.dart';

sealed class FoodSearchState extends Equatable {
  const FoodSearchState();

  @override
  List<Object> get props => [];
}

final class FoodSearchInitial extends FoodSearchState {}

final class FoodSearching extends FoodSearchState {}

final class SearchFoodFailed extends FoodSearchState {
  final String errorMessage;
  const SearchFoodFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class SearchSucceed extends FoodSearchState {}
