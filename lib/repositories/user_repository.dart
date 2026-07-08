import '../models/user.dart';

abstract class UserRepository {
  Future<void> createUser(User user);
  Future<User?> getUser(String id);
  Future<User?> getUserByUsernameAndPassword(String username, String password);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String id);
}
