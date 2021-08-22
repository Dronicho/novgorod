import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/add_route/add_route_view.dart';
import 'package:test_map/src/ui/home/screens/add_route/bloc/add_route_bloc.dart';

class AddRoutePage extends StatelessWidget {
  const AddRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRouteCubit(),
      child: AddRouteView(),
    );
  }
}
