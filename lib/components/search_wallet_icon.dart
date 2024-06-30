import 'package:flutter/material.dart';

class SearchAndWalletIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Consult...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.person, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
