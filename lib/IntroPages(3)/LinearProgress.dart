import 'package:flutter/material.dart';
import 'package:mentalheathstartup/IntroPages(3)/Info.dart';
import 'package:mentalheathstartup/IntroPages(3)/RegisterAs.dart';
import 'package:mentalheathstartup/IntroPages(3)/TandC.dart';

// final GlobalKey<LinearProgressState> _linearProgressKey =
//     GlobalKey<LinearProgressState>();

class LinearProgress extends StatefulWidget {
  const LinearProgress({Key? key}) : super(key: key);

  @override
  State<LinearProgress> createState() => LinearProgressState();
}

class LinearProgressState extends State<LinearProgress> {
  double currentpage = 1;

  void nextPage() {
    if (currentpage < 3) {
      setState(() {
        currentpage++;
      });
    }
  }

  void previousPage() {
    if (currentpage > 1) {
      setState(() {
        currentpage--;
      });
    }
  }

  Widget getPageContent() {
    switch (currentpage) {
      case 1:
        return TandC(
            linearProgressKey: widget.key as GlobalKey<LinearProgressState>);
      case 2:
        return registerAs(
            linearProgressKey: widget.key as GlobalKey<LinearProgressState>);
      case 3:
        return personalInfo();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    double _progress = currentpage / 3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentpage == 2 || currentpage == 3
            ? Color.fromARGB(255, 204, 240, 188)
            : null,
      ),
      body: Container(
        color: currentpage == 2 || currentpage == 3
            ? Color.fromARGB(255, 204, 240, 188)
            : null,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: previousPage,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xff003F5A),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 258,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(6),
                      value: _progress,
                      backgroundColor: Colors.grey[300], // Background color
                      color: Color(0xff003F5A), // Progress color
                      minHeight: 5.0, // Thickness of the bar
                    ),
                  ),
                ),
                Text(
                  "Help",
                  style: TextStyle(
                      color: Color(0xff003F5A),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: 50),
            Expanded(child: getPageContent()),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
