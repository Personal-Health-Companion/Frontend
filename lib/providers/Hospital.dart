
class Hospital{
  int? Id;
  final String name;
  final String code;
  final String city;
  final String district;
  final String town;
  final String? postalCode;
  final String address;
  final String telephone;

  Hospital(
      {this.Id,
        required this.name,
        required this.code,
        required this.city,
        required this.district,
        required this.town,
        required this.postalCode,
        required this.address,
        required this.telephone,
      });

  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'name': name,
      'code': code,
      'city': city,
      'district': district,
      'town': town,
      'postalCode': postalCode,
      'address': address,
      'telephone': telephone,
    };
  }

  Hospital.fromJson(Map<String, dynamic> json)
      : Id = json['id'],
        name = json['name'],
        code = json['code'],
        city = json['city'],
        district = json['district'],
        town = json['town'],
        postalCode = json['postalCode'],
        address = json['address'],
        telephone = json['telephone'];
}

