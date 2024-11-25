import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CustomQuillToolbar extends StatefulWidget {
  const CustomQuillToolbar({
    super.key,
    required this.controller,
    this.primaryIconColor,
    this.secondaryIconColor,
    this.activeIconColor,
    this.iconSize = 20,
    this.toolbarHeight = 44,
    this.toolbarIconAlignment = 0.0,
  });

  final QuillController controller;
  final Color? primaryIconColor;
  final Color? secondaryIconColor;
  final Color? activeIconColor;
  final double iconSize;
  final double toolbarHeight;
  final double toolbarIconAlignment;

  @override
  State<CustomQuillToolbar> createState() => _CustomQuillToolbarState();
}

class _CustomQuillToolbarState extends State<CustomQuillToolbar> {
  Color _getDefaultIconColor(BuildContext context) {
    return Theme.of(context).iconTheme.color ?? Colors.grey.shade700;
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleControllerChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChange);
    super.dispose();
  }

  void _handleControllerChange() {
    setState(() {
      // Trigger rebuild when selection or content changes
    });
  }

  bool _isAttributeActive(Attribute attribute) {
    return widget.controller
        .getSelectionStyle()
        .attributes
        .containsKey(attribute);
  }

  @override
  Widget build(BuildContext context) {
    final defaultIconColor = _getDefaultIconColor(context);
    final effectivePrimaryColor = widget.primaryIconColor ?? defaultIconColor;
    final effectiveSecondaryColor =
        widget.secondaryIconColor ?? Colors.grey.shade500;
    final effectiveActiveColor =
        widget.activeIconColor ?? Theme.of(context).primaryColor;

    return Container(
      height: widget.toolbarHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildHistoryButtons(
                effectivePrimaryColor, effectiveSecondaryColor),
            _buildDivider(),
            _buildFormattingButtons(
              effectivePrimaryColor,
              effectiveActiveColor,
              effectiveSecondaryColor,
            ),
            _buildDivider(),
            _buildListButtons(
              effectivePrimaryColor,
              effectiveActiveColor,
              effectiveSecondaryColor,
            ),
            _buildDivider(),
            _buildInsertButtons(effectivePrimaryColor, effectiveSecondaryColor),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        height: widget.toolbarHeight * 0.7,
        child: const VerticalDivider(
          width: 1,
          thickness: 1,
        ),
      ),
    );
  }

  Widget _buildHistoryButtons(Color primaryColor, Color secondaryColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildToolbarButton(
          icon: Icons.undo_rounded,
          onPressed: () {
            if (widget.controller.hasUndo) {
              widget.controller.undo();
            }
          },
          isEnabled: widget.controller.hasUndo,
          color: primaryColor,
          disabledColor: secondaryColor,
          tooltip: 'Undo',
        ),
        _buildToolbarButton(
          icon: Icons.redo_rounded,
          onPressed: () {
            if (widget.controller.hasRedo) {
              widget.controller.redo();
            }
          },
          isEnabled: widget.controller.hasRedo,
          color: primaryColor,
          disabledColor: secondaryColor,
          tooltip: 'Redo',
        ),
      ],
    );
  }

  Widget _buildFormattingButtons(
    Color primaryColor,
    Color activeColor,
    Color secondaryColor,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFormatButton(
          attribute: Attribute.bold,
          icon: Icons.format_bold_rounded,
          tooltip: 'Bold',
          primaryColor: primaryColor,
          activeColor: activeColor,
        ),
        _buildFormatButton(
          attribute: Attribute.italic,
          icon: Icons.format_italic_rounded,
          tooltip: 'Italic',
          primaryColor: primaryColor,
          activeColor: activeColor,
        ),
        _buildFormatButton(
          attribute: Attribute.underline,
          icon: Icons.format_underline_rounded,
          tooltip: 'Underline',
          primaryColor: primaryColor,
          activeColor: activeColor,
        ),
        _buildFormatButton(
          attribute: Attribute.strikeThrough,
          icon: Icons.format_strikethrough_rounded,
          tooltip: 'Strikethrough',
          primaryColor: primaryColor,
          activeColor: activeColor,
        ),
      ],
    );
  }

  Widget _buildListButtons(
    Color primaryColor,
    Color activeColor,
    Color secondaryColor,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFormatButton(
          attribute: Attribute.ul,
          icon: Icons.format_list_bulleted_rounded,
          tooltip: 'Bullet List',
          primaryColor: primaryColor,
          activeColor: activeColor,
        ),
        _buildFormatButton(
          attribute: Attribute.ol,
          icon: Icons.format_list_numbered_rounded,
          tooltip: 'Numbered List',
          primaryColor: primaryColor,
          activeColor: activeColor,
        ),
        _buildFormatButton(
          attribute: Attribute.blockQuote,
          icon: Icons.format_quote_rounded,
          tooltip: 'Quote Block',
          primaryColor: primaryColor,
          activeColor: activeColor,
        ),
        _buildFormatButton(
          attribute: Attribute.codeBlock,
          icon: Icons.code_rounded,
          tooltip: 'Code Block',
          primaryColor: primaryColor,
          activeColor: activeColor,
        ),
      ],
    );
  }

  Widget _buildInsertButtons(Color primaryColor, Color secondaryColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildToolbarButton(
          icon: Icons.link_rounded,
          onPressed: () => _showLinkDialog(),
          color: _isAttributeActive(Attribute.link)
              ? widget.activeIconColor!
              : primaryColor,
          disabledColor: secondaryColor,
          tooltip: 'Insert Link',
        ),
        _buildToolbarButton(
          icon: Icons.image_rounded,
          onPressed: () => _showImageDialog(),
          color: primaryColor,
          disabledColor: secondaryColor,
          tooltip: 'Insert Image',
        ),
        _buildToolbarButton(
          icon: Icons.horizontal_rule_rounded,
          onPressed: () => _insertHorizontalRule(),
          color: primaryColor,
          disabledColor: secondaryColor,
          tooltip: 'Insert Horizontal Rule',
        ),
      ],
    );
  }

  Widget _buildFormatButton({
    required Attribute attribute,
    required IconData icon,
    required String tooltip,
    required Color primaryColor,
    required Color activeColor,
  }) {
    final isToggled = _isAttributeActive(attribute);
    return _buildToolbarButton(
      icon: icon,
      onPressed: () => widget.controller.formatSelection(attribute),
      color: isToggled ? activeColor : primaryColor,
      tooltip: tooltip,
    );
  }

  Widget _buildToolbarButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
    Color? disabledColor,
    required String tooltip,
    bool isEnabled = true,
  }) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(
          icon,
          size: widget.iconSize,
          color: isEnabled ? color : disabledColor,
        ),
        onPressed: isEnabled ? onPressed : null,
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(
          minWidth: widget.toolbarHeight,
          minHeight: widget.toolbarHeight,
        ),
        alignment: Alignment(widget.toolbarIconAlignment, 0),
      ),
    );
  }

  void _showLinkDialog() {
    // Implement link dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Insert Link'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'URL',
                hintText: 'https://',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement link insertion
              Navigator.of(context).pop();
            },
            child: const Text('Insert'),
          ),
        ],
      ),
    );
  }

  void _showImageDialog() {
    // Implement image dialog
  }

  void _insertHorizontalRule() {
    final index = widget.controller.selection.baseOffset;
    final length = widget.controller.selection.extentOffset - index;
    widget.controller.replaceText(index, length, '\n---\n', null);
  }
}
