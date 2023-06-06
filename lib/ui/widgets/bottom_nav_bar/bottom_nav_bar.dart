import 'package:employment_test/cubits/tab/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var index = context.watch<BottomNavCubit>().activePageIndex;
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.amber,
      type: BottomNavigationBarType.fixed,
      onTap: (value) =>
          BlocProvider.of<BottomNavCubit>(context).changePageIndex(value),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
            color: index == 0 ? Colors.green : Colors.grey.shade400,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_missed_sharp,
            color: index == 1 ? Colors.green : Colors.grey.shade400,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined,
            color: index == 2 ? Colors.green : Colors.grey.shade400,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list,
            color: index == 3 ? Colors.green : Colors.grey.shade400,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,
            color: index == 4 ? Colors.green : Colors.grey.shade400,
          ),
          label: '',
        ),
      ],
    );
  }
}
