import 'package:ayurvedic_app/global/config/color.config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/enrollment.controller.dart';
import '../widget/enroll_body.widget.dart';
import '../widget/enroll_footer.widget.dart';
import '../widget/enroll_header.widget.dart';

class EnrollmentScreen extends StatefulWidget {
  const EnrollmentScreen({super.key});
  static const route = '/enroll';
  @override
  State<EnrollmentScreen> createState() => _EnrollmentScreenState();
}

class _EnrollmentScreenState extends State<EnrollmentScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ctrl = Provider.of<EnrollmentController>(context,listen: false);
      ctrl.onInit();
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kWhite,
      body: Column(
        children: [
          const Expanded(flex: 3, child: EnrollHeader()),
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EnrollBody(),
                  const EnrollFooter()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
