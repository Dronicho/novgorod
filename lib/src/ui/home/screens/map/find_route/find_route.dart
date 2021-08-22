import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/bloc/loading_cubit.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/theme/color.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route_state.dart';
import 'package:test_map/src/ui/home/screens/routes/bloc/route/route_bloc.dart';
import 'package:test_map/src/ui/home/screens/routes/route_detail_view.dart';
import 'package:test_map/src/widgets/input_fields/dropdown_field.dart';
import 'package:test_map/src/widgets/primary_button.dart';

class FindRoutePage extends StatelessWidget {
  const FindRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Нужен маршрут?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownField<FindRouteBloc, FindRouteState>(
                  valueGetter: (state) => state.travelType,
                  values: [
                    {'label': 'Пешком', 'value': 'walk'},
                    {'label': 'Автомобиль', 'value': 'car'},
                    {'label': 'Велосипед', 'value': 'bike'},
                  ],
                  title: 'На чём вы передвигаетесь?',
                  onChanged: (state, value) => context
                      .read<FindRouteBloc>()
                      .updateRoute(state.copyWith(travelType: value))),
              DropdownField<FindRouteBloc, FindRouteState>(
                  valueGetter: (state) => state.companyType,
                  values: [
                    {'label': 'В одиночку', 'value': 'alone'},
                    {'label': 'С семьей', 'value': 'family'},
                    {'label': 'С друзьями', 'value': 'friends'},
                  ],
                  title: 'Ваша компания',
                  onChanged: (state, value) => context
                      .read<FindRouteBloc>()
                      .updateRoute(state.copyWith(companyType: value))),
              SizedBox(
                height: 16,
              ),
              Text('Планируете перекусить?'),
              BlocBuilder<FindRouteBloc, FindRouteState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: true,
                                groupValue: state.needEat,
                                onChanged: (bool? value) {
                                  context.read<FindRouteBloc>().updateRoute(
                                      state.copyWith(needEat: true));
                                }),
                            Text('Да')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: false,
                                groupValue: state.needEat,
                                onChanged: (bool? value) {
                                  context.read<FindRouteBloc>().updateRoute(
                                      state.copyWith(needEat: false));
                                }),
                            Text('Нет')
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              Text('Желаемая продолжительность маршрута'),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<FindRouteBloc, FindRouteState>(
                  builder: (context, state) => Slider(
                      divisions: 8,
                      min: 0,
                      max: 120,
                      value: state.duration.toDouble(),
                      label: state.duration.toString(),
                      onChanged: (value) {
                        context.read<FindRouteBloc>().updateRoute(
                            state.copyWith(duration: value.toInt()));
                      })),
              BlocBuilder<FindRouteBloc, FindRouteState>(
                  builder: (context, state) => Text(
                      state.duration.toString() + ' мин',
                      style: TextStyle(
                          fontFeatures: [FontFeature.liningFigures()]))),
              SizedBox(height: 30),
              PrimaryButton(
                  onPressed: () async {
                    context.read<LoadingCubit>().startLoading();
                    final res = await context.read<FindRouteBloc>().getRoute();
                    context.read<LoadingCubit>().stopLoading();
                    if (res != null) {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListRoutesView(routes: res, title: 'Вот что нам удалось найти')));
                    } else {
                      await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Ой!'),
                                content: Text(
                                    'К сожалению нам не удалось найти маршрутов, которые вам подходят, попробуйте что-нибудь другое'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Хорошо'))
                                ],
                              ));
                    }
                  },
                  child: Text('Подобрать маршруты'))
            ],
          ),
        ),
      ),
    );
  }
}

class ListRoutesView extends StatelessWidget {
  final List<models.Route> routes;
  final String title;
  const ListRoutesView({Key? key, required this.routes, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: RouteTile(route: routes[i]),
        ),
        itemCount: routes.length,
      ),
    );
  }
}

class RouteTile extends StatelessWidget {
  final models.Route route;
  const RouteTile({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(route.tags);
    return SizedBox(
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => RouteBloc()..loadRoute(route.id),
                      child: RouteDetailView(route: route),
                    )));
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 56,
                  width: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                        imageUrl: route.photoUrl, fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: Text(route.name,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    Wrap(
                        spacing: 4,
                        alignment: WrapAlignment.end,
                        runAlignment: WrapAlignment.end,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: route.tags
                            .map((e) => PrimaryChip(label: e))
                            .toList())
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryChip(label: '${route.duration} min'),
                      Text(route.exp.toString() + ' xp',
                          style: TextStyle(color: primaryColor))
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryChip extends StatelessWidget {
  final String label;
  final Color color;

  const PrimaryChip({Key? key, required this.label, Color? color})
      : color = color ?? primaryColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color,
      labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFeatures: [FontFeature.liningFigures()]),
      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
}
