class Exercise {
  String name;
  int sets;
  String reps;
  List<ProgressEntry> progress;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.progress,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      sets: json['sets'],
      reps: json['reps'].toString(),
      progress:
          (json['progress'] as List<dynamic>)
              .map((item) => ProgressEntry.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
      'progress': progress.map((e) => e.toJson()).toList(),
    };
  }
}

class ProgressEntry {
  String date;
  double weight;

  ProgressEntry({required this.date, required this.weight});

  factory ProgressEntry.fromJson(Map<String, dynamic> json) {
    return ProgressEntry(
      date: json['date'],
      weight: (json['weight'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date, 'weight': weight};
  }
}
