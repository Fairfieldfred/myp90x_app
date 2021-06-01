import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayer extends StatefulWidget {

  @override
  _YouTubePlayerState createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayer> {
   YoutubePlayerController _controller = YoutubePlayerController(
     initialVideoId: '-Mbr55h3BeQ',
     flags: YoutubePlayerFlags(
       autoPlay: true,
       mute: false,
     )
   );

  @override
  Widget build(BuildContext context) {

    return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
    );
  }

}
