import 'package:flutter/material.dart';
import 'card_design.dart';

class PopUpDialogBox extends StatelessWidget {
  const PopUpDialogBox({
    super.key,
    required this.widget,
  });

  final CardDesign widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Congratulations!",
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            const Text("You have added"),
            const Text("5"),
            Text("${widget.name} on your bag!"),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xffDB3022),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets
                      .symmetric(
                      horizontal: 90,
                      vertical: 10)),
              child: const Text('Okay'),
            )
          ],
        ),
      ),
    );
  }
}