import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './shared_pref_keys.dart' as pref_keys;
import 'api_call.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'classes.dart';
import 'api_config.dart' as api_config;
import 'package:http/http.dart' as http;

class ApiCallFunctions {
  ApiCall apiCall = ApiCall();

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future<http.Response?> getApelFunctie(Map<String, String> parametriiApiCall, String numeMetoda) async {
    
    http.Response res;

    String url, key;
    key = api_config.keyAppPacienti;
    //url = '${api_config.apiUrl}$pNumeMetoda';

    url = '${api_config.apiUrl}$numeMetoda?';

    url = '${url}pCheie=$key';
    parametriiApiCall.forEach((key, value) {
      url = '$url&$key=$value';
    });
    
    print('getApelFuncție url: $url');

    res = await http.get(Uri.parse(url));

    print('getApelFuncție rezultat: ${res.statusCode}');
    return res;

    //res = await http.get(Uri.parse('https://sosbebe.crmonline.ro/api/OnlineShopAPI/GetContClient?pCheie=6nDjtwV4kPUsIuBtgLhV4bTZNerrxzThPGImSsFa&pUser=0737862090&pParolaMD5=e10adc3949ba59abbe56e057f20f883e'));

  }

  Future<http.Response?> postApelFunctie(Map<String, String> parametriiApiCall, String numeMetoda) async {
    
    http.Response res;

    String url, key;
    key = api_config.keyAppPacienti;
    //url = '${api_config.apiUrl}$pNumeMetoda';

    url = '${api_config.apiUrl}$numeMetoda?';

    url = '${url}pCheie=$key';
    parametriiApiCall.forEach((key, value) {
      url = '$url&$key=$value';
    });
 
    print('postApelFuncție url: $url');

    res = await http.post(
      Uri.parse(url),
      //Uri.parse('https://sosbebe.crmonline.ro/api/OnlineShopAPI/AdaugaContClient?pCheie=6nDjtwV4kPUsIuBtgLhV4bTZNerrxzThPGImSsFa&pNumeComplet=TestMobile&pUser=0737862090&pParolaMD5=e10adc3949ba59abbe56e057f20f883e'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      //body: jsonEncode(parametriiApiCall),
    );

    //res = await http.get(Uri.parse('https://sosbebe.crmonline.ro/api/OnlineShopAPI/GetContClient?pCheie=6nDjtwV4kPUsIuBtgLhV4bTZNerrxzThPGImSsFa&pUser=0737862090&pParolaMD5=e10adc3949ba59abbe56e057f20f883e'));

    print('postApelFuncție rezultat: ${res.statusCode}');
    return res;

  }

  Future<ContClientMobile?> getContClient({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
    required String pDeviceToken,
    required String pTipDispozitiv,
    required String pModelDispozitiv,
    required String pTokenVoip,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
      'pDeviceToken': pDeviceToken,
      'pTipDispozitiv': pTipDispozitiv,
      'pModelDispozitiv': pModelDispozitiv,
      'pTokenVoip': pTokenVoip,
    };

    http.Response? resGetContClient;

    resGetContClient = await getApelFunctie(parametriiApiCall, 'GetContClient');

    print('getContClient rezultat: ${resGetContClient!.statusCode}');

    if (resGetContClient.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return ContClientMobile.fromJson(jsonDecode(resGetContClient.body) as Map<String, dynamic>);
    }
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect contul de client mobile din Json-ul rezultat.'); //old IGV
      return null;
    }

