import 'package:cloud_firestore/cloud_firestore.dart';

class Registrations {

  Future preregistrationCandlestick(String emailAddress) async {

    await FirebaseFirestore.instance.collection("/Sachiels/Candlesticks/Preregistrations")
        .doc(emailAddress).set({
          "Email": emailAddress
        });

    // await createFileOfTexts("Registered", "TXT", emailAddress);

  }

  bool isRegistered() {

    return false;
  }

}