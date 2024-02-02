import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_bebe_app/localizations/1_delegate.dart';

import 'package:sos_bebe_app/localizations/ro.dart' as romanian;

class LocalizationsApp {
  LocalizationsApp(this.locale);

  final Locale locale;

    get universalSave => null;

  static LocalizationsApp? of(BuildContext context) {
    return Localizations.of<LocalizationsApp>(context, LocalizationsApp);
  }

  static const LocalizationsDelegate delegate = AppLocalizationsDelegate();

  static final Map<String, Map<String, dynamic>> _localizedValues = {
    'ro': romanian.values,
    /*
    'en': english.values,
    'fr': french.values,
    'it': italian.values
    */
  };



  String get universalInapoi {
    return _localizedValues[locale.languageCode]!['universal']['inapoi'];
  }


  // adauga_metoda_plata

  String get adaugaMetodaPlataIntroducetiDateleCardului {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['introduceti_datele_cardului'];
  }
  
  String get adaugaMetodaPlataCardHolderTitle {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['card_holder_title'];
  }
  
  String get adaugaMetodaPlataValidThruTitle {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['valid_thru_title'];
  }
  
  String get adaugaMetodaPlataExpiryDate {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['expiry_date'];
  }
  
  String get adaugaMetodaPlataCardHolderHint {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['card_holder_hint'];
  }
  
  String get adaugaMetodaPlataCardNumberText {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['card_number_text'];
  }
  
  String get adaugaMetodaPlataAdresaWeb {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['adresa_web'];
  }
  
  String get adaugaMetodaPlataCVV {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['cvv'];
  }
  
  String get adaugaMetodaPlataCardNumberTitle {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['card_number_title'];
  }
  
  String get adaugaMetodaPlataCardNumberHint {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['card_number_hint'];
  }
  
  String get adaugaMetodaPlataNecompletat {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['necompletat'];
  }
  
  String get adaugaMetodaPlataIncorect {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['incorect'];
  }
  
  String get adaugaMetodaPlataNume {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['nume'];
  }
  
  String get adaugaMetodaPlataCardHolderNameHint {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['card_holder_name_hint'];
  }
  
  String get adaugaMetodaPlataCVVTitle {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['cvv_title'];
  }
  
  String get adaugaMetodaPlataCardCVV {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['card_cvv'];
  }
  
  String get adaugaMetodaPlataExpiredDate {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['expired_date'];
  }
  
  String get adaugaMetodaPlataExpiryDateHint {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['expiry_date_hint'];
  }
  
  String get adaugaMetodaPlataNecompletata {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['necompletata'];
  }
  
  String get adaugaMetodaPlataIncorecta {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['incorecta'];
  }
  
  String get adaugaMetodaPlataPlataAdauga {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['plata_adauga'];
  }


  // apel_video_pacient_screen

  String get apelVideoPacientVaRugamAsteptati {
    return _localizedValues[locale.languageCode]!['adauga_metoda_plata']['va_rugam_asteptati'];
  }


  // confirmare_screen

  String get confirmareTitlu {
    return _localizedValues[locale.languageCode]!['confirmare']['confirmare_titlu'];
  }

  String get confirmareMasterCard {
    return _localizedValues[locale.languageCode]!['confirmare']['master_card'];
  }

  String get confirmareCardNumber {
    return _localizedValues[locale.languageCode]!['confirmare']['card_number'];
  }

  String get confirmareTipPlata {
    return _localizedValues[locale.languageCode]!['confirmare']['tip_plata'];
  }

  String get confirmareUser {
    return _localizedValues[locale.languageCode]!['confirmare']['user'];
  }

  String get confirmareBanca {
    return _localizedValues[locale.languageCode]!['confirmare']['banca'];
  }

  String get confirmareStripe {
    return _localizedValues[locale.languageCode]!['confirmare']['stripe'];
  }

  String get confirmareAdaugaMetodaDePlata {
    return _localizedValues[locale.languageCode]!['confirmare']['adauga_metoda_de_plata'];
  }


  // confirmare_servicii

  String get confirmareServiciiTitlu {
    return _localizedValues[locale.languageCode]!['confirmare']['confirma_plata'];
  }

  String get confirmareServiciiServiciiPediatrie {
    return _localizedValues[locale.languageCode]!['confirmare']['servicii_pediatrie'];
  }

  String get confirmareServiciiPrimitiRecomandareReteta {
    return _localizedValues[locale.languageCode]!['confirmare']['primiti_recomandare_reteta'];
  }

  String get confirmareServiciiRON {
    return _localizedValues[locale.languageCode]!['confirmare']['ron'];
  }

  String get confirmareServiciiSubtotal {
    return _localizedValues[locale.languageCode]!['confirmare']['subtotal'];
  }

  String get confirmareServiciiTotal {
    return _localizedValues[locale.languageCode]!['confirmare']['total'];
  }

  String get confirmareServiciiConfirmaPlataButon {
    return _localizedValues[locale.languageCode]!['confirmare']['confirma_plata_buton'];
  }



  //old Adrian Murgu

  //////////////
  ///UNIVERSAL
  ///

  String get universalTitluSelectLanguage {
    return _localizedValues[locale.languageCode]!['universal']['languageTitle'];
  }


  String get ListaServiciu {
    return _localizedValues[locale.languageCode]!['universal']['lss'];
  }

  String get Valoare {
    return _localizedValues[locale.languageCode]!['universal']['v'];
  }

  String get Platit {
    return _localizedValues[locale.languageCode]!['universal']['p'];
  }










  String get universalValidarePin {
    return _localizedValues[locale.languageCode]!['universal']['pinVal'];
  }




