import 'dart:developer';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;

      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser == null) {
        log("❌ No logged-in user found.");
        return;
      }

      final response = await Supabase.instance.client
          .from('users')
          .select()
          .neq('id', currentUser.id);

      users.assignAll(List<Map<String, dynamic>>.from(response));
    } catch (e) {
      log("❌ Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
