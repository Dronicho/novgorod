import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_map/src/domain/constants.dart';
import 'package:test_map/src/domain/models/user.dart' as models;
import 'package:test_map/src/domain/utils/point_info.dart';
import 'package:test_map/src/ui/home/screens/routes/bloc/player/player_bloc.dart';
import 'package:test_map/src/widgets/primary_button.dart';
import 'package:audio_session/audio_session.dart';

class DetailStepPage extends StatefulWidget {
  const DetailStepPage({Key? key, required this.step, required this.onComplete})
      : super(key: key);

  final models.Step step;
  final VoidCallback onComplete;

  @override
  _DetailStepPageState createState() => _DetailStepPageState();
}

class _DetailStepPageState extends State<DetailStepPage> {
  late FlutterTts _tts;
  late AudioPlayer player;
  late PlayerCubit bloc;

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    AudioSession.instance.then(
        (session) => session.configure(AudioSessionConfiguration.speech()));

    _tts = FlutterTts();
    player = AudioPlayer();
    bloc = context.read<PlayerCubit>();

    getApplicationDocumentsDirectory().then((value) => print(value));
    getTemporaryDirectory().then((value) => print(value));
    _tts
        .synthesizeToFile(widget.step.description, 'data.wav')
        .then((value) => print(value));

    _tts.setCompletionHandler(() {
      setState(() async {
        print('1234');
        var duration = await player.setFilePath(
            '/storage/emulated/0/Android/data/ru.origin_dev.novlegend/files/data.wav');
        print('duration');
        print(duration);
        bloc.setDuration(duration!);
        bloc.markReady();
        player.positionStream.listen((event) {
          bloc.setPosition(event);
        });
      });
    });
  }

  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.step.name),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6))),
                    context: context,
                    builder: (_) => BlocBuilder<PlayerCubit, AudioPlayerState>(
                          bloc: bloc,
                          builder: (context, state) {
                            print(state.duration);
                            return Container(
                              height: 300,
                              child: state.ready
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(children: [
                                        Container(
                                            height: 4,
                                            width: 100,
                                            color: Color(0xFF5B5B5B)),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(widget.step.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22)),
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '${twoDigits(state.position.inMinutes.remainder(60))}:${twoDigits(state.position.inSeconds.remainder(60))}',
                                                  style:
                                                      TextStyle(fontFeatures: [
                                                    FontFeature.liningFigures()
                                                  ])),
                                              Text(
                                                  '${twoDigits(state.duration!.inMinutes.remainder(60))}:${twoDigits(state.duration!.inSeconds.remainder(60))}',
                                                  style:
                                                      TextStyle(fontFeatures: [
                                                    FontFeature.liningFigures()
                                                  ]))
                                            ]),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        LinearProgressIndicator(
                                            color: Colors.black,
                                            backgroundColor:
                                                Colors.black.withOpacity(0.2),
                                            value: state.position.inSeconds /
                                                state.duration!.inSeconds),
                                        IconButton(
                                            onPressed: () {
                                              bloc.togglePlaying();

                                              if (state.playing) {
                                                player.pause();
                                              } else {
                                                player.play();
                                              }
                                            },
                                            icon: Icon(state.playing
                                                ? Icons.pause
                                                : Icons.play_arrow)),
                                      ]),
                                    )
                                  : Center(child: CircularProgressIndicator()),
                            );
                          },
                        ));
              },
              icon: Icon(Icons.volume_up))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: widget.step.photoUrl!),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.step.description),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  'Посетите ${widget.step.name}, чтобы продолжить наше путешествие.'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: PrimaryButton(
                onPressed: () {
                  showPointInfo(context, widget.step.point!);
                },
                child: Text('Подробнее'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: PrimaryButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                            body: GoogleMap(
                                initialCameraPosition: initialCameraPosition,
                                markers: {
                                  Marker(
                                      onTap: () {
                                        showPointInfo(
                                            context, widget.step.point!);
                                      },
                                      markerId: MarkerId(
                                          widget.step.point!.id! +
                                              widget.step.point!.name),
                                      position: widget.step.point!.coordinates
                                          .toLatLng())
                                },
                                onMapCreated: (controller) async {
                                  await controller.animateCamera(
                                      CameraUpdate.newLatLngZoom(
                                          widget.step.point!.coordinates
                                              .toLatLng(),
                                          15));
                                }),
                          )));
                },
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
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.onComplete();
                },
                child: Text('Я на месте!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
