import 'package:flutter/material.dart';
import 'Question.dart';
import 'api_service.dart';

class QuestionScreen extends StatefulWidget {
  final int onn;
  final String huvilbar;
  final int asuulttoo;

  QuestionScreen({required this.onn
  ,required this.huvilbar
  ,required this.asuulttoo});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Question>> futureQuestions;

  @override
  void initState() {
    super.initState();
    futureQuestions = fetchQuestions();
  }

  Future<List<Question>> fetchQuestions() async {
    final payload = {
      'action': 'getasuult',
      'onn': widget.onn,
      'hicheelkod': 11,
      'huvilbar': widget.huvilbar,
      'asuulttoo': widget.asuulttoo,
      'username': 'testuser'
    };
    final response = await apiService.getAsuult(payload);
    List<Question> questions = (response['data'] as List)
        .map((data) => Question.fromJson(data))
        .toList();
    return questions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: FutureBuilder<List<Question>>(
        future: futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No questions available'));
          } else {
            final questions = snapshot.data!;
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question.asuult,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        ...question.answers.map((answer) {
                          return Text('- ${answer.hariult}');
                        }).toList(),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
