class PaginationParamsModel{
  PaginationParamsModel({
    required this.fetch,
    required this.page,
  });

  int fetch;
  int page;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaginationParamsModel &&
        other.page == page &&
        other.fetch == fetch;
  }

  @override
  int get hashCode =>
      page.hashCode ^
      fetch.hashCode;
}
