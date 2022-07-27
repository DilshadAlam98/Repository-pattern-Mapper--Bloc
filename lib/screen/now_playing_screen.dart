import 'package:flutter/material.dart';
import 'package:mapper/bloc/now_playing_bloc.dart';
import 'package:mapper/model/now_playing.dart';
import 'package:mapper/state/now_playing_state.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({Key? key}) : super(key: key);

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  final nowPlayingBloc = NowPlayingBloc();

  @override
  void initState() {
    super.initState();
    nowPlayingBloc.getNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(100, 50),
          child: AppBar(
            title: const Text("Now Playing Screen"),
            centerTitle: true,
          ),
        ),
        body: StreamBuilder<NowPlayingState>(
          stream: nowPlayingBloc.nowPlayingState,
          builder: (context, snapshot) {
            NowPlayingState? state = snapshot.data;
            if (state?.isLoading() ?? false) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
              itemCount: state?.data?.results?.length ?? 0,
              itemBuilder: (context, index) {
                Results? movie = state?.data?.results![index];

                String? givenLink = "https://image.tmdb.org/t/p/original";
                String? post = movie?.posterPath;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 5,
                  shadowColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        child: Image.network(
                          givenLink + post!,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      descText(text: movie?.originalTitle, tittle: "Tittle"),
                      descText(text: movie?.overview, tittle: "Overview"),
                      descText(text: movie?.releaseDate, tittle: "ReleaseDate"),
                      descText(
                          text: movie?.voteCount.toString(), tittle: "Vote"),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          },
        ));
  }

  Widget descText({String? tittle, String? text}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.teal[100]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: Text(tittle!)),
            const Text(":"),
            const SizedBox(
              width: 5,
            ),
            Expanded(child: Text("$text"))
          ],
        ),
      ),
    );
  }
}
