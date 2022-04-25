import 'package:loggy/loggy.dart';

import '../../data/datasources/local/user_local_datasource.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';

class UserRepository {
  late UserLocalDataSource userLocalDataSource;
  late UserRemoteDatatasource userRemoteDatatasource;


  UserRepository() {
    logInfo("Starting UserRepository");
    userLocalDataSource= UserLocalDataSource();
    userRemoteDatatasource= UserRemoteDatatasource();
  }

  Future<bool> getUser() async {
    RandomUser randomUser= await userRemoteDatatasource.getUser();
    await userLocalDataSource.addUser(randomUser);
    return Future.value(true);
  }

  Future<List<RandomUser>> getAllUsers() async =>
    await userLocalDataSource.getAllUsers();

  Future<void> deleteUser(id) async =>
    await userLocalDataSource.deleteUser(id);

  Future<void> deleteAll() async => 
    await userLocalDataSource.deleteAll();

  Future<void> updateUser(user) async => 
    await userLocalDataSource.updateUser(user);
}
