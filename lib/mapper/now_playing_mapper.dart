import 'package:mapper/base/base_mapper.dart';
import 'package:mapper/model/now_playing.dart';
import 'package:mapper/res/now_playing_res.dart';

class NowPlayingMapper extends BaseMapper<NowPlayingRes, NowPlaying> {
  @override
  NowPlaying convert(NowPlayingRes t) {
    return NowPlaying(
        dates: t.dates,
        page: t.page,
        results: t.results,
        totalPages: t.totalPages,
        totalResults: t.totalResults);
  }
}
