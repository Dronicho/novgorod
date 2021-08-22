import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/add_route/add_point_view.dart';

import 'bloc/add_point_bloc.dart';

class AddPointPage extends StatelessWidget {
  const AddPointPage({Key? key, required this.onComplete}) : super(key: key);

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPointBloc(),
      child: AddPointView(
        onComplete: onComplete,
      ),
    );
  }
}
