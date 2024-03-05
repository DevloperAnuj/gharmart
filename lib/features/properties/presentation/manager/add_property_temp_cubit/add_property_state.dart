part of 'add_property_cubit.dart';

class AddPropertyTempState {
  final String country;
  final String state;
  final String city;
  final String title;
  final String desc;
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
  final List<String> picsUrl;

  factory AddPropertyTempState.initial() {
    return const AddPropertyTempState(
      country: "India",
      state: "Maharashtra",
      city: "Pune",
      title: "",
      address: "",
      desc: "",
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
      picsUrl: [],
    );
  }

  const AddPropertyTempState({
    required this.country,
    required this.state,
    required this.city,
    required this.title,
    required this.address,
    required this.desc,
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
    required this.picsUrl,
  });

  AddPropertyTempState copyWith({
    String? country,
    String? state,
    String? city,
    String? title,
    String? address,
    String? desc,
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
    List<String>? picsUrl,
  }) {
    return AddPropertyTempState(
        country: country ?? this.country,
        state: state ?? this.state,
        city: city ?? this.city,
        title: title ?? this.title,
        address: address ?? this.address,
        desc: desc ?? this.desc,
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
        picsUrl: picsUrl ?? this.picsUrl);
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'state': state,
      'city': city,
      'title': title,
      'address': address,
      'desc':desc,
      'propertyType': propertyType,
      'rentPrice': rentPrice,
      'sellPrice': sellPrice,
      'rentNego': rentNego,
      'sellNego': sellNego,
      'deposit': deposit,
      'ment': ment,
      'area': area,
      'bhkType': bhkType,
      'furnishing': furnishing,
      'prefTene': prefTene,
      'parking': parking,
      'bathNo': bathNo,
      'floorNo': floorNo,
      'balkNo': balkNo,
      'water': water,
      'facing': facing,
      'gatedSecu': gatedSecu,
      'nonveg': nonveg,
      'age': age,
      'amenities': amenities,
      'pics': pics,
      'picsUrl': picsUrl,
    };
  }

  factory AddPropertyTempState.fromMap(Map<String, dynamic> map) {
    return AddPropertyTempState(
      country: map['country'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      title: map['title'] as String,
      address: map['address'] as String,
      desc: map['desc'] as String,
      propertyType: map['propertyType'] as String,
      rentPrice: map['rentPrice'] as int,
      sellPrice: map['sellPrice'] as int,
      rentNego: map['rentNego'] as bool,
      sellNego: map['sellNego'] as bool,
      deposit: map['deposit'] as int,
      ment: map['ment'] as int,
      area: map['area'] as int,
      bhkType: map['bhkType'] as String,
      furnishing: map['furnishing'] as String,
      prefTene: map['prefTene'] as String,
      parking: map['parking'] as String,
      bathNo: map['bathNo'] as int,
      floorNo: map['floorNo'] as int,
      balkNo: map['balkNo'] as int,
      water: map['water'] as String,
      facing: map['facing'] as String,
      gatedSecu: map['gatedSecu'] as bool,
      nonveg: map['nonveg'] as bool,
      age: map['age'] as int,
      amenities: map['amenities'] as List<String>,
      pics: map['pics'] as List<Uint8List>,
      picsUrl: map['picsUrl'] as List<String>,
    );
  }
}
