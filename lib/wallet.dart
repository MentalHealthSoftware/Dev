import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  double value = 124;
  List transactions = [
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    },
    {
      "icon": null,
      "title": 'Earned 5 power silver badge',
      'amount': 8,
      'date': '25/10/2024'
    }
  ];

  TextStyle style(color, double size, weight, family) {
    return TextStyle(
        color: Color(color),
        fontSize: size,
        fontWeight: weight,
        fontFamily: family);
  }

  ListTile transactiontile(Icon? icon, String title, int amount, String date) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: icon != null ? AssetImage('$icon') : null,
      ),
      title: Text(
        '$title',
        style: TextStyle(
            color: Color(0xff003f5a),
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: 'Poppins'),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$amount',
            style: TextStyle(
                color: amount >= 0 ? Color(0xff018906) : Color(0xffCA1408),
                fontSize: 15),
          ),
          Text(
            '$date',
            style: TextStyle(
                color: Color(0xff003f5a),
                fontSize: 8,
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Lock orientation to portrait only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // Allow all orientations when leaving the page
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  Padding curvedBox(String points, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff007a7a)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$points',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '$text',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        iconTheme: IconThemeData(color: Color(0xff003F5A)),
        centerTitle: true,
        title: Text(
          "WALLET",
          style: TextStyle(
              color: Color(0xff003F5A),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        bottom: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height / 4.6),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30.0,
                  ),
                  child: Container(
                    width: screenwidth / 1.15,
                    decoration: BoxDecoration(
                        color: Color(0xffE9F3F3),
                        border:
                            Border.all(width: 1.5, color: Color(0xffBCB8B8)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/wallet.png",
                                color: Color(0xff007A7A),
                              ),
                              Text(
                                "Your Wallet Balance",
                                style: style(
                                    0xff003F5A, 15, FontWeight.w500, "Poppins"),
                              ),
                              Text(
                                "\$$value",
                                style: style(
                                    0xff003F5A, 18, FontWeight.w700, "Poppins"),
                              )
                            ],
                          ),
                        ),
                        Container(
                            width: 300,
                            child: Divider(
                              color: Color(0xffC0BDBD4F).withOpacity(0.31),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, bottom: 12, top: 10),
                              child: Text(
                                "Terms & Conditions",
                                style: style(
                                    0xff969696, 15, FontWeight.w500, "Poppins"),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff003F5A),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/WalletNotif.png",
              ))
        ],
      ),
      backgroundColor: Color(0xffE3E3E3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                height: screenheight / 6.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      curvedBox("610", "Total Earned"),
                      curvedBox("100", "Redeemed"),
                      curvedBox("0", "Expired")
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 20),
              child: Container(
                // height: screenheight / 6.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transactions",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins"),
                          ),
                          OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  minimumSize: Size(52, 23),
                                  side: BorderSide(
                                      width: 2, color: Color(0xffd36600)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor:
                                      Color(0xfff9c98f).withOpacity(0.54)),
                              child: Text(
                                "MORE",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffde6600)),
                              ))
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = transactions[index];

                          return transactiontile(
                            transaction['icon'],
                            transaction['title'],
                            transaction['amount'],
                            transaction['date'],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
