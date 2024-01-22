import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/LogoDanaTanpaText.png',
            width: 200,
            color: Colors.white54,
          ),

          // Opacity(
          //   opacity: 0.8,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 250,
          //   ),
          // ),
          const SizedBox(height: 20),
          Text(
            'Belajar dan Kerjakan Quiz-nya !',
            style: GoogleFonts.eduSaBeginner(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: Text(
              'Mulai Quizz',
              style: GoogleFonts.eduSaBeginner(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt_rounded),
          )
        ],
      ),
    );
  }
}
