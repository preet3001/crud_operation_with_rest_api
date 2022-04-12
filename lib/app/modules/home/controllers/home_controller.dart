import 'package:crud_operation/app/data/api_provider/client.dart';
import 'package:crud_operation/app/data/api_provider/repositories/product_repository.dart';
import 'package:crud_operation/app/data/model/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<ProductModel>>{
  callGetProductApi()async{
    Client client = Client();
    ProductRepository productRepository=ProductRepository(client: client.init());
    try {
      productRepository.getProductList().then((value) {
        if(value.isEmpty){
          change(null,status: RxStatus.empty());
        } else{
          change(value,status: RxStatus.success());
        }
      },onError: (err){
        change(value,status: RxStatus.error(err.toString()));
      });
    } on Exception catch (e) {
      change(value,status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    callGetProductApi();
    super.onInit();
  }
}
