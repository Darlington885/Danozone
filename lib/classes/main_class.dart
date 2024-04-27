
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
import 'fonts.dart';

class MainClass{

  static bH(sz) {
    double a1 = sz.toDouble();
    return SizedBox(
      height: a1,
    );
  }

  static bW(sz) {
    double a1 = sz.toDouble();
    return SizedBox(
      width: a1,
    );
  }

  static devH(ctx, sz) {
    double a1 = sz.toDouble();
    return MediaQuery.of(ctx).size.height / a1;
  }

  static devW(ctx, sz) {
    double a1 = sz.toDouble();
    return MediaQuery.of(ctx).size.width / a1;
  }

  static txtB1(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontFamily: AppFonts.manrope),
      textAlign: TextAlign.start,
    );
  }

  static txtB2(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontFamily: AppFonts.manrope),
      textAlign: TextAlign.start,
    );
  }

  static txtM4(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.manrope),
      textAlign: TextAlign.start,
    );
  }

  static txtGM4(txt, sz) {
    double a1 = sz.toDouble();
    return Text(
      txt,
      style: TextStyle(
          fontSize: a1,
          color: AppColor.colorAppGray,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.manrope),
      textAlign: TextAlign.center,
    );
  }

  static userCard(t, s, ctx){
    return Container(
      height: MainClass.devH(ctx, 12),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 20.w, top: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.colorApp.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainClass.txtB1(t, 16.sp),
          MainClass.bH(10),
          MainClass.txtB1(s, 16.sp),
        ],
      ),
    );
  }

}
