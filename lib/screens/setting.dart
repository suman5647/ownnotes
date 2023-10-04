import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dark_mode.dart';
import '../utils/list_tile.dart';
import '../widgets/custom_icon_btn.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Container(
                height: size.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconBtn(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                      color: Theme.of(context).colorScheme.background,
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTileSetting(
                onTap: () {
                  // Get.to(() => Account());
                },
                title: "Account",
                iconData: Icons.person,
                subtitle: const Text('Tap here to go back'),
              ),
              ListTileSetting(
                onTap: () {
                  // Get.to(() => DarkMode());
                },
                title: "Dark Mode",
                iconData: Icons.nights_stay,
                subtitle: const Text('Tap here to go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
