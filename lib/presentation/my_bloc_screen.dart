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
    debugPrint('Call log First Counter Build');
    return BlocBuilder<MyBloc,MyState>(
      buildWhen: (MyState previous, MyState current){
        return previous.firstCount != current.firstCount;
      },
      builder: (BuildContext context,MyState state) {
        final firstCounter = state.firstCount;
        debugPrint('Call log First Counter Builder $firstCounter');
        return Text('First Counter Is $firstCounter');
      }
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
    debugPrint('Call log First Counter Build');
    return BlocBuilder<MyBloc,MyState>(
        buildWhen: (MyState previous, MyState current){
          return previous.secondCount != current.secondCount;
        },
      builder: (BuildContext context,MyState state) {
        final secondCounter = state.secondCount;
        debugPrint('Call log Second Counter Builder $secondCounter');
        return Text('Second Counter Is $secondCounter');
      }
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
      onChanged: (value) => _onChanged(context,value),
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
          disabledBorder :OutlineInputBorder(
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
    debugPrint('Call log Text Field Value Build');
    return BlocBuilder<MyBloc,MyState>(
        buildWhen: (MyState previous, MyState current){
          return previous.text != current.text;
        },
        builder: (BuildContext context,MyState state) {
          final text = state.text;
          debugPrint('Call log TextField Builder $text');
          return Text('Text Value Is $text');
        }
    );
  }
}

class _CalendarTypeSelectorWidget extends StatelessWidget {
  const _CalendarTypeSelectorWidget();

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Calendar Type Value Build');
    return BlocBuilder<MyBloc,MyState>(
        buildWhen: (MyState previous, MyState current){
          return previous.calendarType != current.calendarType;
        },
      builder: (BuildContext context,MyState state) {
        final calendarType = state.calendarType;
        debugPrint('Call log Calendar Type Builder $calendarType');
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
          selected: <CalendarType>{calendarType},
          onSelectionChanged: (Set<CalendarType> newSelection) {
            context.read<MyBloc>().add(UpdateCalendarTypeEvent(calendarType: newSelection.first));
          },
        );
      }
    );
  }
}

class _CheckboxWidget extends StatelessWidget {
  const _CheckboxWidget();

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Checkbox Value Build');
    return BlocBuilder<MyBloc,MyState>(
        buildWhen: (MyState previous, MyState current){
          return previous.isChecked != current.isChecked;
        },
      builder: (BuildContext context , MyState state) {
        final isChecked = state.isChecked;
        debugPrint('Call log Checkbox Builder $isChecked');
        return Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            if(value != null) {
              context.read<MyBloc>().add(UpdateCheckboxValueEvent(isChecked: value));
            }
          },
        );
      }
    );
  }
}

class _SliderWidget extends StatelessWidget {
  const _SliderWidget();

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Slider Value Build');
    return BlocBuilder<MyBloc,MyState>(
        buildWhen: (MyState previous, MyState current){
          return previous.sliderValue != current.sliderValue;
        },
      builder: (BuildContext context, MyState state) {
        final sliderValue = state.sliderValue;
        debugPrint('Call log Slider Builder $sliderValue');
        return Slider(
          value: sliderValue,
          max: 100,
          onChanged: (double value) {
            context.read<MyBloc>().add(UpdateSliderValueEvent(value: value));
          },
        );
      }
    );
  }
}

class _SliderValueWidget extends StatelessWidget {
  const _SliderValueWidget();

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log SliderValue Widget Value Build');
    return BlocBuilder<MyBloc,MyState>(
        buildWhen: (MyState previous, MyState current){
          return previous.sliderValue != current.sliderValue;
        },
      builder: (BuildContext context,MyState state) {
        final sliderValue = state.sliderValue;
        debugPrint('Call log SliderValue Widget Builder $sliderValue');
        return Text('Slider Value Is $sliderValue');
      }
    );
  }
}
