class WorkoutProgram {
  WorkoutProgram({
    required this.id,
    required this.coverImage,
    required this.days,
    required this.interval,
    required this.title,
    required this.desc,
    required this.workouts,
    this.hard = false
  });

  int id;
  String coverImage;
  int days;
  String interval;
  String title;
  String desc;
  List workouts;
  bool hard;
}