part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _InitialWeather;
  const factory WeatherState.loading() = _LoadingWeather;
  const factory WeatherState.loaded(WeatherModel weather) = _LoadedWeather;
  const factory WeatherState.error(String message) = _ErrorWeather;
}
