import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/model/calendar_type.dart';

abstract class MyState extends Equatable {
  const MyState();
  @override
  List<Object?> get props => [];
}

class MyStateInitial extends MyState {
  const MyStateInitial();
}

class FirstCounterUpdatedState extends MyState {
  const FirstCounterUpdatedState({required this.count});

  final String count;

  @override
  List<Object?> get props => [count];
}

class SecondCounterUpdatedState extends MyState {
  const SecondCounterUpdatedState({required this.count});

  final String count;

  @override
  List<Object?> get props => [count];
}

class TextFieldValueChangedState extends MyState {
  const TextFieldValueChangedState({required this.text});

  final String text;

  @override
  List<Object?> get props => [text];
}

class CalendarTypeUpdateState extends MyState {
  const CalendarTypeUpdateState({required this.calendarType});

  final CalendarType calendarType;

  @override
  List<Object?> get props => [calendarType];
}

class CheckboxValueUpdatedState extends MyState {
  const CheckboxValueUpdatedState({required this.isChecked});

  final bool isChecked;

  @override
  List<Object?> get props => [isChecked];
}

class SliderValueUpdatedState extends MyState {
  const SliderValueUpdatedState({required this.value});

  final double value;

  @override
  List<Object?> get props => [value];
}