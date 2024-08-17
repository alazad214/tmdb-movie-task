import 'package:get/get.dart';

class TagController extends GetxController {
  var chips = <String>[].obs;
  var textController = ''.obs;

 addChip(String chip) {
    if (chip.isNotEmpty) {
      chips.add(chip);
      textController.value = '';
    }
  }

  void removeChip(String chip) {
    chips.remove(chip);
  }
}
