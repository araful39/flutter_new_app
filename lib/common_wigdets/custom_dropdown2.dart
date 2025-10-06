import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import '../constants/app_colors.dart';

class CustomDropdownNew<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T)? itemToString;
  final void Function(T?) onChanged;
  final String? hint;
  final String? iconPath;
  final bool? circularColor;
  final Color Function(T)? circleColorExtractor;
  final Color? borderColor;

  const CustomDropdownNew({
    super.key,
    required this.items,
    required this.selectedItem,
    this.itemToString,
    required this.onChanged,
    this.hint,
    this.iconPath,
    this.circularColor = false,
    this.circleColorExtractor,
    this.borderColor,
  });

  @override
  State<CustomDropdownNew<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdownNew<T>> {
  late T? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: dark ? AppColors.c2A2A2A : AppColors.cF6F6F6,
        border: Border.all(
          color: widget.borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          if (widget.iconPath != null)
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 12),
              child: SvgPicture.asset(
                widget.iconPath!,
                width: 24,
                height: 24,
                semanticsLabel: 'Dropdown icon',
              ),
            ),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                borderRadius: BorderRadius.circular(16),
                hint: Text(
                  widget.hint ?? '',
                  style: const TextStyle(
                    color: Color(0xffA1A1A1),
                    fontSize: 16,
                  ),
                ),
                value: selectedItem,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                  widget.onChanged(value);
                },
                items: widget.items.map((item) {
                  final title = widget.itemToString != null
                      ? widget.itemToString!(item)
                      : item.toString();

                  return DropdownMenuItem<T>(
                    key: ValueKey(item),
                    value: item,
                    child: Row(
                      children: [
                        if (widget.circularColor == true &&
                            widget.circleColorExtractor != null)
                          CircleAvatar(
                            radius: 10,
                            backgroundColor:
                            widget.circleColorExtractor!(item),
                          ),
                        if (widget.circularColor == true)
                          const SizedBox(width: 15),
                        Text(
                          title,
                          style: const TextStyle(
                            color: AppColors.cA7A8AC,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.cA7A8AC,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
