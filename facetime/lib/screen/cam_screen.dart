import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:facetime/const/keys.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({super.key});

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine;
  int? uid = 0; // 0 인경우 아고라에서 랜덤하게 uid를 지정해줌
  int? remoteUid;

  Future<void> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다.';
    }

    if (engine == null) {
      engine = createAgoraRtcEngine();

      await engine!.initialize(
        RtcEngineContext(
          appId: appId,
        ),
      );

      engine!.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            // 내가 채널에 들어갔을 때 연결정보와 시간
          },
          onLeaveChannel: (RtcConnection connection, RtcStats stauts) {
            // 내가 채널에서 나갔을 때 작동
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            print('---user joined---');
            setState(() {
              this.remoteUid = remoteUid;
            });
          },
          onUserOffline: (
              RtcConnection connection, // 연결정보
              int remoteUid, // 상대방이 오프라인 시
              UserOfflineReasonType reason,
              ) {
            setState(() {
              this.remoteUid = null;
            });
          },
        ),
      );

      await engine!.enableVideo(); // 엔진 시작
      await engine!.startPreview(); // 미리보기 시작

      ChannelMediaOptions options = ChannelMediaOptions();

      await engine!.joinChannel(
        token: token,
        channelId: channelName,
        uid: uid!,
        options: options,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<void>(
        future: init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return Stack(
            children: [
              Container(
                child: renderMainView(),
              ),
              Container(
                width: 120.0,
                height: 160.0,
                child: AgoraVideoView(
                  controller: VideoViewController(
                    rtcEngine: engine!,
                    canvas: VideoCanvas(
                      uid: uid,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 80.0,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 66,
                    height: 66,
                    child: ElevatedButton(
                      onPressed: () {
                        // 엔진 종료
                        engine!.leaveChannel();
                        engine!.release();
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Icon(
                          Icons.call,
                          size: 30.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEB4E3D),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  renderMainView() {
    if (remoteUid == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: engine!,
        canvas: VideoCanvas(
          uid: remoteUid,
        ),
        connection: RtcConnection(
          channelId: channelName,
        ),
      ),
    );
  }
}
