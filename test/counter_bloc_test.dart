import 'package:bloc_test/bloc_test.dart';
import 'package:dars90_amaliyot/ui/counter/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CounterBloc, () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    tearDown(() {
      counterBloc.close();
    });

    test("Initial State", () {
      expect(counterBloc.state, InitialCounter());
    });

    blocTest(
      "INCREMENT 1",
      build: () {
        return counterBloc;
      },
      act: (bloc) {
        bloc.add(IncrementCounter());
      },
      expect: () {
        return [
          LoadedCounter(1),
        ];
      },
    );

    blocTest(
      "DECREMENT -1",
      build: () {
        return counterBloc;
      },
      act: (bloc) {
        bloc.add(DecrementCounter());
      },
      expect: () {
        return [
          LoadedCounter(-1),
        ];
      },
    );

    blocTest(
      "2x INCREMENT 1x DECREMENT",
      build: () {
        return counterBloc;
      },
      act: (bloc) {
        bloc.add(IncrementCounter());
        bloc.add(IncrementCounter());
        bloc.add(DecrementCounter());
      },
      expect: () {
        return [
          LoadedCounter(1),
          LoadedCounter(2),
          LoadedCounter(1),
        ];
      },
    );
  });
}