  String get universalConsultatii {
    return _localizedValues[locale.languageCode]!['universal']['cons'];
  }

  String get contulMeuModificatiCont {
    return _localizedValues[locale.languageCode]!['universal']['mc'];
  }

  
  String get contulMeuModificatiJudet {
    return _localizedValues[locale.languageCode]!['universal']['judet'];
  }

  String get contulMeuStergeCont {
    return _localizedValues[locale.languageCode]!['universal']['stergecont'];
  }

  String get universalEroare {
    return _localizedValues[locale.languageCode]!['universal']['eroareServer'];
  }

  String get universalCampInvalid {
    return _localizedValues[locale.languageCode]!['universal']['campInvalid'];
  }

  String get universalTelInvalid {
    return _localizedValues[locale.languageCode]!['universal']['telefonInvalid'];
  }

  String get universalEmailInvalid {
    return _localizedValues[locale.languageCode]!['universal']['emailInvalid'];
  }

  String get universalTelefon {
    return _localizedValues[locale.languageCode]!['universal']['telefon'];
  }

  String get universalJudet{
    return _localizedValues[locale.languageCode]!['universal']['judet'];
  }
  String get universalModifLocal{
    return _localizedValues[locale.languageCode]!['universal']['ml'];
  }
  String get universalModifNumeleFamilie{
    return _localizedValues[locale.languageCode]!['universal']['nmx'];
  }
  String get universalModifPrenume{
    return _localizedValues[locale.languageCode]!['universal']['pn'];
  }
  String get universalModifmail{
    return _localizedValues[locale.languageCode]!['universal']['malll'];
  }

  String get universalModifJud{
    return _localizedValues[locale.languageCode]!['universal']['jd'];
  }

  String get universalModifTelefon{
    return _localizedValues[locale.languageCode]!['universal']['tff'];
  }

  String get universaldetMedic{
    return _localizedValues[locale.languageCode]!['universal']['dmd'];
  }
  String get universaldesc{
    return _localizedValues[locale.languageCode]!['universal']['ds'];
  }
  String get universalarii{
    return _localizedValues[locale.languageCode]!['universal']['ai'];
  }

  String get universalSalvare{
    return _localizedValues[locale.languageCode]!['universal']['sal'];
  }

  String get universalLocalitate{
    return _localizedValues[locale.languageCode]!['universal']['localitate'];
  }


  String get universalEmail {
    return _localizedValues[locale.languageCode]!['universal']['email'];
  }

  String get universalNume {
    return _localizedValues[locale.languageCode]!['universal']['nume'];
  }

  String get universalPrenume {
    return _localizedValues[locale.languageCode]!['universal']['prenume'];
  }


  String get universalCopii {
    return _localizedValues[locale.languageCode]!['universal']['cpi'];
  }

  String get universalDDN {
    return _localizedValues[locale.languageCode]!['universal']['ddn'];
  }

  String get universalPass {
    return _localizedValues[locale.languageCode]!['universal']['password'];
  }

  String get universalPassConfirm {
    return _localizedValues[locale.languageCode]!['universal']['passwordConfirm'];
  }

  String get universalBack {
    return _localizedValues[locale.languageCode]!['universal']['back'];
  }

  String get universalContinue {
    return _localizedValues[locale.languageCode]!['universal']['continue'];
  }

  String get universalNoInternet {
    return _localizedValues[locale.languageCode]!['noInternet']['noInternet'];
  }

  String get universalNo {
    return _localizedValues[locale.languageCode]!['universal']['no'];
  }

  String get universalYes {
    return _localizedValues[locale.languageCode]!['universal']['yes'];
  }

  String get universalRegister {
    return _localizedValues[locale.languageCode]!['universal']['register'];
  }

  String get creazaCont {
    return _localizedValues[locale.languageCode]!['universal']['cc'];
  }

  String get universalLogin {
    return _localizedValues[locale.languageCode]!['universal']['login'];
  }

  String get selLimba {
    return _localizedValues[locale.languageCode]!['universal']['limba'];
  }


  String get universalTextLogare {
    return _localizedValues[locale.languageCode]!['universal']['textlogare'];
  }
  String get universalTextCont {
    return _localizedValues[locale.languageCode]!['universal']['textCont'];
  }
  String get scrisoare{
    return _localizedValues[locale.languageCode]!['universal']['1'];
  }
  String get reteta{
    return _localizedValues[locale.languageCode]!['universal']['2'];
  }
  String get adeverinta{
    return _localizedValues[locale.languageCode]!['universal']['3'];
  }


  String get universalSend {
    return _localizedValues[locale.languageCode]!['universal']['send'];
  }

  String get universalOk {
    return _localizedValues[locale.languageCode]!['universal']['ok'];
  }

  String get universalMandatoryField {
    return _localizedValues[locale.languageCode]!['universal']['mandatoryField'];
  }

  String get universalPassMismatch {
    return _localizedValues[locale.languageCode]!['universal']['passMismatch'];
  }

  String get universalInvalidCredentials {
    return _localizedValues[locale.languageCode]!['universal']['invalidCredentials'];
  }

  String get universalForgotPass {
    return _localizedValues[locale.languageCode]!['universal']['forgotPass'];
  }

  String get universalChangePass {
    return _localizedValues[locale.languageCode]!['universal']['changePass'];
  }

  String get universalNewPass {
    return _localizedValues[locale.languageCode]!['universal']['newPassword'];
  }

  String get universalPinEmailAlert {
    return _localizedValues[locale.languageCode]!['universal']['pinEmailAlert'];
  }

