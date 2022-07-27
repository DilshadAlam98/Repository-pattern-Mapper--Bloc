import 'package:mapper/mapper/now_playing_mapper.dart';
import 'package:mapper/model/now_playing.dart';
import 'package:mapper/source/api_source.dart';

class ApiRepository {
  final _apiSource = ApiSource();
  final _nowPlayingMapper = NowPlayingMapper();

  Stream<NowPlaying> getNowPlaying() {
    return _apiSource
        .getNowPlaying()

        /// getting now playing response from the API and converting into the now playing model class using mapper!!!
        .map((event) => _nowPlayingMapper.convert(event));
  }
}
