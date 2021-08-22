import 'package:flutter/material.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/theme/color.dart';
import 'package:test_map/src/ui/home/screens/routes/routes_view.dart';

class CompleteRoutePage extends StatelessWidget {
  final models.Route route;

  const CompleteRoutePage({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: null, title: Text('Вы преодолели маршрут!')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Поздравляем! Ещё одно путешествие в вашей копилке!'),
            ),
            Expanded(
              child: Stack(
                children: [
                  RouteCard(route: route),
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text('+${route.exp} XP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
