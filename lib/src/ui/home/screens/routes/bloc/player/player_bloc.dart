import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerCubit extends Cubit<AudioPlayerState> {
  PlayerCubit() : super(AudioPlayerState(false, null, Duration.zero, false));

  void markReady() {
    emit(state.copyWith(ready: true));
  }

  void setDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }

  void setPosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void togglePlaying() {
    emit(state.copyWith(playing: !state.playing));
  }
}

class AudioPlayerState extends Equatable {
  final bool ready;
  final bool playing;
  final Duration? duration;
  final Duration position;

  AudioPlayerState(this.ready, this.duration, this.position, this.playing);

  AudioPlayerState copyWith(
          {bool? ready,
          Duration? duration,
          Duration? position,
          bool? playing}) =>
      AudioPlayerState(ready ?? this.ready, duration ?? this.duration,
          position ?? this.position, playing ?? this.playing);

  @override
  List<Object?> get props => [ready, duration, position, playing];
}
