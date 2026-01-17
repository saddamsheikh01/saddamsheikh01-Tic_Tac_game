import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled2/AppUtils/app_colors.dart';
import 'package:untitled2/AppUtils/app_font_size.dart';

class TextButtonWidget extends StatelessWidget {
  final String btnTxt;
  final VoidCallback onBtnTap;
  final bool isEnabled;

  const TextButtonWidget({
    super.key,
    required this.btnTxt,
    required this.onBtnTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: isEnabled ? onBtnTap : null,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 34,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                /// GLASS BACKGROUND
                color: AppColors.white.withOpacity(0.12),

                /// BORDER
                border: Border.all(
                  color: AppColors.white.withOpacity(0.28),
                ),

                /// SUBTLE GLOW
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.35),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],

                /// GRADIENT OVERLAY
                gradient: AppColors.primaryGradient,
              ),
              child: Text(
                btnTxt,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFontSize.fontSize18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
