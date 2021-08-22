import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_map/direction_repository.dart';
import 'package:test_map/src/domain/constants.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/theme/color.dart';
import 'package:test_map/src/ui/home/screens/add_route/bloc/add_step_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_bloc.dart';
import 'package:test_map/src/ui/home/screens/map/bloc/map_state.dart';
import 'package:test_map/src/widgets/input_fields/fields.dart';
import 'package:test_map/src/widgets/primary_button.dart';

class SelectStepsPage extends StatefulWidget {
  const SelectStepsPage({Key? key}) : super(key: key);

  @override
  _SelectStepsPageState createState() => _SelectStepsPageState();
}

class _SelectStepsPageState extends State<SelectStepsPage> {
  models.Point? _activePoint;
  List<models.LocalStep> _steps = [];
  Set<Polyline> polylines = {};
  bool _loading = false;
  final DirectionsRepository _repository = DirectionsRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Выберите шаги')),
        body: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            if (state is MapLoaded) {
              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: initialCameraPosition,
                    polylines: polylines,
                    markers: state.points
                        .map((e) => Marker(
                            onTap: () {
                              setState(() {
                                _activePoint = e;
                              });
                            },
                            markerId: MarkerId(e.id!),
                            position: e.coordinates.toLatLng()))
                        .toSet(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _activePoint != null
                        ? Container(
                            color: Colors.white,
                            child: _loading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Вы выбрали'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(_activePoint!.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: PrimaryButton(
                                          onPressed: () async {
                                            final res = await Navigator.of(
                                                    context)
                                                .push<
                                                    models
                                                        .LocalStep>(MaterialPageRoute(
                                                    builder: (_) => BlocProvider(
                                                        create: (context) =>
                                                            AddStepBloc(
                                                                _activePoint!),
                                                        child: AddStepView())));
                                            if (res != null) {
                                              setState(() {
                                                _steps.add(res);
                                              });
                                              if (_steps.length > 1) {
                                                setState(() {
                                                  _loading = true;
                                                });
                                                final info = await _repository
                                                    .getDirections(
                                                        origin: _steps[
                                                                _steps.length -
                                                                    2]
                                                            .point!
                                                            .coordinates
                                                            .toLatLng(),
                                                        destination:
                                                            _activePoint!
                                                                .coordinates
                                                                .toLatLng());
                                                setState(() {
                                                  _loading = false;
                                                  polylines.add(Polyline(
                                                    width: 5,
                                                    color: primaryColor,
                                                    points: info!.polylinePoints
                                                        .map((e) => LatLng(
                                                            e.latitude,
                                                            e.longitude))
                                                        .toList(),
                                                    polylineId: PolylineId(
                                                        _steps[_steps.length -
                                                                    2]
                                                                .point!
                                                                .id! +
                                                            _activePoint!.id!),
                                                  ));
                                                });
                                              }
                                            }
                                          },
                                          child: Text('Продолжить'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: PrimaryButton.success(
                                            onPressed: () async {
                                              Navigator.of(context).pop(_steps);
                                            },
                                            child: Text('Завершить маршрут')),
                                      )
                                    ],
                                  ),
                          )
                        : Container(),
                  )
                ],
              );
            }
            return Container();
          },
        ));
  }
}

class AddStepView extends StatelessWidget {
  const AddStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Создать маршрут'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: UploadField<AddStepBloc, models.LocalStep>(
                valueGetter: (state) => state.file,
                title: 'Выберите фото',
                onChanged: (state, value) => context
                    .read<AddStepBloc>()
                    .updatePoint(state.copyWith(file: value))),
          ),
          BlocTextField<AddStepBloc, models.LocalStep>(
              valueGetter: (state) => state.name,
              title: 'Название',
              onChanged: (state, value) => context
                  .read<AddStepBloc>()
                  .updatePoint(state.copyWith(name: value))),
          BlocTextField<AddStepBloc, models.LocalStep>(
              valueGetter: (state) => state.description,
              title: 'Описание',
              onChanged: (state, value) => context
                  .read<AddStepBloc>()
                  .updatePoint(state.copyWith(description: value))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(
              onPressed: () {
                Navigator.of(context).pop(context.read<AddStepBloc>().state);
              },
              child: Text('Подтвердить'),
            ),
          )
        ]),
      ),
    );
  }
}
