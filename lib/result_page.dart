import 'package:flutter/material.dart';

class Resultpage extends StatefulWidget {
  final List<String> answers;
  final VoidCallback reset;
  const Resultpage({super.key, required this.answers, required this.reset});

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
        title: Text(
          'Quizzler',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        color: Color.fromRGBO(24, 24, 24, 1),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Your Score',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.answers.where((element) => element == 'correct').length}/${widget.answers.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    widget.reset();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Play Again',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
