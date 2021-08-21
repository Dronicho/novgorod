import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_map/direction_repository.dart';
import 'package:test_map/src/domain/bloc/loading_cubit.dart';
import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/ui/home/screens/add_route/bloc/add_route.bloc.dart';
import 'package:test_map/src/widgets/input_fields/fields.dart';
import 'package:test_map/src/widgets/primary_button.dart';

class AddRouteView extends StatelessWidget {
  const AddRouteView({Key? key, required this.onComplete}) : super(key: key);

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Создать метку')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UploadField<AddRouteBloc, LocalPoint>(
                    valueGetter: (state) => state.file,
                    title: 'Выберите фото',
                    onChanged: (state, value) => context
                        .read<AddRouteBloc>()
                        .updatePoint(state.copyWith(file: value))),
              ),
              BlocTextField<AddRouteBloc, LocalPoint>(
                  valueGetter: (state) => state.name,
                  title: 'Название',
                  onChanged: (state, value) => context
                      .read<AddRouteBloc>()
                      .updatePoint(state.copyWith(name: value))),
              BlocTextField<AddRouteBloc, LocalPoint>(
                  valueGetter: (state) => state.description,
                  title: 'Описание',
                  onChanged: (state, value) => context
                      .read<AddRouteBloc>()
                      .updatePoint(state.copyWith(description: value))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Место'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<AddRouteBloc, LocalPoint>(
                    builder: (context, state) => Text(
                        '${state.coordinate.lat}, ${state.coordinate.lng}')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SecondaryButton(
                  onPressed: () async {
                    final res = await Navigator.of(context).push<LatLng>(
                        MaterialPageRoute(
                            builder: (context) => SelectLocationView()));
                    if (res != null) {
                      context.read<AddRouteBloc>().updatePoint(context
                          .read<AddRouteBloc>()
                          .state
                          .copyWith(
                              coordinate: Coordinate(
                                  lat: res.latitude, lng: res.longitude)));
                    }
                  },
                  child: Text('Выбрать на карте'),
                ),
              ),
              DropdownField<AddRouteBloc, LocalPoint>(
                  valueGetter: (state) => state.type!,
                  values: [
                    'Достопримечательности',
                    'Музеи',
                    'Маршруты',
                    'Рестораны',
                    'Отели'
                  ],
                  title: 'Теги',
                  onChanged: (state, value) {
                    context
                        .read<AddRouteBloc>()
                        .updatePoint(state.copyWith(type: value!));
                  }),
              SizedBox(
                height: 50,
              ),
              PrimaryButton(
                onPressed: () async {
                  context.read<LoadingCubit>().startLoading();
                  await context.read<AddRouteBloc>().createPoint();
                  context.read<LoadingCubit>().stopLoading();
                  onComplete();
                },
                child: Text('Создать'),
              )
            ]),
          ),
        ));
  }
}

class SelectLocationView extends StatefulWidget {
  SelectLocationView({Key? key}) : super(key: key);

  @override
  _SelectLocationViewState createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  final _initialPosition = CameraPosition(
    target: LatLng(58.522042, 31.276234),
    zoom: 11.5,
  );
  final DirectionsRepository _repository = DirectionsRepository();

  LatLng? _position;
  bool _loading = false;
  String? address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Отметить на карте')),
        body: Stack(
          children: [
            GoogleMap(
              markers: {
                if (_position != null)
                  Marker(markerId: MarkerId('selected'), position: _position!)
              },
              initialCameraPosition: _initialPosition,
              onTap: (position) async {
                setState(() {
                  _loading = true;
                  _position = position;
                });
                final res = await _repository.getAddress(position);
                setState(() {
                  _loading = false;
                  address = res;
                });
              },
            ),
            if (_position != null)
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _loading
                            ? CircularProgressIndicator()
                            : Column(
                                children: [
                                  Text(address!),
                                  PrimaryButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(_position);
                                    },
                                    child: Text('Подтвердить'),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ))
          ],
        ));
  }
}
