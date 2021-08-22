import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/theme/color.dart';
import 'package:test_map/src/theme/novgorod_icons_icons.dart';
import 'package:test_map/src/ui/home/screens/add_route/add_point_page.dart';
import 'package:test_map/src/ui/home/screens/add_route/add_route_page.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_bloc.dart';

class AddRouteSelectPage extends StatelessWidget {
  final VoidCallback onComplete;
  const AddRouteSelectPage({Key? key, required this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Создать'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddPointPage(onComplete: onComplete)));
            },
            leading: Icon(Icons.location_on, color: primaryColor),
            title: Text('Метку',
                style: TextStyle(
                    color: primaryColor, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                        value: context.read<MapBloc>(),
                        child: AddRoutePage(),
                      )));
            },
            leading: Icon(NovgorodIcons.route, color: primaryColor),
            title: Text('Маршрут',
                style: TextStyle(
                    color: primaryColor, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
