import 'package:advice_app_bloc_sample/controllers/bloc/advice_event.dart';
import 'package:advice_app_bloc_sample/controllers/bloc/advice_state.dart';
import 'package:advice_app_bloc_sample/controllers/services/api_service.dart';
import 'package:bloc/bloc.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitialState()) {
    on<FetchAdviceEvent>((event, emit) async {
      emit(AdviceLoadingState());
      try {
        final advice = await fetchAdvice();
        emit(AdviceLoadedState(advice: advice));
      } catch (e) {
        emit(
          AdviceErrorState(message: 'Something went wrong! Please try again.'),
        );
      }
    });
  }
}
