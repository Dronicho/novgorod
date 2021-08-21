import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/add_route/add_route_view.dart';

import 'bloc/add_route.bloc.dart';

class AddRoutePage extends StatelessWidget {
  const AddRoutePage({Key? key, required this.onComplete}) : super(key: key);

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRouteBloc(),
      child: AddRouteView(
        onComplete: onComplete,
      ),
    );
  }
}
