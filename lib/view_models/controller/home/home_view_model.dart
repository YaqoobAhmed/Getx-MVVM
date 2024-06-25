import 'package:get/get.dart';
import 'package:getx_nvvm/data/response/status.dart';
import 'package:getx_nvvm/models/home/user_list_model.dart';
import 'package:getx_nvvm/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  RxString error = ''.obs;
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi() {
    // setRxRequestStatus(Status.LOADING);      //it will give error bcz it is already being call above
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      print("error: $error");
      print("StackTrace: $stackTrace");
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshUserListApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      print("error: $error");
      print("StackTrace: $stackTrace");
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
