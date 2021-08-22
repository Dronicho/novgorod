import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'types.dart';

class MultiSelectField<B extends BlocBase<S>, S> extends StatefulWidget {
  final InitValueGetter<S, List<String>> valueGetter;
  final String title;
  final StateValueChanged<S, List<String>?> onChanged;
  final BlocBuilderCondition<S>? buildWhen;

  MultiSelectField(
      {Key? key,
      this.buildWhen,
      required this.valueGetter,
      required this.values,
      required this.title,
      required this.onChanged})
      : super(key: key);

  final List<String> values;

  @override
  _MultiSelectFieldState createState() => _MultiSelectFieldState<B, S>();
}

class _MultiSelectFieldState<B extends BlocBase<S>, S>
    extends State<MultiSelectField<B, S>> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: widget.buildWhen ??
          (previous, current) =>
              widget.valueGetter(previous) != widget.valueGetter(current),
      builder: (context, state) {
        final tags = widget.valueGetter(state);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.title),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => MultiSelectBottomSheet<String>(
                        onConfirm: (value) {
                          print(value);
                        },
                        onSelectionChanged: (value) {
                          print(value);
                          widget.onChanged(context.read<B>().state, value);
                        },
                        cancelText: Text('Отмена'),
                        confirmText: Text('Ок'),
                        initialChildSize: 0.4,
                        title: Text('Выберите Теги'),
                        items: widget.values
                            .map((e) => MultiSelectItem(e, e))
                            .toList(),
                        initialValue: widget.valueGetter(state)));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black45),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: tags.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Нажмите, чтобы выбрать теги'),
                        )
                      : MultiSelectChipDisplay(
                          items:
                              tags.map((e) => MultiSelectItem(e, e)).toList(),
                          onTap: (e) {
                            print(e);
                          },
                        ),
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}

class DropdownField<B extends BlocBase<S>, S> extends StatelessWidget {
  final InitValueGetter<S, String> valueGetter;
  final String title;
  final StateValueChanged<S, String?> onChanged;
  final BlocBuilderCondition<S>? buildWhen;

  DropdownField(
      {Key? key,
      this.buildWhen,
      required this.valueGetter,
      required this.values,
      required this.title,
      required this.onChanged})
      : super(key: key);

  final List<Map<String, String>> values;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: buildWhen ??
          (previous, current) => valueGetter(previous) != valueGetter(current),
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black45),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                value: valueGetter(state),
                onChanged: (value) {
                  onChanged(context.read<B>().state, value);
                },
                items: values
                    .map((e) => DropdownMenuItem(
                          value: e['value'],
                          child: Text(e['label']!),
                        ))
                    .toList(),
              )),
            ),
          )
        ]),
      ),
    );
  }
}
