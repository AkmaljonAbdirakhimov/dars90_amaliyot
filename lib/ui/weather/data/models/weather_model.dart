import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @JsonKey(name: "name") required String city,
    @JsonKey(name: "weather", fromJson: mainFromJson) required String main,
    @JsonKey(name: "main", fromJson: temperatureFromJson)
    required int temperature,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, Object?> json) =>
      _$WeatherModelFromJson(json);
}

String mainFromJson(List weather) {
  return weather[0]['main'];
}

int temperatureFromJson(Map main) {
  return main['temp'].toInt();
}
