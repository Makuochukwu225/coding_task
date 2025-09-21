import 'package:coding_task/src/src.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isActive;
  const CustomRadioButton({super.key, required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      padding: EdgeInsets.all(4),
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textPurple),
        shape: BoxShape.circle,
      ),
      child: isActive
          ? Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textPurple,
              ),
            )
          : null,
    );
  }
}
