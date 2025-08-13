import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/event.dart';
import 'package:flutter_bloc_example/bloc/state.dart';
import 'package:flutter_bloc_example/model/calendar_type.dart';

class MyBloc extends Bloc<MyEvent,MyState> {
  MyBloc() : super(const MyStateInitial()){
    on<IncrementFirstCounterEvent>(_onUpdateFirstCounterEventToState);
    on<IncrementSecondCounterEvent>(_onIncrementSecondCounterEventToState);
    on<TextFieldValueChangedEvent>(_onTextFieldValueChangedEventToState);
    on<UpdateCalendarTypeEvent>(_onUpdateCalendarTypeEventToState);
    on<UpdateCheckboxValueEvent>(_onUpdateCheckboxValueEventToState);
    on<UpdateSliderValueEvent>(_onUpdateSliderValueEventToState);
  }

  String get counterOne => _counterOne.toString();
  int _counterOne = 0;

  String get counterTwo => _counterTwo.toString();
  int _counterTwo = 0;

  String get text => _text;
  String _text = '';

  CalendarType get calendarType => _calendarType;
  CalendarType _calendarType = CalendarType.day;

  bool get isChecked => _isChecked;
  bool _isChecked = false;

  double get sliderValue => _sliderValue;
  double _sliderValue = 0.0;

  Future<void> _onUpdateFirstCounterEventToState(
      IncrementFirstCounterEvent event,
      Emitter<MyState> emit,
      ) async{
    _counterOne = _counterOne +1;
    emit(FirstCounterUpdatedState(count: _counterOne.toString()));
  }

  Future<void> _onIncrementSecondCounterEventToState(
      IncrementSecondCounterEvent event,
      Emitter<MyState> emit,
      ) async{
    _counterTwo = _counterTwo +1;
    emit(SecondCounterUpdatedState(count: _counterTwo.toString()));
  }

  Future<void> _onTextFieldValueChangedEventToState(
      TextFieldValueChangedEvent event,
      Emitter<MyState> emit,
      ) async{
    _text = event.text;
    emit(TextFieldValueChangedState(text: _text));
  }

  Future<void> _onUpdateCalendarTypeEventToState(
      UpdateCalendarTypeEvent event,
      Emitter<MyState> emit,
      ) async{
    _calendarType = event.calendarType;
    emit(CalendarTypeUpdateState(calendarType: _calendarType));
  }

  Future<void> _onUpdateCheckboxValueEventToState(
      UpdateCheckboxValueEvent event,
      Emitter<MyState> emit,
      ) async{
    _isChecked = event.isChecked;
    emit(CheckboxValueUpdatedState(isChecked: _isChecked));
  }

  Future<void> _onUpdateSliderValueEventToState(
      UpdateSliderValueEvent event,
      Emitter<MyState> emit,
      ) async {
    _sliderValue = event.value;
    emit(SliderValueUpdatedState(value: _sliderValue));
  }
}