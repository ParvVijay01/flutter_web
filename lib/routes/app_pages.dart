import 'package:get/get.dart';
import 'package:portfolio/model/category_model.dart';
import 'package:portfolio/pages/contact_pages.dart';
import 'package:portfolio/pages/gallery_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/view_all_screen.dart';

class AppPages {
  static const HOME = '/home';
  static const ABOUT = '/about';
  static const GALLERY = '/gallery';
  static const VIEW_ALL = '/viewAll';

  static final routes = [
    GetPage(name: HOME, page: () => HomePage()),
    GetPage(name: ABOUT, page: () => ContactPage()),
    GetPage(name: GALLERY, page: () => GalleryPage()),
    GetPage(
        name: VIEW_ALL,
        page: () => ViewAllScreen(category: Get.arguments as Category))
  ];
}
