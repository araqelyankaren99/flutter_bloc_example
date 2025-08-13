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

class _FirstCounterValueWidget extends StatefulWidget {
  const _FirstCounterValueWidget();

  @override
  State<_FirstCounterValueWidget> createState() => _FirstCounterValueWidgetState();
}

class _FirstCounterValueWidgetState extends State<_FirstCounterValueWidget> {
  late String _firstCounter;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MyBloc>();
    _firstCounter = bloc.counterOne;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log First Counter update $_firstCounter');
    return BlocListener<MyBloc,MyState>(
      listener: _listener,
      child: Text('First Counter Is $_firstCounter'),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is FirstCounterUpdatedState) {
      _firstCounter = state.count;
      setState(() {});
    }
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

class _SecondCounterValueWidget extends StatefulWidget {
  const _SecondCounterValueWidget();

  @override
  State<_SecondCounterValueWidget> createState() => _SecondCounterValueWidgetState();
}

class _SecondCounterValueWidgetState extends State<_SecondCounterValueWidget> {
  late String _secondCounter;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MyBloc>();
    _secondCounter = bloc.counterTwo;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Second Counter update $_secondCounter');
    return BlocListener<MyBloc,MyState>(
      listener: _listener,
      child: Text('Second Counter Is $_secondCounter'),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is SecondCounterUpdatedState) {
      _secondCounter = state.count;
      setState(() {});
    }
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
      decoration: const InputDecoration(
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

class _TextFieldValueWidget extends StatefulWidget {
  const _TextFieldValueWidget();

  @override
  State<_TextFieldValueWidget> createState() => _TextFieldValueWidgetState();
}

class _TextFieldValueWidgetState extends State<_TextFieldValueWidget> {
  late String _text;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MyBloc>();
    _text = bloc.text;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Text Field value update $_text');
    return BlocListener<MyBloc,MyState>(
      listener: _listener,
      child: Text('Text Value Is $_text'),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is TextFieldValueChangedState) {
      _text = state.text;
      setState(() {});
    }
  }
}

class _CalendarTypeSelectorWidget extends StatefulWidget {
  const _CalendarTypeSelectorWidget();

  @override
  State<_CalendarTypeSelectorWidget> createState() => _CalendarTypeSelectorWidgetState();
}

class _CalendarTypeSelectorWidgetState extends State<_CalendarTypeSelectorWidget> {
  late CalendarType _calendarType;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MyBloc>();
    _calendarType = bloc.calendarType;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Calendar Type value update $_calendarType');
    return BlocListener<MyBloc,MyState>(
      listener: _listener,
      child: SegmentedButton<CalendarType>(
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
        selected: <CalendarType>{_calendarType},
        onSelectionChanged: (Set<CalendarType> newSelection) {
          context.read<MyBloc>().add(
            UpdateCalendarTypeEvent(calendarType: newSelection.first),
          );
        },
      ),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is CalendarTypeUpdateState) {
      _calendarType = state.calendarType;
      setState(() {});
    }
  }
}

class _CheckboxWidget extends StatefulWidget {
  const _CheckboxWidget();

  @override
  State<_CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<_CheckboxWidget> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MyBloc>();
    _isChecked = bloc.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log Checkbox value update $_isChecked');
    return BlocListener<MyBloc,MyState>(
      listener: _listener,
      child: Checkbox(
        value: _isChecked,
        onChanged: (bool? value) {
          if (value != null) {
            context.read<MyBloc>().add(
              UpdateCheckboxValueEvent(isChecked: value),
            );
          }
        },
      ),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is CheckboxValueUpdatedState) {
      _isChecked = state.isChecked;
      setState(() {});
    }
  }
}

class _SliderWidget extends StatefulWidget {
  const _SliderWidget();

  @override
  State<_SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<_SliderWidget> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MyBloc>();
    _sliderValue = bloc.sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log SliderWidget value update $_sliderValue');
    return BlocListener<MyBloc,MyState>(
      listener: _listener,
      child: Slider(
        value: _sliderValue,
        max: 100,
        onChanged: (double value) {
          context.read<MyBloc>().add(UpdateSliderValueEvent(value: value));
        },
      ),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is SliderValueUpdatedState) {
      _sliderValue = state.value;
      setState(() {});
    }
  }
}

class _SliderValueWidget extends StatefulWidget {
  const _SliderValueWidget();

  @override
  State<_SliderValueWidget> createState() => _SliderValueWidgetState();
}

class _SliderValueWidgetState extends State<_SliderValueWidget> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MyBloc>();
    _sliderValue = bloc.sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Call log SliderValue Widget value update $_sliderValue');
    return BlocListener<MyBloc,MyState>(
      listener: _listener,
      child: Text('Slider Value Is $_sliderValue'),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is SliderValueUpdatedState) {
      _sliderValue = state.value;
      setState(() {});
    }
  }
}