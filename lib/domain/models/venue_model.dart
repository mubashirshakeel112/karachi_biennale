class VenueModel {
  String title;
  String subtitle;
  String image;

  VenueModel({required this.title, required this.subtitle, required this.image});

  factory VenueModel.fromJson(Map<String, dynamic> json) {
    return VenueModel(title: json['title'] ?? '', subtitle: json['subtitle'] ?? '', image: json['image'] ?? '');
  }
}
