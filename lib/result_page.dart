import 'package:flutter/material.dart';

class Resultpage extends StatefulWidget {
  final List<String> answers;
  final VoidCallback reset;
  const Resultpage({super.key, required this.answers, required this.reset});

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  late Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
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
          padding: EdgeInsets.only(
              left: screenSize.width / 4,
              right: screenSize.width / 4,
              top: screenSize.height / 4),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Your Score',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width / 20,
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
                  fontSize: screenSize.width / 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: screenSize.height / 12,
                width: screenSize.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    widget.reset();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Play Again',
                    style: TextStyle(
                        color: Colors.black, fontSize: screenSize.width / 35),
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
