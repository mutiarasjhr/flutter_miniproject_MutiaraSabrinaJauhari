class Specialist {
  String? id;
  String? name;
  String? avatar;
  bool? is_booking;

  Specialist({
    this.id,
    this.name,
    this.avatar,
    this.is_booking,
  });

  factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
        id: json['id'],
        name: json['name'],
        avatar: json['avatar'],
        is_booking: json['is_booking'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'is_booking': is_booking,
      };
}
