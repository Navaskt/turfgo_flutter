class MatchFinderInfo {
  const MatchFinderInfo({
    required this.teamsLooking,
    required this.teamNames,
    required this.extraTeams,
    this.avatarUrls = const [],
  });

  final int teamsLooking;
  final List<String> teamNames;
  final int extraTeams;
  final List<String> avatarUrls;
}
