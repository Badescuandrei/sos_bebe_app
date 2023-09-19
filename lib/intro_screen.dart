import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset('./assets/images/Sosbebe.png'),
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                              text: "Gaseste cel mai bun \nDoctor Pediatru",
                              style: GoogleFonts.rubik(
                                color: const Color.fromRGBO(14, 210, 62, 1),
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              )),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Găsiți cei mai buni medici specialiști\npentru copilul dvs. ",
                            style: GoogleFonts.rubik(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            )),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(60),
                                    backgroundColor: const Color.fromRGBO(14, 210, 62, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    shadowColor: const Color.fromRGBO(14, 210, 62, 1),
                                    elevation: 20.0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ));
                                },
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  const ImageIcon(
                                    AssetImage("./assets/images/babyhead.png"),
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  const SizedBox(width: 20), // give the width that you desire
                                  Text(
                                    "CONTINUA",
                                    style: GoogleFonts.rubik(
                                        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
                                  ),
                                ]),
                                // icon: const ImageIcon(
                                //   AssetImage("./assets/images/babyhead.png"),
                                //   color: Colors.white,
                                //   size: 20,
                                // ),
                                // label:
                              )),
                        ),
                        SizedBox(
                          width: 130,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
