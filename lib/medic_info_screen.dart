import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/questionare_screen.dart';

class MedicInfoScreen extends StatefulWidget {
  const MedicInfoScreen({super.key});

  @override
  State<MedicInfoScreen> createState() => _MedicInfoScreenState();
}

class _MedicInfoScreenState extends State<MedicInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_outlined))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(foregroundImage: AssetImage('./assets/images/preanebun.jpg'), radius: 30),
                    ],
                  ),
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Dr. Daniela Pretoeasa',
                            style: GoogleFonts.rubik(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 2, 5, 3),
                            child: Text(
                              'online',
                              style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.black38)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                            child: Text(
                              'Nota: 9.8',
                              style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('AIS Clinic & Hospital Bucharest',
                            style: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w500))
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('Pediatrie, doctor primar')],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return QuestionaireScreen();
                      },
                    )),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), color: const Color.fromRGBO(241, 201, 0, 1)),
                      height: 60,
                      child: Row(
                        children: [
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
                                    style: GoogleFonts.rubik(
                                        color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [Text('Sumar', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500))],
                  ),
                  SizedBox(height: 10),
                  const sumarWidget(
                    descriere: 'Medic primar',
                    titlu: 'Titlu profesional',
                  ),
                  customDivider(),
                  const sumarWidget(
                    titlu: 'Specializare',
                    descriere: 'Pediatrie',
                  ),
                  customDivider(),
                  const sumarWidget(
                    titlu: 'Experienta',
                    descriere: '45 ani',
                  ),
                  customDivider(),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Text('Loc de munca', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        './assets/images/building_icon.png',
                        height: 12,
                        width: 12,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('AIS Clinics & Hospital Bucuresti')
                    ],
                  ),
                  customDivider(),
                  Row(
                    children: [
                      Image.asset(
                        './assets/images/icons8-location-50.png',
                        fit: BoxFit.contain,
                        height: 12,
                        width: 12,
                      ),
                      SizedBox(width: 10),
                      Text('Șos. Alexandriei 144, București 051523')
                    ],
                  ),
                  const Divider(color: Colors.black12, height: 2, thickness: 1),
                  const SizedBox(height: 25),
                  Row(
                    children: [Text('Activitate', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500))],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        './assets/images/satisfaction.png',
                        fit: BoxFit.contain,
                        height: 12,
                        width: 12,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('Utilizatori multumiti: 96%')
                    ],
                  ),
                  const Divider(color: Colors.black12, height: 2, thickness: 1),
                  Row(
                    children: [
                      Image.asset(
                        './assets/images/like.png',
                        fit: BoxFit.contain,
                        height: 12,
                        width: 12,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('Am ajutat 214 pacienți ai aplicației')
                    ],
                  ),
                  const Divider(color: Colors.black12, height: 2, thickness: 1),
                  Row(
                    children: [
                      Image.asset(
                        './assets/images/star_icon.png',
                        fit: BoxFit.contain,
                        height: 12,
                        width: 12,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text('112 Testimoniale')
                    ],
                  ),
                  const Divider(color: Colors.black12, height: 2, thickness: 1),
                  Row(
                    children: [
                      Image.asset(
                        './assets/images/icons8-clock-24.png',
                        fit: BoxFit.contain,
                        height: 12,
                        width: 12,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 10),
                      Text('Timp de raspuns < 2 ore (estimat)')
                    ],
                  ),
                  SizedBox(height: 15),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                            'Acest timp este estimat folosind cele mai recente răspunsuri. Ocazional poate fi mai mare sau mai mic decat intervalul afișat.',
                        style: GoogleFonts.rubik(color: Colors.black54, fontSize: 12)),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [Text('Recenzii', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500))],
                  ),
                  SizedBox(height: 10),
                  reviewItem(date: '22 Iulie 2023', name: "Betty", rating: "5/5 "),
                  reviewItem(date: '11 Septembrie 2023', name: "Mihaela", rating: "3/5 "),
                  reviewItem(date: '15 Februarie 2022', name: "Traian", rating: "4/5 "),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Divider customDivider() => const Divider(color: Colors.black12, height: 2, thickness: 1);
}

class reviewItem extends StatelessWidget {
  final String name;
  final String date;
  final String rating;
  const reviewItem({
    super.key,
    required this.name,
    required this.date,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text(name, style: GoogleFonts.rubik(fontSize: 15, fontWeight: FontWeight.w400))],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                Image.asset(
                  './assets/images/like_icon.png',
                  color: Colors.black,
                  height: 16,
                  width: 16,
                ),
                SizedBox(width: 5),
                Text(
                  "Rating $rating",
                  style: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        const Divider(
          color: Colors.black12,
          thickness: 1,
        )
      ],
    );
  }
}

class sumarWidget extends StatelessWidget {
  final String titlu;
  final String descriere;
  const sumarWidget({
    super.key,
    required this.titlu,
    required this.descriere,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titlu, style: GoogleFonts.rubik(fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(descriere, style: GoogleFonts.rubik(fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ],
    );
  }
}
