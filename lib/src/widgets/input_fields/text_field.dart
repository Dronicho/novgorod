import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_map/src/widgets/input_fields/types.dart';

class BlocTextField<B extends BlocBase<S>, S> extends HookWidget {
  final InitValueGetter<S, String?> valueGetter;
  final String title;
  final StateValueChanged<S, String> onChanged;
  final BlocBuilderCondition<S>? buildWhen;
  final bool obscure;

  const BlocTextField(
      {required this.valueGetter,
      this.obscure = false,
      this.buildWhen,
      required this.title,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        useTextEditingController(text: valueGetter(context.read<B>().state));

    return BlocBuilder<B, S>(
      buildWhen: buildWhen ??
          (previous, current) => valueGetter(previous) != valueGetter(current),
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(
              height: 5,
            ),
            TextField(
              maxLines: obscure ? 1 : null,
              controller: controller,
              onChanged: (value) {
                onChanged(context.read<B>().state, value);
              },
              obscureText: obscure,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
