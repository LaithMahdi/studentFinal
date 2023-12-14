import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/add-or-update/AddOrUpdateController.dart';
import '../../../core/constant/AppString.dart';
import '../../../core/enums/StatusRequest.dart';
import '../../../widgets/button/PrimaryButton.dart';
import '../../../widgets/loading/ProgressLoading.dart';
import '../../widgets/add-or-update/AddOrUpdateView.dart';

class AddOrUpdate extends StatelessWidget {
  const AddOrUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    AddOrUpdateControllerImpl controllerImpl =
        Get.put(AddOrUpdateControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(controllerImpl.id == 0
            ? AppString.addStudent
            : AppString.editStudent),
      ),
      body: Form(
        key: controllerImpl.formKey,
        child: GetBuilder<AddOrUpdateControllerImpl>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? const ProgressLoading()
                  : const AddOrUpdateView(),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: PrimaryButton(
          title: controllerImpl.id == 0 ? AppString.add : AppString.edit,
          onPressed: () => controllerImpl.addOrUpdate(),
        ),
      ),
    );
  }
}
