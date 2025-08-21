import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/model/calendar_type.dart';

class MyState extends Equatable {
  const MyState({
    required this.firstCount,
    required this.secondCount,
    required this.text,
    required this.calendarType,
    required this.isChecked,
    required this.sliderValue,
  });

  final int firstCount;
  final int secondCount;
  final String text;
  final CalendarType calendarType;
  final bool isChecked;
  final double sliderValue;


  MyState copyWith({
    int? firstCount,
    int? secondCount,
    String? text,
    CalendarType? calendarType,
    bool? isChecked,
    double? sliderValue,
  }) {
    return MyState(
        firstCount: firstCount ?? this.firstCount,
        secondCount: secondCount ?? this.secondCount,
        text: text ?? this.text,
        calendarType: calendarType ?? this.calendarType,
        isChecked: isChecked ?? this.isChecked,
        sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object?> get props => [
    firstCount,
    secondCount,
    text,
    calendarType,
    isChecked,
    sliderValue,
  ];
}