
import 'package:isar/isar.dart';

part 'profile_model.g.dart';

@collection
class ProfileModel {
  Id id = Isar.autoIncrement;
  
  bool? isCustomer;
  String? fullname;
  String? email;
  String? imageLink;

  ProfileModel({this.isCustomer, this.imageLink, this.fullname, this.email});

  
}
