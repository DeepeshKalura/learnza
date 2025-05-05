import 'package:freezed_annotation/freezed_annotation.dart';

part 'messenger_model.freezed.dart';
part 'messenger_model.g.dart';

@freezed
class MessengerModel with _$MessengerModel {
  const factory MessengerModel({
    required String id,
    String? userId,
    String? groupId,
    required DateTime lastseen,
  }) = _MessengerModel;

  factory MessengerModel.fromJson(Map<String, dynamic> json) =>
      _$MessengerModelFromJson(json);
}
