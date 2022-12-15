

class QuraanModel {
  Data data;

  QuraanModel({required this.data});

  factory QuraanModel.fromJson(Map<String, dynamic> json) {
    return QuraanModel(data: Data.fromJson(json["data"]));
  }
}

class Data {
  List<SuraModel> surahs;

  Data({required this.surahs});

  factory Data.fromJson(Map<String, dynamic> json) {
    List<SuraModel> surahData = [];
    json["surahs"].forEach((element) {
      surahData.add(SuraModel.fromJson(element));
    });
    return Data(surahs: surahData);
  }
}

class SuraModel {
  int number;
  String name;
  String englishName;
  String revelationType;
  List<AyaModel> ayaList;

  SuraModel(
      {required this.number,
      required this.name,
       required this.revelationType,
      required this.englishName,
      required this.ayaList});

  factory SuraModel.fromJson(Map<String, dynamic> json) {
    List<AyaModel> ayaListData = [];
    json["ayahs"].forEach((element) {
      ayaListData.add(AyaModel.fromJson(element));
    });
    return SuraModel(
        ayaList: ayaListData,
        number: json["number"],
        name: json["name"],
        revelationType:json["revelationType"],
        englishName: json["englishName"]);
  }
}

class AyaModel {
  int number;
  String audio;
  String text;

  AyaModel({required this.number, required this.audio, required this.text});

  factory AyaModel.fromJson(Map<String, dynamic> json) {
    return AyaModel(
        number: json["number"], audio: json["audio"], text: json["text"]);
  }
}
