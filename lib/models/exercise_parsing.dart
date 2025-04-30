class ProgressEntry {
  final String date;
  final double weight;

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

class Exercise {
  final String name;
  final int sets;
  final int reps;
  final List<ProgressEntry> progress;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.progress,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    var progressList = json['progress'] as List;
    List<ProgressEntry> parsedProgress =
        progressList.map((e) => ProgressEntry.fromJson(e)).toList();

    return Exercise(
      name: json['name'],
      sets: json['sets'],
      reps: json['reps'],
      progress: parsedProgress,
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
