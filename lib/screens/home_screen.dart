import 'package:advice_app_bloc_sample/controllers/bloc/advice_bloc.dart';
import 'package:advice_app_bloc_sample/controllers/bloc/advice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Advices', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocBuilder<AdviceBloc, AdviceState>(
        builder: (context, state) {
          if (state is AdviceInitialState) {
            return Text(
              'Press the Button to get Advice',
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          } else if (state is AdviceLoadingState) {
            return CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 1.5,
            );
          } else if (state is AdviceLoadedState) {
            return Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text('${state.advice}'),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Get Advice')),
                ],
              ),
            );
          } else if (state is AdviceErrorState) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
