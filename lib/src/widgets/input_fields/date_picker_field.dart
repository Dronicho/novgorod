import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'types.dart';

class DatePickerField<B extends BlocBase<S>, S> extends StatefulWidget {
  final InitValueGetter<S, DateTime> valueGetter;
  final String title;
  final StateValueChanged<S, DateTime> onChanged;
  final BlocBuilderCondition<S>? buildWhen;

  DatePickerField(
      {Key? key,
      this.buildWhen,
      required this.valueGetter,
      required this.title,
      required this.onChanged})
      : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState<B, S>();
}

class _DatePickerFieldState<B extends BlocBase<S>, S>
    extends State<DatePickerField<B, S>> {
  final _format = DateFormat('dd.MM.yyyy');
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    setState(() {
      _date = widget.valueGetter(context.read<B>().state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: widget.buildWhen ??
          (previous, current) =>
              widget.valueGetter(previous) != widget.valueGetter(current),
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.title),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black45),
                borderRadius: BorderRadius.circular(8)),
            child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    final res = await showDatePicker(
                        context: context,
                        initialDate: _date,
                        firstDate: _date.subtract(Duration(days: 365 * 15)),
                        lastDate: _date.add(Duration(days: 365 * 15)));
                    if (res != null) {
                      widget.onChanged(state, res);
                      setState(() {
                        _date = res;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Text(_format.format(_date)),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
