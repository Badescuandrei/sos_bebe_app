import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimonialScreen extends StatelessWidget {
  const TestimonialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_outlined))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Vă mulțumim!', style: GoogleFonts.rubik(color: Colors.black87, fontSize: 28))],
            ),
            const SizedBox(height: 25),
            Image.asset('./assets/images/testimonial_icon.png'),
            const SizedBox(height: 70),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Te rugăm să ne lași si un testimonial!',
                      style: GoogleFonts.rubik(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 240, 240, 240),
                ),
                height: 130,
                child: const TextField(
                  decoration: InputDecoration(border: InputBorder.none, hintText: 'Doctorul a raspuns rapid...'),
                  maxLines: 2,
                )),
            SizedBox(height: 15),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const TestimonialScreen();
                },
              )),
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' TRIMITE CHESTIONARUL',
                      style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      )),
    );
  }
}