  String get universalValidationCode {
    return _localizedValues[locale.languageCode]!['universal']['validationCode'];
  }

  String get universalValidationCodeError {
    return _localizedValues[locale.languageCode]!['universal']['validationCodeError'];
  }

  String get universalAppUnavailable {
    return _localizedValues[locale.languageCode]!['universal']['appUnavailable'];
  }

  String get noInternetMsg {
    return _localizedValues[locale.languageCode]!['noInternet']['noInternet'];
  }

  String get noInternetRefresh {
    return _localizedValues[locale.languageCode]!['noInternet']['refresh'];
  }

  String get errorRegister132 {
    return _localizedValues[locale.languageCode]!['universal']['errorRegister132'];
  }

  String get loginDateGresite {
    return _localizedValues[locale.languageCode]!['universal']['loginDateGresite'];
  }

  String get reseteazaParolaDateGresite {
    return _localizedValues[locale.languageCode]!['universal']['reseteazaParolaDateGresite'];
  }

  String get reseteazaParolaValideazaPin {
    return _localizedValues[locale.languageCode]!['universal']['reseteazaParolaValideazaPin'];
  }

  String get universalPinInvalid {
    return _localizedValues[locale.languageCode]!['universal']['pinInvalid'];
  }

  String get universalMesajUserNeasociat {
    return _localizedValues[locale.languageCode]!['universal']['mesajUserNeasociat'];
  }

  String get universalDDNpeste18Ani {
    return _localizedValues[locale.languageCode]!['universal']['ddn_peste_18ani'];
  }

  String get universalParolaMinimCaractere {
    return _localizedValues[locale.languageCode]!['universal']['minim_caractere'];
  }

  String get universalAnulare {
    return _localizedValues[locale.languageCode]!['universal']['anulare'];
  }

  String get universalDeschideSetari {
    return _localizedValues[locale.languageCode]!['universal']['deschide_setari'];
  }

  String get universalInchide {
    return _localizedValues[locale.languageCode]!['universal']['inchide'];
  }

  String get universalSelectatiSediul {
    return _localizedValues[locale.languageCode]!['universal']['selectati_sediul'];
  }

  String get universalToateSediile {
    return _localizedValues[locale.languageCode]!['universal']['toate_sediile'];
  }

  /////////////////////
  ///ACCEPTA TERMENII

  String get acceptaTermeniiWelcom {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['welcome'];
  }

  String get acceptaTermeniiPatient {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['patient'];
  }

  String get acceptaTermenii1 {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['text1'];
  }

  String get acceptaTermeniiHealthcare {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['healthcare'];
  }

  String get termeni {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['termeni'];
  }

  String get acceptaTermeniiMsg {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['msg'];
  }

  String get acceptaTermeniiMsgTerms {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['msg_terms'];
  }

  String get acceptaTermeniiMsgAnd {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['msg_and'];
  }

  String get acceptaTermeniiMsgConditions {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['msg_conditions'];
  }

  String get acceptaTermenii {
    return _localizedValues[locale.languageCode]!['accepta_termenii']['accepta_termenii'];
  }

//////////////
  ///TERMENI SI CONDITII

  String get termeniiConditiiTitle {
    return _localizedValues[locale.languageCode]!['termeni_conditii']['title'];
  }

  String get politicaTitlu {
    return _localizedValues[locale.languageCode]!['politica_conf']['title'];
  }

  //HOME

  String get homeWelcome {
    return _localizedValues[locale.languageCode]!['home']['welcome'];
  }
  String get homeSus {
    return _localizedValues[locale.languageCode]!['home']['sus'];
  }

  String get homeTapToPay {
    return _localizedValues[locale.languageCode]!['home']['tap_to_pay'];
  }

  String get homeProgramarileMele {
    return _localizedValues[locale.languageCode]!['home']['programarileMele'];
  }

  String get homeContulMeu {
    return _localizedValues[locale.languageCode]!['home']['contul_meu'];
  }

  String get homeInterventii {
    return _localizedValues[locale.languageCode]!['home']['interventii'];
  }

  String get homeProgramari {
    return _localizedValues[locale.languageCode]!['home']['programari'];
  }

  String get homePlati {
    return _localizedValues[locale.languageCode]!['home']['hp'];
  }


  String get platiTitlu {
    return _localizedValues[locale.languageCode]!['plati']['title'];
  }

  String get platiNeplatite {
    return _localizedValues[locale.languageCode]!['plati']['neplatite'];
  }

  String get platiToate {
    return _localizedValues[locale.languageCode]!['plati']['toate'];
  }

  String get home11 {
    return _localizedValues[locale.languageCode]!['home']['h11'];
  }
  String get home22 {
    return _localizedValues[locale.languageCode]!['home']['h22'];
  }


  String get alegeCopil {
    return _localizedValues[locale.languageCode]!['home']['alc'];
  }



  String get politicadeconf {
    return _localizedValues[locale.languageCode]!['home']['confident '];
  }

  String get homeContact {
    return _localizedValues[locale.languageCode]!['home']['contact'];
  }

  String get homeProgramariFamilie {
    return _localizedValues[locale.languageCode]!['home']['programariFamilie'];
  }

  String get homeProgramareNoua {
    return _localizedValues[locale.languageCode]!['home']['programareNoua'];
  }

  String get homeListaPreturi {
    return _localizedValues[locale.languageCode]!['home']['listaPreturi'];
  }

  String get homeEchipaDoctori {
    return _localizedValues[locale.languageCode]!['home']['echipaDoctori'];
  }
  String get searchDoc {
    return _localizedValues[locale.languageCode]!['home']['sd'];
  }

