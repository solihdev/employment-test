import 'package:employment_test/bloc/user/user_bloc.dart';
import 'package:employment_test/data/models/form_status.dart';
import 'package:employment_test/ui/tab_box/tabs/order/order_page.dart';
import 'package:employment_test/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

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
      body: BlocBuilder<UsersBloc, UserState>(
        builder: (context, state) {
          if (state.status == FormStatus.gettingUserLoad) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == FormStatus.gettingUserSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(
                            userModel: state.users[index],
                          ),
                        ),
                      );
                    },
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
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.edit)),
                    title: Text(
                      state.users[index].name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(state.users[index].number.toString()),
                  );
                },
              ),
            );
          } else if (state.status == FormStatus.gettingUserFail) {
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
