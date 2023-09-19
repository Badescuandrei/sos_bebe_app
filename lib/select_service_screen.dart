import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/doctor_selection_screen.dart';

class ServiceSelectScreen extends StatelessWidget {
  const ServiceSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 100),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(241, 201, 0, 1)),
                  height: 60,
                  child: Row(children: [
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('./assets/images/recipe.png'),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Primiți o recomandare \nși rețetă medicală",
                              style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: RichText(
                        text: TextSpan(text: "25.9 ", style: GoogleFonts.rubik(fontSize: 22), children: [
                          TextSpan(
                            text: "RON",
                            style: GoogleFonts.rubik(fontSize: 16),
                          ),
                        ]),
                      ),
                    ),
                  ])),
              const SizedBox(height: 10),
              const MyButton(
                  pret: "49.9 ",
                  text: "Scrie o intrebare",
                  iconLocation: './assets/images/chat-cerc.png',
                  color: Colors.blue),
              const SizedBox(height: 10),
              const MyButton(
                pret: "99.9 ",
                text: "Suna acum",
                iconLocation: './assets/images/phone-call.png',
                color: Colors.green,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DoctorSelectionScreen();
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('./assets/images/medical.png'),
                            ),
                            Text(
                              'Vezi medici disponibili',
                              style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 14,
                    )),
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final String pret;
  final String iconLocation;
  final Color color;
  const MyButton({
    super.key,
    required this.text,
    required this.pret,
    required this.iconLocation,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(iconLocation),
                ),
                Text(
                  text,
                  style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: RichText(
              text: TextSpan(text: pret, style: GoogleFonts.rubik(fontSize: 22), children: [
                TextSpan(
                  text: "RON",
                  style: GoogleFonts.rubik(fontSize: 16),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
