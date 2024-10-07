import 'package:get/get.dart';
import 'package:oberi_mobile/ui/views/account/account_binding.dart';
import 'package:oberi_mobile/ui/views/account/account_view.dart';

final accountRoute = [
  GetPage(
    name: AccountView.route,
    page: () => const AccountView(),
    binding: AccountBinding(),
  ),
];
