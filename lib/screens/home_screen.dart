// ignore_for_file: depend_on_referenced_packages

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mini_store_app/const/colors.dart';
import 'package:mini_store_app/widget/appbar_icons.dart';
import 'package:mini_store_app/widget/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 4,
            title: const Text("Home"),
            leading: AppBarIcons(
              function: () {},
              icon: Icons.category_rounded,
            ),
            actions: [
              AppBarIcons(
                function: () {},
                icon: Icons.supervised_user_circle,
              ),
            ],
          ),
          // search bar
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).cardColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: lightIconsColor,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (ctx, index) {
                      return const SaleWidget();
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
