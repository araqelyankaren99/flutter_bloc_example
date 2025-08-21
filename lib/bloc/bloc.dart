import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/event.dart';
import 'package:flutter_bloc_example/bloc/state.dart';
import 'package:flutter_bloc_example/model/calendar_type.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc()
      : super(MyState(
    firstCount: 0,
    secondCount: 0,
    text: '',
    calendarType: CalendarType.day,
    isChecked: false,
    sliderValue: 0.0,
  )) {
    on<IncrementFirstCounterEvent>(_onUpdateFirstCounterEventToState);
    on<IncrementSecondCounterEvent>(_onIncrementSecondCounterEventToState);
    on<TextFieldValueChangedEvent>(_onTextFieldValueChangedEventToState);
    on<UpdateCalendarTypeEvent>(_onUpdateCalendarTypeEventToState);
    on<UpdateCheckboxValueEvent>(_onUpdateCheckboxValueEventToState);
    on<UpdateSliderValueEvent>(_onUpdateSliderValueEventToState);
  }

  Future<void> _onUpdateFirstCounterEventToState(
      IncrementFirstCounterEvent event,
      Emitter<MyState> emit,
      ) async {
    emit(state.copyWith(firstCount: state.firstCount + 1));
  }

  Future<void> _onIncrementSecondCounterEventToState(
      IncrementSecondCounterEvent event,
      Emitter<MyState> emit,
      ) async {
    emit(state.copyWith(secondCount: state.secondCount + 1));
  }

  Future<void> _onTextFieldValueChangedEventToState(
      TextFieldValueChangedEvent event,
      Emitter<MyState> emit,
      ) async {
    emit(state.copyWith(text: event.text));
  }

  Future<void> _onUpdateCalendarTypeEventToState(
      UpdateCalendarTypeEvent event,
      Emitter<MyState> emit,
      ) async {
    emit(state.copyWith(calendarType: event.calendarType));
  }

  Future<void> _onUpdateCheckboxValueEventToState(
      UpdateCheckboxValueEvent event,
      Emitter<MyState> emit,
      ) async {
    emit(state.copyWith(isChecked: event.isChecked));
  }

  Future<void> _onUpdateSliderValueEventToState(
      UpdateSliderValueEvent event,
      Emitter<MyState> emit,
      ) async {
    emit(state.copyWith(sliderValue: event.value));
  }
}
