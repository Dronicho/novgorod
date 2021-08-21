import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/domain/utils/mappers.dart';
import 'package:test_map/src/widgets/shimmers/container.dart';

import 'bloc/route/route_bloc.dart';
import 'bloc/routes_bloc.dart';
import 'bloc/routes_state.dart';
import 'route_detail_view.dart';

final mockRoute = models.Route(
    tags: [],
    id: 'id',
    name: 'Поход до Быков на реке Волхов',
    steps: [],
    exp: 3000,
    duration: 30,
    description: 'Увлекательный маршрут для самых выносливых исследователей');

class RoutesView extends StatelessWidget {
  RoutesView({Key? key}) : super(key: key);

  final intervals = [15, 30, 60, 120];
  final travelTypes = [
    {'name': 'Пешком', 'image': 'assets/walk.png'},
    {'name': 'Велосипед', 'image': 'assets/bike.png'},
    {'name': 'Авто', 'image': 'assets/car.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Маршруты',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text(
                    'Больше всего оценок',
                  ),
                ],
              ),
            ),
            BlocBuilder<RoutesCubit, RoutesState>(
              builder: (context, state) {
                if (state is RoutesLoading) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ContainerShimmer(height: 300),
                  );
                } else if (state is RoutesLoaded) {
                  return Center(
                    child: CarouselSlider(
                        items: state.routes
                            .map((e) => RouteCard(route: e))
                            .toList(),
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            aspectRatio: 0.8,
                            enlargeCenterPage: true)),
                  );
                }
                return Container();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('По длительности'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: intervals
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: mapDurationToColor(e),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text('$e минут',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26))),
                            ),
                          ))
                      .toList()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('По средству передвижения'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: travelTypes
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(e['image']!)),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(e['name']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  )),
                            ),
                          ))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}

class RouteCard extends StatefulWidget {
  const RouteCard({Key? key, required this.route}) : super(key: key);

  final models.Route route;

  @override
  _RouteCardState createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RouteBloc()..loadRoute(widget.route.id),
                  child: RouteDetailView(route: widget.route),
                )));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: 'https://source.unsplash.com/random')),
          // Positioned(
          //   bottom: 15,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: 200,
          //     decoration: BoxDecoration(
          //         gradient: LinearGradient(colors: [
          //       Colors.transparent,
          //       Colors.black.withOpacity(0.05)
          //     ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          //   ),
          // ),
          Positioned(
              top: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text('${widget.route.duration} мин',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    backgroundColor: mapDurationToColor(widget.route.duration),
                  ),
                  Chip(
                    label: Text('${widget.route.exp} XP',
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Color(0xFFCF2F68),
                  )
                ],
              )),
          Positioned(
              top: 16,
              right: 16,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _liked = !_liked;
                      });
                    },
                    child: Chip(
                      avatar: Icon(Icons.thumb_up_alt,
                          color: _liked ? Colors.white : Color(0xFF363636)),
                      label: Text('500',
                          style: TextStyle(
                              color: _liked ? Colors.white : Color(0xFF363636),
                              fontWeight: FontWeight.bold)),
                      backgroundColor: _liked
                          ? Theme.of(context).primaryColor
                          : Color(0xFFF8F8F8),
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 32,
            left: 16,
            child: Container(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.directions_bike, color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(widget.route.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(widget.route.description,
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
