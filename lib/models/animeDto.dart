// To parse this JSON data, do
//
//     final animeDto = animeDtoFromJson(jsonString);

import 'dart:convert';

AnimeDto animeDtoFromJson(String str) => AnimeDto.fromJson(json.decode(str));

String animeDtoToJson(AnimeDto data) => json.encode(data.toJson());

class AnimeDto {
  AnimeDto({
    this.statusCode,
    this.message,
    this.data,
    this.version,
  });

  int statusCode;
  String message;
  Data data;
  String version;

  factory AnimeDto.fromJson(Map<String, dynamic> json) => AnimeDto(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        version: json["version"] == null ? null : json["version"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
        "version": version == null ? null : version,
      };
}

class Data {
  Data({
    this.currentPage,
    this.count,
    this.documents,
    this.lastPage,
  });

  int currentPage;
  int count;
  List<Document> documents;
  int lastPage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        count: json["count"] == null ? null : json["count"],
        documents: json["documents"] == null
            ? null
            : List<Document>.from(
                json["documents"].map((x) => Document.fromJson(x))),
        lastPage: json["last_page"] == null ? null : json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "count": count == null ? null : count,
        "documents": documents == null
            ? null
            : List<dynamic>.from(documents.map((x) => x.toJson())),
        "last_page": lastPage == null ? null : lastPage,
      };
}

class Document {
  Document({
    this.titles,
    this.descriptions,
    this.coverImage,
    this.score,
    this.id,
  });

  Titles titles;
  Descriptions descriptions;
  String coverImage;
  int score;
  int id;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        titles: json["titles"] == null ? null : Titles.fromJson(json["titles"]),
        descriptions: json["descriptions"] == null
            ? null
            : Descriptions.fromJson(json["descriptions"]),
        coverImage: json["cover_image"] == null ? null : json["cover_image"],
        score: json["score"] == null ? null : json["score"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "titles": titles == null ? null : titles.toJson(),
        "descriptions": descriptions == null ? null : descriptions.toJson(),
        "cover_image": coverImage == null ? null : coverImage,
        "score": score == null ? null : score,
        "id": id == null ? null : id,
      };
}

class Descriptions {
  Descriptions({
    this.en,
    this.it,
  });

  String en;
  String it;

  factory Descriptions.fromJson(Map<String, dynamic> json) => Descriptions(
        en: json["en"] == null ? null : json["en"],
        it: json["it"] == null ? null : json["it"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
        "it": it == null ? null : it,
      };
}

class Titles {
  Titles({
    this.en,
    this.jp,
    this.it,
  });

  String en;
  String jp;
  String it;

  factory Titles.fromJson(Map<String, dynamic> json) => Titles(
        en: json["en"] == null ? null : json["en"],
        jp: json["jp"] == null ? null : json["jp"],
        it: json["it"] == null ? null : json["it"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
        "jp": jp == null ? null : jp,
        "it": it == null ? null : it,
      };
}
