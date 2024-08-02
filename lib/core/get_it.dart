import 'package:dars90_amaliyot/ui/counter/bloc/counter_bloc.dart';
import 'package:dars90_amaliyot/ui/weather/bloc/weather_bloc.dart';
import 'package:dars90_amaliyot/ui/weather/data/repositories/weather_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void dependencyInit() {
  getIt.registerLazySingleton(() => WeatherRepository());

  getIt.registerLazySingleton(
    () => WeatherBloc(weatherRepository: getIt.get<WeatherRepository>()),
  );
  getIt.registerLazySingleton(
    () => CounterBloc(),
  );
}
