part of 'add_property_cubit.dart';

class AddPropertyTempState {
  final String country;
  final String state;
  final String city;
  final String title;
  final String address;
  final String propertyType;
  final int rentPrice;
  final int sellPrice;
  final bool rentNego;
  final bool sellNego;
  final int deposit;
  final int ment;
  final int area;
  final String bhkType;
  final String furnishing;
  final String prefTene;
  final String parking;
  final int bathNo;
  final int floorNo;
  final int balkNo;
  final String water;
  final String facing;
  final bool gatedSecu;
  final bool nonveg;
  final int age;
  final List<String> amenities;
  final List<Uint8List> pics;

  factory AddPropertyTempState.initial() {
    return const AddPropertyTempState(
      country: "India",
      state: "Maharashtra",
      city: "Pune",
      title: "",
      address: "",
      propertyType: "Property for",
      rentPrice: 0,
      sellPrice: 0,
      rentNego: false,
      sellNego: false,
      deposit: 0,
      ment: 0,
      area: 0,
      bhkType: "Select BHK",
      furnishing: "Select Furnishing",
      prefTene: "Preferred Tenets",
      parking: "Select Parking",
      bathNo: 0,
      floorNo: 0,
      balkNo: 0,
      water: "Select Water Supply",
      facing: "Select Home Facing",
      gatedSecu: false,
      nonveg: false,
      age: 0,
      amenities: [],
      pics: [],
    );
  }

  const AddPropertyTempState({
    required this.country,
    required this.state,
    required this.city,
    required this.title,
    required this.address,
    required this.propertyType,
    required this.rentPrice,
    required this.sellPrice,
    required this.rentNego,
    required this.sellNego,
    required this.deposit,
    required this.ment,
    required this.area,
    required this.bhkType,
    required this.furnishing,
    required this.prefTene,
    required this.parking,
    required this.bathNo,
    required this.floorNo,
    required this.balkNo,
    required this.water,
    required this.facing,
    required this.gatedSecu,
    required this.nonveg,
    required this.age,
    required this.amenities,
    required this.pics,
  });

  AddPropertyTempState copyWith({
    String? country,
    String? state,
    String? city,
    String? title,
    String? address,
    String? propertyType,
    int? rentPrice,
    int? sellPrice,
    bool? rentNego,
    bool? sellNego,
    int? deposit,
    int? ment,
    int? area,
    String? bhkType,
    String? furnishing,
    String? prefTene,
    String? parking,
    int? bathNo,
    int? floorNo,
    int? balkNo,
    String? water,
    String? facing,
    bool? gatedSecu,
    bool? nonveg,
    int? age,
    List<String>? amenities,
    List<Uint8List>? pics,
  }) {
    return AddPropertyTempState(
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      title: title ?? this.title,
      address: address ?? this.address,
      propertyType: propertyType ?? this.propertyType,
      rentPrice: rentPrice ?? this.rentPrice,
      sellPrice: sellPrice ?? this.sellPrice,
      rentNego: rentNego ?? this.rentNego,
      sellNego: sellNego ?? this.sellNego,
      deposit: deposit ?? this.deposit,
      ment: ment ?? this.ment,
      area: area ?? this.area,
      bhkType: bhkType ?? this.bhkType,
      furnishing: furnishing ?? this.furnishing,
      prefTene: prefTene ?? this.prefTene,
      parking: parking ?? this.parking,
      bathNo: bathNo ?? this.bathNo,
      floorNo: floorNo ?? this.floorNo,
      balkNo: balkNo ?? this.balkNo,
      water: water ?? this.water,
      facing: facing ?? this.facing,
      gatedSecu: gatedSecu ?? this.gatedSecu,
      nonveg: nonveg ?? this.nonveg,
      age: age ?? this.age,
      amenities: amenities ?? this.amenities,
      pics: pics ?? this.pics,
    );
  }
}
