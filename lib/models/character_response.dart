import 'dart:convert';

class RickMortyResponse {
  RickMortyResponse({
    required this.info,
    required this.results,
  });

  Info info;
  List<Character> results;

  factory RickMortyResponse.fromJson(String str) =>
      RickMortyResponse.fromMap(json.decode(str));

  factory RickMortyResponse.fromMap(Map<String, dynamic> json) =>
      RickMortyResponse(
        info: Info.fromMap(json["info"]),
        results: List<Character>.from(
            json["results"].map((x) => Character.fromMap(x))),
      );
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );
}

class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    this.url,
    required this.created,
  });

  int id;
  String name;
  String status;
  String species;
  String? type;
  String gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String? url;
  String created;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Location.fromMap(json["origin"]),
        location: Location.fromMap(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: json["created"],
      );
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );
}
