import 'package:bloc_test/bloc_test.dart';
import 'package:dars90_amaliyot/ui/weather/bloc/weather_bloc.dart';
import 'package:dars90_amaliyot/ui/weather/data/models/weather_model.dart';
import 'package:dars90_amaliyot/ui/weather/data/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherReposiroy extends Mock implements WeatherRepository {}

void main() {
  group(WeatherBloc, () {
    late WeatherBloc weatherBloc;
    late MockWeatherReposiroy weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherReposiroy();
      weatherBloc = WeatherBloc(weatherRepository: weatherRepository);
    });

    test('Ob havoni boshlang\'ich holati = InitialWeather', () {
      expect(weatherBloc.state, const WeatherState.initial());
    });

    blocTest(
      "Ob havoni muvaffaqiyatli kelishini test qilish",
      build: () {
        return weatherBloc;
      },
      act: (bloc) async {
        when(() => weatherRepository.getWeather("Tashkent"))
            .thenAnswer((_) async {
          return const WeatherModel(
            city: "Tashkent",
            main: "Clear",
            temperature: 38,
          );
        });
        bloc.add(const WeatherEvent.getWeather("Tashkent"));
        // return await weatherRepository.getWeather("Tashkent");
      },
      expect: () {
        return [
          const WeatherState.loading(),
          // const WeatherState.error("Xato")
          const WeatherState.loaded(
            WeatherModel(
              city: "Tashkent",
              main: "Clear",
              temperature: 38,
            ),
          ),
        ];
      },
    );

    blocTest(
      "Ob havoda error kelishini test qilish",
      build: () {
        return weatherBloc;
      },
      act: (bloc) async {
        when(() => weatherRepository.getWeather("Tashkent")).thenThrow("Xato");
        bloc.add(const WeatherEvent.getWeather("Tashkent"));
      },
      expect: () {
        return [const WeatherState.loading(), const WeatherState.error("Xato")];
      },
    );
  });
}
