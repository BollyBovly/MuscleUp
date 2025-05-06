class Exercise {
  final String id;
  final String name;
  final int sets;
  final String reps;
  final List<ProgressEntry> progress;

  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.progress,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      sets:
          json['sets'] is int
              ? json['sets']
              : int.parse(json['sets'].toString()),
      reps: json['reps'].toString(),
      progress:
          (json['progress'] as List<dynamic>)
              .map((entry) => ProgressEntry.fromJson(entry))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sets': sets,
      'reps': reps,
      'progress': progress.map((e) => e.toJson()).toList(),
    };
  }
}

class ProgressEntry {
  final String date;
  final double weight;

  ProgressEntry({required this.date, required this.weight});

  factory ProgressEntry.fromJson(Map<String, dynamic> json) {
    return ProgressEntry(
      date: json['date'],
      weight:
          json['weight'] is double
              ? json['weight']
              : double.parse(json['weight'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date, 'weight': weight};
  }
}
