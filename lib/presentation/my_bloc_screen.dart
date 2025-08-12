import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/bloc.dart';
import 'package:flutter_bloc_example/bloc/event.dart';
import 'package:flutter_bloc_example/bloc/state.dart';
import 'package:flutter_bloc_example/model/calendar_type.dart';

class MyBlocScreen extends StatefulWidget {
  const MyBlocScreen({super.key});

  @override
  State<MyBlocScreen> createState() => _MyBlocScreenState();
}

class _MyBlocScreenState extends State<MyBlocScreen> {
  final _myBloc = MyBloc();

  @override
  void dispose() {
    _myBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyBloc>(
      create: (_) => _myBloc,
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _FirstCounterValueWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _FirstCounterIncrementButtonWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _SecondCounterValueWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _SecondCounterIncrementButtonWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _TextFieldWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _TextFieldValueWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _CalendarTypeSelectorWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _CheckboxWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _SliderWidget(),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    _SliderValueWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FirstCounterValueWidget extends StatelessWidget {
  const _FirstCounterValueWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyBloc>();
    debugPrint('Call log First Counter Value Widget build');
    return BlocBuilder<MyBloc, MyState>(
      buildWhen: (MyState prev, MyState current) {
        if (prev is! FirstCounterUpdatedState && current is! FirstCounterUpdatedState) {
          return false;
        }
        if (prev is! FirstCounterUpdatedState && current is FirstCounterUpdatedState) {
          return true;
        }
        if (prev is FirstCounterUpdatedState && current is! FirstCounterUpdatedState) {
          return false;
        }
        final prevValue = (prev as FirstCounterUpdatedState).count;
        final currentValue = (current as FirstCounterUpdatedState).count;
        return prevValue != currentValue;
      },
      builder: (BuildContext context, MyState state) {
        debugPrint('Call log FirstCounter Builder Widget value update ${bloc.counterOne}');
        return Text('First Counter Is ${bloc.counterOne}');
        // FirstCounterUpdatedState
      },
    );
  }
}

class _FirstCounterIncrementButtonWidget extends StatelessWidget {
  const _FirstCounterIncrementButtonWidget();

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log First Counter Button Build');
    return ElevatedButton(
      onPressed: () => _onTap(context),
      child: Text('Increment First Counter'),
    );
  }

  void _onTap(BuildContext context) {
    context.read<MyBloc>().add(IncrementFirstCounterEvent());
  }
}

class _SecondCounterValueWidget extends StatelessWidget {
  const _SecondCounterValueWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyBloc>();
    debugPrint('Call log Second Counter Value Widget build');
    return BlocBuilder<MyBloc, MyState>(
      buildWhen: (MyState prev, MyState current) {
        if (prev is! SecondCounterUpdatedState && current is! SecondCounterUpdatedState) {
          return false;
        }
        if (prev is! SecondCounterUpdatedState && current is SecondCounterUpdatedState) {
          return true;
        }
        if (prev is SecondCounterUpdatedState && current is! SecondCounterUpdatedState) {
          return false;
        }
        final prevValue = (prev as SecondCounterUpdatedState).count;
        final currentValue = (current as SecondCounterUpdatedState).count;
        return prevValue != currentValue;
      },
      builder: (BuildContext context, MyState state) {
        debugPrint('Call log SecondCounter Builder Widget value update ${bloc.counterOne}');
        return Text('Second Counter Is ${bloc.counterOne}');
        // FirstCounterUpdatedState
      },
    );
  }
}

