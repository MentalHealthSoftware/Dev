import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mentalheathstartup/IntroPages(3)/LinearProgress.dart';

class TandC extends StatefulWidget {
  final GlobalKey<LinearProgressState> linearProgressKey;

  const TandC({super.key, required this.linearProgressKey});

  @override
  State<TandC> createState() => _TandCState();
}

class _TandCState extends State<TandC> {
  TextStyle head() {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff003F5A));
  }

  TextStyle desc() {
    return TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff003F5A));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Container(
            height: 98,
            color: Color(0xff007A7A),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 13, bottom: 9),
                  child: Text(
                    "DISCLAIMER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 9),
                  child: Text(
                    "Please note that our app only allows certified practictioners .",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Terms And Conditions",
          style: TextStyle(
              color: Color(0xff003F5A),
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Acceptance of Terms",
                    style: head(),
                  ),
                  Text(
                    "[App Name] provides resources and tools to support mental well-being, including but not limited to mood tracking, meditation exercises, chat features, and educational content. Our services do not substitute professional mental health treatment.",
                    style: desc(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1. Acceptance of Terms",
                    style: head(),
                  ),
                  Text(
                    "[App Name] provides resources and tools to support mental well-being, including but not limited to mood tracking, meditation exercises, chat features, and educational content. Our services do not substitute professional mental health treatment.",
                    style: desc(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1. Acceptance of Terms",
                    style: head(),
                  ),
                  Text(
                    "[App Name] provides resources and tools to support mental well-being, including but not limited to mood tracking, meditation exercises, chat features, and educational content. Our services do not substitute professional mental health treatment.",
                    style: desc(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1. Acceptance of Terms",
                    style: head(),
                  ),
                  Text(
                    "[App Name] provides resources and tools to support mental well-being, including but not limited to mood tracking, meditation exercises, chat features, and educational content. Our services do not substitute professional mental health treatment.",
                    style: desc(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1. Acceptance of Terms",
                    style: head(),
                  ),
                  Text(
                    "[App Name] provides resources and tools to support mental well-being, including but not limited to mood tracking, meditation exercises, chat features, and educational content. Our services do not substitute professional mental health treatment.",
                    style: desc(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1. Acceptance of Terms",
                    style: head(),
                  ),
                  Text(
                    "[App Name] provides resources and tools to support mental well-being, including but not limited to mood tracking, meditation exercises, chat features, and educational content. Our services do not substitute professional mental health treatment.",
                    style: desc(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Color(0xff007A7A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "DISAGREE",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffDE6600),
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        widget.linearProgressKey.currentState!.nextPage();
                      },
                      child: Text(
                        "AGREE",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
