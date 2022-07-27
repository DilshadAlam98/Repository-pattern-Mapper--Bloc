import 'package:mapper/base/base_ui_state.dart';
import 'package:mapper/model/now_playing.dart';

class NowPlayingState extends BaseUiState<NowPlaying> {
  NowPlayingState.loading() : super.loading();

  NowPlayingState.completed(NowPlaying data) : super.completed(data: data);
  NowPlayingState.error(dynamic error) : super.error(error);
}
