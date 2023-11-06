import 'package:flutter/material.dart';

class HistoryInterface extends StatefulWidget {

  const HistoryInterface({Key? key}) : super(key: key);

  @override
  State<HistoryInterface> createState() => _HistoryInterfaceState();
}
class _HistoryInterfaceState extends State<HistoryInterface> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.greenAccent,
      child: const Align(
        alignment: Alignment.topCenter,
        child: Image(
          image: AssetImage("assets/coming_soon.png")
        )
      )
    );
  }

}