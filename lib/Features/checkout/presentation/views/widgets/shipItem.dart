
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';

class Shipitem extends StatelessWidget {
  const Shipitem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    required this.onaTap,
  }) : super(key: key);

  final String title, subTitle;
  final String price;
  final bool isSelected;
  final VoidCallback onaTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onaTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical:20
        ),

        decoration: BoxDecoration(
          color: const Color(0x33D9D9D9),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? App_Colors.kprimaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isSelected ? Activecontainer() : InActivecontainer(),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.heading13semiBold,
                    ),
                    Text(
                      subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body11Regular.copyWith(
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Text(
                "$price EGP",
                maxLines: 1,
                style: AppTextStyles.body13Bold.copyWith(
                  color: App_Colors.kprimaryColor,
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

class InActivecontainer extends StatelessWidget {
  const InActivecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
      ),
    );
  }
}

class Activecontainer extends StatelessWidget {
  const Activecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
          color: App_Colors.kprimaryColor,
          shape:OvalBorder(
              side: BorderSide(
                  width: 4,
                  color: Colors.white

              )
          )
      ),
    );
  }
}
