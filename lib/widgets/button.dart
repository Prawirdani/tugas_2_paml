import 'package:flutter/material.dart';
import 'package:tugas_2_paml/config/theme/colors.dart';

enum ButtonVariant {
  primary,
  secondary,
  outline,
  destructive,
  destructiveOutline,
}

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final bool fullWidth;
  final double? height;
  final IconData? icon;

  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.fullWidth = false,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _getButtonStyle(context),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_getProgressColor()),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          _buildText(),
        ],
      );
    }

    return _buildText();
  }

  Text _buildText() {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Color _getProgressColor() {
    switch (variant) {
      case ButtonVariant.outline:
        return AppColors.primaryColor;
      case ButtonVariant.destructive:
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    final theme = Theme.of(context);

    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: theme.primaryColor.withOpacity(0.6),
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );

      case ButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.secondary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: theme.colorScheme.secondary.withOpacity(0.6),
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );

      case ButtonVariant.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: theme.primaryColor,
          disabledBackgroundColor: Colors.white.withOpacity(0.6),
          disabledForegroundColor: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: theme.primaryColor),
          ),
        );

      case ButtonVariant.destructive:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.destructive,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.destructive.withOpacity(0.6),
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );

      case ButtonVariant.destructiveOutline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.destructive,
          disabledBackgroundColor: Colors.white.withOpacity(0.6),
          disabledForegroundColor: AppColors.destructive,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.destructive),
          ),
        );
    }
  }
}
