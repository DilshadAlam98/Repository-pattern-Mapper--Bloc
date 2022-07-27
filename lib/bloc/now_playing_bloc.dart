import 'package:mapper/base/base_bloc.dart';
import 'package:mapper/repo/api_repository.dart';
import 'package:mapper/state/now_playing_state.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingBloc extends BaseBloc {
  final _apiRepo = ApiRepository();
  final nowPlayingState = BehaviorSubject<NowPlayingState>();

  void getNowPlaying() {
    nowPlayingState.add(NowPlayingState.loading());
    subscription.add(_apiRepo
        .getNowPlaying()
        .map((event) => NowPlayingState.completed(event))
        .onErrorReturnWith((error, stackTrace) => NowPlayingState.error(error))
        .startWith(NowPlayingState.loading())
        .listen((state) {
      nowPlayingState.add(state);
    }));
  }
}
