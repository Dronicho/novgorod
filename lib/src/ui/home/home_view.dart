import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_map/direction_model.dart';
import 'package:test_map/src/ui/home/screens/add_route/add_route_page.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/map_view.dart';
import 'package:test_map/src/ui/home/screens/routes/routes_view.dart';

import '../../../direction_repository.dart';
import 'screens/profile/profile_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  int _index = 1;

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;

  final _pages = <Widget>[AuthProtected(child: ProfileView()), Mapview(), RoutesView()];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView.builder(
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            _index = index;
            return _pages[index];
          },
          controller: _controller,
          allowImplicitScrolling: false,
          physics: NeverScrollableScrollPhysics(),
        ),
        floatingActionButton: _index == 1
            ? FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AddRoutePage(
                            onComplete: () {
                              context.read<MapBloc>().loadPoints();
                            },
                          )));
                },
                child: const Icon(Icons.add),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
            _controller.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Профиль'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Карта'),
            BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Маршруты'),
          ],
        ));
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin!.position, destination: pos);
      setState(() => _info = directions);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
