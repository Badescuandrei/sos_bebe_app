import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'medic_info_screen.dart';

class DoctorSelectionScreen extends StatefulWidget {
  const DoctorSelectionScreen({super.key});

  @override
  State<DoctorSelectionScreen> createState() => _DoctorSelectionScreenState();
}

class _DoctorSelectionScreenState extends State<DoctorSelectionScreen> {
  final searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 240, 240),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(foregroundImage: AssetImage('./assets/images/preanebun.jpg'), radius: 25),
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search_outlined),
                      onPressed: () {},
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          searchController.clear();
                        });
                      },
                    ),
                    hintText: "Medic primar pediatrie",
                  )),
            ),
            const SizedBox(height: 20),
            containerDoctorProfile(),
          ],
        ),
      )),
    );
  }

  GestureDetector containerDoctorProfile() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const MedicInfoScreen();
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(foregroundImage: AssetImage('./assets/images/preanebun.jpg'), radius: 30),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 20,
                        )),
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
                          style: GoogleFonts.rubik(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w500))
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
                  Row(
                    children: [
                      Image.asset(
                        './assets/images/icons8-location-50.png',
                        color: Colors.black54,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(width: 10),
                      Text('Bucuresti', style: GoogleFonts.rubik(fontWeight: FontWeight.w400, fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset(
                        './assets/images/like_icon.png',

                        // fit: BoxFit.contain,
                        height: 16,
                        color: Colors.black54,
                        width: 16,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '100%(254)',
                        style: GoogleFonts.rubik(fontSize: 12),
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        './assets/images/icons8-clock-24.png',
                        // fit: BoxFit.contain,
                        height: 16,
                        color: Colors.black54,
                        width: 16,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '< 2 Ore',
                        style: GoogleFonts.rubik(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset('./assets/images/like_red.png', fit: BoxFit.contain, height: 24, width: 24),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
