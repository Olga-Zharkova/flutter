// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'description_hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescriptionHotel _$DescriptionHotelFromJson(Map<String, dynamic> json) =>
    DescriptionHotel(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      address: AddressHotel.fromJson(json['address'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      services:
          ServicesHotel.fromJson(json['services'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DescriptionHotelToJson(DescriptionHotel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };
