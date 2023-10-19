import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/card_alert_dialog.dart';
import '../components/card_input_formatter.dart';
import '../components/card_month_input_formatter.dart';
import '../components/master_card.dart';
import '../components/my_painter.dart';
//import '../constants.dart';


class AdaugaMetodaPlataScreen extends StatefulWidget {
  const AdaugaMetodaPlataScreen({Key? key}) : super(key: key);

  @override
  State<AdaugaMetodaPlataScreen> createState() => _AdaugaMetodaPlataScreenState();
}

class _AdaugaMetodaPlataScreenState extends State<AdaugaMetodaPlataScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardExpiryDateController =
      TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();

  final FlipCardController flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Înapoi'),
        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
        foregroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      //end added by George Valentin Iordache
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              FlipCard(
                  fill: Fill.fillFront,
                  direction: FlipDirection.HORIZONTAL,
                  controller: flipCardController,
                  onFlip: () {
                    print('Flip');
                  },
                  flipOnTouch: true,
                  onFlipDone: (isFront) {
                    print('isFront: $isFront');
                  },
                  front: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: buildCreditCard(
                      //color: kDarkBlue,
                      color: const Color.fromRGBO(14, 190, 127, 1),
                      cardExpiration: cardExpiryDateController.text.isEmpty
                          ? "08/2022"
                          : cardExpiryDateController.text,
                      cardHolder: cardHolderNameController.text.isEmpty
                          ? "Card Holder"
                          : cardHolderNameController.text.toUpperCase(),
                      cardNumber: cardNumberController.text.isEmpty
                          ? "XXXX XXXX XXXX XXXX"
                          : cardNumberController.text,
                    ),
                  ),
                  back: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 4.0,
                      //color: kDarkBlue,
                      color: const Color.fromRGBO(14, 190, 127, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Container(
                        height: 230,
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 0),
                            const Text(
                              'https://www.paypal.com',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                              ),
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            CustomPaint(
                              painter: MyPainter(),
                              child: SizedBox(
                                height: 35,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      cardCvvController.text.isEmpty
                                          ? "322"
                                          : cardCvvController.text,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),    
              const SizedBox(height: 40),
              Row(
                children:[
                  const SizedBox(width: 30,),
                  Text('Card Number', 
                    style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 16,),
                  ),
                ],
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(14, 190, 127, 1),
                    width: 1.0,
                    style: BorderStyle.solid
                  ),
                  //color: Colors.grey[200],
                  //borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                child: TextFormField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    /*border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:  const BorderSide(color: Color.fromRGBO(14, 190, 127, 1), ),

                    ),
                    */
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: '1453 2436 1198 4452',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(206, 209, 229, 1),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardInputFormatter(),
                  ],
                  onChanged: (value) {
                    var text = value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                    setState(() {
                      cardNumberController.value = cardNumberController.value
                          .copyWith(
                              text: text,
                              selection:
                                  TextSelection.collapsed(offset: text.length),
                              composing: TextRange.empty);
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children:[
                  const SizedBox(width: 30,),
                  Text('Nume', 
                    style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 16,),
                  ),
                ],
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  //color: Colors.grey[200],
                  //borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(14, 190, 127, 1),
                    width: 1.0,
                    style: BorderStyle.solid
                  ),
                  //color: Colors.grey[200],
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: cardHolderNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    /*
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:  const BorderSide(color: Color.fromRGBO(14, 190, 127, 1), ),

                    ),
                    */
                    contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Popescu',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(206, 209, 229, 1),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      cardHolderNameController.value =
                          cardHolderNameController.value.copyWith(
                              text: value,
                              selection:
                                  TextSelection.collapsed(offset: value.length),
                              composing: TextRange.empty);
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:[
                          const SizedBox(width: 5,),
                          Text('CVV', 
                            style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 16,),
                          ),
                        ],
                      ),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          //color: Colors.grey[200],
                          //borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromRGBO(14, 190, 127, 1),
                            width: 1.0,
                            style: BorderStyle.solid
                          ),
                          //color: Colors.grey[200],
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: cardCvvController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: '● ● ●',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(206, 209, 229, 1),
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          onTap: () {
                            setState(() {
                              Future.delayed(const Duration(milliseconds: 300), () {
                                flipCardController.toggleCard();
                              });
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              int length = value.length;
                              if (length == 4 || length == 9 || length == 14) {
                                cardNumberController.text = '$value ';
                                cardNumberController.selection =
                                    TextSelection.fromPosition(
                                        TextPosition(offset: value.length + 1));
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:[
                          const SizedBox(width: 5),
                          Text('Expired Date', 
                            style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 16,),
                          ),
                        ],
                      ),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          //color: Colors.grey[200],
                          //borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromRGBO(14, 190, 127, 1),
                            width: 1.0,
                            style: BorderStyle.solid
                          ),
                          //color: Colors.grey[200],
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: cardExpiryDateController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: '01/28',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(206, 209, 229, 1),
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardDateInputFormatter(),
                          ],
                          onChanged: (value) {
                            var text = value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                            setState(() {
                              cardExpiryDateController.value =
                                  cardExpiryDateController.value.copyWith(
                                      text: text,
                                      selection: TextSelection.collapsed(
                                          offset: text.length),
                                      composing: TextRange.empty);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20 * 3),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width / 1.12, 55),
                ),
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    showDialog(
                        context: context,
                        builder: (context) => const CardAlertDialog());
                    cardCvvController.clear();
                    cardExpiryDateController.clear();
                    cardHolderNameController.clear();
                    cardNumberController.clear();
                    flipCardController.toggleCard();
                  });
                },
                child: const Text(
                  'PLATĂ / ADAUGĂ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
