import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/data/provider/palidrome_provider.dart';
import 'package:testflutter/data/provider/user_provider.dart';
import 'package:testflutter/presentation/component/button.dart';
import 'package:testflutter/presentation/palidrome/component/textbox.dart';
import 'package:testflutter/presentation/palidrome/component/textboxNoController.dart';
import 'package:testflutter/utils/dimensions.dart';
import 'package:testflutter/utils/images.dart';

class ChekingPalidrome extends StatefulWidget {
  const ChekingPalidrome({super.key});

  @override
  State<ChekingPalidrome> createState() => _ChekingPalidromeState();
}

class _ChekingPalidromeState extends State<ChekingPalidrome> {
  TextEditingController textPalidrome = TextEditingController();
  bool visibel = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PalidromeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Images.background))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Images.emptyPhoto),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            CustomTextBox(
              hint: "name",
              controller: textPalidrome,
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            CustomTextBoxNoController(
                hint: provider.palidResult == ''
                    ? "Palidrome result"
                    : provider.palidResult),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Visibility(
                visible: visibel,
                child: const Text(
                  "Text field can't be null !",
                  style: TextStyle(color: Colors.red),
                )),
            CustomButton(
                title: "Check",
                function: () {
                  if (textPalidrome.text.isEmpty) {
                    setState(() {
                      visibel = true;
                    });
                  } else {
                    setState(() {
                      visibel = false;
                    });
                    provider.checkPalidrome(textPalidrome.text);
                  }
                }),
            const SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            CustomButton(
                title: "Next",
                function: () {
                  if (textPalidrome.text.isNotEmpty) {
                    userProvider.getUsername(textPalidrome.text);
                    Navigator.pushNamed(context, '/detail');
                  }
                })
          ],
        ),
      ),
    );
  }
}
