part of 'favorite_property_cubit.dart';

class FavoritePropertyState {
  final List<PropertyEntity> favoritePropertyList;

  const FavoritePropertyState({
    required this.favoritePropertyList,
  });

  factory FavoritePropertyState.initial() {
    return const FavoritePropertyState(favoritePropertyList: []);
  }

  FavoritePropertyState copyWith({
    List<PropertyEntity>? favoritePropertyList,
  }) {
    return FavoritePropertyState(
      favoritePropertyList: favoritePropertyList ?? this.favoritePropertyList,
    );
  }
}
