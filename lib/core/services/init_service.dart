import 'package:get/get.dart';
import 'package:nft_tool_app/app/components/bottom_bar/controller/bottom_controller.dart';

/// Servislerin initialize edildiği yer
/// [ParametersController] tüm ekranlarda kullanıldığı için burada Init edildi.
class InitServices extends Bindings {
  @override
  Future<void> dependencies() async {
    await _getxController();
    await _loadServices();
    await _fbServices();
  }

  //Getx de initialize yapılacak olan controller ın tutulduğu yer.
  static Future<void> _getxController() async {
    Get.put(BottomAppbarController());
  }

  //Initialize ı yapılması gereken sınıfların tutulduğu yer.
  static Future<void> _loadServices() async {}

  //Firebase servislerinin initialize ının yapıldığı yer.
  static Future<void> _fbServices() async {}
}
