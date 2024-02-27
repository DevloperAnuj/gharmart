class FilterEntity {
  final String country;
  final String state;
  final String city;
  final String propertyType;
  final String bhkType;
  final int priceMin;
  final int priceMax;
  final String prefTen;
  final String furnishing;
  final String parking;

  const FilterEntity({
    required this.country,
    required this.state,
    required this.city,
    required this.propertyType,
    required this.bhkType,
    required this.priceMin,
    required this.priceMax,
    required this.prefTen,
    required this.furnishing,
    required this.parking,
  });

  FilterEntity copyWith({
    String? country,
    String? state,
    String? city,
    String? propertyType,
    String? bhkType,
    int? priceMin,
    int? priceMax,
    String? prefTen,
    String? furnishing,
    String? parking,
  }) {
    return FilterEntity(
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      propertyType: propertyType ?? this.propertyType,
      bhkType: bhkType ?? this.bhkType,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      prefTen: prefTen ?? this.prefTen,
      furnishing: furnishing ?? this.furnishing,
      parking: parking ?? this.parking,
    );
  }
}
