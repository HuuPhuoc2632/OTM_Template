import 'package:flutter/material.dart';
import 'package:otm_template/themes/app_colors.dart';

class ItbeeQuantityButton extends StatefulWidget {
  final VoidCallback onPressAddProductAttribute;
  final VoidCallback onPressRemoveProductAttribute;
  final ValueChanged<String> onChangeProductAttribute;
  final ValueNotifier<int> amountNotifier;

  const ItbeeQuantityButton({
    super.key,
    required this.onPressAddProductAttribute,
    required this.onPressRemoveProductAttribute,
    required this.onChangeProductAttribute,
    required this.amountNotifier,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ItbeeQuantityButtonState createState() => _ItbeeQuantityButtonState();
}

class _ItbeeQuantityButtonState extends State<ItbeeQuantityButton> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: widget.amountNotifier.value.toString());
    widget.amountNotifier.addListener(_updateTextField);
  }

  @override
  void dispose() {
    widget.amountNotifier.removeListener(_updateTextField);
    _controller.dispose();
    super.dispose();
  }

  void _updateTextField() {
    _controller.text = widget.amountNotifier.value.toString();
  }

  void _onTextChanged(String value) {
    if (value.isEmpty) _controller.text = "0";
    widget.onChangeProductAttribute(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.greyColor80),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
            ),
            onPressed: widget.onPressRemoveProductAttribute,
            child: const Icon(Icons.remove, size: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50,
            height: 40,
            child: TextField(
              controller: _controller,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _onTextChanged(value);
                if (value.isNotEmpty && value.startsWith('0')) {
                  _controller.text = value.replaceFirst(RegExp(r'^0+'), '');
                  _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: _controller.text.length),
                  );
                }
              },
            ),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.greyColor80),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
            ),
            onPressed: widget.onPressAddProductAttribute,
            child: const Icon(Icons.add, size: 16),
          ),
        ),
      ],
    );
  }
}
