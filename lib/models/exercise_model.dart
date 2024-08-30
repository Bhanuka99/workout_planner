class Exercise{
  final int id;
  final String exerciseName;
  final String exerciseImageURL;
  final int numOfMinuites;
  bool isCompleted;

  Exercise({
    required this.id,
    required this.exerciseName,
    required this.exerciseImageURL,
    required this.numOfMinuites,
    required this.isCompleted,
  }
  );
}