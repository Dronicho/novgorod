import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_map/src/domain/constants.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/widgets/primary_button.dart';

import 'bloc/route/route_bloc.dart';
import 'bloc/route/route_state.dart';
import 'steps_view.dart';

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
                child: BlocBuilder<RouteBloc, RouteState>(
                  builder: (context, state) {
                    if (state is RouteLoading) {
                      return GoogleMap(
                        initialCameraPosition: initialCameraPosition,
                      );
                    }
                    if (state is RouteLoaded) {
                      return GoogleMap(
                        initialCameraPosition: initialCameraPosition,
                        markers: state.route.steps!
                            .map((e) => Marker(
                                markerId: MarkerId(e.name),
                                position: LatLng(e.point!.coordinates.lat,
                                    e.point!.coordinates.lng)))
                            .toSet(),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(route.description),
              ),
              BlocBuilder<RouteBloc, RouteState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: PrimaryButton.success(
                      onPressed: (state is RouteLoaded)
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      StepsPage(route: state.route)));
                            }
                          : null,
                      child: Text('Я на старте!'),
                    ),
                  );
                },
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
