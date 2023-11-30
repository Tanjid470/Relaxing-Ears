import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_image.dart';
import 'package:musicapp/constants/app_music.dart';

class MusicPlayerController extends GetxController {
  int pointer = 0;
  int timerSet = 0;
  late AudioPlayer player;
  late AudioPlayer preloadedPlayer;

  MusicPlayerController() {
    player = AudioPlayer();
    preloadedPlayer = AudioPlayer();
  }
  void switchToPreloadedPlayer() {
    if (player.state == PlayerState.playing) {
      player.pause();
      player = preloadedPlayer;
      preloadedPlayer = AudioPlayer();
    }
  }
  void switchToRegularPlayer() {
    if (preloadedPlayer.state == PlayerState.playing) {
      preloadedPlayer.pause();
      preloadedPlayer = player;
      player = AudioPlayer();
    }
  }

  //AppImage + Title
  Map<String, String> images = {
    AppImage.forest: 'Forest',
    AppImage.rain: 'Rain',
    AppImage.innerTranquility: 'Inner Tranquility',
    AppImage.peacefulPiano: 'Peaceful Piano',
    AppImage.soothingSerenity: 'Soothing Serenity',
    AppImage.gentleMelodies: 'Gentle Melodies',
    AppImage.calmOasis: 'Calm Oasis',
    AppImage.peacefulNature: 'Peaceful Nature',
    AppImage.restfulRhythms: 'Restful Rhythms',
    AppImage.birds: 'Birds',
    AppImage.springBirds: 'Spring Birds',
    AppImage.cat: 'Cat',
    AppImage.crickets: 'Crickets',
    AppImage.fireFlies: 'Fireflies',
    AppImage.campFire: 'Campfire',
    AppImage.firePlace: 'Fire place',
    AppImage.flowingRiver: 'Flowing River',
    AppImage.gentleWater: 'Gentle Water',
    AppImage.forestRain: 'Forest Rain',
    AppImage.heavyRain: 'Heavy Rain',
    AppImage.heavyRainandThunderstorm: 'Rain and Thunderstorm',
    AppImage.lightRain: 'Light Rain',
    AppImage.mediumRain: 'Medium Rain',
    AppImage.oceanFarAway: 'Ocean Far Away',
    AppImage.calmOcean: 'Calm Ocean',
    AppImage.silentBeach: 'Silent Beach',
    AppImage.guitar: 'Guitar',
    AppImage.kalimba: 'Kalimba',
    AppImage.musicBox: 'Music Box',
    AppImage.windChimes: 'Wind Chimes',
  };
    Map<String, String> musics = {
    AppMusic.forest: "Into the forest I go, to lose my mind and find my soul",
    AppMusic.rain: "Feel every drop of rain and clam your mind",
    AppMusic.innerTranquility:
        "Find your inner peace in the stillness of the melody",
    AppMusic.peacefulPiano:
        'Let the gentle notes wash away your worries and lull you to sleep',
    AppMusic.soothingSerenity:
        'Drift into a blissful slumber on the calm waves of sound',
    AppMusic.gentleMelodies: 'Float away on a cloud of melodies to find peace',
    AppMusic.calmOasis: 'Step into a calm oasis, where your spirit can soar',
    AppMusic.peacefulNature: 'Surrender to the peaceful rhythms of nature',
    AppMusic.restfulRhythms:
        'Let the rhythms lull you into a slumber as sweet as night itself',
    AppMusic.birds: 'Melodies of feathered friends',
    AppMusic.springBirds: 'A chorus of joy, heralding the season\'s rebirth',
    AppMusic.cat: 'Purrfectly soothing feline serenades',
    AppMusic.crickets: 'Nature\'s lullaby, chirping sweet and low',
    AppMusic.fireFlies: 'Enchanted twinkles of nature\'s symphony',
    AppMusic.campFire: 'Crackling flames, igniting memories and warmth',
    AppMusic.firePlace: 'A cozy symphony of flickering flames and crackling embers',
    AppMusic.flowingRiver: 'A meandering melody, carrying the stories of the land',
    AppMusic.gentleWater: 'A soothing ripple, washing away your cares',
    AppMusic.forestRain: 'A soothing cascade of nature\'s tears, cleansing and revitalizing',
    AppMusic.heavyRain: 'A rhythmic tamborine, drumming away your worries',
    AppMusic.heavyRainandThunderstorm: 'A tempestuous symphony, unleashing nature\'s raw power',
    AppMusic.lightRain: 'A gentle caress of raindrops, whispering secrets to the earth',
    AppMusic.mediumRain: 'A rhythmic lullaby, pattering on the rooftops',
    AppMusic.oceanFarAway: 'A distant lullaby, echoing across the vast expanse',
    AppMusic.calmOcean: 'A symphony of gentle waves, lapping at the shores of tranquility',
    AppMusic.silentBeach: 'Where the ocean\'s murmurs meet the whisper of the sand',
    AppMusic.guitar: 'Soulful strums, weaving tales of love and longing',
    AppMusic.kalimba: 'African melodies, dancing on fingertips',
    AppMusic.musicBox: 'A delicate waltz of timeless charm',
    AppMusic.windChimes: 'Whispering whispers, carried on the breeze',
  };

  // AudioPlayer player = AudioPlayer();
  AudioCache audioCache = AudioCache();
  // FixedPlayer player = FixedPlayer();

  bool isPlaying = false;
}
