import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_bloc.dart';
import 'package:test_map/src/ui/home/screens/routes/bloc/routes_bloc.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => HomePage(), settings: RouteSettings(name: '/home'));
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return HomeView();
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => MapBloc()..loadPoints()),
      BlocProvider(create: (context) => RoutesCubit()..loadRoutes())
    ], child: HomeView());
  }
}
