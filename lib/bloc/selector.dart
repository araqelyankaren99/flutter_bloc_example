import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/bloc.dart';
import 'package:flutter_bloc_example/model/calendar_type.dart';

abstract class MyBlocSelector {
  MyBlocSelector._();

  static String counterOneSelector(BuildContext context) {
   return context.select((MyBloc myBloc) => myBloc.counterOne);
  }

  static String counterTwoSelector(BuildContext context) {
   return context.select((MyBloc myBloc) => myBloc.counterTwo);
  }

  static String textSelector(BuildContext context) {
   return context.select((MyBloc myBloc) => myBloc.text);
  }

  static CalendarType calendarTypeSelector(BuildContext context) {
    return context.select((MyBloc myBloc) => myBloc.calendarType);
  }

  static bool checkedSelector(BuildContext context) {
    return context.select((MyBloc myBloc) => myBloc.isChecked);
  }

    static double sliderSelector(BuildContext context) {
    return context.select((MyBloc myBloc) => myBloc.sliderValue);
  }
}