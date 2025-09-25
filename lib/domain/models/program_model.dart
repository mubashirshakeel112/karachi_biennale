class ProgramModel {
  String id;
  String image;
  String title;
  String subtitle;
  String description;
  String date;
  String time;
  String venue;

  ProgramModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
     required this.date,
    required this.time,
    required this.id,
    required this.venue
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json, String id) {
    return ProgramModel(
      id: id,
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      venue: json['venue']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'date': date,
      'image': image,
      'time': time,
      'venue': venue
    };
  }
}
