import 'package:beijing/controllers/theme_controller.dart';
import 'package:beijing/utils/styles.dart';
import 'package:beijing/views/settingspage/widgets/settings_topRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.060,
          right: size.width * 0.060,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.03),
                // A TopRow Widget
                const SettingsTopRow(),

                SizedBox(height: size.height * 0.015),

                ListTile(
                  title: const Text("Dark Theme"),
                  trailing: Obx(() {
                    return Switch(
                      value: themeController.currentThemeMode.value ==
                          ThemeMode.dark,
                      activeColor: Colors.redAccent,
                      activeTrackColor: yellowColor,
                      onChanged: (value) {
                        themeController.setTheme();
                        Get.changeThemeMode(
                            themeController.currentThemeMode.value);
                      },
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
