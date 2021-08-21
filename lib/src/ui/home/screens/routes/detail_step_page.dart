import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/widgets/primary_button.dart';

class DetailStepPage extends StatelessWidget {
  final models.Step step;

  const DetailStepPage({Key? key, required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(step.name),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.volume_up))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: step.photoUrl!),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(step.description),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  'Посетите ${step.name}, чтобы продолжить наше путешествие.'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: PrimaryButton(
                onPressed: () {},
                child: Text('Подробнее'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: PrimaryButton(
                onPressed: () {},
                child: Text('Показать на карте'),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: PrimaryButton.success(
                onPressed: () {},
                child: Text('Я на месте!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
