import 'package:advice_app_bloc_sample/controllers/services/advice_model.dart';

abstract class AdviceState {}

class AdviceInitialState extends AdviceState {}

class AdviceLoadingState extends AdviceState {}

class AdviceLoadedState extends AdviceState {
  final AdviceModel advice;

  AdviceLoadedState({required this.advice});
}

class AdviceErrorState extends AdviceState {
  final String message;

  AdviceErrorState({required this.message});
}
