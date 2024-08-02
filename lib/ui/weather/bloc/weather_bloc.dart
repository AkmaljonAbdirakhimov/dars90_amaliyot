import 'package:bloc/bloc.dart';
import 'package:dars90_amaliyot/ui/weather/data/models/weather_model.dart';
import 'package:dars90_amaliyot/ui/weather/data/repositories/weather_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.weatherRepository,
  }) : super(const _InitialWeather()) {
    on<_GetWeather>(_getWeather);
  }

  final WeatherRepository weatherRepository;

  void _getWeather(_GetWeather event, emit) async {
    emit(const _LoadingWeather());

    try {
      final weather = await weatherRepository.getWeather(event.city);
      emit(_LoadedWeather(weather));
    } catch (e) {
      emit(_ErrorWeather(e.toString()));
    }
  }
}
