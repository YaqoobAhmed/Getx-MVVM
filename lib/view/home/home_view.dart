import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/data/response/status.dart';
import 'package:getx_nvvm/resources/colors/app_color.dart';
import 'package:getx_nvvm/resources/components/general_exception.dart';
import 'package:getx_nvvm/resources/components/internet_exception_widget.dart';
import 'package:getx_nvvm/resources/routes/routes_name.dart';
import 'package:getx_nvvm/view_models/controller/home/home_view_model.dart';
import 'package:getx_nvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  UserPreferences userPreferences = UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  userPreferences.removeUser().then((value) {
                    Get.toNamed(RoutesName.loginView);
                  });
                },
                icon: Icon(
                  Icons.login,
                  color: AppColor.whitecolor,
                ))
          ],
        ),
        body: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              );
            case Status.ERROR: //Request Time Outnull
              if (homeController.error.value == 'No Internet null') {
                return InternetExceptionWidget(onPressed: () {
                  homeController.refreshUserListApi();
                });
              } else {
                return GeneralExceptionWidget(onPressed: () {
                  homeController.refreshUserListApi();
                });
              }

            case Status.COMPLETED:
              return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                    ),
                  );
                },
              );
          }
        }));
  }
}
