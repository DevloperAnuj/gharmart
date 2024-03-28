import 'dart:convert';

class ConnectionPropertyEntity {
  final String id;
  final DateTime createdAt;
  final Property property;
  final String user;

  ConnectionPropertyEntity({
    required this.id,
    required this.createdAt,
    required this.property,
    required this.user,
  });

  ConnectionPropertyEntity copyWith({
    String? id,
    DateTime? createdAt,
    Property? property,
    String? user,
  }) =>
      ConnectionPropertyEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        property: property ?? this.property,
        user: user ?? this.user,
      );

  factory ConnectionPropertyEntity.fromJson(String str) => ConnectionPropertyEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConnectionPropertyEntity.fromMap(Map<String, dynamic> json) => ConnectionPropertyEntity(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    property: Property.fromMap(json["property"]),
    user: json["user"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "property": property.toMap(),
    "user": user,
  };
}

class Property {
  final String id;
  final int age;
  final int area;
  final String city;
  final String desc;
  final int ment;
  final List<dynamic> pics;
  final User user;
  final String owner;
  final String state;
  final String title;
  final String water;
  final int balkNo;
  final int bathNo;
  final String facing;
  final bool nonveg;
  final int status;
  final String address;
  final String bhkType;
  final String country;
  final int deposit;
  final int floorNo;
  final String parking;
  final List<String> picsUrl;
  final String prefTene;
  final bool rentNego;
  final bool sellNego;
  final List<String> amenities;
  final bool gatedSecu;
  final int rentPrice;
  final int sellPrice;
  final DateTime createdAt;
  final String furnishing;
  final String propertyType;

  Property({
    required this.id,
    required this.age,
    required this.area,
    required this.city,
    required this.desc,
    required this.ment,
    required this.pics,
    required this.user,
    required this.owner,
    required this.state,
    required this.title,
    required this.water,
    required this.balkNo,
    required this.bathNo,
    required this.facing,
    required this.nonveg,
    required this.status,
    required this.address,
    required this.bhkType,
    required this.country,
    required this.deposit,
    required this.floorNo,
    required this.parking,
    required this.picsUrl,
    required this.prefTene,
    required this.rentNego,
    required this.sellNego,
    required this.amenities,
    required this.gatedSecu,
    required this.rentPrice,
    required this.sellPrice,
    required this.createdAt,
    required this.furnishing,
    required this.propertyType,
  });

  Property copyWith({
    String? id,
    int? age,
    int? area,
    String? city,
    String? desc,
    int? ment,
    List<dynamic>? pics,
    User? user,
    String? owner,
    String? state,
    String? title,
    String? water,
    int? balkNo,
    int? bathNo,
    String? facing,
    bool? nonveg,
    int? status,
    String? address,
    String? bhkType,
    String? country,
    int? deposit,
    int? floorNo,
    String? parking,
    List<String>? picsUrl,
    String? prefTene,
    bool? rentNego,
    bool? sellNego,
    List<String>? amenities,
    bool? gatedSecu,
    int? rentPrice,
    int? sellPrice,
    DateTime? createdAt,
    String? furnishing,
    String? propertyType,
  }) =>
      Property(
        id: id ?? this.id,
        age: age ?? this.age,
        area: area ?? this.area,
        city: city ?? this.city,
        desc: desc ?? this.desc,
        ment: ment ?? this.ment,
        pics: pics ?? this.pics,
        user: user ?? this.user,
        owner: owner ?? this.owner,
        state: state ?? this.state,
        title: title ?? this.title,
        water: water ?? this.water,
        balkNo: balkNo ?? this.balkNo,
        bathNo: bathNo ?? this.bathNo,
        facing: facing ?? this.facing,
        nonveg: nonveg ?? this.nonveg,
        status: status ?? this.status,
        address: address ?? this.address,
        bhkType: bhkType ?? this.bhkType,
        country: country ?? this.country,
        deposit: deposit ?? this.deposit,
        floorNo: floorNo ?? this.floorNo,
        parking: parking ?? this.parking,
        picsUrl: picsUrl ?? this.picsUrl,
        prefTene: prefTene ?? this.prefTene,
        rentNego: rentNego ?? this.rentNego,
        sellNego: sellNego ?? this.sellNego,
        amenities: amenities ?? this.amenities,
        gatedSecu: gatedSecu ?? this.gatedSecu,
        rentPrice: rentPrice ?? this.rentPrice,
        sellPrice: sellPrice ?? this.sellPrice,
        createdAt: createdAt ?? this.createdAt,
        furnishing: furnishing ?? this.furnishing,
        propertyType: propertyType ?? this.propertyType,
      );