  String get homeSedii {
    return _localizedValues[locale.languageCode]!['home']['sedii'];
  }

  String get homeTratamenteleMele {
    return _localizedValues[locale.languageCode]!['home']['tratamenteleMele'];
  }

  String get homeRadiografii {
    return _localizedValues[locale.languageCode]!['home']['radiografii'];
  }

  String get homePrescriptiileMele {
    return _localizedValues[locale.languageCode]!['home']['prescriptiileMele'];
  }

  String get homeSold {
    return _localizedValues[locale.languageCode]!['home']['sold'];
  }

  String get homeLogOut {
    return _localizedValues[locale.languageCode]!['home']['logout'];
  }

  String get homeSchimbaLimba {
    return _localizedValues[locale.languageCode]!['home']['schimbaLimba'];
  }

  String get homeProgramariViitoare {
    return _localizedValues[locale.languageCode]!['home']['programari_viitoare'];
  }

  String get homeProgramariTrecute {
    return _localizedValues[locale.languageCode]!['home']['programari_trecute'];
  }

  String get homeUrmatoareaProgramare {
    return _localizedValues[locale.languageCode]!['home']['urmatoarea_programare'];
  }

  String get homeConfirma {
    return _localizedValues[locale.languageCode]!['home']['confirma'];
  }

  String get homeAnuleaza {
    return _localizedValues[locale.languageCode]!['home']['anuleaza'];
  }

  String get homeFeedback {
    return _localizedValues[locale.languageCode]!['home']['feedback'];
  }
  String get card {
    return _localizedValues[locale.languageCode]!['home']['card'];
  }

  String get homeDeFacut {
    return _localizedValues[locale.languageCode]!['home']['de_facut'];
  }

  String get homeRealizate {
    return _localizedValues[locale.languageCode]!['home']['realizate'];
  }

  String get homeNicioProgramare {
    return _localizedValues[locale.languageCode]!['home']['nicio_programare'];
  }

  String get homeNicioConsultatie {
    return _localizedValues[locale.languageCode]!['home']['nicio_consultatie'];
  }

  String get homeNicioInterventie {
    return _localizedValues[locale.languageCode]!['home']['nicio_interventie'];
  }

  String get homeAnuleazaProgramarea {
    return _localizedValues[locale.languageCode]!['home']['anuleaza_programarea'];
  }

  String get homeConfirmaProgramarea {
    return _localizedValues[locale.languageCode]!['home']['confirma_programarea'];
  }

  String get homeDa {
    return _localizedValues[locale.languageCode]!['home']['yes'];
  }

  String get homeNu {
    return _localizedValues[locale.languageCode]!['home']['no'];
  }

  String get homeSolicitaProgramare {
    return _localizedValues[locale.languageCode]!['home']['solicitaProgramare'];
  }

  String get homeVeziIstoric {
    return _localizedValues[locale.languageCode]!['home']['veziIstoric'];
  }

  String get homeIstoricProgramari {
    return _localizedValues[locale.languageCode]!['home']['istoricProgramari'];
  }

  String get homeOProgramare1 {
    return _localizedValues[locale.languageCode]!['home']['oProgramare1'];
  }
  String get home1 {
    return _localizedValues[locale.languageCode]!['home']['h1'];
  }
  String get home2 {
    return _localizedValues[locale.languageCode]!['home']['h2'];
  }

  String get homeOProgramare2 {
    return _localizedValues[locale.languageCode]!['home']['oProgramare2'];
  }

  String get homeOProgramare3 {
    return _localizedValues[locale.languageCode]!['home']['oProgramare3'];
  }

  String get homeMaiMulteProgramari {
    return _localizedValues[locale.languageCode]!['home']['maiMulteProgramari'];
  }

  String get homeMaiMulteProgramariLa {
    return _localizedValues[locale.languageCode]!['home']['maiMulteProgramariLa'];
  }

  String get homeAreProgramare {
    return _localizedValues[locale.languageCode]!['home']['areProgramare'];
  }

  //IGV
  String get homeArhivaMedicala {
    return _localizedValues[locale.languageCode]!['home']['radiografii'];
  }

  //CHOOSE USER

  String get chooseUserPentru {
    return _localizedValues[locale.languageCode]!['chooseUser']['pentru'];
  }

  String get chooseUserMine {
    return _localizedValues[locale.languageCode]!['chooseUser']['mine'];
  }

  //CONTUL MEU


  String get reprog {
    return _localizedValues[locale.languageCode]!['home']['rpg'];
  }


  String get detcons {
    return _localizedValues[locale.languageCode]!['home']['ds'];
  }


  String get contulMeuTitlu {
    return _localizedValues[locale.languageCode]!['contul_meu']['titlu'];
  }
  String get contulMeumodSalvate {
    return _localizedValues[locale.languageCode]!['home']['modS'];
  }
  String get contuintra {
    return _localizedValues[locale.languageCode]!['home']['irt'];
  }

  String get modCont{
    return _localizedValues[locale.languageCode]!['home']['mkc'];
  }
  String get pedgen{
    return _localizedValues[locale.languageCode]!['home']['pg'];
  }

  String get vd{
    return _localizedValues[locale.languageCode]!['home']['vd'];
  }


  String get contulMeuVaPutemContacta {
    return _localizedValues[locale.languageCode]!['contul_meu']['va_putem_contacta'];
  }

  String get contulMeuNePermiteti {
    return _localizedValues[locale.languageCode]!['contul_meu']['ne_permiteti'];
  }

  String get contulMeuSMSreamintire {
    return _localizedValues[locale.languageCode]!['contul_meu']['sms_reamintire'];
  }

