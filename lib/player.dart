import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String? youtubeUrl;
  const CustomYoutubePlayer(this.youtubeUrl);

  @override
  _CustomYoutubePlayerState createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayerController.convertUrlToId(widget.youtubeUrl!)!,
        params: const YoutubePlayerParams(
          loop: true,
          showControls: false,
          showVideoAnnotations: false,
          strictRelatedVideos: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _controller.hideTopMenu();
    return SizedBox(
      height: kIsWeb ? screenSize.height / 1.13 : screenSize.height,
      width: screenSize.width,
      child: YoutubePlayerControllerProvider(
        controller: _controller,
        child: YoutubePlayerIFrame(),
      ),
    );
  }
}
