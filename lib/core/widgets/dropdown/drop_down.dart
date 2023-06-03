import 'package:taslema_task/core/injection/injectable.dart';

import '../../consts/exports.dart';
import 'cubit/dropdown_cubit.dart';

typedef RetreiveTitle<T> = String Function(T json);

// ignore: must_be_immutable
class MDropDown<T> extends StatelessWidget {
  final List<T> options;
  final T? setInitial;
  final String? hint;
  final String? title, footerTitle;
  double? height;
  final bool check;
  final ValueChanged<T?> onChanged;
  final bool isCenter;
  final bool removeBorder;
  final RetreiveTitle<T> itemTitle;
  final bool isExpanded;
  final Color? iconColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? hintColor;
  final double textSize;
  final Color? dropdownColor;
  final Color? titleColor;
  final bool inFill;
  final Widget Function(T? itemImage)? perfix;
  final double paddingHorizontal;
  final double paddingVertical;
  final double iconSize;
  final double borderRadius;
  final bool hideDropdown;
  final double? maxWidth;
  final AlignmentGeometry titleAlign;

  MDropDown({
    Key? key,
    required this.onChanged,
    required this.itemTitle,
    this.inFill = true,
    this.perfix,
    this.titleColor,
    this.titleAlign = AlignmentDirectional.centerStart,
    this.footerTitle,
    this.maxWidth,
    this.title,
    this.height,
    this.options = const [],
    this.removeBorder = true,
    this.hint = "",
    this.isCenter = false,
    this.setInitial,
    this.check = false,
    this.isExpanded = true,
    this.iconColor,
    this.textColor,
    this.textSize = 19,
    this.dropdownColor,
    this.borderColor,
    this.hintColor,
    this.paddingHorizontal = 21.0,
    this.paddingVertical = 6.0,
    this.iconSize = 12.0,
    this.borderRadius = 5.0,
    this.hideDropdown = false,
  }) : super(key: key);

  late final DropdownCubit cubit = getIt<DropdownCubit>()
    ..setInitialValue<T?>(setInitial);

  T? item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          MText(
            text: title,
            textSize: textSize,
            textWeight: FontWeight.w500,
            fontFamily: FoontFamily.rubik,
            textColor: titleColor ?? Coolors.white,
          ).addPadding(bottom: 12.0),
        Container(
          height: height,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius),
            border: inFill
                ? null
                : Border.all(color: borderColor ?? Coolors.highLight),
          ),
          child: BlocBuilder<DropdownCubit, DropdownState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is InitialDropdownState) {
                item = state.item;
              } else if (state is SelectDropdownItemState) {
                item = state.item;
              }
              return DropdownButton<T>(
                dropdownColor: dropdownColor,
                elevation: 2,
                underline: removeBorder
                    ? const SizedBox()
                    : Container(
                        height: 0.5,
                        color: Coolors.primaryColor,
                      ),
                isExpanded: isExpanded,
                icon: hideDropdown
                    ? const SizedBox()
                    : Column(
                        children: [
                          MSvg(
                            name: Svgs.dropdown,
                            color: iconColor ?? Coolors.borderColor,
                            height: iconSize,
                          )
                        ],
                      ).addPadding(start: removeBorder ? 12.0 : 0.0),
                hint: MText(
                  maxWidth: maxWidth,
                  fontFamily: FoontFamily.rubik,
                  text: hint,
                  textColor: hintColor ?? Coolors.borderColor,
                  textSize: textSize,
                  textAlign: isCenter ? TextAlign.center : TextAlign.start,
                ).addPadding(bottom: removeBorder ? 0 : 21.0),
                value: item,
                onChanged: (value) {
                  onChanged(value);
                  cubit.onSelectItem<T?>(value);
                },
                items: options.map((T item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Row(
                      children: [
                        if (perfix != null) perfix!(item),
                        MText(
                          maxWidth: maxWidth,
                          textColor: textColor ?? Coolors.black,
                          textSize: textSize,
                          text: itemTitle(item),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
        if (footerTitle != null)
          Align(
            alignment: titleAlign,
            child: MText(
              text: footerTitle,
              textSize: textSize,
              textWeight: FontWeight.w500,
              fontFamily: FoontFamily.rubik,
              textColor: titleColor ?? Coolors.white,
            ),
          ),
      ],
    );
  }
}
