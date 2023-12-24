import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/data/provider/user_provider.dart';
import 'package:testflutter/presentation/component/button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome"),
            Text(
              userProvider.username,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Center(
                child: Text(
                  userProvider.userDetail.email == "email"
                      ? "Selected Username"
                      : "${userProvider.userDetail.firstName} ${userProvider.userDetail.lastName}",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            CustomButton(
                function: () {
                  Navigator.pushNamed(context, '/listUser');
                },
                title: "Choose a User")
          ],
        ),
      ),
    );
  }
}
