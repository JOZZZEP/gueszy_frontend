import 'package:get/get.dart';

class UserControl extends GetxController {
  late num id;
  late String name;
  late String password;
  late String gueszyId;

  UserControl(
      {required this.id,
      required this.name,
      required this.password,
      required this.gueszyId});

  get getId => id;

  set setId(id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getPassword => password;

  set setPassword(password) => this.password = password;

  get getGueszyId => gueszyId;

  set setGueszyId(gueszyId) => this.gueszyId = gueszyId;
}
