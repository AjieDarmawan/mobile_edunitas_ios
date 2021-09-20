part of 'widget_home.dart';

class ProfilVideoYoutube extends StatefulWidget {
  final String videoyoutube;
  ProfilVideoYoutube({
    this.videoyoutube,
  });

  @override
  _ProfilVideoYoutubeState createState() => _ProfilVideoYoutubeState();
}

class _ProfilVideoYoutubeState extends State<ProfilVideoYoutube> {
  static String videoId;

  @override
  void initState() {
    super.initState();

    videoId = widget.videoyoutube == null ? '2kHtQPeMXm8' : widget.videoyoutube;
  }

  // YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: videoId,
  //   flags: YoutubePlayerFlags(
  //     autoPlay: false,
  //     mute: false,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(videoId),
          // YoutubePlayer(
          //   controller: _controller,
          //   liveUIColor: Colors.amber,
          //   showVideoProgressIndicator: true,
          // ),
        ],
      ),
    );
  }
}
