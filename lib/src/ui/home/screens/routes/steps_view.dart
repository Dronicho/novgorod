import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/domain/utils/list_extension.dart';
import 'package:test_map/src/theme/color.dart';
import 'package:test_map/src/ui/home/screens/routes/bloc/player/player_bloc.dart';
import 'package:test_map/src/ui/home/screens/routes/detail_step_page.dart';
import 'package:test_map/src/widgets/primary_button.dart';

import 'bloc/complete_route_page.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({Key? key, required this.route}) : super(key: key);

  final models.Route route;

  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  final List<models.Step> _completedSteps = [];
  late models.Step _activeStep;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      _activeStep = widget.route.steps![0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оглавление'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          ...widget.route.steps!
              .mapIndexed((e, i) => StepTile(
                  index: i + 1,
                  step: e,
                  active: e.name == _activeStep.name,
                  completed: _completedSteps.contains(e)))
              .toList(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                'Чтобы открыть содержимое, доберитесь до метки, следуя маршруту',
                textAlign: TextAlign.center,
                style: TextStyle(color: secondaryColor)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => PlayerCubit(),
                          child: DetailStepPage(
                              step: _activeStep,
                              onComplete: () {
                                if (_index < widget.route.steps!.length - 1) {
                                  setState(() {
                                    _index += 1;
                                    _completedSteps.add(_activeStep);
                                    _activeStep = widget.route.steps![_index];
                                  });
                                } else {
                                  setState(() {
                                    _completedSteps.add(_activeStep);
                                  });
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CompleteRoutePage(
                                          route: widget.route)));
                                }
                              }),
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                    child: Text(
                  'Глава ${_index + 1}',
                )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class StepTile extends StatelessWidget {
  final models.Step step;
  final bool active;
  final bool completed;
  final int index;

  const StepTile(
      {Key? key,
      required this.index,
      required this.step,
      this.active = false,
      this.completed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: completed ? 0.45 : 1,
      child: ListTile(
          leading: Icon(Icons.location_on,
              color: active || completed ? primaryColor : secondaryColor),
          title: Text(
            'Глава $index. ${step.name}',
            style: TextStyle(
                color: active || completed ? primaryColor : secondaryColor,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
