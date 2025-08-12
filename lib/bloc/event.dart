import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/model/calendar_type.dart';

abstract class MyEvent extends Equatable {
  const MyEvent();
  @override
  List<Object?> get props => [];
}

class IncrementFirstCounterEvent extends MyEvent {
  const IncrementFirstCounterEvent();
}

class IncrementSecondCounterEvent extends MyEvent {
  const IncrementSecondCounterEvent();
}

class TextFieldValueChangedEvent extends MyEvent {
  const TextFieldValueChangedEvent({required this.text});

  final String text;

  @override
  List<Object?> get props => [text];
}

class UpdateCalendarTypeEvent extends MyEvent {
  const UpdateCalendarTypeEvent({required this.calendarType});

  final CalendarType calendarType;

  @override
  List<Object?> get props => [calendarType];
}

class UpdateCheckboxValueEvent extends MyEvent {
  const UpdateCheckboxValueEvent({required this.isChecked});

  final bool isChecked;

  @override
  List<Object?> get props => [isChecked];
}

class UpdateSliderValueEvent extends MyEvent {
  const UpdateSliderValueEvent({required this.value});

  final double value;

  @override
  List<Object?> get props => [value];
}