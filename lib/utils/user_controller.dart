import 'package:app4_receitas/data/models/user_profile.dart';
import 'package:app4_receitas/data/repositories/auth_repository.dart';
import 'package:app4_receitas/di/service_locator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  final _repository = getIt<AuthRepository>();
  final user = Rxn<UserProfile>();

  Future<void> loadUser() async {
    final result = await _repository.currentUser;
    result.fold((left) => null, (right) => user.value = right);
  }
}
