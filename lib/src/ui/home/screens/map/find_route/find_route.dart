import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/bloc/loading_cubit.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/find_route/find_route_state.dart';
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
                  values: ['Пешком', 'Автомобиль', 'Велосипед'],
                  title: 'На чём вы передвигаетесь?',
                  onChanged: (state, value) => context
                      .read<FindRouteBloc>()
                      .updateRoute(state.copyWith(travelType: value))),
              DropdownField<FindRouteBloc, FindRouteState>(
                  valueGetter: (state) => state.companyType,
                  values: ['В одиночку', 'С семьей', 'С друзьями'],
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
                      min: 0,
                      max: 60,
                      value: state.duration.toDouble(),
                      label: state.duration.toString(),
                      onChanged: (value) {
                        context.read<FindRouteBloc>().updateRoute(
                            state.copyWith(duration: value.toInt()));
                      })),
              BlocBuilder<FindRouteBloc, FindRouteState>(
                  builder: (context, state) =>
                      Text(state.duration.toString() + ' мин')),
              SizedBox(height: 30),
              PrimaryButton(
                  onPressed: () async {
                    context.read<LoadingCubit>().startLoading();
                    await Future.delayed(Duration(milliseconds: 200));
                    context.read<LoadingCubit>().stopLoading();
                  },
                  child: Text('Подобрать маршруты'))
            ],
          ),
        ),
      ),
    );
  }
}
