import 'package:dars90_amaliyot/ui/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();

  void _searchWeather() {
    context.read<WeatherBloc>().add(
          WeatherEvent.getWeather(
            _cityController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ob havo dasturi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Shahar nomi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _searchWeather,
                child: const Text('Izlash'),
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return const Center(
                      child: Text("Shahar nomini kiriting"),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loaded: (weather) {
                    return Column(
                      children: [
                        Text(
                          '${weather.temperature}°C',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          weather.city,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          weather.main,
                          style: const TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    );
                  },
                  error: (message) {
                    return Center(
                      child: Text(message),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
