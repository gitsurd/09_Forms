// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) {
  return HotelPreview(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    poster: json['poster'] as String,
  );
}

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

HotelDetal _$HotelDetalFromJson(Map<String, dynamic> json) {
  return HotelDetal(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    poster: json['poster'] as String,
    address: json['address'] == null
        ? null
        : HotelAdress.fromJson(json['address'] as Map<String, dynamic>),
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    price: (json['price'] as num)?.toDouble(),
    rating: (json['rating'] as num)?.toDouble(),
    services: json['services'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$HotelDetalToJson(HotelDetal instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address?.toJson(),
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };

HotelAdress _$HotelAdressFromJson(Map<String, dynamic> json) {
  return HotelAdress(
    country: json['country'] as String,
    city: json['city'] as String,
    street: json['street'] as String,
    zip_code: json['zip_code'] as int,
    coords: json['coords'] == null
        ? null
        : HotelCoords.fromJson(json['coords'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HotelAdressToJson(HotelAdress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zip_code,
      'coords': instance.coords?.toJson(),
    };

HotelCoords _$HotelCoordsFromJson(Map<String, dynamic> json) {
  return HotelCoords(
    lan: (json['lan'] as num)?.toDouble(),
    lat: (json['lat'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HotelCoordsToJson(HotelCoords instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

Hotelservices _$HotelservicesFromJson(Map<String, dynamic> json) {
  return Hotelservices(
    services: json['services'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$HotelservicesToJson(Hotelservices instance) =>
    <String, dynamic>{
      'services': instance.services,
    };
