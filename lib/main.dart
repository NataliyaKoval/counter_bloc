import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_bloc/logic/cubit/counter_cubit.dart';
import 'package:counter_bloc/logic/cubit/internet_cubit.dart';
import 'package:counter_bloc/presentation/router/app_router.dart';
import 'package:counter_bloc/presentation/screens/home_screen.dart';
import 'package:counter_bloc/presentation/screens/second_screen.dart';
import 'package:counter_bloc/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(connectivity: Connectivity(), appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({Key? key, required this.connectivity, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit(internetCubit: context.read()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