  String get contulMeuSMSrecall {
    return _localizedValues[locale.languageCode]!['contul_meu']['sms_recall'];
  }

  String get contulMeuSMSaniversare {
    return _localizedValues[locale.languageCode]!['contul_meu']['sms_aniversare'];
  }

  String get contulMeuNewsletterSMS {
    return _localizedValues[locale.languageCode]!['contul_meu']['newsletter_sms'];
  }

  String get contulMeuNewsletterEmail {
    return _localizedValues[locale.languageCode]!['contul_meu']['newsletter_email'];
  }

  String get contulMeuModificati {
    return _localizedValues[locale.languageCode]!['contul_meu']['modificati'];
  }

  String get contulMeuLipsaTelefon {
    return _localizedValues[locale.languageCode]!['contul_meu']['lipsa_telefon'];
  }
  String get contulMeuLipsaNume {
    return _localizedValues[locale.languageCode]!['contul_meu']['Nume Personal'];
  }
  String get contulMeuLipsaPrenume {
    return _localizedValues[locale.languageCode]!['contul_meu']['Prenume Personal'];
  }
  String get contulMeuLipsaEmail {
    return _localizedValues[locale.languageCode]!['contul_meu']['lipsa_email'];
  }

  String get contulMeuSigurDoriti {
    return _localizedValues[locale.languageCode]!['contul_meu']['sigur_doriti'];
  }

  String get contulMeuDa {
    return _localizedValues[locale.languageCode]!['contul_meu']['da'];
  }

  String get contulMeuNu {
    return _localizedValues[locale.languageCode]!['contul_meu']['nu'];
  }

  String get contulMeuLipsaSMSreamintire {
    return _localizedValues[locale.languageCode]!['contul_meu']['lipsa_sms_reamintire'];
  }

  String get contulMeuLipsaSMSrecall {
    return _localizedValues[locale.languageCode]!['contul_meu']['lipsa_sms_recall'];
  }

  String get contulMeuPreferinte {
    return _localizedValues[locale.languageCode]!['contul_meu']['preferinte'];
  }

  String get contulMeuDateContact {
    return _localizedValues[locale.languageCode]!['contul_meu']['date_contact'];
  }

  String get contulMeuSave {
    return _localizedValues[locale.languageCode]!['contul_meu']['save'];
  }

  String get contulMeuCancel {
    return _localizedValues[locale.languageCode]!['contul_meu']['cancel'];
  }

  String get contulMeuSchimbaLimba {
    return _localizedValues[locale.languageCode]!['contul_meu']['schimba_limba'];
  }

  String get contulMeuSchimbaParola {
    return _localizedValues[locale.languageCode]!['contul_meu']['schimba_parola'];
  }

  String get contulMeuEmailDejaFolosit {
    return _localizedValues[locale.languageCode]!['contul_meu']['email_deja_folosit'];
  }

  String get contulMeuCodDeBare {
    return _localizedValues[locale.languageCode]!['contul_meu']['cod_de_bare'];
  }

  String get contulMeuAlege {
    return _localizedValues[locale.languageCode]!['contul_meu']['alege'];
  }

  String get contulMeuPacient {
    return _localizedValues[locale.languageCode]!['contul_meu']['pacient'];
  }

  String get contulMeuMsgSigurDoritiStergerea {
    return _localizedValues[locale.languageCode]!['contul_meu']['msgSigurDoritiStergerea'];
  }


  //SCHIMBA PAROLA

  String get schimbaParolaCurrentPass {
    return _localizedValues[locale.languageCode]!['schimba_parola']['current_pass'];
  }

  String get schimbaParolaIncorectPass {
    return _localizedValues[locale.languageCode]!['schimba_parola']['incorect_pass'];
  }

  //POZA PROFIL

  String get pozaProfilTitlu {
    return _localizedValues[locale.languageCode]!['poza_profil']['titlu'];
  }

  String get pozaProfilSchimbaPoza {
    return _localizedValues[locale.languageCode]!['poza_profil']['schimba_poza'];
  }

  String get pozaProfilCamera {
    return _localizedValues[locale.languageCode]!['poza_profil']['camera'];
  }

  String get pozaProfilGalerie {
    return _localizedValues[locale.languageCode]!['poza_profil']['galerie'];
  }

  String get pozaProfilAlwaysFinishActivitiesMsg {
    return _localizedValues[locale.languageCode]!['poza_profil']['always_finish_activities_msg'];
  }

  String get pozaProfilCerePermisiuneCamera {
    return _localizedValues[locale.languageCode]!['poza_profil']['cere_permisiune_camera'];
  }

  String get pozaProfilCerePermisiuneGalerie {
    return _localizedValues[locale.languageCode]!['poza_profil']['cere_permisiune_galerie'];
  }

  //PROGRAMARE NOUA

  String get progNouaPentruMine {
    return _localizedValues[locale.languageCode]!['programareNoua']['pentruMine'];
  }

  String get progNouaAlegetiData {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiData'];
  }

  String get progNouaAlegetiAltaData {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiAltaData'];
  }

  String get progNouaCompletatiObservatii {
    return _localizedValues[locale.languageCode]!['programareNoua']['completatiObservatii'];
  }

  String get progNouaProgAdaugata {
    return _localizedValues[locale.languageCode]!['programareNoua']['progAdaugata'];
  }

  String get progNouaProgAdaugataReala {
    return _localizedValues[locale.languageCode]!['programareNoua']['progAdaugataReala'];
  }

  String get progNouaCategorie {
    return _localizedValues[locale.languageCode]!['programareNoua']['categorie'];
  }

