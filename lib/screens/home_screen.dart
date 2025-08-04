import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advice_app_bloc_sample/controllers/bloc/advice_bloc.dart';
import 'package:advice_app_bloc_sample/controllers/bloc/advice_event.dart';
import 'package:advice_app_bloc_sample/controllers/bloc/advice_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 138, 138),
      appBar: AppBar(
        title: const Text(
          'Advices',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AdviceBloc, AdviceState>(
                builder: (context, state) {
                  if (state is AdviceInitialState) {
                    return const Text(
                      'Press the button to get advice',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    );
                  } else if (state is AdviceLoadingState) {
                    return const CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 1.5,
                    );
                  } else if (state is AdviceLoadedState) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            const Color.fromARGB(255, 111, 111, 111),
                            Colors.black,
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                      child: Text(
                        state.advice.advice,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state is AdviceErrorState) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  context.read<AdviceBloc>().add(FetchAdviceEvent());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Get Advice',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