    //return resGetContClient;

  }

  Future<List<MedicMobile>?> getListaMedici({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
    };

    http.Response? resGetListaMedici;

    resGetListaMedici = await getApelFunctie(parametriiApiCall, 'GetListaMedici');

    if (resGetListaMedici!.statusCode == 200) 
    {

      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      List<MedicMobile> parseMediciMobile(String responseBody) 
      {
        final parsed =
            (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

        return parsed.map<MedicMobile>((json) => MedicMobile.fromJson(json)).toList();
      }

      print('resGetListaMedici rezultat parsat: ${parseMediciMobile(resGetListaMedici.body)}');
      return parseMediciMobile(resGetListaMedici.body);

      //return ContClientMobile.fromJson(jsonDecode(resGetContClient.body) as Map<String, dynamic>);

    }
    else 
    {
      return null;
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect lista de medici din Json-ul rezultat.');
    }

  }

  Future<MedicMobile>? getDetaliiMedic({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
    required String pIdMedic,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
      'pIdMedic': pIdMedic,
    };

    http.Response? resGetDetaliiMedic;

    resGetDetaliiMedic = await getApelFunctie(parametriiApiCall, 'GetDetaliiMedic');

    
    if (resGetDetaliiMedic!.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return MedicMobile.fromJson(jsonDecode(resGetDetaliiMedic.body) as Map<String, dynamic>);
    } 
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect contul de client mobile din Json-ul rezultat.'); //old IGV
      return const MedicMobile(id: -1, linkPozaProfil: '', titulatura: '', numeleComplet: '', locDeMunca: '', functia: '', 
        specializarea: '', medieReviewuri: -1.0, nrLikeuri: -1, status: -1, primesteIntrebari: false, interpreteazaAnalize: false, consultatieVideo: false, monedaPreturi: -1, pretIntrebare: -1.0, pretConsultatieVideo: -1.0, 
        pretInterpretareAnalize: -1.0, experienta: '', adresaLocDeMunca: '', totalClienti: 0, totalTestimoniale: 0, procentRating: 0.0, esteFavorit: false, channelName: '');
    }

    //return resGetContClient;

  }

  Future<List<RecenzieMobile>?> getListaRecenziiByIdMedic({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
    required String pIdMedic,
    required String pNrMaxim,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
      'pIdMedic': pIdMedic,
      'pNrMaxim': pNrMaxim,
    };

    http.Response? resGetListaRecenziiByIdMedic;

    resGetListaRecenziiByIdMedic = await getApelFunctie(parametriiApiCall, 'GetListaRecenziiByIdMedic');

    if (resGetListaRecenziiByIdMedic!.statusCode == 200) 
    {

      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      List<RecenzieMobile> parseRecenzii(String responseBody) 
      {
        final parsed =
            (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

        return parsed.map<RecenzieMobile>((json) => RecenzieMobile.fromJson(json)).toList();
      }

      print('resGetListaRecenziiByIdMedic rezultat parsat: ${parseRecenzii(resGetListaRecenziiByIdMedic.body)}');
      return parseRecenzii(resGetListaRecenziiByIdMedic.body);

      //return ContClientMobile.fromJson(jsonDecode(resGetContClient.body) as Map<String, dynamic>);

    }
    else 
    {
      return null;
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect lista de medici din Json-ul rezultat.');
    }

    //return resGetContClient;

  }


  Future<List<FacturaClientMobile>?> getListaFacturi({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
    };

    http.Response? resGetListaFacturi;

    resGetListaFacturi = await getApelFunctie(parametriiApiCall, 'GetListaFacturi');

    if (resGetListaFacturi!.statusCode == 200) 
    {

      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      List<FacturaClientMobile> parseFacturiMobile(String responseBody) 
      {
        final parsed =
            (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

        return parsed.map<FacturaClientMobile>((json) => FacturaClientMobile.fromJson(json)).toList();
      }

      print('resGetListaFacturi rezultat parsat: ${parseFacturiMobile(resGetListaFacturi.body)}');
      return parseFacturiMobile(resGetListaFacturi.body);

      //return ContClientMobile.fromJson(jsonDecode(resGetContClient.body) as Map<String, dynamic>);

    }
    else 
    {
      return null;
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect lista de medici din Json-ul rezultat.');
    }

    //return resGetContClient;

  }

  

  Future<FacturaClientMobile>? getDetaliiFactura({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
    required String pIdFactura,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
      'pIdFactura': pIdFactura,
    };

    http.Response? resGetDetaliiFactura;

    resGetDetaliiFactura = await getApelFunctie(parametriiApiCall, 'GetDetaliiFactura');

    
    if (resGetDetaliiFactura!.statusCode == 200) {
      
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return FacturaClientMobile.fromJson(jsonDecode(resGetDetaliiFactura.body) as Map<String, dynamic>);

    }
    else {
      
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect contul de client mobile din Json-ul rezultat.'); //old IGV
      DateTime dataNow = DateTime.now();
      return FacturaClientMobile(id: -1, numar: '-1', serie: '-1', dataEmitere: dataNow, dataPlata: dataNow, denumireBeneficiar: '',
        telefonBeneficiar: '', emailBeneficiar: '', valoareCuTVA: 0.0, valoareTVA: 0.0, valoareFaraTVA: 0.0, moneda:0, denumireMedic: '',
        serviciiFactura:'', telefonEmitent:'', emailEmitent:'', idFeedbackClient: 1);

    }

    //return resGetContClient;

  }

  Future<List<ConversatieMobile>?> getListaConversatii({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
    //required String pIdMedic,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
      //'pIdMedic': pIdMedic,
    };

    http.Response? resGetListaConversatii;

    resGetListaConversatii = await getApelFunctie(parametriiApiCall, 'GetListaConversatii');

    if (resGetListaConversatii!.statusCode == 200) 
    {

      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      List<ConversatieMobile> parseConversatii(String responseBody) 
      {
        final parsed =
            (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

        return parsed.map<ConversatieMobile>((json) => ConversatieMobile.fromJson(json)).toList();
      }

      print('resGetListaConversatii rezultat parsat: ${parseConversatii(resGetListaConversatii.body)}');
      return parseConversatii(resGetListaConversatii.body);

      //return ContClientMobile.fromJson(jsonDecode(resGetContClient.body) as Map<String, dynamic>);

    }
    else 
    {
      return null;
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect lista de medici din Json-ul rezultat.');
    }

    //return resGetContClient;

  }

  Future<List<MesajConversatieMobile>?> getListaMesajePeConversatie({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
    required String pIdConversatie,
    //required String pIdMedic,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
      'pIdConversatie': pIdConversatie,
      //'pIdMedic': pIdMedic,
    };

    http.Response? resGetListaMesajePeConversatie;

    resGetListaMesajePeConversatie = await getApelFunctie(parametriiApiCall, 'GetListaMesajePeConversatie');

    if (resGetListaMesajePeConversatie!.statusCode == 200) 
    {

      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      List<MesajConversatieMobile> parseListaMesajePeConversatie(String responseBody) 
      {
        final parsed =
            (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

        return parsed.map<MesajConversatieMobile>((json) => MesajConversatieMobile.fromJson(json)).toList();
      }

      print('resGetListaMedici rezultat parsat: ${parseListaMesajePeConversatie(resGetListaMesajePeConversatie.body)}');
      return parseListaMesajePeConversatie(resGetListaMesajePeConversatie.body);

      //return ContClientMobile.fromJson(jsonDecode(resGetContClient.body) as Map<String, dynamic>);

    }
    else 
    {
      return null;
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect lista de medici din Json-ul rezultat.');
    }

    //return resGetContClient;

  }

  Future<ChestionarClientMobile?> getUltimulChestionarCompletatByContClient({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
    //required String pIdMedic,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
      //'pIdMedic': pIdMedic,
    };

    http.Response? resGetUltimulChestionarCompletatByContClient;

    resGetUltimulChestionarCompletatByContClient = await getApelFunctie(parametriiApiCall, 'GetUltimulChestionarCompletatByContClient');

    if (resGetUltimulChestionarCompletatByContClient!.statusCode == 200) 
    {

      // If the server did return a 200 response,
      // then parse the JSON.

      ChestionarClientMobile chestionar = ChestionarClientMobile.fromJson(jsonDecode(resGetUltimulChestionarCompletatByContClient.body) as Map<String, dynamic>);

      return chestionar;

      //return ContClientMobile.fromJson(jsonDecode(resGetContClient.body) as Map<String, dynamic>);

    }
    else 
    {
      return null;
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect lista de medici din Json-ul rezultat.');
    }

    //return resGetContClient;

  }

  Future<String?> getSirBitiFacturaContClient({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
    required String pIdFactura,
  }) async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParola,
      'pIdFactura': pIdFactura,
    };

    http.Response? resGetUltimulChestionarCompletatByContClient;

    resGetUltimulChestionarCompletatByContClient = await getApelFunctie(parametriiApiCall, 'GetSirBitiFacturaContClient');

    if (resGetUltimulChestionarCompletatByContClient!.statusCode == 200) 
    {

      // If the server did return a 200 response,
      // then parse the JSON.

      String data = resGetUltimulChestionarCompletatByContClient.body;

      return data;

      //return ContClientMobile.fromJson(jsonDecode(resGetContClient.body) as Map<String, dynamic>);

    }
    else 
    {
      return null;
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect lista de medici din Json-ul rezultat.');
    }

    //return resGetContClient;

  }


  Future<ChestionarClientMobile?> getCredentialeAgora() async
  {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
    };

    http.Response? resGetCredentialeAgora;

    resGetCredentialeAgora = await getApelFunctie(parametriiApiCall, 'GetCredentialeAgora');

    
    if (resGetCredentialeAgora!.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return ChestionarClientMobile.fromJson(jsonDecode(resGetCredentialeAgora.body) as Map<String, dynamic>);
    }
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Nu s-a putut crea corect contul de client mobile din Json-ul rezultat.'); //old IGV
      return null;
    }

  }

  Future<http.Response?> adaugaContClient({
    required String pNumeComplet,
    required String pUser,
    required String pParola,
    required String pDeviceToken,
    required String pTipDispozitiv,
  }) async {
    final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParolaMD5,
      'pDeviceToken': pDeviceToken,
      'pTipDispozitiv': pTipDispozitiv,
    };

    http.Response? resAdaugaContClient;

    resAdaugaContClient = await postApelFunctie(parametriiApiCall, 'AdaugaContClient');

    print('adaugaContClient status rezultat: ${resAdaugaContClient!.statusCode} body rezultat: ${resAdaugaContClient!.body}');

    return resAdaugaContClient;

  }

  Future<http.Response?> trimitePinPentruResetareParolaClient({
    required String pUser,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
    };

    http.Response? resTrimitePin;

    resTrimitePin = await postApelFunctie(parametriiApiCall, 'TrimitePinPentruResetareParolaClient');

    print('trimitePinPentruResetareParolaClient rezultat: ${resTrimitePin!.statusCode} body rezultat: ${resTrimitePin.body}');

    return resTrimitePin;

  }

  Future<http.Response?> verificaCodPinClient({
    required String pUser,
    required String pCodPIN,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser,
      'pCodPIN': pCodPIN, //IGV
    };

    http.Response? resVerificaCodPin;

    resVerificaCodPin = await postApelFunctie(parametriiApiCall, 'VerificaCodPinClient');

    print('verificaCodPinClient rezultat: ${resVerificaCodPin!.statusCode} body rezultat: ${resVerificaCodPin.body}');

    return resVerificaCodPin;

  }

  Future<http.Response?> updateDateClient({
    required String pUser,
    required String pParola,
    required String pNumeleComplet,
    required String pTelefonNou,
    required String pAdresaEmailNoua,
    required String pUserNou,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser,
      'pParolaMD5': pParola,
      'pNumeleComplet': pNumeleComplet,
      'pTelefonNou': pTelefonNou,
      'pAdresaEmailNoua': pAdresaEmailNoua,
      'pUserNou': pUserNou,
    };

    http.Response? resUpdateDateClient;

    resUpdateDateClient = await postApelFunctie(parametriiApiCall, 'UpdateDateClient');

    print('updateDateClient rezultat: ${resUpdateDateClient!.statusCode} body rezultat: ${resUpdateDateClient.body}');

    return resUpdateDateClient;

  }

  Future<http.Response?> trimitePinPentruStergereContClient({
    required String pUser,
    required String pParola,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
    };

    http.Response? resTrimitePinStergere;

    resTrimitePinStergere = await postApelFunctie(parametriiApiCall, 'TrimitePinPentruStergereContClient');

    print('parametriiApiCall: $parametriiApiCall trimitePinPentruStergereContClient rezultat: ${resTrimitePinStergere!.statusCode} body rezultat: ${resTrimitePinStergere.body}');

    return resTrimitePinStergere;

  }

  Future<http.Response?> stergeContClient({
    required String pUser,
    required String pParola,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
    };

    http.Response? resStergeContClient;

    resStergeContClient = await postApelFunctie(parametriiApiCall, 'StergeContClient');

    print('stergeContClient rezultat: ${resStergeContClient!.statusCode} body rezultat: ${resStergeContClient.body}');

    return resStergeContClient;

  }

  Future<http.Response?> reseteazaParolaClient({

    required String pUser,
    required String pNouaParola,

  }) async {
    final String pNouaParolaMD5 = generateMd5(pNouaParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser,
      'pNouaParolaMD5': pNouaParolaMD5, //IGV
    };

    http.Response? resReseteazaParola;

    resReseteazaParola = await postApelFunctie(parametriiApiCall, 'ReseteazaParolaClient');

    print('reseteazaParolaClient rezultat: ${resReseteazaParola!.statusCode} body rezultat: ${resReseteazaParola.body}');

    return resReseteazaParola;

  }

  Future<http.Response?> adaugaFeedbackDinContClient({
    required String pUser,
    required String pParola,
    required String pIdMedic,
    required String pIdFactura,
    required String pNota,
    required String pComentariu,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
      'pIdMedic': pIdMedic,
      'pIdFactura': pIdFactura,
      'pNota': pNota,
      'pComentariu': pComentariu,
    };

    http.Response? resAdaugaFeedbackDinContClient;

    resAdaugaFeedbackDinContClient = await postApelFunctie(parametriiApiCall, 'AdaugaFeedbackDinContClient');

    print('adaugaFeedbackDinContClient status rezultat: ${resAdaugaFeedbackDinContClient!.statusCode} body rezultat: ${resAdaugaFeedbackDinContClient!.body}');

    return resAdaugaFeedbackDinContClient;

  }


  Future<http.Response?> modificaFeedbackDinContClient({
    required String pUser,
    required String pParola,
    required String pIdFeedback,
    required String pNota,
    required String pComentariu,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
      'pIdFeedback': pIdFeedback,
      'pNota': pNota,
      'pComentariu': pComentariu,
    };

    http.Response? resModificaFeedbackDinContClient;

    resModificaFeedbackDinContClient = await postApelFunctie(parametriiApiCall, 'ModificaFeedbackDinContClient');

    print('modificaFeedbackDinContClient status rezultat: ${resModificaFeedbackDinContClient!.statusCode} body rezultat: ${resModificaFeedbackDinContClient!.body}');

    return resModificaFeedbackDinContClient;

  }


  Future<http.Response?> stergeFeedbackDinContClient({
    required String pUser,
    required String pParola,
    required String pIdFeedback,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
      'pIdFeedback': pIdFeedback,
    };

    http.Response? resStergeFeedbackDinContClient;

    resStergeFeedbackDinContClient = await postApelFunctie(parametriiApiCall, 'StergeFeedbackDinContClient');

    print('stergeFeedbackDinContClient rezultat: ${resStergeFeedbackDinContClient!.statusCode} body rezultat: ${resStergeFeedbackDinContClient.body}');

    return resStergeFeedbackDinContClient;

  }


  Future<http.Response?> adaugaMesajDinContClient({
    required String pUser,
    required String pParola,
    required String pIdMedic,
    required String pMesaj,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
      'pIdMedic': pIdMedic,
      'pMesaj': pMesaj,
    };

    http.Response? resAdaugaMesajDinContClient;

    resAdaugaMesajDinContClient = await postApelFunctie(parametriiApiCall, 'AdaugaMesajDinContClient');

    print('adaugaMesajDinContClient status rezultat: ${resAdaugaMesajDinContClient!.statusCode} body rezultat: ${resAdaugaMesajDinContClient!.body}');

    return resAdaugaMesajDinContClient;

  }

  Future<http.Response?> updateChestionarDinContClient({
    required String pUser,
    required String pParola,
    required String pNumeleComplet,
    required String pDataNastereDDMMYYYY,
    required String pGreutate,
    required String pListaRaspunsuri,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser,
      'pParolaMD5': pParola,
      'pNumeleComplet': pNumeleComplet,
      'pDataNastereDDMMYYYY': pDataNastereDDMMYYYY,
      'pGreutate': pGreutate,
      'pListaRaspunsuri': pListaRaspunsuri,
    };

    http.Response? resUpdateChestionarDinContClient;

    resUpdateChestionarDinContClient = await postApelFunctie(parametriiApiCall, 'UpdateChestionarDinContClient');

    print('updateChestionarDinContClient rezultat: ${resUpdateChestionarDinContClient!.statusCode} body rezultat: ${resUpdateChestionarDinContClient.body}');

    return resUpdateChestionarDinContClient;

  }


  Future<http.Response?> adaugaMedicLaFavorit({
    required String pUser,
    required String pParola,
    required String pIdMedic,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
      'pIdMedic': pIdMedic,
    };

    http.Response? resAdaugaMedicLaFavorit;

    resAdaugaMedicLaFavorit = await postApelFunctie(parametriiApiCall, 'AdaugaMedicLaFavorit');

    print('adaugaMedicLaFavorit status rezultat: ${resAdaugaMedicLaFavorit!.statusCode} body rezultat: ${resAdaugaMedicLaFavorit!.body}');

    return resAdaugaMedicLaFavorit;

  }


  Future<http.Response?> scoateMedicDeLaFavorit({
    required String pUser,
    required String pParola,
    required String pIdMedic,
  }) async {
    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
      'pIdMedic': pIdMedic,
    };

    http.Response? resScoateMedicDeLaFavorit;

    resScoateMedicDeLaFavorit = await postApelFunctie(parametriiApiCall, 'ScoateMedicDeLaFavorit');

    print('scoateMedicDeLaFavorit status rezultat: ${resScoateMedicDeLaFavorit!.statusCode} body rezultat: ${resScoateMedicDeLaFavorit!.body}');

    return resScoateMedicDeLaFavorit;

  }

  Future<http.Response?> trimitePushPrinOneSignal({
    required String pUser,
    required String pParola,
    required String pTipNotificare,

  }) async {

    //final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {

      'pUser': pUser, //IGV
      'pParolaMD5': pParola,
      'pTipNotificare': pTipNotificare,

    };

    http.Response? resTrimitePushPrinOneSignal;

    resTrimitePushPrinOneSignal = await postApelFunctie(parametriiApiCall, 'TrimitePushPrinOneSignal');

    print('trimitePushPrinOneSignal status rezultat: ${resTrimitePushPrinOneSignal!.statusCode} body rezultat: ${resTrimitePushPrinOneSignal.body}');

    return resTrimitePushPrinOneSignal;

  }

  Future<String> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String device = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model ?? '';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.utsname.machine ?? '';
    }

    return device;
  }

}