  String get progNouaMedic {
    return _localizedValues[locale.languageCode]!['programareNoua']['medic'];
  }

  String get progNouaData {
    return _localizedValues[locale.languageCode]!['programareNoua']['data'];
  }
  String get progNouaSelecteazaData {
    return _localizedValues[locale.languageCode]!['programareNoua']['aleDat'];
  }

  String get progNouaObservatii {
    return _localizedValues[locale.languageCode]!['programareNoua']['observatii'];
  }

  String get progNouaScriene {
    return _localizedValues[locale.languageCode]!['programareNoua']['scrn'];
  }

  String get progNouaAlegeti {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegeti'];
  }

  String get progNouaAlegetiCategoria {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiCategoria'];
  }

  
  String get progNouaAlegetiInterventia {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiServiciul'];
  }

  String get progNouaAlegetiMotiv {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiMotiv'];
  }

  String get progNouaAlegetiMedicul {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiMedicul'];
  }

  String get progNouaOk {
    return _localizedValues[locale.languageCode]!['programareNoua']['ok'];
  }

  String get progNouaTrimite {
    return _localizedValues[locale.languageCode]!['programareNoua']['trimite'];
  }

  String get progNouaAlegetiOra {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiOra'];
  }

  String get progNouaFaraIntervaleLibere {
    return _localizedValues[locale.languageCode]!['programareNoua']['faraIntervaleLibere'];
  }

  String get progNouaFaraIntervaleLibereLaMedic {
    return _localizedValues[locale.languageCode]!['programareNoua']['faraIntervaleLibereLaMedic'];
  }

  String get progNouaUrmatorulInterval {
    return _localizedValues[locale.languageCode]!['programareNoua']['urmatorulInterval'];
  }

  String get progNouaIntervaleDisponibile {
    return _localizedValues[locale.languageCode]!['programareNoua']['intervaleDisponibile'];
  }

  String get progNouaAlegeListaServicii {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegeListaDeServicii'];
  }

  String get progNouaAlegeServiciul {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegeServiciul'];
  }

  String get progNouaUrmatorulPas {
    return _localizedValues[locale.languageCode]!['programareNoua']['urmatorulpas'];
  }

  String get progNouaMsgNuSuntServiciiAlocateSpecializarii {
    return _localizedValues[locale.languageCode]!['programareNoua']['nuSuntServiciiAlocateSpecializarii'];
  }

  String get progNouaMsgEroare {
    return _localizedValues[locale.languageCode]!['programareNoua']['eroare'];
  }
  
  String get progNouaMsgSelectatiUnServiciu {
    return _localizedValues[locale.languageCode]!['programareNoua']['selectatiUnServiciu'];
  }
  
  String get progNouaNuAtiSelectatMedic {
    return _localizedValues[locale.languageCode]!['programareNoua']['nuAtiSelectatUnMedic'];
  }
  
  String get progNouaNuAtiSelectatOCategorie {
    return _localizedValues[locale.languageCode]!['programareNoua']['nuAtiSelectatOCategorie'];
  }
  
  String get progNouaAlegetiListaServicii {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiListaServicii'];
  }

  String get progNouaAlegetiOData {
    return _localizedValues[locale.languageCode]!['programareNoua']['alegetiOData'];
  }
  
  String get progNouaSelectatiIntervalMedic {
    return _localizedValues[locale.languageCode]!['programareNoua']['selectatiIntervalMedic'];
  }
  
  String get progNouaRezumatProgramare {
    return _localizedValues[locale.languageCode]!['programareNoua']['rezumatProgramare'];
  }
  
  String get progNouaRezumatProgramareMedic {
    return _localizedValues[locale.languageCode]!['programareNoua']['rezumatProgramareMedic'];
  }
  
  String get progNouaRezumatProgramareCategorie {
    return _localizedValues[locale.languageCode]!['programareNoua']['rezumatProgramareCategorie'];
  }
  
  String get progNouaRezumatProgramareServiciuSelectat {
    return _localizedValues[locale.languageCode]!['programareNoua']['rezumatProgramareServiciuSelectat'];
  }
  
  String get progNouaRezumatProgramareData {
    return _localizedValues[locale.languageCode]!['programareNoua']['rezumatProgramareData'];
  }
  
  String get progNouaRezumatProgramareOra {
    return _localizedValues[locale.languageCode]!['programareNoua']['rezumatProgramareOra'];
  }
  
  String get progNouaRezumatProgramarePret {
    return _localizedValues[locale.languageCode]!['programareNoua']['rezumatProgramarePretul'];
  }

//PROGRAMARILE LUI

  String get progLuiViitoare {
    return _localizedValues[locale.languageCode]!['programarileLui']['viitoare'];
  }

  String get progLuiTrecute {
    return _localizedValues[locale.languageCode]!['programarileLui']['trecute'];
  }

  String get progLuiNicioProgViitoare {
    return _localizedValues[locale.languageCode]!['programarileLui']['nicioProgViitoare'];
  }

  String get progLuiNicioProg {
    return _localizedValues[locale.languageCode]!['programarileLui']['nicioProg'];
  }

  String get progLuiNicioSolicitare {
    return _localizedValues[locale.languageCode]!['programarileLui']['nicioSolicitare'];
  }

  String get progLuiAnulata {
    return _localizedValues[locale.languageCode]!['programarileLui']['anulata'];
  }

  String get progLuiSolicitari {
    return _localizedValues[locale.languageCode]!['programarileLui']['solicitari'];
  }

  String get progLuiNuExistaDocumente {
    return _localizedValues[locale.languageCode]!['programarileLui']['nuSuntDocumente'];
  }

