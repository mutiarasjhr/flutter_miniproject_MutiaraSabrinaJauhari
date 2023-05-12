class Specialist {
  String? id;
  String? name;
  String? avatar;
  String? pricelist;
  String? pricelistwed;
  List<String> portofolio;

  Specialist(
      {required this.id,
      this.name,
      this.avatar,
      this.pricelist,
      this.pricelistwed,
      required this.portofolio});

  factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      pricelist: json['pricelist'],
      pricelistwed: json['pricelistwed'],
      portofolio: List<String>.from(json['portofolio']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'pricelist': pricelist,
        'pricelistwed': pricelistwed,
        'portofolio': portofolio
      };
}
