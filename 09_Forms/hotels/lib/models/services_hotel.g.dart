// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesHotel _$ServicesHotelFromJson(Map<String, dynamic> json) =>
    ServicesHotel(
      free: (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      paid: (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServicesHotelToJson(ServicesHotel instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