  //TRATAMENTELE LUI

  String get tratamenteleLuiRealizate {
    return _localizedValues[locale.languageCode]!['tratamenteleLui']['realizate'];
  }

  String get tratamenteleLuiDeFacut {
    return _localizedValues[locale.languageCode]!['tratamenteleLui']['deFacut'];
  }

  String get tratamenteleLuiNiciunTratamentDeFacut {
    return _localizedValues[locale.languageCode]!['tratamenteleLui']['niciunTratamentDeFacut'];
  }

  String get tratamenteleLuiNiciunTratamentRealizat {
    return _localizedValues[locale.languageCode]!['tratamenteleLui']['niciunTratamentRealizat'];
  }

  //PRESCRIPTII

  String get prescriptiiNiciuna {
    return _localizedValues[locale.languageCode]!['prescriptii']['niciuna'];
  }
  String get prescriptii {
    return _localizedValues[locale.languageCode]!['prescriptii']['prs'];
  }
  String get investigatii {
    return _localizedValues[locale.languageCode]!['prescriptii']['iv'];
  }

  String get prescriptiiDescarca {
    return _localizedValues[locale.languageCode]!['prescriptii']['descarca'];
  }
  
  String get prescriptiiMomentanNuAuFostGasitePrescriptii {
    return _localizedValues[locale.languageCode]!['prescriptii']['momentanNuAuFostGasitePrescriptii'];
  }

  //LISTA PRETURI

  String get pricesTitle {
    return _localizedValues[locale.languageCode]!['prices']['appBarTitle'];
  }

  String get pricesSearch {
    return _localizedValues[locale.languageCode]!['prices']['search'];
  }

  String get pricesCancel {
    return _localizedValues[locale.languageCode]!['prices']['cancel'];
  }

  String get pricesCategory {
    return _localizedValues[locale.languageCode]!['prices']['category'];
  }

  String get pricesCode {
    return _localizedValues[locale.languageCode]!['prices']['code'];
  }

  String get pricesName {
    return _localizedValues[locale.languageCode]!['prices']['name'];
  }

  String get pricesPrice {
    return _localizedValues[locale.languageCode]!['prices']['price'];
  }

  String get pricesAll {
    return _localizedValues[locale.languageCode]!['prices']['all'];
  }

  String get pricesRON {
    return _localizedValues[locale.languageCode]!['prices']['RON'];
  }

  //SOLD
  String get soldSold {
    return _localizedValues[locale.languageCode]!['sold']['sold'];
  }

  String get soldIban {
    return _localizedValues[locale.languageCode]!['sold']['iban'];
  }

  String get soldSoldCopy {
    return _localizedValues[locale.languageCode]!['sold']['soldCopied'];
  }

  String get soldIbanCopy {
    return _localizedValues[locale.languageCode]!['sold']['ibanCopied'];
  }

  String get soldInfoDetalii {
    return _localizedValues[locale.languageCode]!['sold']['infoDetalii'];
  }

  String get soldDetailsCopied {
    return _localizedValues[locale.languageCode]!['sold']['detailsCopied'];
  }

  String get soldPlataProforma {
    return _localizedValues[locale.languageCode]!['sold']['plataProforma'];
  }

  String get soldPlataFactura {
    return _localizedValues[locale.languageCode]!['sold']['plataFactura'];
  }

  String get soldPlata {
    return _localizedValues[locale.languageCode]!['sold']['plata'];
  }

  String get soldVeziDetalii {
    return _localizedValues[locale.languageCode]!['sold']['veziDetalii'];
  }

  //DETALII SOLD

  String get soldDetaliiTitle {
    return _localizedValues[locale.languageCode]!['soldDetalii']['title'];
  }

  String get soldDetaliiData {
    return _localizedValues[locale.languageCode]!['soldDetalii']['data'];
  }

  String get soldDetaliiDoctor {
    return _localizedValues[locale.languageCode]!['soldDetalii']['doctor'];
  }

  String get soldDetaliiInterventie {
    return _localizedValues[locale.languageCode]!['soldDetalii']['interventie'];
  }

  String get soldDetaliiPret {
    return _localizedValues[locale.languageCode]!['soldDetalii']['pret'];
  }

  String get soldDetaliiAchitat {
    return _localizedValues[locale.languageCode]!['soldDetalii']['achitat'];
  }

  String get soldDetaliiDeAchitat {
    return _localizedValues[locale.languageCode]!['soldDetalii']['deAchitat'];
  }

  String get soldDetaliiDinti {
    return _localizedValues[locale.languageCode]!['soldDetalii']['dinti'];
  }

  String get soldDetaliiTotal {
    return _localizedValues[locale.languageCode]!['soldDetalii']['total'];
  }

  String get soldDetaliiSubtotal {
    return _localizedValues[locale.languageCode]!['soldDetalii']['subtotal'];
  }

  //FEEDBACK
  String get feedbackIntrebare {
    return _localizedValues[locale.languageCode]!['feedback']['intrebare'];
  }

  String get feedbackObservatii {
    return _localizedValues[locale.languageCode]!['feedback']['observatii'];
  }

  String get feedbackButon {
    return _localizedValues[locale.languageCode]!['feedback']['buton'];
  }

  String get feedbackCompletatiObs {
    return _localizedValues[locale.languageCode]!['feedback']['completatiObs'];
  }

  String get feedbackAcordaRating {
    return _localizedValues[locale.languageCode]!['feedback']['acordaRating'];
  }

//SEDII
  String get sediiHarta {
    return _localizedValues[locale.languageCode]!['sedii']['harta'];
  }

