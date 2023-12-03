import 'dart:convert';
import 'package:mediminder/plans/add_diet1_plans/diet1.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalDiet2Bloc {
  BehaviorSubject<List<Diet2>>? _diet2List$;
  BehaviorSubject<List<Diet2>>? get diet2List$ => _diet2List$;

  GlobalDiet2Bloc() {
    _diet2List$ = BehaviorSubject<List<Diet2>>.seeded([]);
    makeDiet2List();
  }

  Future removedDiet2(Diet2 toboDiet2Removed, {Diet2? diet2}) async {
    SharedPreferences sharedDiet2User = await SharedPreferences.getInstance();
    List<String> diet2JsonList = [];

    var blockDiet2List = _diet2List$!.value;
    blockDiet2List.removeWhere(
        (diet2) => diet2.breakfast2 == toboDiet2Removed.breakfast2);

    if (blockDiet2List.isNotEmpty) {
      for (var blockDiet2 in blockDiet2List) {
        String diet2Json = jsonEncode(blockDiet2.toJson());
        diet2JsonList.add(diet2Json);
      }
    }

    sharedDiet2User.setStringList('diet2', diet2JsonList);
    _diet2List$!.add(blockDiet2List);
  }

  Future updateDiet2List(Diet2 newDiet2) async {
    var diet2BlocList = _diet2List$!.value;
    diet2BlocList.add(newDiet2);
    _diet2List$!.add(diet2BlocList);

    Map<String, dynamic> tempnewDiet2 = newDiet2.toJson();
    SharedPreferences? sharedDiet2User = await SharedPreferences.getInstance();
    String newDiet2Json = jsonEncode(tempnewDiet2);
    List<String> diet2JsonList = [];
    if (sharedDiet2User.getStringList('diet2') == null) {
      diet2JsonList.add(newDiet2Json);
    } else {
      diet2JsonList = sharedDiet2User.getStringList('diet2')!;
      diet2JsonList.add(newDiet2Json);
    }

    sharedDiet2User.setStringList('diet2', diet2JsonList);
  }

  Future makeDiet2List() async {
    SharedPreferences? sharedDiet2User = await SharedPreferences.getInstance();
    List<String>? jsonDList = sharedDiet2User.getStringList('diet2');
    List<Diet2> prefDiet2List = [];

    if (jsonDList == null) {
      return;
    } else {
      for (String jsonDiet2 in jsonDList) {
        dynamic userDiet2Map = jsonDecode(jsonDiet2);
        Diet2 tempDiet2 = Diet2.fromJson(userDiet2Map);
        prefDiet2List.add(tempDiet2);
      }
      _diet2List$!.add(prefDiet2List);
    }
  }

  void dispose() {
    _diet2List$!.close();
  }
}
