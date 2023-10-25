import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sachiel_website/utils/io/file_io.dart';

class Registrations {

  Future preregistrationCandlestick(String emailAddress) async {

    await FirebaseFirestore.instance.collection("/Sachiels/Candlesticks/Preregistrations/")
        .doc(emailAddress).set({
          "Email": emailAddress
        });

    createFileOfTexts("Registered", "TXT", emailAddress);

  }

  Future<bool> isRegistered() {

    return fileExist("Registered.TXT");
  }

}