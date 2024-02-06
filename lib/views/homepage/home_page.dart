import 'package:beijing/controllers/home_controller.dart';
import 'package:beijing/utils/styles.dart';
import 'package:beijing/views/homepage/widgets/product_gridview.dart';
import 'package:beijing/views/homepage/widgets/topRow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final homeController = Get.put(HomeController());
  String brandText = "Find good Food around you";

  @override
  void initState() {
    homeController.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                const TopRow(),
                // Brand text
                Text(
                  brandText,
                  style: const TextStyle(
                    fontSize: 24,
                    color: darkColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 0,
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.020),
                    // SearchBar
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        // isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: size.height * 0.006),
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.black54),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: yellowColor, width: size.width * 0.003),
                        ),
                        prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass,
                            size: 20),
                        hintText: "Search your fav food",
                        hintStyle: const TextStyle(color: Colors.black87),
                        suffixIcon:
                            const Icon(FontAwesomeIcons.sliders, size: 20),
                      ),
                    ),

                    SizedBox(height: size.height * 0.020),

                    // Find Text Row
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Find",
                          style: TextStyle(
                            fontSize: 30,
                            color: darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 3),
                          child: Text(
                            "5km",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.5),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 14,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.020),

                    // FindCategory TabBar
                    SizedBox(
                      height: size.height * 0.080,
                      child: TabBar(
                        controller: homeController.tabController,
                        indicatorColor: Colors.black38,
                        indicatorWeight: 1.2,
                        splashFactory: NoSplash.splashFactory,
                        labelPadding: const EdgeInsets.all(8),
                        indicatorPadding:
                            EdgeInsets.only(top: size.height * 0.025),
                        onTap: (value) {
                          homeController.setFindCategoryIndex(value);
                        },
                        tabs: List.generate(
                          homeController.findCategory.length,
                          (index) {
                            return Obx(
                              () => Tab(
                                child: Container(
                                  height: size.height * 0.060,
                                  width: size.width * 0.75,
                                  decoration: BoxDecoration(
                                    color: homeController
                                                .findCategoryIndex.value ==
                                            index
                                        ? yellowColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      size.height * 0.0375,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      homeController.findCategory[index]
                                          ["value"],
                                      style: TextStyle(
                                        color: darkColor,
                                        fontSize: size.height * 0.022,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // TabBarView of TabBar
                    SizedBox(
                      height: size.height * 0.75,
                      child: TabBarView(
                        controller: homeController.tabController,
                        children: const [
                          ProductGridView(),
                          Center(
                            child: Text("Hot Sale"),
                          ),
                          Center(
                            child: Text("Popularity"),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * 0.020),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
