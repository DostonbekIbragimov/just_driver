import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_driver/controller/main/dashboard_controller.dart';
import 'package:just_driver/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:just_driver/data/utils/constants.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          backgroundColor: mainBackground,
          appBar: AppBar(
            leading: InkWell(
              child: Icon(
                Icons.phone,
                color: Colors.amber,
              ),

            ),
            title: Text("title"),
            elevation: 10,
          ),
          body: const Center(
            child: Text('My Page!'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
