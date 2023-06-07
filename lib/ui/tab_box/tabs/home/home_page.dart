import 'package:employment_test/bloc/order/orders_bloc.dart';
import 'package:employment_test/data/models/form_status.dart';
import 'package:employment_test/data/repositories/order_repository.dart';
import 'package:employment_test/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Zakazlar",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
        actions: [
          IconButton(
            onPressed: () {
              context.read<OrdersRepository>().getOrders();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state.status == FormStatus.gettingOrdersLoad) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == FormStatus.gettingOrdersSuccess) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.personImage),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      trailing: Text("${state.orders[index].totalPrice} So'm"),
                      title: Text(
                        state.orders[index].orderName,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state.status == FormStatus.gettingOrdersFail) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: SizedBox(),
            );
          }
        },
      ),
    );
  }
}
