import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/bloc/loading_cubit.dart';
import 'package:test_map/src/theme/color.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool? loading;
  final Color? color;
  PrimaryButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.color,
    this.loading,
  }) : super(key: key);

  factory PrimaryButton.success({
    Key? key,
    VoidCallback? onPressed,
    required Widget child,
    bool? loading,
  }) =>
      PrimaryButton(
        child: child,
        onPressed: onPressed,
        loading: loading,
        color: green,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, state) {
        final _loading = state || (loading ?? false);
        return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: onPressed != null
                    ? color ?? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
                // color: secondaryWhite,
                borderRadius: BorderRadius.circular(8)),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: Container(
                height: 50,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: _loading ? null : onPressed,
                      child: Center(
                          child: _loading
                              ? SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  child: child,
                                ))),
                ),
              ),
            ));
      },
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  SecondaryButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFF363636), width: 1)),
        child: Container(
          height: 50,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onPressed,
                child: Center(
                    child: DefaultTextStyle(
                  style: TextStyle(color: Color(0xFF363636), fontSize: 16),
                  child: child,
                ))),
          ),
        ));
  }
}
