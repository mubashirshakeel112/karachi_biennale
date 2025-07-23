class AboutModel {
  List<String> images;

  AboutModel({
    required this.images,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
    };
  }
}
