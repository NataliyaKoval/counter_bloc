import 'package:counter_bloc/constants/enums.dart';
import 'package:counter_bloc/logic/cubit/internet_cubit.dart';
import 'package:counter_bloc/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
              if(state is InternetConnected && state.connectionType == ConnectionType.Wifi) {
                return const Text('Wifi');
              } else if(state is InternetConnected && state.connectionType == ConnectionType.Mobile) {
                return const Text('Mobile');
              } else if(state is InternetDisconnected) {
                return const Text('Disconnected');
              }
              return const CircularProgressIndicator();
            }),
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) => {
                if (state.wasIncremented == true)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ))
                  }
                else if (state.wasIncremented == false)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    )
                  }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () =>
            //           {BlocProvider.of<CounterCubit>(context).decrement()},
            //       tooltip: 'Decrement',
            //       child: const Icon(Icons.remove),
            //     ),
            //     FloatingActionButton(
            //       onPressed: () =>
            //           {BlocProvider.of<CounterCubit>(context).increment()},
            //       tooltip: 'Increment',
            //       child: const Icon(Icons.add),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              color: widget.color,
              child: const Text('Co to Second Screen'),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              color: widget.color,
              child: const Text('Co to Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
