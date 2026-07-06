import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownWidget<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final String hint;
  final bool showSearchBox;
  final String Function(T)? itemAsString;

  const CustomDropdownWidget({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hint,
    this.showSearchBox = true,
    this.itemAsString,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF5E6272),
          ),
        ),
        const SizedBox(height: 8),
        DropdownSearch<T>(
          items: (filter, loadProps) {
            if (filter.isEmpty) return items;
            return items.where((item) {
              final str = itemAsString != null ? itemAsString!(item) : item.toString();
              return str.toLowerCase().contains(filter.toLowerCase());
            }).toList();
          },
          selectedItem: value,
          onSelected: onChanged,
          enabled: onChanged != null,
          itemAsString: itemAsString,
          popupProps: PopupProps.menu(
            showSearchBox: showSearchBox,
            fit: FlexFit.loose,
            constraints: const BoxConstraints(maxHeight: 300),
            menuProps: MenuProps(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
            ),
            searchFieldProps: TextFieldProps(
              style: GoogleFonts.outfit(
                fontSize: 15,
                color: const Color(0xFF1B1B1E),
              ),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: GoogleFonts.outfit(
                  color: const Color(0xFF9EA3B2),
                  fontSize: 15,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                filled: true,
                fillColor: const Color(0xFFF3F5FC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            itemBuilder: (context, item, isSelected, isFocused) {
              final displayStr = itemAsString != null ? itemAsString!(item) : item.toString();
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0x102D29D4)
                      : isFocused
                          ? const Color(0x052D29D4)
                          : Colors.transparent,
                ),
                child: Text(
                  displayStr,
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? const Color(0xFF2D29D4) : const Color(0xFF1B1B1E),
                  ),
                ),
              );
            },
          ),
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.outfit(
                color: const Color(0xFF9EA3B2),
                fontSize: 15,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              filled: true,
              fillColor: onChanged != null ? Colors.white : const Color(0xFFF3F5FC),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFFE2E4EC),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFF2D29D4),
                  width: 1.5,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFFE2E4EC),
                  width: 1.5,
                ),
              ),
            ),
            baseStyle: GoogleFonts.outfit(
              fontSize: 15,
              color: const Color(0xFF1B1B1E),
            ),
          ),
        ),
      ],
    );
  }
}
