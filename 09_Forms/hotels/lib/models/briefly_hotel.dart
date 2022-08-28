import 'package:json_annotation/json_annotation.dart';

part 'briefly_hotel.g.dart';

@JsonSerializable()
class BrieflyHotel {
  final String uuid;
  final String name;
  final String poster;

  BrieflyHotel({required this.uuid, required this.name, required this.poster});

  factory BrieflyHotel.fromJson(Map<String, dynamic> json) =>
      _$BrieflyHotelFromJson(json);

  Map<String, dynamic> toJson() => _$BrieflyHotelToJson(this);
}
