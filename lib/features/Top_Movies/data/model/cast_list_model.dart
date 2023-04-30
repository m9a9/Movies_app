class CastList {
  final String name;
  final String profilePath;
  final String character;

  CastList(
      {required this.name, required this.profilePath, required this.character});

  factory CastList.fromJson(dynamic jsonData) {
    return CastList(
        name: jsonData['name'] ?? '',
        profilePath: jsonData['profile_Path'] ?? '',
        character: jsonData['character'] ?? '');
  }
}
