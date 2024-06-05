import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video; // 처음에 null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: video != null
          ? _VideoPlayer(
              video: video!, onAnotherVideoPicked: onLogoTap) //  null이 아님
          : _VideoSelector(
              onLogoTap: onLogoTap,
            ),
    );
  }

  onLogoTap() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    setState(() {
      this.video = video;
    });
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;

  const _Logo({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'asset/image/logo.png',
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 32.0,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'VIDEO',
          style: textStyle,
        ),
        Text(
          'PLAYER',
          style: textStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _VideoSelector extends StatelessWidget {
  final VoidCallback onLogoTap;
  const _VideoSelector({
    super.key,
    required this.onLogoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // stops: [0,1,], // 색이 변경되는 단계
        colors: [
          Color(0xFF2A3A7C),
          Color(0xFF000118),
        ],
      )
          // gradient: RadialGradient(
          //   center: Alignment.bottomLeft,
          //   radius:3,
          //   colors: [
          //     Colors.red,
          //     Colors.green,
          //   ],
          // ),
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(onTap: onLogoTap),
          SizedBox(
            height: 28.0,
          ),
          _Title(),
        ],
      ),
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onAnotherVideoPicked;

  const _VideoPlayer({
    super.key,
    required this.video,
    required this.onAnotherVideoPicked,
  });

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController videoPlayerController;
  // late final 지금당장 초기화 하지 않고, 컨트롤러 사용하기 전에 초기화되도록함
  // null타입을 사용하지 않고 선언한 위치에서 초기화하고 싶지 않은 경우 시용
  bool showIcons = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniitializeController();
  }

  @override
  didUpdateWidget(covariant _VideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.video.path != widget.video.path) {
      // 이전 비디오와 현재 비디오가 다르면 다시 컨트롤러 초기화
      iniitializeController();
    }
  }

  iniitializeController() async {
    videoPlayerController = VideoPlayerController.file(
      File(
        widget.video.path, // 선택한 영상의 경로, 어떤 영상인지 명시
      ),
    );

    await videoPlayerController.initialize(); // 위 선택한 영상으로 초기화
    videoPlayerController.addListener(() {
      // 비디오 플레이어 컨트롤러 변경(재생, 정지)될 때마다 콜백함수 실행
      setState(() {});
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){setState(() {
        showIcons = !showIcons;
      });},
      child: Center(
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio, // 비디오의 원래 비율로 적용
          child: Stack(children: [
            //Stack 에 넣은 순서대로 쌓임
            VideoPlayer(videoPlayerController),
            if(showIcons)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(.3),
            ),
            if(showIcons)
            _PlayButtons(
              onReversePressed: onReversePressed,
              onPlayPressed: onPlayPressed,
              onForwardPressed: onForwardPressed,
              isPlaying: videoPlayerController.value.isPlaying,
            ),
            if(showIcons)
            _Bottom(
              position: videoPlayerController.value.position,
              maxPosition: videoPlayerController.value.duration,
              onSlideChanged: onSlideChanged,
            ),
            if(showIcons)
            _PickAnotherVideo(onPressed: widget.onAnotherVideoPicked),

          ]),
        ),
      ),
    );
  }

  onReversePressed() {
    final currentPosition = videoPlayerController.value.position;

    Duration position = Duration(); // 새로 이동할 포지션으로 초기화
    if (currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3);
    }

    videoPlayerController.seekTo(position);
  }

  onPlayPressed() {
    setState(() {
      if (videoPlayerController.value.isPlaying) {
        videoPlayerController.pause();
      } else {
        videoPlayerController.play();
      }
    });
  }

  onForwardPressed() {
    final maxPostion = videoPlayerController.value.duration;
    final currentPosition = videoPlayerController.value.position;

    Duration position = maxPostion; // 최대 길이로 초기화
    if ((maxPostion - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }

    videoPlayerController.seekTo(position);
  }

  onSlideChanged(double val) {
    final position = Duration(seconds: val.toInt());

    videoPlayerController.seekTo(position);
  }
}

class _PlayButtons extends StatefulWidget {
  final VoidCallback onReversePressed;
  final VoidCallback onPlayPressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _PlayButtons({
    super.key,
    required this.onReversePressed,
    required this.onPlayPressed,
    required this.onForwardPressed,
    required this.isPlaying,
  });

  @override
  State<_PlayButtons> createState() => _PlayButtonsState();
}

class _PlayButtonsState extends State<_PlayButtons> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: widget.onReversePressed,
            icon: Icon(Icons.rotate_left),
            color: Colors.white,
          ),
          IconButton(
            onPressed: widget.onPlayPressed,
            icon: Icon(widget.isPlaying ? Icons.pause : Icons.play_arrow),
            color: Colors.white,
          ),
          IconButton(
            onPressed: widget.onForwardPressed,
            icon: Icon(Icons.rotate_right),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  final Duration position; //videoPlayerController.value.position
  final Duration maxPosition;
  final ValueChanged<double> onSlideChanged;
  const _Bottom({
    super.key,
    required this.position,
    required this.maxPosition,
    required this.onSlideChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(
          children: [
            Text(
              '${position.inMinutes.toString().padLeft(2, '0')}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Slider(
                value: position.inSeconds.toDouble(),
                max: maxPosition.inSeconds.toDouble(),
                onChanged: onSlideChanged,
              ),
            ),
            Text(
              '${maxPosition.inMinutes.toString().padLeft(2, '0')}:${(maxPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PickAnotherVideo extends StatelessWidget {
  final VoidCallback onPressed;
  const _PickAnotherVideo({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.photo_camera_back_outlined),
        color: Colors.white,
      ),
    );
  }
}
