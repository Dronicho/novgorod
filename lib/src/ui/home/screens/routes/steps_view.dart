import 'package:flutter/material.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/theme/color.dart';
import 'package:test_map/src/ui/home/screens/routes/detail_step_page.dart';
import 'package:test_map/src/widgets/primary_button.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({Key? key, required this.route}) : super(key: key);

  final models.Route route;

  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
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
              .map((e) => StepTile(step: e, active: e.name == _activeStep.name))
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
                    builder: (context) => DetailStepPage(step: _activeStep)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(child: Text(_activeStep.name)),
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
  const StepTile({Key? key, required this.step, this.active = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.location_on,
            color: active ? primaryColor : secondaryColor),
        title: Text(
          step.name,
          style: TextStyle(color: active ? primaryColor : secondaryColor),
        ));
  }
}
