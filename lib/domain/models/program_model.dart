class ProgramModel {
  String id;
  String image;
  String title;
  String subtitle;
  String time;

  ProgramModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.id,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json, String id) {
    return ProgramModel(
      id: id,
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'subtitle': subtitle,
      'image': image,
      'time': time
    };
  }
}
