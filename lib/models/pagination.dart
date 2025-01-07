import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  @JsonKey(defaultValue: 0)
  int? total;
  Pagination({
    this.total,
  });

  Pagination copyWith({
    int? total,
  }) {
    return Pagination(
      total: total ?? this.total,
    );
  }

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}