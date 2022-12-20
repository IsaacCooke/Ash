class Settings{
  final int id;
  final String voiceId;
  final bool staySignedIn;
  
  const Settings({
    required this.id,
    required this.voiceId,
    required this.staySignedIn,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    id: json['id'],
    voiceId: json['voiceId'],
    staySignedIn: json['staySignedIn'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'voiceId': voiceId,
    'staySignedIn': staySignedIn,
  };
}