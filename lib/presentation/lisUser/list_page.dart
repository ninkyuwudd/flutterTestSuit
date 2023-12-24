import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/data/model/user_model.dart';
import 'package:testflutter/data/provider/user_provider.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: FutureBuilder<MainData>(
        future: provider.allUserData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            final getdata = snapshot.data!;
            return buildPosts(getdata, provider);
          } else {
            return const Text("No data from api");
          }
        },
      ),
    );
  }
}

Widget buildPosts(MainData posts, UserProvider provider) {
  return ListView.builder(
    itemCount: posts.data.length,
    itemBuilder: (context, index) {
      final post = posts.data[index];
      return InkWell(
        onTap: () {
          provider.getUserDetail(post);
          provider.getUsername(post.firstName);
          Navigator.pushReplacementNamed(context, '/detail');
        },
        child: Container(
          color: Colors.grey.shade300,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(flex: 1, child: Image.network(post.avatar)),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(post.firstName)),
            ],
          ),
        ),
      );
    },
  );
}
