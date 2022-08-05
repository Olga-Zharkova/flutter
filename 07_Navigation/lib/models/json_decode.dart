class Artist {
  Artist({required this.id, required this.title, required this.type});
  String id;
  String title;
  String type;

  Artist.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        type = json['type'];
}