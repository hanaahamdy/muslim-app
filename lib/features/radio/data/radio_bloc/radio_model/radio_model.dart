class RadioParentModel {
  List<RadioModel> radiosList;

  RadioParentModel({required this.radiosList});

  factory RadioParentModel.fromJson(Map<String,dynamic> json) {
    List<RadioModel> data = [];
    json["Radios"].forEach((element) {
      data.add(RadioModel.fromJson(element));
    });
    return RadioParentModel(radiosList: data);
  }
}

class RadioModel {
  String stationName;
  String stationUrl;

  RadioModel({required this.stationName, required this.stationUrl});

  factory RadioModel.fromJson(Map<String,dynamic> json) {
    return RadioModel(stationName: json["Name"], stationUrl: json["URL"]);
  }
}