  factory Property.fromJson(String str) => Property.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Property.fromMap(Map<String, dynamic> json) => Property(
    id: json["id"],
    age: json["age"],
    area: json["area"],
    city: json["city"],
    desc: json["desc"],
    ment: json["ment"],
    pics: List<dynamic>.from(json["pics"].map((x) => x)),
    user: User.fromMap(json["user"]),
    owner: json["owner"],
    state: json["state"],
    title: json["title"],
    water: json["water"],
    balkNo: json["balkNo"],
    bathNo: json["bathNo"],
    facing: json["facing"],
    nonveg: json["nonveg"],
    status: json["status"],
    address: json["address"],
    bhkType: json["bhkType"],
    country: json["country"],
    deposit: json["deposit"],
    floorNo: json["floorNo"],
    parking: json["parking"],
    picsUrl: List<String>.from(json["picsUrl"].map((x) => x)),
    prefTene: json["prefTene"],
    rentNego: json["rentNego"],
    sellNego: json["sellNego"],
    amenities: List<String>.from(json["amenities"].map((x) => x)),
    gatedSecu: json["gatedSecu"],
    rentPrice: json["rentPrice"],
    sellPrice: json["sellPrice"],
    createdAt: DateTime.parse(json["created_at"]),
    furnishing: json["furnishing"],
    propertyType: json["propertyType"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "age": age,
    "area": area,
    "city": city,
    "desc": desc,
    "ment": ment,
    "pics": List<dynamic>.from(pics.map((x) => x)),
    "user": user.toMap(),
    "owner": owner,
    "state": state,
    "title": title,
    "water": water,
    "balkNo": balkNo,
    "bathNo": bathNo,
    "facing": facing,
    "nonveg": nonveg,
    "status": status,
    "address": address,
    "bhkType": bhkType,
    "country": country,
    "deposit": deposit,
    "floorNo": floorNo,
    "parking": parking,
    "picsUrl": List<dynamic>.from(picsUrl.map((x) => x)),
    "prefTene": prefTene,
    "rentNego": rentNego,
    "sellNego": sellNego,
    "amenities": List<dynamic>.from(amenities.map((x) => x)),
    "gatedSecu": gatedSecu,
    "rentPrice": rentPrice,
    "sellPrice": sellPrice,
    "created_at": createdAt.toIso8601String(),
    "furnishing": furnishing,
    "propertyType": propertyType,
  };
}

class User {
  final String id;
  final String city;
  final String name;
  final String email;
  final String phone;
  final int tokens;
  final DateTime createdAt;

  User({
    required this.id,
    required this.city,
    required this.name,
    required this.email,
    required this.phone,
    required this.tokens,
    required this.createdAt,
  });

  User copyWith({
    String? id,
    String? city,
    String? name,
    String? email,
    String? phone,
    int? tokens,
    DateTime? createdAt,
  }) =>
      User(
        id: id ?? this.id,
        city: city ?? this.city,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        tokens: tokens ?? this.tokens,
        createdAt: createdAt ?? this.createdAt,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    city: json["city"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    tokens: json["tokens"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "city": city,
    "name": name,
    "email": email,
    "phone": phone,
    "tokens": tokens,
    "created_at": createdAt.toIso8601String(),
  };
}
