import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_repository.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route_bloc.dart';
import 'package:test_map/src/widgets/primary_button.dart';

import 'bloc/map_bloc.dart';
import 'bloc/map_state.dart';
import 'find_route/find_route.dart';

class Mapview extends StatefulWidget {
  const Mapview({Key? key}) : super(key: key);

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(58.522042, 31.276234),
    zoom: 11.5,
  );

  @override
  _MapviewState createState() => _MapviewState();
}

class _MapviewState extends State<Mapview> with AutomaticKeepAliveClientMixin {
  late GoogleMapController _controller;

  final mapTypeToColor = {
    'достопримечательности': BitmapDescriptor.hueBlue,
    'отели': BitmapDescriptor.hueRose,
    'рестораны': BitmapDescriptor.hueGreen,
    'музеи': BitmapDescriptor.hueBlue,
    'маршруты': BitmapDescriptor.hueBlue,
    'достопримечательность': BitmapDescriptor.hueBlue,
  };

  Map<String, bool> filters = {
    'отели': true,
    'рестораны': true,
    'музеи': true,
    'маршруты': true,
    'достопримечательность': true,
  };

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Expanded(
          child: BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              if (state is MapLoading) {
                return GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: Mapview._initialCameraPosition,
                  onMapCreated: (controller) => _controller = controller,
                  // polylines: {
                  //   if (_info != null)
                  //     Polyline(
                  //       polylineId: const PolylineId('overview_polyline'),
                  //       color: Colors.red,
                  //       width: 10,
                  //       points: _info!.polylinePoints
                  //           .map((e) => LatLng(e.latitude, e.longitude))
                  //           .toList(),
                  //     ),
                  // },
                  // onLongPress: _addMarker,
                );
              } else if (state is MapLoaded) {
                return GoogleMap(
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: Mapview._initialCameraPosition,
                    markers: state.points
                        .where((p) {
                          final s =
                              filters.entries.where((element) => element.value);
                          return s
                              .map((e) => e.key.toLowerCase())
                              .contains(p.type.toLowerCase());
                        })
                        .map((e) => Marker(
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                mapTypeToColor[e.type.toLowerCase().trim()] ??
                                    BitmapDescriptor.hueBlue),
                            onTap: () {
                              _controller.animateCamera(
                                  CameraUpdate.newLatLngZoom(
                                      LatLng(
                                          e.coordinate.lat, e.coordinate.lng),
                                      15));
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) =>
                                      DraggableScrollableSheet(
                                          expand: false,
                                          initialChildSize: 0.5,
                                          builder: (context, sc) => SafeArea(
                                                child: SingleChildScrollView(
                                                  controller: sc,
                                                  child: SafeArea(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 32,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(e.name,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline5),
                                                        ),
                                                        if (e.photoUrl !=
                                                                null &&
                                                            e.photoUrl!
                                                                .isNotEmpty)
                                                          CachedNetworkImage(
                                                              imageUrl:
                                                                  e.photoUrl!),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Wrap(
                                                          children: e.tags
                                                              .map(
                                                                  (t) =>
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 4.0),
                                                                        child: Chip(
                                                                            label:
                                                                                Text(t)),
                                                                      ))
                                                              .toList(),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                              e.description ??
                                                                  ''),
                                                        ),
                                                        SizedBox(height: 16),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: PrimaryButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                  'Проложить маршрут')),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: PrimaryButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                  'Я на месте')),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )));
                            },
                            markerId: MarkerId(e.id!),
                            position:
                                LatLng(e.coordinate.lat, e.coordinate.lng)))
                        .toSet());
              }
              return Container();
            },
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child: OpenContainer(
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            closedBuilder: (context, open) => GestureDetector(
                onTap: open,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Поиск...'), Icon(Icons.search)],
                    ),
                  ),
                )),
            openBuilder: (context, close) =>
                SearchView(controller: _controller, close: close),
          ),
        ),
        Positioned(
            bottom: 16,
            left: 16,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              label: Text('Нужен маршрут?'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => FindRouteBloc(),
                    child: FindRoutePage(),
                  ),
                ));
              },
            )),
        Positioned(
            top: 95,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => FilterDialog(
                        defaultFilters: filters,
                        onChange: (key, value) {
                          setState(() {
                            filters[key] = value;
                          });
                        }));
              },
              child: Icon(Icons.filter_alt),
            ))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SearchView extends StatefulWidget {
  SearchView({Key? key, required this.controller, required this.close})
      : super(key: key);

  final GoogleMapController controller;
  final VoidCallback close;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Point> _points = [];
  bool _loading = false;
  final MapRepository _repository = MapRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(hintText: 'Поиск...'),
                    onChanged: (value) async {
                      setState(() {
                        _loading = true;
                      });
                      final res = await _repository.searchPoints(value);

                      setState(() {
                        _loading = false;
                        _points = res;
                      });
                    })),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Chip(
                      label: Text('Достопримечательности'),
                      avatar: Icon(Icons.add),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Chip(
                      label: Text('Достопримечательности'),
                      avatar: Icon(Icons.add),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Chip(
                      label: Text('Достопримечательности'),
                      avatar: Icon(Icons.add),
                    ),
                  ),
                  Text('123123')
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text('Недавно искали'),
            SizedBox(
              height: 16,
            ),
            if (_loading)
              CircularProgressIndicator()
            else
              ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SearchTile(
                      point: _points[index],
                      onTap: () {
                        final e = _points[index];
                        widget.close();
                        widget.controller.animateCamera(
                            CameraUpdate.newLatLngZoom(
                                LatLng(e.coordinate.lat, e.coordinate.lng),
                                15));
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => DraggableScrollableSheet(
                                expand: false,
                                initialChildSize: 0.35,
                                builder: (context, sc) => SafeArea(
                                      child: SingleChildScrollView(
                                        controller: sc,
                                        child: SafeArea(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 32,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(e.name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5),
                                              ),
                                              if (e.photoUrl != null &&
                                                  e.photoUrl!.isNotEmpty)
                                                CachedNetworkImage(
                                                    imageUrl: e.photoUrl!),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Wrap(
                                                children: e.tags
                                                    .map((t) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      4.0),
                                                          child: Chip(
                                                              label: Text(t)),
                                                        ))
                                                    .toList(),
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    Text(e.description ?? ''),
                                              ),
                                              SizedBox(height: 16),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: PrimaryButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                        'Проложить маршрут')),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: PrimaryButton(
                                                    onPressed: () {},
                                                    child: Text('Я на месте')),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )));
                      }),
                  itemCount: _points.length)
          ],
        ),
      ),
    );
  }
}

class FilterDialog extends StatefulWidget {
  FilterDialog({Key? key, required this.onChange, required this.defaultFilters})
      : super(key: key);

  final Map<String, bool> defaultFilters;
  final Function(String, bool) onChange;

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  Map<String, bool> filters = {
    'отели': true,
    'рестораны': true,
    'музеи': true,
    'маршруты': true,
    'достопримечательность': true,
  };

  @override
  void initState() {
    super.initState();
    setState(() {
      filters = widget.defaultFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Показывать на карте',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        ...filters.entries
            .map(
              (entry) => CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Theme.of(context).primaryColor,
                  value: entry.value,
                  onChanged: (v) {
                    if (v != null) {
                      setState(() {
                        filters[entry.key] = v;
                      });
                      widget.onChange(entry.key, v);
                    }
                  },
                  title: Text(entry.key)),
            )
            .toList(),
      ],
    ));
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({Key? key, required this.point, required this.onTap})
      : super(key: key);

  final Point point;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: CircleAvatar(
            backgroundImage:
                point.photoUrl != null && point.photoUrl!.isNotEmpty
                    ? CachedNetworkImageProvider(point.photoUrl!)
                    : null),
        title: Text(point.name));
  }
}
