import 'package:intl/intl.dart';
import 'package:whenfinish/services/local_storage.dart';
import 'package:whenfinish/utils/constants.dart';

class TimeManagerService {
  TimeManagerService();
  final DateFormat _formatter = DateFormat('HH:mm');
  final Duration _smalsDay = const Duration(hours: 7, minutes: 36);

  get getStartDay => _formatter.format(DateTime.fromMillisecondsSinceEpoch(
      LocalStorageService.get(keyStartWorkTime)));

  get getEndDay => _formatter.format(DateTime.fromMillisecondsSinceEpoch(
      LocalStorageService.get(keyEndWorkTime)));

  get getStartBreak => _formatter.format(DateTime.fromMillisecondsSinceEpoch(
      LocalStorageService.get(keyStartBreakTime)));

  get getEndBreak => _formatter.format(DateTime.fromMillisecondsSinceEpoch(
      LocalStorageService.get(keyFinishBreakTime)));

  bool get yetSetted => LocalStorageService.get('yetSet') == -1;

  bool get yetBreaked => LocalStorageService.get('yetSet') == -2;

  setStartWorkDay() {
    LocalStorageService.set(keyStartWorkTime, _now);
    DateTime end = DateTime.fromMillisecondsSinceEpoch(_now).add(_smalsDay);
    LocalStorageService.set(keyEndWorkTime, end.millisecondsSinceEpoch);
  }

  setBreakStart() {
    LocalStorageService.set(keyStartBreakTime, _now);
    LocalStorageService.set("yetSet", -1);
  }

  setBreakFinish() {
    LocalStorageService.set(keyFinishBreakTime, _now);
    int difference = DateTime.fromMillisecondsSinceEpoch(
            LocalStorageService.get(keyFinishBreakTime))
        .difference(DateTime.fromMillisecondsSinceEpoch(
            LocalStorageService.get(keyStartBreakTime)))
        .inMinutes;
    LocalStorageService.set(
        keyEndWorkTime,
        DateTime.fromMillisecondsSinceEpoch(
                LocalStorageService.get(keyEndWorkTime))
            .add(Duration(minutes: difference))
            .millisecondsSinceEpoch);

    LocalStorageService.set("yetSet", -2);
  }

  clearAll() {
    LocalStorageService.remove(keyStartWorkTime);
    LocalStorageService.remove(keyEndWorkTime);
    LocalStorageService.remove(keyStartBreakTime);
    LocalStorageService.remove(keyFinishBreakTime);
    LocalStorageService.remove("yetSet");
    print("all was deleted");
  }

  int get _now => DateTime.now().millisecondsSinceEpoch;
}