//////////////////////////////////////old
/*
  Future<http.Response?> getContClient({
    //required String pNumeComplet,
    required String pUser,
    required String pParola,
  }) async {
    final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      //'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      //'pUser': '0737862090',
      'pParolaMD5': pParolaMD5,
    };

    String url, key;
    key = api_config.keyAppPacienti;
    //url = '${api_config.apiUrl}$pNumeMetoda';

    url = '${api_config.apiUrl}GetContClient?';

    url = '${url}pCheie=$key';
    parametriiApiCall.forEach((key, value) {
      url = '$url&$key=$value';
    });

    print('getContClient url: $url');
    
    http.Response res;

    res = await http.get(Uri.parse(url));

    //res = await http.get(Uri.parse('https://sosbebe.crmonline.ro/api/OnlineShopAPI/GetContClient?pCheie=6nDjtwV4kPUsIuBtgLhV4bTZNerrxzThPGImSsFa&pUser=0737862090&pParolaMD5=e10adc3949ba59abbe56e057f20f883e'));


    print('getContClient rezultat: ${res.statusCode}');
    return res;
  }
  */
  
  /*
  Future<http.Response?> adaugaContClient({
    required String pNumeComplet,
    required String pUser,
    required String pParola,
  }) async {
    final String pParolaMD5 = generateMd5(pParola);

    String url, key;
    key = api_config.keyAppPacienti;
    //url = '${api_config.apiUrl}$pNumeMetoda';

    final Map<String, String> parametriiApiCall = {
      'pCheie': key,
      'pNumeComplet': pNumeComplet,
      'pUser': pUser, //IGV
      'pParolaMD5': pParolaMD5,
    };

    url = '${api_config.apiUrl}AdaugaContClient';

    print('adaugaContClient url: $url parametriiApiCall: $parametriiApiCall ${jsonEncode(parametriiApiCall)}');
    
    http.Response res;

    res = await http.post(
      //Uri.parse(url),
      Uri.parse('https://sosbebe.crmonline.ro/api/OnlineShopAPI/AdaugaContClient?pCheie=6nDjtwV4kPUsIuBtgLhV4bTZNerrxzThPGImSsFa&pNumeComplet=TestMobile&pUser=0737862090&pParolaMD5=e10adc3949ba59abbe56e057f20f883e'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      //body: jsonEncode(parametriiApiCall),
    );

    //res = await http.get(Uri.parse('https://sosbebe.crmonline.ro/api/OnlineShopAPI/GetContClient?pCheie=6nDjtwV4kPUsIuBtgLhV4bTZNerrxzThPGImSsFa&pUser=0737862090&pParolaMD5=e10adc3949ba59abbe56e057f20f883e'));


    print('adaugaContClient rezultat: ${res.statusCode}');
    return res;
  }

  Future<http.Response?> trimitePinPentruResetareParolaClient({
    required String pUser,
  }) async {

    String url, key;
    key = api_config.keyAppPacienti;
    //url = '${api_config.apiUrl}$pNumeMetoda';

    final Map<String, String> parametriiApiCall = {
      'pCheie': key,
      'pUser': pUser, //IGV
    };

    url = '${api_config.apiUrl}TrimitePinPentruResetareParolaClient';

    print('trimitePinPentruResetareParolaClient url: $url parametriiApiCall: $parametriiApiCall');
    
    http.Response res;

    res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(parametriiApiCall),
    );

    //res = await http.get(Uri.parse('https://sosbebe.crmonline.ro/api/OnlineShopAPI/GetContClient?pCheie=6nDjtwV4kPUsIuBtgLhV4bTZNerrxzThPGImSsFa&pUser=0737862090&pParolaMD5=e10adc3949ba59abbe56e057f20f883e'));


    print('trimitePinPentruResetareParolaClient rezultat: ${res.statusCode}');
    return res;
  }
  */

