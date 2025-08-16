import 'dart:io';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AssetVideoPlayer extends StatefulWidget {
  final String assetPath;

  const AssetVideoPlayer({super.key, required this.assetPath});

  @override
  State<AssetVideoPlayer> createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<AssetVideoPlayer> {
  late Future<BetterPlayerController> _controllerFuture;

  @override
  void initState() {
    super.initState();
    _controllerFuture = _initializePlayer();
  }

  Future<BetterPlayerController> _initializePlayer() async {
    final byteData = await rootBundle.load(widget.assetPath);
    final tempDir = await getTemporaryDirectory();
    final tempFile = File(
      '${tempDir.path}/${widget.assetPath.split('/').last}',
    );

    if (!await tempFile.exists()) {
      await tempFile.writeAsBytes(byteData.buffer.asUint8List());
    }

    return BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,
        aspectRatio: 16 / 9,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          enableSkips: true,
          enableFullscreen: true,
          enableMute: true,
          enableProgressText: true,
        ),
      ),
      betterPlayerDataSource: BetterPlayerDataSource.file(tempFile.path),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controllerFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Failed to load video'));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer(controller: snapshot.data!),
        );
      },
    );
  }

  @override
  void dispose() {
    _controllerFuture.then((controller) => controller.dispose());
    super.dispose();
  }
}
