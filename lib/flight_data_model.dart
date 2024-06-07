class FlightDataModel {
  final String destination;
  final String currentLocation;
  final String arrivingTime;
  final String departedTime;
  final String planeStatus;
  final String flightNo;
  final String seatNo;
  final String gateNo;

  FlightDataModel(
      {required this.destination,
      required this.currentLocation,
      required this.arrivingTime,
      required this.departedTime,
      required this.planeStatus,
      required this.flightNo,
      required this.seatNo,
      required this.gateNo});

  Map<String, String> toMap() {
    return {
      "destination": destination,
      "currentLocation": currentLocation,
      "arrivingTime": arrivingTime,
      "departedTime": departedTime,
      "planeStatus": planeStatus,
      "flightNo": flightNo,
      "seatNo": seatNo,
      "gateNo": gateNo
    };
  }
}
