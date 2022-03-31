import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/question.dart';
import '../widgets/authentication/google_sign_in.dart';
import 'authentication.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);
  static const routeName = '/Questions';
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Quiz? quiz;
  List<Question>? questions;

  Future<void> fetchQuestions() async {
    final url = Uri.parse('https://opentdb.com/api.php?amount=30');
    final response = await http.get(url);

    final ques = jsonDecode(response.body);
    print(ques);
    quiz = Quiz.fromJson(ques);
    questions = quiz!.questions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Quiz App'),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            DropdownButton(
              underline: Container(),
              icon: Icon(Icons.more_vert,
                  color: Theme.of(context).primaryIconTheme.color),
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 8),
                      const Text('Logout'),
                    ]),
                  ),
                  value: 'logout',
                )
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  GoogleSignInApi.logout();
                  Navigator.pushReplacementNamed(
                      context, Authentication.routeName);
                }
              },
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: fetchQuestions,
          child: FutureBuilder(
              future: fetchQuestions(),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    // TODO: Handle this case.
                    return Text('Press button to start');
                  // break;
                  case ConnectionState.active:
                  // TODO: Handle this case.
                  // break;
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  // TODO: Handle this case.
                  // break;

                  case ConnectionState.done:
                    // TODO: Handle this case.
                    if (snapshot.hasError) return errorData(snapshot);
                    return questionList();
                  // break;
                }
              }),
        ));
  }

  Padding errorData(AsyncSnapshot snapshot) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error: ${snapshot.error}'),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              fetchQuestions();
              setState(() {});
            },
            child: Text('Try Again'),
          )
        ],
      ),
    );
  }

  ListView questionList() {
    return ListView.builder(
      itemCount: questions?.length,
      itemBuilder: (context, index) => Card(
        // color: Theme.of(context).accentColor,
        child: ExpansionTile(
          // collapsedBackgroundColor: Theme.of(context).accentColor,
          title: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questions![index].question,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterChip(
                        backgroundColor: Colors.grey[100],
                        label: Text(questions![index].category),
                        onSelected: (b) {},
                      ),
                      SizedBox(width: 10),
                      FilterChip(
                        backgroundColor: Colors.grey[100],
                        label: Text(questions![index].difficulty),
                        onSelected: (b) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Text(questions![index].type.startsWith('m') ? 'M' : 'B'),
          ),
          children: questions![index].allAnswers.map((m) {
            return AnswerWidget(questions!, index, m);
          }).toList(),
        ),
      ),
    );
  }
}

class AnswerWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AnswerWidget(this.questions, this.index, this.m);

  final List<Question> questions;
  final int? index;
  final String? m;
  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color c = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.m == widget.questions[widget.index!].correctAnswer) {
            c = Colors.green;
          } else {
            c = Colors.red;
          }
        });
      },
      title: Text(
        widget.m!,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: c,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
