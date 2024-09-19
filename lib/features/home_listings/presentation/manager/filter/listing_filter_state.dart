part of 'listing_filter_cubit.dart';

class ListingFilterState {
  final String country;
  final String state;
  final String city;
  final String propertyType;
  final String propertyCat;
  final String bhkType;
  final int priceMin;
  final int priceMax;
  final int rentMin;
  final int rentMax;
  final String prefTen;
  final String furnishing;
  final String parking;
  final String landmark;
  final String procat;

  factory ListingFilterState.initial() {
    return const ListingFilterState(
      country: "India",
      state: "Maharashtra",
      city: "Pune",
      propertyType: "Rent",
      propertyCat: "Room",
      bhkType: "1 BHK",
      priceMin: 100000,
      priceMax: 10000000,
      prefTen: "All",
      furnishing: "Semi",
      parking: "Bike and Car",
      rentMin: 1000,
      rentMax: 5000,
      landmark: "Ambegaon Budruk",
      procat: "Flat"
    );
  }

  const ListingFilterState({
    required this.country,
    required this.state,
    required this.city,
    required this.propertyType,
    required this.propertyCat,
    required this.bhkType,
    required this.priceMin,
    required this.priceMax,
    required this.rentMin,
    required this.rentMax,
    required this.prefTen,
    required this.furnishing,
    required this.parking,
    required this.landmark,
    required this.procat,
  });

  ListingFilterState copyWith({
    String? country,
    String? state,
    String? city,
    String? propertyType,
    String? propertyCat,
    String? bhkType,
    int? priceMin,
    int? priceMax,
    int? rentMin,
    int? rentMax,
    String? prefTen,
    String? furnishing,
    String? parking,
    String? landmark,
    String? procat,
  }) {
    return ListingFilterState(
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      propertyType: propertyType ?? this.propertyType,
      propertyCat: propertyCat ?? this.propertyCat,
      bhkType: bhkType ?? this.bhkType,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      prefTen: prefTen ?? this.prefTen,
      furnishing: furnishing ?? this.furnishing,
      parking: parking ?? this.parking,
      rentMin: rentMin ?? this.rentMin,
      rentMax: rentMax ?? this.rentMax,
      landmark: landmark ?? this.landmark,
      procat: procat ?? this.procat,
    );
  }
}
