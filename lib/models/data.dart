import 'package:flutter/foundation.dart';

class Machine {
  @required
  final String title; // türü makine, tesis, kalıp
  @required
  final String mid; // makine id
  @required
  final DateTime date; // tarih
  @required
  final DateTime totalT; // total üretim
  @required
  final DateTime finishT; // bitiş süresi

  Machine({
    this.title,
    this.mid,
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

class Production {
  @required
  final String title; // tesis, makine, kalıp vs
  @required
  final int titlenum; // türünden kaç tane var
  @required
  final String id; // id uniqe
  @required
  final String work; // çalışıp çalışmadığı
  @required
  final int correct; // hatasız üretim
  @required
  final int incorrect; // hatalı üretim
  @required
  final DateTime date; // üretim zamanı bugün
  @required
  final int planing; // planlanan toplam üretim
  @required
  final int finish; // biten üretim
  @required
  final DateTime nTime; // gerekli zaman
  @required
  final int average; // biten üretim
  @required
  final int next; // sıradaki kalıp, diğerleri null

  Production({
    this.title,
    this.titlenum,
    this.id,
    this.correct,
    this.work,
    this.incorrect,
    this.date,
    this.planing,
    this.finish,
    this.nTime,
    this.average,
    this.next,
  });
}

class Productivity {
  @required
  final int planing; // Planlanan
  @required
  final int nPlaning; // Planlanmayan
  @required
  final int broken; // Arıza
  @required
  final int unknown; // Bilinmeyen
  Productivity({
    this.planing,
    this.nPlaning,
    this.broken,
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

class Tickets {
  @required
  final subject;
  @required
  final message;
  @required
  final DateTime date;
  @required
  final mail;
  Tickets({
    this.subject,
    this.message,
    this.date,
    this.mail,
  });
}
