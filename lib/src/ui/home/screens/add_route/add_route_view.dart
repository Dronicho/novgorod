import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/bloc/loading_cubit.dart';
import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/ui/home/screens/add_route/bloc/add_route_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_bloc.dart';
import 'package:test_map/src/widgets/input_fields/fields.dart';
import 'package:test_map/src/widgets/primary_button.dart';

import 'select_steps_page.dart';

class AddRouteView extends StatelessWidget {
  const AddRouteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context.read<MapBloc>().state);
    return Scaffold(
      appBar: AppBar(
        title: Text('Создать маршрут'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: UploadField<AddRouteCubit, LocalRoute>(
                valueGetter: (state) => state.file,
                title: 'Выберите фото',
                onChanged: (state, value) => context
                    .read<AddRouteCubit>()
                    .updatePoint(state.copyWith(file: value))),
          ),
          BlocTextField<AddRouteCubit, LocalRoute>(
              valueGetter: (state) => state.name,
              title: 'Название',
              onChanged: (state, value) => context
                  .read<AddRouteCubit>()
                  .updatePoint(state.copyWith(name: value))),
          BlocTextField<AddRouteCubit, LocalRoute>(
              valueGetter: (state) => state.description,
              title: 'Описание',
              onChanged: (state, value) => context
                  .read<AddRouteCubit>()
                  .updatePoint(state.copyWith(description: value))),
          BlocTextField<AddRouteCubit, LocalRoute>(
              valueGetter: (state) => state.duration.toString(),
              title: 'Длительность',
              onChanged: (state, value) => context
                  .read<AddRouteCubit>()
                  .updatePoint(
                      state.copyWith(duration: int.tryParse(value) ?? 0))),
          DropdownField<AddRouteCubit, LocalRoute>(
              valueGetter: (state) => state.type,
              values: [
                {'label': 'Пешком', 'value': 'walk'},
                {'label': 'На велосипеде', 'value': 'bike'},
                {'label': 'На машине', 'value': 'car'},
              ],
              title: 'Категория',
              onChanged: (state, value) {
                context
                    .read<AddRouteCubit>()
                    .updatePoint(state.copyWith(type: value!));
              }),
          MultiSelectField<AddRouteCubit, LocalRoute>(
              valueGetter: (stete) => stete.tags,
              values: ['с семьей', 'популярное', 'спорт'],
              title: 'Teги',
              onChanged: (state, value) => context
                  .read<AddRouteCubit>()
                  .updatePoint(state.copyWith(tags: value!))),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(
              onPressed: () async {
                final res = await Navigator.of(context)
                    .push<List<LocalStep>>(MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                              value: context.read<MapBloc>(),
                              child: SelectStepsPage(),
                            )));
                if (res != null) {
                  context.read<AddRouteCubit>().updatePoint(
                      context.read<AddRouteCubit>().state.copyWith(steps: res));
                }
              },
              child: Text('Перейти к выбору точек'),
            ),
          ),
          BlocBuilder<AddRouteCubit, LocalRoute>(builder: (context, state) {
            final s = state.steps ?? [];
            return Column(
              children: s
                  .map((e) => ListTile(
                        title: Text(
                          e.name,
                        ),
                        subtitle: Text(e.point!.name),
                      ))
                  .toList(),
            );
          }),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(
              onPressed: () {
                context.read<AddRouteCubit>().createRoute();
              },
              child: Text('Сохранить маршрут'),
            ),
          )
        ]),
      ),
    );
  }
}
