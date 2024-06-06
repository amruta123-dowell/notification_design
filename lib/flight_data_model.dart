class FlightDataModel {
  final String destination;
  final String currentLocation;
  final String arrivingTime;
  final String departedTime;
  final String planeStatus;
  FlightDataModel(
      {required this.destination,
      required this.currentLocation,
      required this.arrivingTime,
      required this.departedTime,
      required this.planeStatus});
}
