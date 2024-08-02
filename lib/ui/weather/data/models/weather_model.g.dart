// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      city: json['name'] as String,
      main: mainFromJson(json['weather'] as List),
      temperature: temperatureFromJson(json['main'] as Map),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'name': instance.city,
      'weather': instance.main,
      'main': instance.temperature,
    };
