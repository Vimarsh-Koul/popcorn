// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) =>
    ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  ImageModel({
    this.images,
    this.changeKeys,
  });

  Images images;
  List<String> changeKeys;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        images: Images.fromJson(json["images"]),
        changeKeys: List<String>.from(json["change_keys"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "images": images.toJson(),
        "change_keys": List<dynamic>.from(changeKeys.map((x) => x)),
      };
}

class Images {
  Images({
    this.baseUrl,
    this.secureBaseUrl,
    this.backdropSizes,
    this.logoSizes,
    this.posterSizes,
    this.profileSizes,
    this.stillSizes,
  });

  String baseUrl;
  String secureBaseUrl;
  List<String> backdropSizes;
  List<String> logoSizes;
  List<String> posterSizes;
  List<String> profileSizes;
  List<String> stillSizes;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        baseUrl: json["base_url"],
        secureBaseUrl: json["secure_base_url"],
        backdropSizes: List<String>.from(json["backdrop_sizes"].map((x) => x)),
        logoSizes: List<String>.from(json["logo_sizes"].map((x) => x)),
        posterSizes: List<String>.from(json["poster_sizes"].map((x) => x)),
        profileSizes: List<String>.from(json["profile_sizes"].map((x) => x)),
        stillSizes: List<String>.from(json["still_sizes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "secure_base_url": secureBaseUrl,
        "backdrop_sizes": List<dynamic>.from(backdropSizes.map((x) => x)),
        "logo_sizes": List<dynamic>.from(logoSizes.map((x) => x)),
        "poster_sizes": List<dynamic>.from(posterSizes.map((x) => x)),
        "profile_sizes": List<dynamic>.from(profileSizes.map((x) => x)),
        "still_sizes": List<dynamic>.from(stillSizes.map((x) => x)),
      };
}
