
class Question {
  final int aid;
  final String asuult;
  final int hicheelkod;
  final int onn;
  final int catkod;
  final int onoo;   
  final String huvilbar;
  final int huvilbarid;
  final int minutes;
  final int desdugaar;
  final int userhariultid;
  final List<Answer> answers;

  Question({
    required this.aid,
    required this.asuult,
    required this.hicheelkod,
    required this.onn,
    required this.catkod,
    required this.onoo,
    required this.huvilbar,
    required this.huvilbarid,
    required this.minutes,
    required this.desdugaar,
    required this.userhariultid,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var list = json['hariult'] as List;
    List<Answer> answerList = list.map((i) => Answer.fromJson(i)).toList();

    return Question(
      aid: json['aid'],
      asuult: json['asuult'],
      hicheelkod: json['hicheelkod'],
      onn: json['onn'],
      catkod: json['catkod'],
      onoo: json['onoo'],
      huvilbar: json['huvilbar'],
      huvilbarid: json['huvilbarid'],
      minutes: json['minutes'],
      desdugaar: json['desdugaar'],
      userhariultid: json['userhariultid'],
      answers: answerList,
    );
  }
}

class Answer {
  final int hid;
  final int aid;
  final String hariult;
  final bool correctans; // Assuming correctans is represented as 0 or 1 in JSON
  final int hariultid;

  Answer({
    required this.hid,
    required this.aid,
    required this.hariult,
    required this.correctans,
    required this.hariultid,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      hid: json['hid'],
      aid: json['aid'],
      hariult: json['hariult'],
      correctans: json['correctans'] == 1, // Convert 1 to true, 0 to false
      hariultid: json['hariultid'],
    );
  }
}

