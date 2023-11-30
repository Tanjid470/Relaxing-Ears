import 'package:get/get.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:hive/hive.dart';

class FaveritesController extends GetxController {
  // Box name for Hive
  static const String boxName = 'favMusic';

  Set<int> favoriteList = {};

  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());

  // Initialize favoriteList from Hive box when controller is created
  @override
  void onInit() async {
    await _loadFavoriteListFromHive();
    super.onInit();
  }

  // Fetch favoriteList from Hive box
  Future<void> _loadFavoriteListFromHive() async {
    final Box<dynamic> hiveBox = await Hive.openBox(boxName);
    if (hiveBox.containsKey('favoriteList')) {
      favoriteList = Set<int>.from(hiveBox.get('favoriteList'));
      update(); // Notify listeners about the change
      print('FavoriteList on app open: $favoriteList');
    }
  }

  // Save favoriteList to Hive box
  Future<void> _saveFavoriteListToHive() async {
    final Box<dynamic> hiveBox = await Hive.openBox(boxName);
    await hiveBox.put('favoriteList', favoriteList.toList());
  }

  // Print the contents of the Hive box
  Future<void> printHiveBoxContents() async {
    final Box<dynamic> hiveBox = await Hive.openBox(boxName);
    print('Contents of $boxName Hive box: ${hiveBox.toMap()}');
  }

  // Add item to favoriteList
  void favoAdded(int index) {
    favoriteList.add(index);
    _saveFavoriteListToHive(); // Update Hive box
    update(); // Notify listeners about the change
    printHiveBoxContents(); // Print Hive box contents
  }

  // Clear all items from favoriteList
  void favoDelete() {
    favoriteList.clear();
    _saveFavoriteListToHive(); // Update Hive box
    update(); // Notify listeners about the change
    printHiveBoxContents(); // Print Hive box contents
  }

  // Remove one item from favoriteList
  void favOneDelete(int index) {
    favoriteList.remove(index);
    _saveFavoriteListToHive(); // Update Hive box
    update(); // Notify listeners about the change
    printHiveBoxContents(); // Print Hive box contents
  }

}
