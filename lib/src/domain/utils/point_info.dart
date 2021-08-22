import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/ui/home/screens/map/find_route/find_route.dart';
import 'package:test_map/src/widgets/primary_button.dart';

Future<dynamic> showPointInfo(BuildContext context, models.Point point,
    [bool showControls = false]) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) =>
          PointInfo(point: point, showControls: showControls));
}

class PointInfo extends StatefulWidget {
  final models.Point point;
  final bool showControls;

  const PointInfo({Key? key, required this.point, this.showControls = false})
      : super(key: key);

  @override
  _PointInfoState createState() => _PointInfoState();
}

class _PointInfoState extends State<PointInfo> {

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.25,
        minChildSize: 0.1,
        builder: (context, sc) => SafeArea(
              child: SingleChildScrollView(
                controller: sc,
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.point.name,
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      if (widget.point.photoUrl != null &&
                          widget.point.photoUrl!.isNotEmpty)
                        CachedNetworkImage(imageUrl: widget.point.photoUrl!),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        children: widget.point.tags!
                            .map((t) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: PrimaryChip(label: t),
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text((widget.point.description) ?? ''),
                      ),
                      SizedBox(height: 16),
                      if (widget.showControls)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PrimaryButton(
                              onPressed: () {},
                              child: Text('Проложить маршрут')),
                        ),
                      if (widget.showControls)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PrimaryButton(
                              onPressed: () {}, child: Text('Я на месте')),
                        )
                    ],
                  ),
                ),
              ),
            ));
  }
}
