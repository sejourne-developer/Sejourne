import 'package:get/get.dart';
import '../features/authentication/controllers/permissions/permissions_controller.dart';
import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkManager>(NetworkManager(),permanent: true);
    Get.put(PermissionsController());
  }
}
