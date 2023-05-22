
part of 'card_model.dart';

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return CardModel(
    id: json['id'] as String,
    author: json['author'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    url: json['url'] as String,
    downloadUrl: json['download_url'] as String,
  );
}

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'download_url': instance.downloadUrl,
    };
