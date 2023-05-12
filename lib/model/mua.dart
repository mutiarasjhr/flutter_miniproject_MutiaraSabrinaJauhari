class Specialist {
  String? id;
  String? name;
  String? avatar;
  String? pricelist;
  String? pricelistwed;

  Specialist(
      {required this.id,
      this.name,
      this.avatar,
      this.pricelist,
      this.pricelistwed});

  factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      pricelist: json['pricelist'],
      pricelistwed: json['pricelistwed']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'pricelist': pricelist,
        'pricelistwed': pricelistwed,
      };
}
