//import 'package:flutter/cupertino.dart';
//import 'package:lite_rolling_switch/lite_rolling_switch.dart';
//import 'package:sos_bebe_app/testimonial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/payment_screen.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
import 'package:sos_bebe_app/raspunde_intrebare_doar_chat_screen.dart';

class QuestionaireScreen extends StatefulWidget {
  const QuestionaireScreen({super.key});

  @override
  State<QuestionaireScreen> createState() => _QuestionaireScreenState();
}

class _QuestionaireScreenState extends State<QuestionaireScreen> {
  void callback(bool newIsVisible) {
    setState(() {
      isVisible = newIsVisible;
    });
  }

  bool isToggled = false;
  bool isVisible = false;
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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(children: [
                  //Text('Chestionar', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500)) old

                  //adăugat de George Valentin Iordache
                  Text('Chestionar', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500)),

                ]),
                const SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  //Text('Nume si prenume pacient', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old
                  //Text('Laura Popescu', style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400)) old

                  //adăugat de George Valentin Iordache
                  Text('Nume si prenume pacient', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w400)),
                  Text('Laura Popescu', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300)),
                ]),
                customDivider(),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  //Text('Varsta', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old
                  //Text('1 an si 8 luni', style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400)) old

                  //adăugat de George Valentin Iordache
                  Text('Varsta', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w400)),
                  Text('1 an si 8 luni', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300)),
                ]),
                customDivider(),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  // Text('Greutate', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)),
                  // Text('10 kg', style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400))

                  //adăugat de George Valentin Iordache
                  Text('Greutate', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w400)),
                  Text('10 kg', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300))
                ]),
                customDivider(),
                const SizedBox(height: 10),
                TextAndSwitchWidget(isToggled: isVisible, disease: "Alergic la vreun medicament?", callback: callback),
                
                // Column(
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text("Alergic la vreun medicament?",
                //             style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)),
                //         FlutterSwitch(
                //           value: isVisible,
                //           height: 25,
                //           width: 60,
                //           activeColor: const Color.fromARGB(255, 103, 197, 108),
                //           inactiveColor: Colors.grey[200]!,
                //           onToggle: (value) {
                //             setState(() {
                //               isVisible = value;
                //               // ignore: avoid_print
                //               print(isVisible);
                //             });
                //           },
                //         ),
                //       ],
                //     ),
                //     const SizedBox(height: 5),
                //     customDivider(),
                //     const SizedBox(height: 5),
                //   ],
                // ),
                Visibility(
                  visible: isVisible,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('La ce medicament este alergic?',

                            //style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old
                            
                            //adăugat de George Valentin Iordache
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          //borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 242, 239, 239),
                        ),
                        height: 70,
                        child: const TextField(
                          decoration:
                              InputDecoration(border: InputBorder.none, 
                                hintText: 'Alergic la paracetamol...',
                                
                                 //added by George Valentin Iordache
                                hintStyle: TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(children: [
                  //Text('Simptome pacient', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500)) old

                  //adăugat de George Valentin Iordache
                  Text('Simptome pacient', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500)),

                ]),
                const SizedBox(height: 15),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Febră"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Tuse"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Dificultăți respiratorii"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Astenie"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Cefalee"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Dureri în gât"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Grețuri/Vărsături"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Diaree/Constipație"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Refuzul alimentație"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Iritații piele"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Nas înfundat"),
                TextAndSwitchWidget(isToggled: isToggled, disease: "Rinoree"),
              ],
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                //return const PaymentScreen();
                return const RaspundeIntrebareDoarChatScreen(textNume: '', textIntrebare: '', textRaspuns: '',);
              },
            )),
            child: Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Colors.green,

                color: const Color.fromRGBO(14, 190, 127, 1),//adăugat de George Valentin Iordache

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
          //SizedBox(height: 15), old
          const SizedBox(height: 15),
        ],
      )),
    );
  }

  Divider customDivider() => const Divider(color: Colors.black12, height: 2, thickness: 1);
}

// ignore: must_be_immutable
class TextAndSwitchWidget extends StatefulWidget {
  bool isToggled;
  final Function(bool)? callback;
  final String disease;
  TextAndSwitchWidget({super.key, required this.isToggled, required this.disease, this.callback});

  @override
  State<TextAndSwitchWidget> createState() => _TextAndSwitchWidgetState();
}

class _TextAndSwitchWidgetState extends State<TextAndSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            //Text(widget.disease, style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old

            Text(widget.disease, style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w400)),

            FlutterSwitch(
              value: widget.isToggled,
              height: 25,
              width: 60,

              //activeColor: const Color.fromARGB(255, 103, 197, 108),

              //added by George Valentin Iordache
              activeColor: const Color.fromRGBO(14, 190, 127, 1),
              
              inactiveColor: Colors.grey[200]!,
              onToggle: (value) {
                if (widget.callback != null) {
                  setState(() {
                    widget.callback!(value);
                  });
                } else {
                  setState(() {
                    widget.isToggled = value;
                    // ignore: avoid_print
                    print(widget.isToggled);
                  });
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        customDivider(),
        const SizedBox(height: 5),
      ],
    );
  }
}
