import 'dart:convert';

class ReportPropertyEntity {
  final DateTime createdAt;
  final Property property;
  final Reporter reporter;
  final String reason;
  final String id;

  ReportPropertyEntity({
    required this.createdAt,
    required this.property,
    required this.reporter,
    required this.reason,
    required this.id,
  });

  ReportPropertyEntity copyWith({
    DateTime? createdAt,
    Property? property,
    Reporter? reporter,
    String? reason,
    String? id,
  }) =>
      ReportPropertyEntity(
        createdAt: createdAt ?? this.createdAt,
        property: property ?? this.property,
        reporter: reporter ?? this.reporter,
        reason: reason ?? this.reason,
        id: id ?? this.id,
      );

  factory ReportPropertyEntity.fromJson(String str) => ReportPropertyEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportPropertyEntity.fromMap(Map<String, dynamic> json) => ReportPropertyEntity(
    createdAt: DateTime.parse(json["created_at"]),
    property: Property.fromMap(json["property"]),
    reporter: Reporter.fromMap(json["reporter"]),
    reason: json["reason"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "created_at": createdAt.toIso8601String(),
    "property": property.toMap(),
    "reporter": reporter.toMap(),
    "reason": reason,
    "id": id,
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
  final Reporter user;
  final String owner;
  final String state;
  final String title;
  final String water;
  final int balkNo;
  final int bathNo;
  final String facing;
  final bool nonveg;
  final String procat;
  final int status;
  final String address;
  final String bhkType;
  final String country;
  final int deposit;
  final int floorNo;
  final String parking;
  final List<String> picsUrl;
  final String landmark;
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
    required this.procat,
    required this.status,
    required this.address,
    required this.bhkType,
    required this.country,
    required this.deposit,
    required this.floorNo,
    required this.parking,
    required this.picsUrl,
    required this.landmark,
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
    Reporter? user,
    String? owner,
    String? state,
    String? title,
    String? water,
    int? balkNo,
    int? bathNo,
    String? facing,
    bool? nonveg,
    String? procat,
    int? status,
    String? address,
    String? bhkType,
    String? country,
    int? deposit,
    int? floorNo,
    String? parking,
    List<String>? picsUrl,
    String? landmark,
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
        procat: procat ?? this.procat,
        status: status ?? this.status,
        address: address ?? this.address,
        bhkType: bhkType ?? this.bhkType,
        country: country ?? this.country,
        deposit: deposit ?? this.deposit,
        floorNo: floorNo ?? this.floorNo,
        parking: parking ?? this.parking,
        picsUrl: picsUrl ?? this.picsUrl,
        landmark: landmark ?? this.landmark,
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
    user: Reporter.fromMap(json["user"]),
    owner: json["owner"],
    state: json["state"],
    title: json["title"],
    water: json["water"],
    balkNo: json["balkNo"],
    bathNo: json["bathNo"],
    facing: json["facing"],
    nonveg: json["nonveg"],
    procat: json["procat"],
    status: json["status"],
    address: json["address"],
    bhkType: json["bhkType"],
    country: json["country"],
    deposit: json["deposit"],
    floorNo: json["floorNo"],
    parking: json["parking"],
    picsUrl: List<String>.from(json["picsUrl"].map((x) => x)),
    landmark: json["landmark"],
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
    "procat": procat,
    "status": status,
    "address": address,
    "bhkType": bhkType,
    "country": country,
    "deposit": deposit,
    "floorNo": floorNo,
    "parking": parking,
    "picsUrl": List<dynamic>.from(picsUrl.map((x) => x)),
    "landmark": landmark,
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

class Reporter {
  final String id;
  final String city;
  final String name;
  final String email;
  final String phone;
  final int tokens;
  final DateTime createdAt;

  Reporter({
    required this.id,
    required this.city,
    required this.name,
    required this.email,
    required this.phone,
    required this.tokens,
    required this.createdAt,
  });

  Reporter copyWith({
    String? id,
    String? city,
    String? name,
    String? email,
    String? phone,
    int? tokens,
    DateTime? createdAt,
  }) =>
      Reporter(
        id: id ?? this.id,
        city: city ?? this.city,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        tokens: tokens ?? this.tokens,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Reporter.fromJson(String str) => Reporter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reporter.fromMap(Map<String, dynamic> json) => Reporter(
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
