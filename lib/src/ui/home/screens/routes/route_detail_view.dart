import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_map/src/domain/constants.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/domain/utils/list_extension.dart';
import 'package:test_map/src/domain/utils/mappers.dart';
import 'package:test_map/src/theme/color.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        polylines: {
                          Polyline(
                            polylineId: const PolylineId('overview_polyline'),
                            color: primaryColor,
                            width: 5,
                            points: state.directions!.polylinePoints
                                .map((e) => LatLng(e.latitude, e.longitude))
                                .toList(),
                          )
                        },
                        markers: state.route.steps!.mapIndexed((e, i) {
                          var hue = BitmapDescriptor.hueBlue;
                          if (i == 0) {
                            hue = BitmapDescriptor.hueGreen;
                          }
                          if (i == state.route.steps!.length - 1) {
                            hue = BitmapDescriptor.hueRed;
                          }

                          return Marker(
                              icon: BitmapDescriptor.defaultMarkerWithHue(hue),
                              markerId: MarkerId(e.name),
                              position: LatLng(e.point!.coordinates.lat,
                                  e.point!.coordinates.lng));
                        }).toSet(),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(mapTypeToIcon[route.type]),
                      PrimaryChip(
                        label: '${route.duration} мин',
                        color: mapDurationToColor(route.duration),
                      ),
                      ...route.tags.map((e) => PrimaryChip(label: e))
                    ]),
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
                child: BlocBuilder<RouteBloc, RouteState>(
                  builder: (context, state) {
                    return PrimaryButton(
                        child: Text('Маршрут на полный экран'),
                        onPressed: state is RouteLoaded
                            ? () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Scaffold(
                                            body: GoogleMap(
                                          initialCameraPosition:
                                              initialCameraPosition,
                                          polylines: {
                                            Polyline(
                                              polylineId: const PolylineId(
                                                  'overview_polyline'),
                                              color: primaryColor,
                                              width: 5,
                                              points: state
                                                  .directions!.polylinePoints
                                                  .map((e) => LatLng(
                                                      e.latitude, e.longitude))
                                                  .toList(),
                                            )
                                          },
                                          markers: state.route.steps!
                                              .mapIndexed((e, i) {
                                            var hue = BitmapDescriptor.hueBlue;
                                            if (i == 0) {
                                              hue = BitmapDescriptor.hueGreen;
                                            }
                                            if (i ==
                                                state.route.steps!.length - 1) {
                                              hue = BitmapDescriptor.hueRed;
                                            }

                                            return Marker(
                                                icon: BitmapDescriptor
                                                    .defaultMarkerWithHue(hue),
                                                markerId: MarkerId(e.name),
                                                position: LatLng(
                                                    e.point!.coordinates.lat,
                                                    e.point!.coordinates.lng));
                                          }).toSet(),
                                        ))));
                              }
                            : null);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
