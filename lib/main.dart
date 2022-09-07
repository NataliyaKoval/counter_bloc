import 'package:counter_bloc/logic/cubit/counter_cubit.dart';
import 'package:counter_bloc/presentation/screens/home_screen.dart';
import 'package:counter_bloc/presentation/screens/second_screen.dart';
import 'package:counter_bloc/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(title: 'Home', color: Colors.blue),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(title: 'Second', color: Colors.red),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(title: 'Third', color: Colors.yellow),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
