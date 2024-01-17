import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
//import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sos_bebe_app/parola_noua_pacient_screen.dart';
//import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
//import 'package:auto_size_text/auto_size_text.dart';

class VerificaCodulPacientScreen extends StatefulWidget {
  const VerificaCodulPacientScreen({super.key});

  @override
  State<VerificaCodulPacientScreen> createState() => _VerificaCodulPacientScreenState();
}

class _VerificaCodulPacientScreenState extends State<VerificaCodulPacientScreen> {
  final verificaCodulKey = GlobalKey<FormState>();
  bool isHidden = true;
  final controllerCode = TextEditingController();

  final FocusNode focusNodePhone = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 125),
                Center(
                  child: Text(
                    'Verifică codul',
                    style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(14, 190, 127, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Form(
                  key: verificaCodulKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width:250,
                        child:AutoSizeText.rich(// old value RichText(
                          TextSpan(
                            style: GoogleFonts.rubik(
                              color: const Color.fromRGBO(103, 114, 148, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            children: const <TextSpan>[
                              TextSpan(text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod..'),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),  
                      const SizedBox(height: 35),
                      SizedBox(height: 80, width: 270,
                       child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: const Color.fromRGBO(205, 211, 223, 1)),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center( 
                            child: SizedBox(
                              width: 200,
                              height:80,  
                              child: PinCodeTextField(
                                length: 4,
                                //obscureText: false,
                                textStyle: const TextStyle(color: Colors.white),
                                //animationType: AnimationType.fade,
                                appContext: context,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.circle,
                                  borderRadius: BorderRadius.zero,
                                  fieldHeight: 40,
                                  fieldWidth: 40,
                                  activeFillColor: const Color.fromRGBO(14, 190, 127, 1),
                                  inactiveColor: const Color.fromRGBO(103, 114, 148, 1),
                                  inactiveFillColor: const Color.fromRGBO(103, 114, 148, 1),
                                  selectedFillColor: const Color.fromRGBO(103, 114, 148, 1),
                                  selectedColor: const Color.fromRGBO(103, 114, 148, 1),
                                  activeColor: const Color.fromRGBO(103, 114, 148, 1),
                                ),
                                animationDuration: const Duration(milliseconds: 300),
                                //cursorColor: const Color.fromRGBO(103, 114, 148, 1),
                                backgroundColor: Colors.transparent,
                                enableActiveFill: true,
                                //errorAnimationController: errorController,
                                //controller: textEditingController,
                                onCompleted: (v) {
                                  print("Completed");
                                },
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    //currentText = value;
                                  });
                                },
                                beforeTextPaste: (text) {
                                  print("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                              ),
                            ),  
                          ),
                        ),   
                      ),  
                      const SizedBox(height: 45),
                      
                      SizedBox(
                        width:250,
                        child:
                        GestureDetector(
                          onTap: () 
                          {                               
                            
                          },
                          child:
                          Center(
                            child:Text('Timite din nou codul', 
                              style: GoogleFonts.rubik(color: const Color.fromRGBO(14, 190, 127, 1), fontWeight: FontWeight.w300, fontSize: 14))
                          ),
                        ),  
                      ), 
                    ],
                  ),
                ),
                const SizedBox(height: 115),
                SizedBox(
                  width: 160,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      
                      final isValidForm = verificaCodulKey.currentState!.validate();
                      if (isValidForm) {  
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //builder: (context) => const ServiceSelectScreen(),
                            builder: (context) => const ParolaNouaPacientScreen(),
                          ) 
                        );
                      }  
                      
                      //Navigator.push(
                          //context,
                          //MaterialPageRoute(
                            //builder: (context) => const ServiceSelectScreen(),
                            //builder: (context) => const TestimonialScreen(),
                          //));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                        minimumSize: const Size.fromHeight(50), // NEW
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: Text('Verifică',
                        style: GoogleFonts.rubik(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300)),
                  ),
                ),  
                //const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}