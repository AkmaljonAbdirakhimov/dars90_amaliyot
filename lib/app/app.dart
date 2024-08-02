import 'package:dars90_amaliyot/core/get_it.dart';
import 'package:dars90_amaliyot/ui/counter/bloc/counter_bloc.dart';
import 'package:dars90_amaliyot/ui/counter/screen/counter_screen.dart';
import 'package:dars90_amaliyot/ui/weather/bloc/weather_bloc.dart';
import 'package:dars90_amaliyot/ui/weather/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt.get<WeatherBloc>(),
        ),
        BlocProvider.value(
          value: getIt.get<CounterBloc>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
    );
  }
}