class _SecondCounterIncrementButtonWidget extends StatelessWidget {
  const _SecondCounterIncrementButtonWidget();

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Second Counter Button Build');
    return ElevatedButton(
      onPressed: () => _onTap(context),
      child: Text('Increment Second Counter'),
    );
  }

  void _onTap(BuildContext context) {
    context.read<MyBloc>().add(const IncrementSecondCounterEvent());
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget();

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Text Field Build');
    return TextField(
      onChanged: (value) => _onChanged(context, value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  void _onChanged(BuildContext context, String value) {
    context.read<MyBloc>().add(TextFieldValueChangedEvent(text: value));
  }
}

class _TextFieldValueWidget extends StatelessWidget {
  const _TextFieldValueWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyBloc>();
    debugPrint('Call log Text Field Value Widget build');
    return BlocBuilder<MyBloc, MyState>(
      buildWhen: (MyState prev, MyState current) {
        if (prev is! TextFieldValueChangedState && current is! TextFieldValueChangedState) {
          return false;
        }
        if (prev is! TextFieldValueChangedState && current is TextFieldValueChangedState) {
          return true;
        }
        if (prev is TextFieldValueChangedState && current is! TextFieldValueChangedState) {
          return false;
        }
        final prevValue = (prev as TextFieldValueChangedState).text;
        final currentValue = (current as TextFieldValueChangedState).text;
        return prevValue != currentValue;
      },
      builder: (BuildContext context, MyState state) {
        debugPrint('Call log TextField Builder Widget value update ${bloc.text}');
        return Text('Text Value Is ${bloc.text}');
      },
    );
  }
}

class _CalendarTypeSelectorWidget extends StatelessWidget {
  const _CalendarTypeSelectorWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyBloc>();
    debugPrint('Call log Calendar Type Value Widget build');
    return BlocBuilder<MyBloc, MyState>(
      buildWhen: (MyState prev, MyState current) {
        if (prev is! CalendarTypeUpdateState && current is! CalendarTypeUpdateState) {
          return false;
        }
        if (prev is! CalendarTypeUpdateState && current is CalendarTypeUpdateState) {
          return true;
        }
        if (prev is CalendarTypeUpdateState && current is! CalendarTypeUpdateState) {
          return false;
        }
        final prevValue = (prev as CalendarTypeUpdateState).calendarType;
        final currentValue = (current as CalendarTypeUpdateState).calendarType;
        return prevValue != currentValue;
      },
      builder: (context, state) {
        debugPrint('Call log CalendarType Selector Builder Widget value update ${bloc.calendarType}');
        return SegmentedButton<CalendarType>(
          style: SegmentedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.red,
            selectedForegroundColor: Colors.white,
            selectedBackgroundColor: Colors.green,
          ),
          segments: const <ButtonSegment<CalendarType>>[
            ButtonSegment<CalendarType>(
              value: CalendarType.day,
              label: Text('Day'),
              icon: Icon(Icons.calendar_view_day),
            ),
            ButtonSegment<CalendarType>(
              value: CalendarType.week,
              label: Text('Week'),
              icon: Icon(Icons.calendar_view_week),
            ),
            ButtonSegment<CalendarType>(
              value: CalendarType.month,
              label: Text('Month'),
              icon: Icon(Icons.calendar_view_month),
            ),
            ButtonSegment<CalendarType>(
              value: CalendarType.year,
              label: Text('Year'),
              icon: Icon(Icons.calendar_today),
            ),
          ],
          selected: <CalendarType>{bloc.calendarType},
          onSelectionChanged: (Set<CalendarType> newSelection) {
            context.read<MyBloc>().add(UpdateCalendarTypeEvent(calendarType: newSelection.first));
          },
        );
      },
    );
  }
}

class _CheckboxWidget extends StatelessWidget {
  const _CheckboxWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyBloc>();
    debugPrint('Call log Calendar Type Value Widget build');
    return BlocBuilder<MyBloc, MyState>(
      buildWhen: (MyState prev, MyState current) {
        if (prev is! CheckboxValueUpdatedState && current is! CheckboxValueUpdatedState) {
          return false;
        }
        if (prev is! CheckboxValueUpdatedState && current is CheckboxValueUpdatedState) {
          return true;
        }
        if (prev is CheckboxValueUpdatedState && current is! CheckboxValueUpdatedState) {
          return false;
        }
        final prevValue = (prev as CheckboxValueUpdatedState).isChecked;
        final currentValue = (current as CheckboxValueUpdatedState).isChecked;
        return prevValue != currentValue;
      },
      builder: (context, state) {
        debugPrint('Call log Checkbox Builder Widget value update ${bloc.isChecked}');
        return Checkbox(
          value: bloc.isChecked,
          onChanged: (bool? value) {
            if (value != null) {
              context.read<MyBloc>().add(
                UpdateCheckboxValueEvent(isChecked: value),
              );
            }
          },
        );
      },
    );
  }
}

class _SliderWidget extends StatelessWidget {
  const _SliderWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyBloc>();
    debugPrint('Call log Slider Value Widget build');
    return BlocBuilder<MyBloc, MyState>(
      buildWhen: (MyState prev, MyState current) {
        if (prev is! SliderValueUpdatedState && current is! SliderValueUpdatedState) {
          return false;
        }
        if (prev is! SliderValueUpdatedState && current is SliderValueUpdatedState) {
          return true;
        }
        if (prev is SliderValueUpdatedState && current is! SliderValueUpdatedState) {
          return false;
        }
        final prevValue = (prev as SliderValueUpdatedState).value;
        final currentValue = (current as SliderValueUpdatedState).value;
        return prevValue != currentValue;
      },
      builder: (context, state) {
        debugPrint('Call log Slider Builder Widget value update ${bloc.sliderValue}');
        return Slider(
          value: bloc.sliderValue,
          max: 100,
          onChanged: (double value) {
            context.read<MyBloc>().add(UpdateSliderValueEvent(value: value));
          },
        );
      },
    );
  }
}

class _SliderValueWidget extends StatelessWidget {
  const _SliderValueWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyBloc>();
    debugPrint('Call log Slider Value Widget build');
    return BlocBuilder<MyBloc, MyState>(
      builder: (context, state) {
        debugPrint('Call log SliderValue Widget Builder value update ${bloc.sliderValue}');
        return Text('Slider Value Is ${bloc.sliderValue}');
      },
      buildWhen: (prev, current) {
        if (prev is! SliderValueUpdatedState && current is! SliderValueUpdatedState) {
          return false;
        }
        if (prev is! SliderValueUpdatedState && current is SliderValueUpdatedState) {
          return true;
        }
        if (prev is SliderValueUpdatedState && current is! SliderValueUpdatedState) {
          return false;
        }
        final prevValue = (prev as SliderValueUpdatedState).value;
        final currentValue = (current as SliderValueUpdatedState).value;
        return prevValue != currentValue;
      },
    );
  }
}
