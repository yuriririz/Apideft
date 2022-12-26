// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_deaf/models/ContentModel.dart';
import 'package:app_deaf/utils/App_constant.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoYoutube extends StatefulWidget {
  const VideoYoutube({
    Key? key,
    required this.contentModel,
  }) : super(key: key);

  final ContentModel contentModel;

  @override
  State<VideoYoutube> createState() => _VideoYoutubeState();
}

class _VideoYoutubeState extends State<VideoYoutube> {
  String testVideoYoutube = 'https://www.youtube.com/watch?v=xDOk0ELS2bc';
  String? initiaVideoId;
  YoutubePlayerController? youtubePlayerController;
  bool haveError = false;

  @override
  void initState() {
    super.initState();
    setUpYoutube();
  }

  void setUpYoutube() {
    try {
      initiaVideoId = YoutubePlayer.convertUrlToId(widget.contentModel.video);
      print('initiaVideo --> $initiaVideoId');

      youtubePlayerController = YoutubePlayerController(
          initialVideoId: initiaVideoId!,
          flags: YoutubePlayerFlags(autoPlay: true, mute: true));
    } catch (e) {
      //error
      setState(() {
        haveError = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: haveError
          ? Center(child: Text('ไม่สามารถเปิดวีดิโอนี้ได้'))
          : YoutubePlayer(
              controller: youtubePlayerController!,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                  playedColor: AppConstant.bgColor,
                  handleColor: AppConstant.lightColor),
              onReady: () {
                youtubePlayerController!.addListener(() {});
              },
            ),
    );
  }
}
