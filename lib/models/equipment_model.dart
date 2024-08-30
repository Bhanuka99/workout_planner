class Equipment {
  final int id;
  final String equipmentName;
  final String equipmentImageURL;
  final String equipmentDiscription;
  final int noOfMinuites;
  final double noOfCalaries;
  bool isHandover;

  Equipment({
    required this.id, 
    required this.equipmentName, 
    required this.equipmentImageURL, 
    required this.equipmentDiscription, 
    required this.noOfMinuites, required this.noOfCalaries, 
    required this.isHandover}
    );
}