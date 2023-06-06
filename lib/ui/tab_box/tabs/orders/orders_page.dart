import 'package:employment_test/utils/images.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Zakaz olish",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.personImage),
                        fit: BoxFit.fill),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                trailing:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                title: Text(
                  "Doniyor Turg'unboyev   ${index + 1}",
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: const Text("998 (90) 789 80 69"),
              );
            },
          ),
        ),
      ),
    );
  }
}
