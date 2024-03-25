import "package:flutter/material.dart";

// class Home extends StatefulWidget {
//   const Home(this.changeScreen, {super.key});
//   final void Function() changeScreen;

//   @override
//   State<Home> createState() {
//     return _Home();
//   }
// }

// class _Home extends State<Home> {

class Home extends StatelessWidget {
  const Home(this.changeScreen, {super.key});
  final void Function() changeScreen;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz.png',
          width: 200,
        ),
        const Text(
          "Data Science",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, shadowColor: Colors.white),
          onPressed: changeScreen,
          label: const Text('Start'),
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}
