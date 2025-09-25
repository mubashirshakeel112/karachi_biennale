class VenueModel {
  String id;
  String title;
  String subtitle;
  String image;
  String location;
  String phone;
  List<String> artists;

  VenueModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.location,
    required this.phone,
    required this.artists
  });

  factory VenueModel.fromJson(Map<String, dynamic> json) {
    return VenueModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
      phone: json['phone'] ?? '',
      artists: List<String>.from(json['artists']),
    );
  }
}
