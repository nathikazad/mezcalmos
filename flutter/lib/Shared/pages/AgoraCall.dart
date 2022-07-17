// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/controllers/Agora/agoraController.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

// class AgoraCallScreen extends StatelessWidget {
//   AgoraCallScreen({Key? key}) : super(key: key);

//   // later on inject it with authHook probably
//   final Sagora _sagoraController = Get.put<Sagora>(Sagora());
//   final TextEditingController _controller = TextEditingController();

// // Display remote user's video
//   Widget _remoteVideo() {
//     if (AgoraConfig.uid.value != null) {
//       return RtcRemoteView.SurfaceView(
//         uid: AgoraConfig.uid.value!,
//         channelId: AgoraConfig.channelId,
//       );
//     } else {
//       return Text(
//         'Please wait for remote user to join',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agora Video Call'),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: _remoteVideo(),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Container(
//               width: 100,
//               height: 150,
//               child: Center(
//                 child: _sagoraController.isJoined.value
//                     ? RtcLocalView.SurfaceView()
//                     : CircularProgressIndicator(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(),
//   //     body: Stack(
//   //       children: [
//   //         // Center(
//   //         //   child: _remoteVideo(),
//   //         // ),
//   //         Align(
//   //           alignment: Alignment.topLeft,
//   //           child: Container(
//   //             width: 100,
//   //             height: 150,
//   //             child: Center(
//   //               child: _sagoraController.isJoined.value
//   //                   ? RtcLocalView.SurfaceView()
//   //                   : CircularProgressIndicator(),
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),

