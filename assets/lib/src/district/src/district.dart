class District {
  final int id;
  final String name;
  List<String> villages;

  District({
    required this.id,
    required this.name,
    required this.villages,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'] as int,
      name: json['name'] as String,
      villages:
          (json['villages'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  @override
  String toString() => 'District(id: $id, name: $name)';
}
