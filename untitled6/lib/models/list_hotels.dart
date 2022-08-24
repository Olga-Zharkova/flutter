class ListHotels {
  final String? uuid;
  final String? name;
  final String? poster;

  ListHotels({this.uuid, this.name, this.poster});

  ListHotels.fronJson(Map<String, String> json)
      : this(
          uuid: json['uuid'],
          name: json['name'],
          poster: json['poster'],
        );
}
