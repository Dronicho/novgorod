import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/domain/utils/mappers.dart';
import 'package:test_map/src/theme/color.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route.dart';
import 'package:test_map/src/widgets/shimmers/container.dart';

import 'bloc/route/route_bloc.dart';
import 'bloc/routes_bloc.dart';
import 'bloc/routes_state.dart';
import 'route_detail_view.dart';

class RoutesView extends StatelessWidget {
  RoutesView({Key? key}) : super(key: key);

  final intervals = [15, 30, 60, 120];
  final travelTypes = [
    {'name': 'Пешком', 'image': 'assets/walk.png', 'type': 'walk'},
    {'name': 'Велосипед', 'image': 'assets/bike.png', 'type': 'bike'},
    {'name': 'Авто', 'image': 'assets/car.png', 'type': 'car'}
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
                      .map((e) => GestureDetector(
                            onTap: () {
                              final s = context.read<RoutesCubit>().state;
                              if (s is RoutesLoaded) {
                                final f = s.routes
                                    .where((element) => element.duration == e)
                                    .toList();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ListRoutesView(
                                          routes: f,
                                          title: 'Маршруты',
                                        )));
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                                            fontFeatures: [
                                              FontFeature.liningFigures()
                                            ],
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26))),
                              ),
                            ),
                          ))
                      .toList()),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('По средству передвижения'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: travelTypes
                      .map((e) => GestureDetector(
                            onTap: () {
                              final s = context.read<RoutesCubit>().state;
                              if (s is RoutesLoaded) {
                                final f = s.routes
                                    .where(
                                        (element) => element.type == e['type'])
                                    .toList();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ListRoutesView(
                                          routes: f,
                                          title: 'Маршруты',
                                        )));
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(e['image']!)),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 8.0),
                                      child: Text(e['name']!,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    )),
                              ),
                            ),
                          ))
                      .toList()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Прочие категории'),
            ),
            RoutesFilterList()
          ],
        ),
      ),
    );
  }
}

class RoutesFilterList extends StatefulWidget {
  const RoutesFilterList({Key? key}) : super(key: key);

  @override
  _RoutesFilterListState createState() => _RoutesFilterListState();
}

class _RoutesFilterListState extends State<RoutesFilterList> {
  final categories = ['С детьми', 'За городом', 'Популярное', 'Спорт'];
  String _active = 'С детьми';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: categories
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _active = e;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: PrimaryChip(
                              label: e,
                              color:
                                  _active == e ? primaryColor : secondaryColor),
                        ),
                      ))
                  .toList()),
        ),
        BlocBuilder<RoutesCubit, RoutesState>(builder: (context, state) {
          if (state is RoutesLoading) return CircularProgressIndicator();
          if (state is RoutesLoaded) {
            final filteredRoutes = state.routes
                .where((element) => element.tags.any((e) => e == _active))
                .toList();

            if (filteredRoutes.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Ничего нет :('),
                ),
              );
            }
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragStart: (d) {},
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, i) =>
                    RouteTile(route: filteredRoutes[i]),
                itemCount: filteredRoutes.length,
              ),
            );
          }
          return Container();
        })
      ],
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
          Positioned.fill(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                    fit: BoxFit.cover, imageUrl: widget.route.photoUrl)),
          ),
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
                  PrimaryChip(
                    label: '${widget.route.duration} мин',
                    color: mapDurationToColor(widget.route.duration),
                  ),
                  PrimaryChip(
                    label: '${widget.route.exp} XP',
                    color: mapDurationToColor(widget.route.duration),
                  ),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      avatar: Icon(Icons.thumb_up_alt,
                          color: _liked ? Colors.white : Color(0xFF363636)),
                      label: Text(
                          (widget.route.likes + (_liked ? 1 : 0)).toString(),
                          style: TextStyle(
                              fontFeatures: [FontFeature.liningFigures()],
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
                      Icon(mapTypeToIcon[widget.route.type],
                          color: Colors.white),
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
