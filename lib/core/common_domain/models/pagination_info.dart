
/// PaginationInfo model class
/// Contains the URLs for the first, last, previous, and next pages.
class PaginationInfo {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  PaginationInfo({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) {
    return PaginationInfo(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }

  @override
  String toString() {
    return 'PaginationInfo(first: $first, last: $last, prev: $prev, next: $next)';
  }
}