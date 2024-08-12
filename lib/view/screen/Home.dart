import 'package:covo/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var showSearchField = false.obs;

  void toggleSearchField() {
    showSearchField.value = !showSearchField.value;
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bienvenue A Covoix", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: controller.toggleSearchField,
                      child: Image.asset(
                        Imageasset.search,
                        height: 45,
                      ),
                    ),
                    Obx(() {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: controller.showSearchField.value ? 280.0 : 0.0,
                        curve: Curves.linear,
                        child: controller.showSearchField.value
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Rechercher...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      );
                    }),
                    const Spacer(),
                    Image.asset(Imageasset.noti),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
