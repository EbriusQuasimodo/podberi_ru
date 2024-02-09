class IsarPaginationParamsModel{
  IsarPaginationParamsModel({
    required this.offset,
    required this.limit,
  });

  int offset=0;
  int limit;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IsarPaginationParamsModel &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode =>
      limit.hashCode ^
      offset.hashCode;
}
