class MyEventModel {
  String id;
  String image;
  String title;
  String subtitle;
  String time;

  MyEventModel({required this.image, required this.title, required this.subtitle, required this.time, required this.id});

  factory MyEventModel.fromJson(Map<String, dynamic> json, String id) {
    return MyEventModel(
      id: id,
      image: json['imageUrl'],
      title: json['title'],
      subtitle: json['subtitle'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'imageUrl': image, 'title': title, 'subtitle': subtitle, 'time': time};
  }
}
