import 'package:freezed_annotation/freezed_annotation.dart';

part 'industry_identifiers.freezed.dart';
part 'industry_identifiers.g.dart';

@freezed
class IndustryIdentifiers with _$IndustryIdentifiers {
  const factory IndustryIdentifiers({
    required String type,
    required String value,
  }) = _IndustryIdentifiers;

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);
}
