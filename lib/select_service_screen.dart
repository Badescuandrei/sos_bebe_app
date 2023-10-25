import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/doctor_selection_screen.dart';
import 'package:auto_size_text/auto_size_text.dart'; //George Valentin Iordache

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
              const SizedBox(height: 100), //am adăugat const
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(241, 201, 0, 1)
                    ),
                  height: 60,
                  child: Row(children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /* old
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
                          */
                          //George Valentin Iordache
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('./assets/images/recipe.png'),
                          ),
                          Expanded(
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: "Primiți o recomandare și rețetă medicală",
                                style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: RichText(
                        text: TextSpan(text: "25.9 ", style: GoogleFonts.rubik(fontSize: 16), children: [
                          TextSpan(
                            text: "RON",
                            //style: GoogleFonts.rubik(fontSize: 16),
                            style: GoogleFonts.rubik(fontSize: 9, fontWeight: FontWeight.w300),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const MyButton(
                  pret: "49.9 ",
                  text: "Scrie o întrebare",
                  iconLocation: './assets/images/chat-cerc.png',
                  color: Colors.blue),
              const SizedBox(height: 10),
              const MyButton(
                pret: "99.9 ",
                //text: "Suna acum",
                text: "Sună acum",
                iconLocation: './assets/images/phone-call_mare.png',
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
                        /* old
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('./assets/images/medical.png'),
                            ),
                            Text(
                              'Vezi medici disponibili',
                              //style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18), old
                              style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                            ),
                          ],
                        ),
                        */
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              'Vezi medici disponibili',
                              //style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18), old
                              style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                            ),
                            const SizedBox(width: 110),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('./assets/images/medical.png'),
                            ),
                            const SizedBox(width: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //const SizedBox(height: 30),
              const SizedBox(height: 90),
              /*
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
              */
              Expanded(
                child:AutoSizeText.rich(
                      TextSpan(
                          text:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          style: GoogleFonts.rubik(
                            color: const Color.fromRGBO(103, 114, 148, 1),
                            fontSize: 14,
                          ),
                        ),
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start, 
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child:AutoSizeText.rich(
                      TextSpan(
                          text:"It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          style: GoogleFonts.rubik(
                            color: const Color.fromRGBO(103, 114, 148, 1),
                            fontSize: 14,
                          ),
                        ),
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start, 
                ),
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
                  onPressed: () => {},
                  icon: Image.asset(iconLocation),
                ),
                Text(
                  text,
                  //style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18), old
                  style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: RichText(
              //text: TextSpan(text: pret, style: GoogleFonts.rubik(fontSize: 22), children: [ old
              text: TextSpan(text: pret, style: GoogleFonts.rubik(fontSize: 16), children: [
                TextSpan(
                  text: "RON",
                  // style: GoogleFonts.rubik(fontSize: 16), old
                  style: GoogleFonts.rubik(fontSize: 9)
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
