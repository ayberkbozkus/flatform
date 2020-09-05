class Ticket {
  String email;
  String issue;
  String message;
  String color;

  Ticket.fromJsonMap(Map<String, dynamic> map)
      : email = map["email"],
        issue = map["issue"],
        message = map["message"],
        color = map["color"];
}
