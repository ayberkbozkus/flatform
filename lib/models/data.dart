import 'package:flutter/foundation.dart';

class Machine {
  @required
  final String mtitle;
  @required
  final String ptitle;
  @required
  final DateTime date;
  @required
  final DateTime totalT;
  @required
  final DateTime finishT;

  Machine({
    this.mtitle,
    this.ptitle,
    this.date,
    this.totalT,
    this.finishT,
  });
}

class Work {
  @required
  final String title;
  @required
  final int run;
  @required
  final int stop;
  @required
  final DateTime date;

  Work({
    this.title,
    this.run,
    this.stop,
    this.date,
  });
}

class TotalProduction {
  @required
  final int correct; // hatasız
  @required
  final int incorrect; // hatalı
  @required
  final DateTime date; // üretim zamanı
  @required
  final String title; // tesis vs
  @required
  final int planing; // planlanan
  @required
  final int finish; // biten
  @required
  final DateTime nTime; // gerekli zaman

  TotalProduction({
    this.correct,
    this.incorrect,
    this.date,
    this.title,
    this.planing,
    this.finish,
    this.nTime,
  });
}

class Stop {
  @required
  final int planing;
  @required
  final int nPlaning;
  @required
  final int fault;
  @required
  final int unknown;
  Stop({
    this.planing,
    this.nPlaning,
    this.fault,
    this.unknown,
  });
}

class Notification {
  @required
  final String mesagess;
  @required
  final DateTime date;
  @required
  final int priority;
  @required
  final String mail;
  Notification({
    this.mesagess,
    this.date,
    this.priority,
    this.mail,
  });
}

class Person {
  @required
  final String name;
  @required
  final String mail;
  @required
  final String title;
  @required
  final int notification;
  Person({
    this.name,
    this.mail,
    this.title,
    this.notification,
  });
}

class Ticket {
  @required
  final subject;
  @required
  final message;
  @required
  final DateTime date;
  @required
  final mail;
  Ticket({
    this.subject,
    this.message,
    this.date,
    this.mail,
  });
}
