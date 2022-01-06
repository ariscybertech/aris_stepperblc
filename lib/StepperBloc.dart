import 'package:bloc/bloc.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  void onContinue() {
    dispatch(ContinueEvent());
  }

  void onBack() {
    dispatch(BackEvent());
  }

  void onSaveRate(double rate, double volume) {
    dispatch(SaveRateEvent(rate: rate, volume: volume));
  }

  @override
  StepperState get initialState => StepperState.initial();

  @override
  Stream<StepperState> mapEventToState(StepperState state, StepperEvent event) async* {
    final _currentState = currentState;
    if (event is ContinueEvent) {
      yield StepperState(currentStep: _currentState.currentStep + 1, rate: _currentState.rate, volume: _currentState.volume);
    } else if (event is BackEvent) {
      yield StepperState(currentStep: _currentState.currentStep - 1, rate: _currentState.rate, volume: _currentState.volume);
    } else if (event is SaveRateEvent) {
      yield StepperState(currentStep: _currentState.currentStep, rate: event.rate, volume: event.volume);
    }
  }
}

abstract class StepperEvent {
  
}

class ContinueEvent extends StepperEvent {}

class BackEvent extends StepperEvent {}

class SaveRateEvent extends StepperEvent  {
  final double rate;
  final double volume;

  SaveRateEvent({this.rate, this.volume});
}

class StepperState {
  final int currentStep;
  final double rate;
  final double volume;

  const StepperState({this.currentStep, this.rate, this.volume});

  factory StepperState.initial() => StepperState(currentStep: 0);
}

