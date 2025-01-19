import 'package:flutter/material.dart';
import 'package:quizzler/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'In which year did World War II end?',
      'options': ['1945', '1943', '1944', '1946'],
      'correctAnswer': '1945',
      'category': 'History'
    },
    {
      'question': 'What is the largest mammal in the world?',
      'options': ['Blue Whale', 'African Elephant', 'Giraffe', 'Hippopotamus'],
      'correctAnswer': 'Blue Whale',
      'category': 'Biology'
    },
    {
      'question': 'Who wrote "Romeo and Juliet"?',
      'options': [
        'William Shakespeare',
        'Charles Dickens',
        'Jane Austen',
        'Mark Twain'
      ],
      'correctAnswer': 'William Shakespeare',
      'category': 'Literature'
    },
    {
      'question': 'What is the square root of 144?',
      'options': ['12', '14', '10', '16'],
      'correctAnswer': '12',
      'category': 'Mathematics'
    },
    {
      'question': 'Which country is known as the Land of the Rising Sun?',
      'options': ['Japan', 'China', 'Thailand', 'Vietnam'],
      'correctAnswer': 'Japan',
      'category': 'Geography'
    },
    {
      'question': 'Who invented the telephone?',
      'options': [
        'Alexander Graham Bell',
        'Thomas Edison',
        'Nikola Tesla',
        'Albert Einstein'
      ],
      'correctAnswer': 'Alexander Graham Bell',
      'category': 'History'
    },
    {
      'question': 'What is the chemical formula for water?',
      'options': ['H2O', 'CO2', 'O2', 'N2'],
      'correctAnswer': 'H2O',
      'category': 'Science'
    },
    {
      'question': 'Which is the longest river in the world?',
      'options': ['Nile', 'Amazon', 'Mississippi', 'Yangtze'],
      'correctAnswer': 'Nile',
      'category': 'Geography'
    },
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Rome'],
      'correctAnswer': 'Paris',
      'category': 'Geography'
    },
    {
      'question': 'Who painted "The Starry Night"?',
      'options': [
        'Vincent van Gogh',
        'Pablo Picasso',
        'Claude Monet',
        'Salvador Dali'
      ],
      'correctAnswer': 'Vincent van Gogh',
      'category': 'Art'
    },
  ];

  int counter = 0;
  List<String> userAnswers = [];

  void reset() {
    counter = 0;
    userAnswers.clear();
  }

  void nextQuestion(String ans) {
    setState(() {
      if (userAnswers.length < questions.length) {
        userAnswers.add(ans);
        if (userAnswers.length >= questions.length) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Resultpage(
                      answers: userAnswers,
                      reset: reset,
                    )),
          );
        } else {
          counter++;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please reset the quiz to start again..."),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 40),
          child: Text(
            'Quizzler',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 40, top: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Resultpage(
                            answers: userAnswers,
                            reset: reset,
                          )),
                );
              },
              child: Text('Result'),
            ),
          )
        ],
      ),
      body: Container(
        width: double.maxFinite,
        color: Color.fromRGBO(24, 24, 24, 1),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(questions.elementAt(counter)['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionBtn(
                    option: questions.elementAt(counter)['options'][0],
                    correctAnswer:
                        questions.elementAt(counter)['correctAnswer'],
                    onNextQuestion: nextQuestion,
                  ),
                  OptionBtn(
                    option: questions.elementAt(counter)['options'][1],
                    correctAnswer:
                        questions.elementAt(counter)['correctAnswer'],
                    onNextQuestion: nextQuestion,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionBtn(
                    option: questions.elementAt(counter)['options'][2],
                    correctAnswer:
                        questions.elementAt(counter)['correctAnswer'],
                    onNextQuestion: nextQuestion,
                  ),
                  OptionBtn(
                    option: questions.elementAt(counter)['options'][3],
                    correctAnswer:
                        questions.elementAt(counter)['correctAnswer'],
                    onNextQuestion: nextQuestion,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionBtn extends StatefulWidget {
  final String option;
  final String correctAnswer;
  final Function(String) onNextQuestion;

  const OptionBtn({
    super.key,
    required this.option,
    required this.correctAnswer,
    required this.onNextQuestion,
  });

  @override
  _OptionBtnState createState() => _OptionBtnState();
}

class _OptionBtnState extends State<OptionBtn> {
  Color btnBg = Color.fromRGBO(24, 24, 24, 1);

  void checkAnswer() {
    setState(() {
      if (widget.option == widget.correctAnswer) {
        btnBg = Colors.green;
      } else {
        btnBg = Colors.red;
      }
      Future.delayed(Duration(milliseconds: 200), () {
        setState(() {
          btnBg = Color.fromRGBO(24, 24, 24, 1);
        });
        widget.onNextQuestion(
            widget.option == widget.correctAnswer ? 'correct' : 'incorrect');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: checkAnswer,
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: btnBg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(widget.option,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
