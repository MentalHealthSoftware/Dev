import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 32,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Consult...',
                  hintStyle: const TextStyle(color: Color(0xFFC6DFDF)),
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0xFF007A7A)),
                  suffixIcon: const Icon(Icons.mic, color: Color(0xFF007A7A)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFC6DFDF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFC6DFDF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFC6DFDF)),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            'assets/wallet.svg',
            height: 45,
            color: Colors.grey,
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
