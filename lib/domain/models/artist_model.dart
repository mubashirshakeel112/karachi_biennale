class ArtistModel {
  final String id;
  final String name;
  final String skill;
  final String imageUrl;

  ArtistModel({
    required this.id,
    required this.name,
    required this.skill,
    required this.imageUrl,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json, String id) {
    return ArtistModel(
      id: id,
      name: json["name"] ?? '',
      skill: json["skill"] ?? '',
      imageUrl: json["imageUrl"] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'skill': skill,
      'imageUrl': imageUrl,
    };
  }
}
