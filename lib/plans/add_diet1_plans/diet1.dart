class Diet2 {
  final List<dynamic>? notification2IDs;
  final String? breakfast2;
  final String? lunch2;
  final String? dinner2;
  final String? day2;

  Diet2(
      {this.notification2IDs,
      this.breakfast2,
      this.lunch2,
      this.dinner2,
      this.day2});

  String get getBreakfast2 => breakfast2!;
  String get getlunch2 => lunch2!;
  String get getdinner2 => dinner2!;
  String get getday2 => day2!;
  List<dynamic> get get2IDs => notification2IDs!;

  Map<String, dynamic> toJson() {
    return {
      '1ids': notification2IDs,
      'breakfast2': breakfast2,
      'lunch2': lunch2,
      'dinner2': dinner2,
      'day2': day2,
    };
  }

  factory Diet2.fromJson(Map<String, dynamic> parsedJson) {
    return Diet2(
      notification2IDs: parsedJson['1ids'],
      breakfast2: parsedJson['breakfast2'],
      lunch2: parsedJson['lunch2'],
      dinner2: parsedJson['dinner2'],
      day2: parsedJson['day2'],
    );
  }
}
