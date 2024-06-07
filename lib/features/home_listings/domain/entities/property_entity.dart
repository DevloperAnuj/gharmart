import 'package:meta/meta.dart';
import 'dart:convert';

class PropertyEntity {
  final String id;
  final DateTime createdAt;
  final String title;
  final String country;
  final String state;
  final String city;
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
  final List<String> picsUrl;
  final String owner;
  final int status;
  final List<dynamic> pics;
  final String desc;
  final User user;
  final String landmark;
  final String procat;

  PropertyEntity({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.country,
    required this.state,
    required this.city,
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
    required this.picsUrl,
    required this.owner,
    required this.status,
    required this.pics,
    required this.desc,
    required this.user,
    required this.landmark,
    required this.procat,
  });

  PropertyEntity copyWith({
    String? id,
    DateTime? createdAt,
    String? title,
    String? country,
    String? state,
    String? city,
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
    List<String>? picsUrl,
    String? owner,
    int? status,
    List<dynamic>? pics,
    String? desc,
    User? user,
    String? procat,
    String? landmark,
  }) =>
      PropertyEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
        country: country ?? this.country,
        state: state ?? this.state,
        city: city ?? this.city,
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
        picsUrl: picsUrl ?? this.picsUrl,
        owner: owner ?? this.owner,
        status: status ?? this.status,
        pics: pics ?? this.pics,
        desc: desc ?? this.desc,
        user: user ?? this.user,
        procat: procat ?? this.procat,
        landmark: landmark ?? this.landmark,
      );

  factory PropertyEntity.fromJson(String str) =>
      PropertyEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PropertyEntity.fromMap(Map<String, dynamic> json) => PropertyEntity(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        title: json["title"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        propertyType: json["propertyType"],
        landmark: json["landmark"],
        procat: json["procat"],
        rentPrice: json["rentPrice"],
        sellPrice: json["sellPrice"],
        rentNego: json["rentNego"],
        sellNego: json["sellNego"],
        deposit: json["deposit"],
        ment: json["ment"],
        area: json["area"],
        bhkType: json["bhkType"],
        furnishing: json["furnishing"],
        prefTene: json["prefTene"],
        parking: json["parking"],
        bathNo: json["bathNo"],
        floorNo: json["floorNo"],
        balkNo: json["balkNo"],
        water: json["water"],
        facing: json["facing"],
        gatedSecu: json["gatedSecu"],
        nonveg: json["nonveg"],
        age: json["age"],
        amenities: List<String>.from(json["amenities"].map((x) => x)),
        picsUrl: List<String>.from(json["picsUrl"].map((x) => x)),
        owner: json["owner"],
        status: json["status"],
        pics: List<dynamic>.from(json["pics"].map((x) => x)),
        desc: json["desc"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "title": title,
        "country": country,
        "state": state,
        "city": city,
        "address": address,
        "propertyType": propertyType,
        "rentPrice": rentPrice,
        "sellPrice": sellPrice,
        "rentNego": rentNego,
        "sellNego": sellNego,
        "deposit": deposit,
        "ment": ment,
        "area": area,
        "bhkType": bhkType,
        "furnishing": furnishing,
        "prefTene": prefTene,
        "parking": parking,
        "bathNo": bathNo,
        "floorNo": floorNo,
        "balkNo": balkNo,
        "water": water,
        "facing": facing,
        "gatedSecu": gatedSecu,
        "nonveg": nonveg,
        "age": age,
        "amenities": List<dynamic>.from(amenities.map((x) => x)),
        "picsUrl": List<dynamic>.from(picsUrl.map((x) => x)),
        "owner": owner,
        "status": status,
        "pics": List<dynamic>.from(pics.map((x) => x)),
        "desc": desc,
        "user": user.toMap(),
        "procat": procat,
        "landmark": landmark,
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
