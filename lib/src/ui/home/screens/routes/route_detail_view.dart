import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_map/src/domain/constants.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/widgets/primary_button.dart';

class RouteDetailView extends StatelessWidget {
  const RouteDetailView({Key? key, required this.route}) : super(key: key);

  final models.Route route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: FittedBox(child: Text(route.name)), actions: []),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 360,
                child: GoogleMap(
                  initialCameraPosition: initialCameraPosition,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(route.description),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: PrimaryButton(child: Text('Я на старте!')),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: PrimaryButton(child: Text('Маршрут на полный экран')),
              ),
            ],
          ),
        ));
  }
}