//   // body: Stack(
//   //   children: <Widget>[
//   //     Column(
//   //       children: <Widget>[
//   //         TextField(
//   //           controller: _controller,
//   //           decoration: const InputDecoration(hintText: 'Channel ID'),
//   //         ),
//   //         Row(
//   //           children: <Widget>[
//   //             Expanded(
//   //               flex: 1,
//   //               child: ElevatedButton(
//   //                 onPressed: _sagoraController.isJoined.value
//   //                     ? _sagoraController.leaveChannel
//   //                     : _sagoraController.joinChannel,
//   //                 child: Text(
//   //                   '${_sagoraController.isJoined.value ? 'Leave' : 'Join'} channel',
//   //                 ),
//   //               ),
//   //             )
//   //           ],
//   //         ),
//   //       ],
//   //     ),
//   //     Align(
//   //       alignment: Alignment.bottomRight,
//   //       child: Padding(
//   //         child: Column(
//   //           mainAxisSize: MainAxisSize.min,
//   //           crossAxisAlignment: CrossAxisAlignment.end,
//   //           children: <Widget>[
//   //             ElevatedButton(
//   //               onPressed: _sagoraController.switchMicrophone,
//   //               child: Text(
//   //                   'Microphone ${_sagoraController.openMicrophone.value ? 'on' : 'off'}'),
//   //             ),
//   //             ElevatedButton(
//   //               onPressed: _sagoraController.isJoined.value
//   //                   ? _sagoraController.switchSpeakerphone
//   //                   : null,
//   //               child: Text(
//   //                 _sagoraController.enableSpeakerphone.value
//   //                     ? 'Speakerphone'
//   //                     : 'Earpiece',
//   //               ),
//   //             ),
//   //             if (!kIsWeb)
//   //               ElevatedButton(
//   //                 onPressed: _sagoraController.isJoined.value
//   //                     ? _sagoraController.switchEffect
//   //                     : null,
//   //                 child: Text(
//   //                   '${_sagoraController.playEffect.value ? 'Stop' : 'Play'} effect',
//   //                 ),
//   //               ),
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.end,
//   //               children: <Widget>[
//   //                 const Text('RecordingVolume:'),
//   //                 Slider(
//   //                   value: _sagoraController.recordingVolume.value,
//   //                   min: 0,
//   //                   max: 400,
//   //                   divisions: 5,
//   //                   label: 'RecordingVolume',
//   //                   onChanged: _sagoraController.isJoined.value
//   //                       ? (double value) {
//   //                           _sagoraController.recordingVolume.value = value;
//   //                           _sagoraController.engine
//   //                               .adjustRecordingSignalVolume(value.toInt());
//   //                         }
//   //                       : null,
//   //                 )
//   //               ],
//   //             ),
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.end,
//   //               children: [
//   //                 const Text('PlaybackVolume:'),
//   //                 Slider(
//   //                   value: _sagoraController.playbackVolume.value,
//   //                   min: 0,
//   //                   max: 400,
//   //                   divisions: 5,
//   //                   label: 'PlaybackVolume',
//   //                   onChanged: _sagoraController.isJoined.value
//   //                       ? (double value) {
//   //                           _sagoraController.playbackVolume.value = value;
//   //                           _sagoraController.engine
//   //                               .adjustPlaybackSignalVolume(value.toInt());
//   //                         }
//   //                       : null,
//   //                 )
//   //               ],
//   //             ),
//   //             Column(
//   //               mainAxisSize: MainAxisSize.min,
//   //               crossAxisAlignment: CrossAxisAlignment.end,
//   //               children: <Widget>[
//   //                 Row(mainAxisSize: MainAxisSize.min, children: [
//   //                   const Text('InEar Monitoring Volume:'),
//   //                   Switch(
//   //                     value: _sagoraController.enableInEarMonitoring.value,
//   //                     onChanged: _sagoraController.isJoined.value
//   //                         ? _sagoraController.toggleInEarMonitoring
//   //                         : null,
//   //                     activeTrackColor: Colors.grey[350],
//   //                     activeColor: Colors.white,
//   //                   )
//   //                 ]),
//   //                 if (_sagoraController.enableInEarMonitoring.value)
//   //                   SizedBox(
//   //                       width: 300,
//   //                       child: Slider(
//   //                         value:
//   //                             _sagoraController.inEarMonitoringVolume.value,
//   //                         min: 0,
//   //                         max: 100,
//   //                         divisions: 5,
//   //                         label:
//   //                             'InEar Monitoring Volume ${_sagoraController.inEarMonitoringVolume.value}',
//   //                         onChanged: _sagoraController.isJoined.value
//   //                             ? _sagoraController
//   //                                 .onChangeInEarMonitoringVolume
//   //                             : null,
//   //                       ))
//   //               ],
//   //             ),
//   //           ],
//   //         ),
//   //         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
//   //       ),
//   //     )
//   //   ],
//   // ),
//   //   );
//   // }
// }

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/Agora/agoraController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CallPage extends StatefulWidget {
  /// non-modifiable channel name of the page
  final String? channelName;

  /// non-modifiable client role of the page
  final ClientRole? role;

  /// Creates a call page with given channel name.
  const CallPage({Key? key, this.channelName, this.role}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  late RtcEngine _engine;

  @override
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // initialize agora sdk
    initialize();
  }

  Future<void> initialize() async {
    if (AgoraConfig.appId.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await _engine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(AgoraConfig.token, 'mezcalmos', null, 0);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(AgoraConfig.appId);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role!);
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    }, leaveChannel: (stats) {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    }, userJoined: (uid, elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _infoStrings.add(info);
        _users.add(uid);
      });
    }, userOffline: (uid, elapsed) {
      setState(() {
        final info = 'userOffline: $uid';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    }));
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    _users.forEach(
      (int uid) {
        mezDbgPrint("ForEach ==> uid:$uid");
        list.add(
          RtcRemoteView.SurfaceView(
            uid: AgoraConfig.uid.value!,
            channelId: AgoraConfig.channelId,
          ),
        );
      },
    );
    return list;
  }

  /// Video view wrapper
  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  /// Video view row wrapper
  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[_videoView(views[0])],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  /// Toolbar layout
  Widget _toolbar() {
    if (widget.role == ClientRole.Audience) return Container();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  /// Info panel to show logs
  Widget _panel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: _infoStrings.length,
            itemBuilder: (BuildContext context, int index) {
              if (_infoStrings.isEmpty) {
                return Text(
                    "null"); // return type can't be null, a widget was required
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          _infoStrings[index],
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agora Flutter QuickStart'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            _viewRows(),
            _panel(),
            _toolbar(),
          ],
        ),
      ),
    );
  }
}