//////////////////////////////////////////////////////// old Andrei Bădescu
/*

  Future<String?> register({
    required String pNume,
    required String pPrenume,
    required String pTelefonMobil,
    required String pDataDeNastereYYYYMMDD,
    required String pAdresaMail,
    required String pParola,
    required String pFirebaseGoogleDeviceID,
  }) async {
    final String pParolaMD5 = generateMd5(pParola);
    final Map<String, String> parametriiApiCall = {
      'pNume': pNume,
      'pPrenume': pPrenume,
      'pTelefonMobil': pTelefonMobil,
      'pDataDeNastereYYYYMMDD': pDataDeNastereYYYYMMDD,
      'pAdresaMail': pAdresaMail,
      'pParolaMD5': pParolaMD5,
      'pTipDispozitiv': Platform.isAndroid
          ? '1'
          : Platform.isIOS
              ? '2'
              : '0',
      'pModelDispozitiv': await deviceInfo(),
      'pFirebaseGoogleDeviceID': pFirebaseGoogleDeviceID,
      'pLimbaSelectata': '1',
    };

    String? res = await apiCall.apeleazaMetodaString(pNumeMetoda: 'AdaugaPacient', pParametrii: parametriiApiCall);

    return res;
  }

  Future<List<LinieFisaTratament>?> getListaLiniiFisaTratamentDeFacut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> params = {
      'pAdresaMail': prefs.getString(pref_keys.userEmail)!,
      'pParolaMD5': prefs.getString(pref_keys.userPassMD5)!,
    };

    String? res =
        await apiCall.apeleazaMetodaString(pNumeMetoda: 'GetListaLiniiFisaTratamentDeFacut', pParametrii: params);

    List<LinieFisaTratament> interventii = <LinieFisaTratament>[];
    if (res == null) {
      return null;
    }
    if (res.contains('*\$*')) {
      List<String> interventiiRaw = res.split('*\$*');
      interventiiRaw.removeWhere((v) => v.isEmpty);

      for (var interv in interventiiRaw) {
        List<String> list = interv.split('\$#\$');

        DateTime dateTime = DateTime.utc(
            int.parse(list[6].substring(0, 4)), int.parse(list[6].substring(4, 6)), int.parse(list[6].substring(6, 8)));

        String data = DateFormat('dd.MM.yyyy').format(dateTime);

        interventii.add(LinieFisaTratament(
            tipObiect: list[0],
            idObiect: list[1],
            numeMedic: list[2],
            denumireInterventie: list[3],
            dinti: list[4],
            observatii: list[5],
            dataDateTime: dateTime,
            dataString: data,
            pret: list[7],
            culoare: Color(int.parse(list[8])),
            valoareInitiala: list[9]));
      }
    }
    return interventii;
  }

  Future<List<Sediu>> getListaSedii() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String idUser = prefs.getString(pref_keys.userIdAjustareCurenta)!;
    final Map<String, String> param = {
      "pAdresaMail": prefs.getString(pref_keys.userEmail)!,
      "pParolaMD5": prefs.getString(pref_keys.userPassMD5)!
    };
    String? data = await apiCall.apeleazaMetodaString(pNumeMetoda: 'GetListaSedii', pParametrii: param);

    List<Sediu> sedii = <Sediu>[];

    if (data == null) {
      return [];
    }

    if (data.contains('*\$*')) {
      List<String> l = data.split('*\$*');
      l.removeWhere((element) => element.isEmpty);
      for (var element in l) {
        List<String> parts = element.split('\$#\$');

        Sediu s = Sediu(id: parts[0], denumire: parts[1], adresa: parts[2], telefon: parts[3]);
        sedii.add(s);
      }
    }
    return sedii;
  }

  Future<String?> login({
    required String pAdresaEmail,
    required String pParolaMD5,
    required String pFirebaseGoogleDeviceID,
  }) async {
    final Map<String, String> param = {
      'pAdresaEmail': pAdresaEmail,
      'pParolaMD5': pParolaMD5,
      'pFirebaseGoogleDeviceID': pFirebaseGoogleDeviceID,
      'pTipDispozitiv': Platform.isAndroid
          ? '1'
          : Platform.isIOS
              ? '2'
              : '0',
      'pModelDispozitiv': await deviceInfo(),
    };

    String? res = await apiCall.apeleazaMetodaString(pNumeMetoda: 'Login', pParametrii: param);

    return res;
  }

  Future<String?> loginByPhone({
    required String pTelefon,
    required String pParolaMD5,
    required String pFirebaseGoogleDeviceID,
  }) async {
    final Map<String, String> param = {
      'pTelefon': pTelefon,
      'pParolaMD5': pParolaMD5,
      'pFirebaseGoogleDeviceID': pFirebaseGoogleDeviceID,
      'pTipDispozitiv': Platform.isAndroid
          ? '1'
          : Platform.isIOS
              ? '2'
              : '0',
      'pModelDispozitiv': await deviceInfo(),
    };

    String? res = await apiCall.apeleazaMetodaString(pNumeMetoda: 'LoginByTelefon', pParametrii: param);

    return res;
  }

  Future<String?> schimbaDatelePersonale({
    required String pDataDeNastereDDMMYYYY,
    required String judet,
    required String localitate,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> param = {
      'pAdresaMail': prefs.getString(pref_keys.userEmail)!,
      'pParola': prefs.getString(pref_keys.userPassMD5)!,
      'pNume': prefs.getString(pref_keys.userNume)!,
      'pPrenume': prefs.getString(pref_keys.userPrenume)!,
      //'pDataDeNastereDDMMYYYY': pDataDeNastereDDMMYYYY,
      'pDataDeNastereDDMMYYYY': pDataDeNastereDDMMYYYY,
      'pIdJudet': judet,
      'pIdLocalitate': localitate,
    };
    String? res = await apiCall.apeleazaMetodaString(pNumeMetoda: 'SchimbaDatelePersonale', pParametrii: param);
    return res;
  }

  Future<String?> updateDeviceID({
    required String pAdresaEmail,
    required String pPrimesteNotificari,
    required String pParolaMD5,
    required String pFirebaseGoogleDeviceID,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> param = {
      'pPrimesteNotificari': pPrimesteNotificari,
      'pAdresaEmail': pAdresaEmail,
      'pParolaMD5': pParolaMD5,
      'pFirebaseGoogleDeviceID': prefs.getString(pref_keys.fcmToken)!,
      'pTipDispozitiv': Platform.isAndroid
          ? '1'
          : Platform.isIOS
              ? '2'
              : '0',
      'pModelDispozitiv': await deviceInfo(),
    };

    String? res = await apiCall.apeleazaMetodaString(pNumeMetoda: 'UpdateDeviceID', pParametrii: param);

    return res;
  }

  Future<Programari?> getListaProgramari() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString(pref_keys.userEmail));

    // final String idUser = prefs.getString(pref_keys.userIdAjustareCurenta)!;
    final Map<String, String> param = {
      'pIdLimba': '0',
      "pAdresaMail": prefs.getString(pref_keys.userEmail)!,
      "pParolaMD5": prefs.getString(pref_keys.userPassMD5)!
    };

    String? res = await apiCall.apeleazaMetodaString(pNumeMetoda: 'GetListaProgramarileLui', pParametrii: param);

    List<Programare> programariViitoare = <Programare>[];
    List<Programare> programariTrecute = <Programare>[];
    if (res == null) {
      return null;
    }
    if (res.contains('%\$%')) {
      List<String> list = res.split('%\$%');

      List<String> viitoare = list[0].split('*\$*');
      List<String> trecute = list[1].split('*\$*');
      viitoare.removeWhere((element) => element.isEmpty);
      trecute.removeWhere((element) => element.isEmpty);

      for (var element in viitoare) {
        List<String> l = element.split('\$#\$');

        DateTime date = DateTime.utc(
          int.parse(l[0].substring(0, 4)),
          int.parse(l[0].substring(4, 6)),
          int.parse(l[0].substring(6, 8)),
          int.parse(l[0].substring(8, 10)),
          int.parse(l[0].substring(10, 12)),
        );
        DateTime dateSf = DateTime.utc(
          int.parse(l[0].substring(0, 4)),
          int.parse(l[0].substring(4, 6)),
          int.parse(l[0].substring(6, 8)),
          int.parse(l[1].substring(0, 2)),
          int.parse(l[1].substring(3, 5)),
        );

//TODO verif
        Programare p = Programare(
            nume: '',
            prenume: '',
            idPacient: '',
            medic: l[2],
            categorie: l[3],
            status: l[4],
            anulata: l[5],
            inceput: date,
            sfarsit: dateSf,
            id: l[6],
            hasFeedback: l[7],
            idMedic: l[8],
            locatie: l[9]);
        programariViitoare.add(p);
      }

      for (var element in trecute) {
        List<String> l = element.split('\$#\$');
//data inceput, ora final, identitate medic, categorie, status programare, 0/1 (este sau nu anulata)
        DateTime date = DateTime.utc(
          int.parse(l[0].substring(0, 4)),
          int.parse(l[0].substring(4, 6)),
          int.parse(l[0].substring(6, 8)),
          int.parse(l[0].substring(8, 10)),
          int.parse(l[0].substring(10, 12)),
        );
        DateTime dateSf = DateTime.utc(
          int.parse(l[0].substring(0, 4)),
          int.parse(l[0].substring(4, 6)),
          int.parse(l[0].substring(6, 8)),
          int.parse(l[1].substring(0, 2)),
          int.parse(l[1].substring(3, 5)),
        );
//TODO verif
        Programare p = Programare(
            nume: '',
            prenume: '',
            idPacient: '',
            id: l[6],
            medic: l[2],
            categorie: l[3],
            status: l[4],
            anulata: l[5],
            inceput: date,
            sfarsit: dateSf,
            hasFeedback: l[7],
            idMedic: l[8],
            locatie: l[9]);
        programariTrecute.add(p);
      }
    }
    programariTrecute.sort((a, b) => b.inceput.compareTo(a.inceput));
    programariViitoare.sort((a, b) => a.inceput.compareTo(b.inceput));
    return Programari(trecute: programariTrecute, viitoare: programariViitoare);
  }

  Future<String> deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String device = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.utsname.machine;
    }
    return device;
  }

  Future<void> anuleazaProgramarea(String pIdProgramare) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> params = {
      'pAdresaMail': prefs.getString(pref_keys.userEmail)!,
      'pParolaMD5': prefs.getString(pref_keys.userPassMD5)!,
      'pIdProgramare': pIdProgramare,
    };
    await apiCall.apeleazaMetodaString(pNumeMetoda: 'AnuleazaProgramarea', pParametrii: params);
  }

  Future<void> confirmaProgramarea(String pIdProgramare) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> params = {
      'pAdresaMail': prefs.getString(pref_keys.userEmail)!,
      'pParolaMD5': prefs.getString(pref_keys.userPassMD5)!,
      'pIdProgramare': pIdProgramare,
    };
    await apiCall.apeleazaMetodaString(pNumeMetoda: 'ConfirmaProgramarea', pParametrii: params);
  }

  Future<List<LinieFisaTratament>?> getListaLiniiFisaTratamentRealizate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> params = {
      'pAdresaMail': prefs.getString(pref_keys.userEmail)!,
      'pParolaMD5': prefs.getString(pref_keys.userPassMD5)!,
    };

    String? res =
        await apiCall.apeleazaMetodaString(pNumeMetoda: 'GetListaLiniiFisaTratamentRealizate', pParametrii: params);

    List<LinieFisaTratament> interventii = <LinieFisaTratament>[];
    if (res == null) {
      return null;
    }
    if (res.contains('*\$*')) {
      List<String> interventiiRaw = res.split('*\$*');
      interventiiRaw.removeWhere((v) => v.isEmpty);

      for (var interv in interventiiRaw) {
        List<String> list = interv.split('\$#\$');

        DateTime dateTime = DateTime.utc(
            int.parse(list[6].substring(0, 4)), int.parse(list[6].substring(4, 6)), int.parse(list[6].substring(6, 8)));

        String data = DateFormat('dd.MM.yyyy').format(dateTime);

        interventii.add(LinieFisaTratament(
            tipObiect: list[0],
            idObiect: list[1],
            numeMedic: list[2],
            denumireInterventie: list[3],
            dinti: list[4],
            observatii: list[5],
            dataDateTime: dateTime,
            dataString: data,
            pret: list[7],
            culoare: Color(int.parse(list[8])),
            valoareInitiala: list[9]));
      }
    }
    return interventii;
  }

  Future<String?> getDetaliiProgramare(String pIdProgramare) async {
    ApiCall apiCall = ApiCall();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> params = {
      'pAdresaMail': prefs.getString(pref_keys.userEmail)!,
      'pParolaMD5': prefs.getString(pref_keys.userPassMD5)!,
      'pIdProgramare': pIdProgramare,
    };
    String? lmao = await apiCall.apeleazaMetodaString(pNumeMetoda: 'GetDetaliiProgramare', pParametrii: params);
    
    //print('Rezultat getDetaliiProgramare '+ pIdProgramare);
    if (lmao == null) {
      return null;
    } else {
      List<String> ayy = lmao.split('\$#\$');
      DetaliiProgramare a = DetaliiProgramare(
          dataInceput: ayy[0],
          oraFinal: ayy[1],
          numeMedic: ayy[2],
          idCategorie: ayy[3],
          statusProgramare: ayy[4],
          esteAnulat: ayy[5],
          numeLocatie: ayy[6],
          listaInterventii: ayy[7].split('%\$%'));
      // String total = '';
      // List<String> details = [];
      // details.add(a.numeLocatie);
      // print(a.listaInterventii);
      // // print(a.listaInterventii[6]);
      // List<double> listaPreturi = [];

      // for (String date in a.listaInterventii) {
      //   listaPreturi.add(double.parse(date[2]));
      // }
      // double sumaTotala = listaPreturi.reduce((a, b) => a + b);
      // return (sumaTotala.toString());
      return a.GetTotal().toString();
    }
  }

  Future<String?> reseteazaParola({
    required String pAdresaMail,
    required String pParolaNoua,
  }) async {
    final String pParolaNouaMD5 = generateMd5(pParolaNoua);
    final Map<String, String> param = {'pAdresaMail': pAdresaMail, 'pParolaNouaMD5': pParolaNouaMD5};
    String? res = await apiCall.apeleazaMetodaString(pNumeMetoda: 'ReseteazaParola', pParametrii: param);
    return res;
  }

  Future<String?> reseteazaParolaValidarePIN({
    required String pAdresaMail,
    required String pParolaNoua,
    required String pPINDinMail,
  }) async {
    final String pParolaNouaMD5 = generateMd5(pParolaNoua);

    final Map<String, String> param = {
      'pAdresaMail': pAdresaMail,
      'pParolaNouaMD5': pParolaNouaMD5,
      'pPINDinMail': pPINDinMail
    };

    String? res = await apiCall.apeleazaMetodaString(pNumeMetoda: 'ReseteazaParolaValidarePIN', pParametrii: param);
    return res;
  }

  Future<String?> schimbaDateleDeContact({
    required String pNouaAdresaDeEmail,
    required String pNoulTelefon,
    required String pAdresaDeEmail,
    required String pParola,
  }) async {
    Map<String, String> param = {
      'pAdresaMail': pAdresaDeEmail,
      'pParola': pParola,
      'pNouaAdresaDeEmail': pNouaAdresaDeEmail,
      'pNoulTelefon': pNoulTelefon,
    };

    String? data = await apiCall.apeleazaMetodaString(pNumeMetoda: 'SchimbaDateleDeContact', pParametrii: param);

    return data;
  }

  Future<String?> schimbaDateleDeContactValidarePin({
    required String pAdresaMail,
    required String pParola,
    required String pPINDinMail,
  }) async {
    final Map<String, String> param = {'pAdresaMail': pAdresaMail, 'pParola': pParola, 'pPINDinMail': pPINDinMail};
    String? res =
        await apiCall.apeleazaMetodaString(pNumeMetoda: 'SchimbaDateleDeContactValidarePIN', pParametrii: param);
    return res;
  }

  Future<String?> adaugaProgramare({
    required String pIdCategorie,
    required String pIdMedic,
    required String pDataProgramareDDMMYYYYHHmm,
    required String pObservatiiProgramare,
    required String pIdSediu,
    required String pIdMembruFamilie,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> param = {
      'pCheie': ' ',
      'pAdresaMail': prefs.getString(pref_keys.userEmail)!,
      'pParolaMD5': prefs.getString(pref_keys.userPassMD5)!,
      'pIdCategorie': pIdCategorie,
      'pIdMedic': pIdMedic,
      'pDataProgramareDDMMYYYYHHmm': pDataProgramareDDMMYYYYHHmm,
      'pObservatiiProgramare': pObservatiiProgramare,
      'pIdSediu': pIdSediu,
      'pIdMembruFamilie': pIdMembruFamilie,
    };

    String? data = await apiCall.apeleazaMetodaString(pNumeMetoda: 'AdaugaProgramareV2', pParametrii: param);

    return data;
  }

  Future<List<MembruFamilie>> getListaFamilie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> param = {
      'pAdresaMail': prefs.getString(pref_keys.userEmail)!,
      'pParolaMD5': prefs.getString(pref_keys.userPassMD5)!,
    };
    String? data = await apiCall.apeleazaMetodaString(pNumeMetoda: 'GetListaFamilie', pParametrii: param);

    List<MembruFamilie> familie = <MembruFamilie>[];
    if (data == null) {
      return [];
    }
    if (data.contains('*\$*')) {
      List<String> l = data.split('*\$*');
      l.removeWhere((element) => element.isEmpty);
      for (var element in l) {
        List<String> parts = element.split('\$#\$');

        MembruFamilie s = MembruFamilie(id: parts[0], nume: parts[1], prenume: parts[2]);
        familie.add(s);
      }
    }

    return familie;
  }

  Future<List<LinieFisaTratament>?> getListaLiniiFisaTratamentRealizateMembruFamilie(
      MembruFamilie membruFamilie) async {
    Map<String, String> params = {'pIdMembru': membruFamilie.id};

    String? res = await apiCall.apeleazaMetodaString(
        pNumeMetoda: 'GetListaLiniiFisaTratamentRealizatePeMembruFamilie', pParametrii: params);

    List<LinieFisaTratament> interventii = <LinieFisaTratament>[];
    if (res == null) {
      return null;
    }
    if (res.contains('*\$*')) {
      List<String> interventiiRaw = res.split('*\$*');
      interventiiRaw.removeWhere((v) => v.isEmpty);

      for (var interv in interventiiRaw) {
        List<String> list = interv.split('\$#\$');

        DateTime dateTime = DateTime.utc(
            int.parse(list[6].substring(0, 4)), int.parse(list[6].substring(4, 6)), int.parse(list[6].substring(6, 8)));

        String data = DateFormat('dd.MM.yyyy').format(dateTime);

        interventii.add(LinieFisaTratament(
            tipObiect: list[0],
            idObiect: list[1],
            numeMedic: list[2],
            denumireInterventie: list[3],
            dinti: list[4],
            observatii: list[5],
            dataDateTime: dateTime,
            dataString: data,
            pret: list[7],
            culoare: Color(int.parse(list[8])),
            valoareInitiala: list[9]));
      }
    }
    return interventii;
  }

  Future<List<LinieFisaTratament>?> getListaLiniiFisaTratamentDeFacutPeMembruFamilie(
      MembruFamilie membruFamilie) async {
    Map<String, String> params = {'pIdMembru': membruFamilie.id};

    String? res = await apiCall.apeleazaMetodaString(
        pNumeMetoda: 'GetListaLiniiFisaTratamentDeFacutPeMembruFamilie', pParametrii: params);

    List<LinieFisaTratament> interventii = <LinieFisaTratament>[];
    if (res == null) {
      return null;
    }
    if (res.contains('*\$*')) {
      List<String> interventiiRaw = res.split('*\$*');
      interventiiRaw.removeWhere((v) => v.isEmpty);

      for (var interv in interventiiRaw) {
        List<String> list = interv.split('\$#\$');

        DateTime dateTime = DateTime.utc(
            int.parse(list[6].substring(0, 4)), int.parse(list[6].substring(4, 6)), int.parse(list[6].substring(6, 8)));

        String data = DateFormat('dd.MM.yyyy').format(dateTime);

        interventii.add(LinieFisaTratament(
          tipObiect: list[0],
          idObiect: list[1],
          numeMedic: list[2],
          denumireInterventie: list[3],
          dinti: list[4],
          observatii: list[5],
          dataDateTime: dateTime,
          dataString: data,
          pret: list[7],
          culoare: Color(int.parse(list[8])),
          valoareInitiala: list[9]));
      }
    }
    return interventii;
  }

  
  Future<List<Judet>> getListaJudete() async {
    String? data = await apiCall.apeleazaMetodaString(
        pNumeMetoda: 'GetListaJudete');

    print('GetListaJudete data: $data');

    List<Judet> judete = <Judet>[];

    if (data == null) {
      return [];
    }

    if (data.contains('*\$*')) {
      List<String> l = data.split('*\$*');
      l.removeWhere((element) => element.isEmpty);
      for (var element in l) {
        List<String> parts = element.split('\$#\$');

        Judet z = Judet(
          id: parts[0],
          denumire: parts[1],
        );
        judete.add(z);
      }
    }
    return judete;
  }

  Future<List<Localitate>> getListaLocalitati(String pIdJudet) async {
    final Map<String, String> param = {
      'pIdJudet': pIdJudet,
    };
    String? data =
        await apiCall.apeleazaMetodaString(pNumeMetoda: 'GetListaLocalitati', pParametrii: param);

    List<Localitate> localitati = <Localitate>[];

    if (data == null) {
      return [];
    }

    if (data.contains('*\$*')) {
      List<String> l = data.split('*\$*');
      l.removeWhere((element) => element.isEmpty);
      for (var element in l) {
        List<String> parts = element.split('\$#\$');

        Localitate y = Localitate(id: parts[0], denumire: parts[1]);
        localitati.add(y);
      }
    }
    return localitati;
  }

}
*/
