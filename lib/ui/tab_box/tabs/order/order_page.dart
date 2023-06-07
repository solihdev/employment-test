import 'package:employment_test/bloc/order/orders_bloc.dart';
import 'package:employment_test/bloc/products/products_bloc.dart';
import 'package:employment_test/data/models/form_status.dart';
import 'package:employment_test/data/models/order_model.dart';
import 'package:employment_test/data/models/user_model.dart';
import 'package:employment_test/ui/tab_box/tab_box.dart';
import 'package:employment_test/utils/images.dart';
import 'package:employment_test/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController firstPrice = TextEditingController();
    TextEditingController secondPrice = TextEditingController();
    TextEditingController threePrice = TextEditingController();
    TextEditingController fourthPrice = TextEditingController();
    TextEditingController fifthPrice = TextEditingController();

    List<TextEditingController> controllers = [
      firstPrice,
      secondPrice,
      threePrice,
      fourthPrice,
      fifthPrice,
    ];

    int totalPrice = 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.status == FormStatus.gettingProductsLoad) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == FormStatus.gettingProductsSuccess) {
            return Padding(
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
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.products.length,
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
                                    controller: controllers[index],
                                  ),
                                ),
                              ),
                              title: Text(
                                state.products[index].productName,
                                style: const TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                  "${state.products[index].price} ${state.products[index].currency}"),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  TextButton(
                    child: const Text("Buyurtma berish"),
                    onPressed: () {
                      for (var i = 0; i < controllers.length; i++) {
                        if (controllers[i].text.isNotEmpty) {
                          totalPrice += int.parse(controllers[i].text) *
                              state.products[i].price;
                        }
                      }
                      OrderModel newOrder = OrderModel(
                        count: 0,
                        totalPrice: totalPrice,
                        orderName: userModel.name,
                      );

                      final ordersBloc = BlocProvider.of<OrdersBloc>(context);
                      totalPrice != 0
                          ? ordersBloc.add(AddOrders(orderModel: newOrder))
                          : MyUtils.getMyToast(message: 'Qiymat kiriting');
                    },
                  ),
                  BlocListener<OrdersBloc, OrdersState>(
                    listener: (context, state) {
                      if (state.status == FormStatus.insertingOrdersSuccess) {
                        BlocProvider.of<OrdersBloc>(context).add(FetchOrders());

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TabBoxPage()),
                        );
                      }
                    },
                    child: Container(), // Empty Container
                  )
                ],
              ),
            );
          } else if (state.status == FormStatus.gettingProductsFail) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
