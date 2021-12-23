import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:audioplayer/models/file_model.dart';

import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;
import '/bloc/states.dart';
import '/screens/all_audios.dart';
import '/screens/favorites.dart';
import '/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:id3/id3.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomePage(),
    const AllAudios(),
    const Favorites(),
  ];
  int currentIndex = 0;

  changePages(int index) {
    currentIndex = index;
    emit(ChangeScreensState());
  }

  List<FileSystemEntity> files;
  List<FileSystemEntity> songs = [];

  getAllAudios() {
    Directory dir = Directory('/storage/emulated/0/');
    String mp3Path = dir.toString();
    if (kDebugMode) {
      print(mp3Path);
    }

    files = dir.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in files) {
      String path = entity.path;
      if (path.endsWith('.mp3')) songs.add(entity);
    }
    if (kDebugMode) {
      print(songs);
      print(songs.length);
    }
  }

  Map<String, dynamic> getFileInfo({String fileName}) {
    List<int> mp3Bytes = File(fileName).readAsBytesSync();
    MP3Instance mp3instance = MP3Instance(mp3Bytes);
    if (mp3instance.parseTagsSync()) {
      if (kDebugMode) {
        print(mp3instance.getMetaTags());
      }
    }
    return {
      "Title": "SongName",
      "Artist": "ArtistName",
      "Album": "AlbumName",
      "APIC": {
        "mime": "image/jpeg",
        "textEncoding": "0",
        "picType": "0",
        "description": "description",
        "base64": "AP/Y/+AAEEpGSUYAAQEBAE..."
      }
    };
  }

  List<String> maroon5 = [
    'images/maroon1.jpg',
    'images/maroon2.jpg',
    'images/maroon3.jpg',
    'images/maroon4.jpg',
  ];
  List<String> taylor = [
    'images/taylor1.jpg',
    'images/taylor2.jpg',
    'images/taylor3.jpg',
    'images/taylor4.jpg',
  ];
  List<String> minaj = [
    'images/minaj1.jpg',
    'images/minaj2.jpg',
    'images/minaj3.png',
    'images/minaj4.jpg',
  ];
  List<String> snoop = [
    'images/snoop1.jpg',
    'images/snoop2.jpg',
    'images/snoop3.jpg',
    'images/snoop4.jpg',
  ];
  List<String> flo = [
    'images/flo1.jpg',
    'images/flo2.jpg',
    'images/flo3.jpg',
    'images/flo4.jpg',
  ];
  List<String> miley = [
    'images/miley1.jpg',
    'images/miley2.png',
    'images/miley3.jpg',
    'images/miley4.jpg',
  ];

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState playerState = PlayerState.PAUSED;
  AudioCache audioCache;

  playAudio({String path}) async {
    await audioPlayer.play(path, isLocal: true);
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }

  List favorites = [];

  addToFavorites({FileSystemEntity fileName}) {
    favorites.add(fileName);

    emit(AddToFavoritesState());
  }

  removeFromFavorites({int index}) {
    favorites.removeAt(index);
    emit(RemoveFromFavoritesState());
  }

  /// Generates a 200x200 png, with randomized colors, to use as art for the
  /// notification/lockscreen.
  static Future<Uint8List> generateImageBytes() async {
    // Random color generation methods: pick contrasting hues.
    final Random random = Random();
    final double bgHue = random.nextDouble() * 360;
    final double fgHue = (bgHue + 180.0) % 360;
    final HSLColor bgHslColor =
        HSLColor.fromAHSL(1.0, bgHue, random.nextDouble() * .5 + .5, .5);
    final HSLColor fgHslColor =
        HSLColor.fromAHSL(1.0, fgHue, random.nextDouble() * .5 + .5, .5);

    const Size size = Size(200.0, 200.0);
    const Offset center = Offset(100.0, 100.0);
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Rect rect = Offset.zero & size;
    final Canvas canvas = Canvas(recorder, rect);
    final Paint bgPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = bgHslColor.toColor();
    final Paint fgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = fgHslColor.toColor()
      ..strokeWidth = 8;
    // Draw background color.
    canvas.drawRect(rect, bgPaint);
    // Draw 5 inset squares around the center.
    for (int i = 0; i < 5; i++) {
      canvas.drawRect(
          Rect.fromCenter(center: center, width: i * 40.0, height: i * 40.0),
          fgPaint);
    }
    // Render to image, then compress to PNG ByteData, then return as Uint8List.
    final ui.Image image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final ByteData encodedImageData =
        (await image.toByteData(format: ui.ImageByteFormat.png));
    return encodedImageData.buffer.asUint8List();
  }

  void getFileMetaData({String filePath}) async {
    var metadata = await MetadataRetriever.fromFile(File(filePath));
    if (kDebugMode) {
      print(metadata.albumArtistName);
    }
  }
}
