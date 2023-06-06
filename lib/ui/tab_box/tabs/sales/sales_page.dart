import 'package:employment_test/utils/images.dart';
import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Barcha mahsulotlar",
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Jami sum",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "0.0",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
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
                        trailing: SizedBox(
                          height: 80,
                          width: 50,
                          child: Center(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                              ),
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                            ),
                          ),
                        ),
                        title: Text(
                          "Colgate ${index + 1}-gr",
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle: const Text(" 75000 So'm"),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
            TextButton(child: const Text("Buyurtma berish"),onPressed: (){},)
          ],
        ),
      ),
    );
  }
}
