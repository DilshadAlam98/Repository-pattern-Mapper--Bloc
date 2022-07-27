import 'package:mapper/base/rest_client.dart';
import 'package:mapper/res/now_playing_res.dart';

class ApiSource {
  final _client = RestClient();

  Stream<NowPlayingRes> getNowPlaying() {
    return Stream.fromFuture(_client.dio.get("/now_playing", queryParameters: {
      "page": 1,
      "api_key": "0e7274f05c36db12cbe71d9ab0393d47"
    })).map((event) => NowPlayingRes.fromJson(event.data));
  }
}
