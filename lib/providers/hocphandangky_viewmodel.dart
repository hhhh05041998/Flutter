import 'package:connection/models/hocphan.dart';
import 'package:connection/models/profile.dart';
import 'package:connection/repositories/hocphan_dangky_repository.dart';
import 'package:flutter/material.dart';

class HocPhanDangKyViewModel with ChangeNotifier {
  String message = '';
  int status = 0;
  HocPhanDangKyRepository hocphandangky = HocPhanDangKyRepository();
  Future<void> dangKyHocPhan(int id) async {
    status = 1;
    notifyListeners();
    try {
      var profile = await hocphandangky.dangKyHocPhan(id);
      if (profile == 2) {
        status = 2;
        message = 'Đăng ký thành công';
      } else {
        message = "Đăng ký  thất bại !";
        status = 1;
      }

      notifyListeners();
    } catch (e) {
      status = 1;
      // ignore: avoid_print
      print(e);
    }
  }

  Future<List<HocPhanDangKy>> getHocPhanDangKy() async {
    notifyListeners();
    try {
      var profile = await hocphandangky.getHocPhanDangKy();
      List<HocPhanDangKy> allCourses = profile;
      final filteredList = allCourses
          .where((hocPhan) => hocPhan.idsinhvien == Profile().user.id)
          .toList();
      return filteredList;
    } catch (e) {
      // ignore: avoid_print
      print(e);

      return [];
    }
  }
}