  String get sediiHint {
    return _localizedValues[locale.languageCode]!['sedii']['hint'];
  }

  String get sediiBtn {
    return _localizedValues[locale.languageCode]!['sedii']['btn'];
  }

  String get sediiTrimiteEmpty {
    return _localizedValues[locale.languageCode]!['sedii']['trimite_empty'];
  }

  String get sediiTrimiteSuccess {
    return _localizedValues[locale.languageCode]!['sedii']['trimite_success'];
  }

  String get alegesediu {
    return _localizedValues[locale.languageCode]!['sedii']['as'];
  }

  //RADIOGRAFII
  String get radiografiiNicioRadiografie {
    return _localizedValues[locale.languageCode]!['radiografii']['nicio_radiografie'];
  }

  String get t1 {
    return _localizedValues[locale.languageCode]!['radiografii']['1.1'];
  }

  String get clinicaPediatrica {
    return _localizedValues[locale.languageCode]!['radiografii']['c1'];
  }


  String get t2 {
    return _localizedValues[locale.languageCode]!['radiografii']['1.2'];
  }
  String get t3 {
    return _localizedValues[locale.languageCode]!['radiografii']['2.1'];
  }
  String get t4 {
    return _localizedValues[locale.languageCode]!['radiografii']['2.2'];
  }
  String get t5 {
    return _localizedValues[locale.languageCode]!['radiografii']['3.0'];
  }
  String get t6 {
    return _localizedValues[locale.languageCode]!['radiografii']['3.1'];
  }

  String get t7 {
    return _localizedValues[locale.languageCode]!['radiografii']['4.0'];
  }
  String get t8 {
    return _localizedValues[locale.languageCode]!['radiografii']['4.1'];
  }

  String get radiografiiMomentanFaraDocumente {
    return _localizedValues[locale.languageCode]!['radiografii']['momentanFaraDocumente'];
  }

  //Radiografie dimensiune reala
  String get radiografieDimensiuneRealaImagineNedisponibila {
    return _localizedValues[locale.languageCode]!['radiografieDimensiuneReala']['imagineNedisponibila'];
  }

  String get radiografieDimensiuneRealaDescarca {
    return _localizedValues[locale.languageCode]!['radiografieDimensiuneReala']['descarca'];
  }

  String get radiografieDimensiuneRealaSalut {
    return _localizedValues[locale.languageCode]!['radiografieDimensiuneReala']['salut'];
  }

  //Completare date facturare
  
  String get completareDateFacturareTitlu {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['titlu'];
  }

  String get completareDateFacturareCnpParinte {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['cnpParinte'];
  }

  String get completareDateFacturareCnpCopil {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['cnpCopil'];
  }

  String get completareDateFacturareCompletatiToateCampurile {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['completatiToateCampurile'];
  }

  String get completareDateFacturareCompletatiCnpParinte {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['completatiCnpParinte'];
  }

  String get completareDateFacturareCompletatiCnpCopil {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['completatiCnpCopil'];
  }

  String get completareDateFacturareCompletatiJudetul {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['completatiJudetul'];
  }

  String get completareDateFacturareCompletatiLocalitatea {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['completatiLocalitatea'];
  }


  //NETOPIA

  String get textPaginaNetopia {
    return _localizedValues[locale.languageCode]!['textPaginaNetopia']['textCentrat'];
  }

  //VOUCHER

  String get voucherTitlu {
    return _localizedValues[locale.languageCode]!['voucher']['title'];
  }

  String get voucherMsgNuAufostGasite {
    return _localizedValues[locale.languageCode]!['voucher']['nuAuFostGasiteVouchere'];
  }

  String get voucherNuUitaMaiBineSaTratezi {
    return _localizedValues[locale.languageCode]!['voucher']['nuUitaMaiBineSaTratezi'];
  }

  String get voucherPerioadaValabilitate {
    return _localizedValues[locale.languageCode]!['voucher']['perioadaValabilitate'];
  }

  String get voucherValoare {
    return _localizedValues[locale.languageCode]!['voucher']['valoare'];
  }

  String get alegeListaSpecializareListaGoala {
    return _localizedValues[locale.languageCode]!['alegeListaSpecializare']['listaGoala'];
  }

  //CNP Copil / Părinte
  
  String get cnpCopilHint {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['cnpCopil'];
  }
  
  String get cnpValidare {
    return _localizedValues[locale.languageCode]!['completareDateFacturare']['validareCNP'];
  }

  //Dosarul Meu
  
  String get dosarulMeuMomentanFaraDocumente {
    return _localizedValues[locale.languageCode]!['dosarulMeu']['msgMomentanNuAuFostGasiteDocumente'];
  }

  //Edit Judet

  String get editJudetAlegeJudetul {
    return _localizedValues[locale.languageCode]!['editJudet']['alegeJudetul'];
  }

  String get editJudetSelecteazaJudetul {
    return _localizedValues[locale.languageCode]!['editJudet']['selecteazaJudetul'];
  }

  String get editJudetCautaJudetul {
    return _localizedValues[locale.languageCode]!['editJudet']['cautaJudetul'];
  }

  //Edit Localitate

  String get editLocalitateAlegeLocalitatea {
    return _localizedValues[locale.languageCode]!['editLocalitate']['alegeLocalitatea'];
  }

  String get editLocalitateSelecteazaLocalitatea {
    return _localizedValues[locale.languageCode]!['editLocalitate']['selecteazaLocalitatea'];
  }

  String get editLocalitateCautaLocalitatea {
    return _localizedValues[locale.languageCode]!['editLocalitate']['cautaLocalitatea'];
  }

}