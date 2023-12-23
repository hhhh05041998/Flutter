import 'package:connection/models/hocphan.dart';
import 'package:connection/providers/hocphandangky_viewmodel.dart';
import 'package:connection/providers/mainViewModel.dart';
import 'package:connection/repositories/ds_hocphan_repository.dart';
import 'package:connection/ui/custom_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppConstant.dart';

class SubPageDsHocPhan extends StatelessWidget {
  const SubPageDsHocPhan({super.key});
  static int idPage = 5;

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<HocPhanDangKyViewModel>(context);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Danh Sách Học Phần',
            style: TextStyle(
              color: Color.fromARGB(255, 146, 13, 6),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: FutureBuilder<List<HocPhan>>(
            future: HocPhanRepository().getDsHocPhan(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                ); // Hiển thị loading khi đang fetch dữ liệu
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Xây dựng giao diện sử dụng dữ liệu từ API
                List<HocPhan> dataList = snapshot.data!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // maxCrossAxisExtent: 200,
                      crossAxisSpacing: 15, // Khoảng cách giữa các cột
                      mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                    ),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 56, 174, 195),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 15, 6, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    dataList[index].tenhocphan,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    dataList[index].tengv,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 8, 5, 173),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () async {
                                  await viewmodel
                                      .dangKyHocPhan(dataList[index].id);
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: CustomButton(textButton: 'Đăng ký'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
