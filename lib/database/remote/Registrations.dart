import 'package:sachiel_website/utils/io/file_io.dart';

class Registrations {

  void preregistrationCandlestick(String emailAddress) async {

    // await FirebaseFirestore.instance.collection("/Sachiels/Candlesticks/Preregistrations")
    //     .doc(emailAddress).set({
    //       "Email": emailAddress
    //     });

    storeBoolean("Registered", true);

  }

  Future<bool> isRegistered() async {

    return readBoolean("Registered");
  }

}