import 'package:flutter/material.dart';
import 'package:ticket_system/core/configs/theme/app_color.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    brightness: Brightness.light,
    fontFamily: 'Inter',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.black, width: 1.5), // Đường gạch dưới khi chưa focus
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.blue, width: 1.5), // Đường gạch dưới khi chưa focus
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.blue, width: 1.5), // Đường gạch dưới khi chưa focus
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary, // Màu con trỏ
      selectionColor: AppColors.primary.withValues(alpha: 0.3), // Màu vùng chọn
      selectionHandleColor: AppColors.primary, // Màu chốt kéo vùng chọn
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    ),
  );
}
