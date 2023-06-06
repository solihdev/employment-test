import 'package:employment_test/cubits/tab/tab_cubit.dart';
import 'package:employment_test/ui/tab_box/tabs/orders/orders_page.dart';
import 'package:employment_test/ui/tab_box/tabs/sales/sales_page.dart';
import 'package:employment_test/ui/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tabs/home/home_page.dart';

class TabBoxPage extends StatefulWidget {
  const TabBoxPage({super.key});

  @override
  State<TabBoxPage> createState() => _TabBoxPageState();
}

class _TabBoxPageState extends State<TabBoxPage> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const HomePage());
    screens.add(const SizedBox());
    screens.add(const OrdersPage());
    screens.add(const SalesPage());
    screens.add(const SizedBox());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        var index = context.watch<BottomNavCubit>().activePageIndex;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: IndexedStack(
              index: index,
              children: screens,
            ),
            bottomNavigationBar: const BottomNavBar(),
          ),
        );
      },
    );
  }
}
