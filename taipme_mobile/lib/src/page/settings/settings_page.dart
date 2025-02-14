import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/custom_footer.dart';
import 'package:taipme_mobile/src/component/custom_header.dart';
import 'package:taipme_mobile/src/component/menu.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

import '../../component/text_input.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const Menu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, // Allinea a sinistra
              children: [
                _buildLabel('E-mail'),
                TextInput(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  hintText: '',
                  icon: Icons.person, // Icona a destra
                  isValid: _isEmailValid,
                  onFocusLost: _validateEmail,
                  iconPosition: IconPosition.right,
                ),
                const SizedBox(height: 16),
                _buildLabel('Password'),
                TextInput(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  hintText: '',
                  icon: Icons.visibility, // Icona a destra
                  isValid: _isPasswordValid,
                  onFocusLost: _validatePassword,
                  iconPosition: IconPosition.right,
                ),
                const SizedBox(height: 32), // Spazio prima del pulsante "_salva"
                Center(
                  child: TextButton(
                    onPressed: _validateForm,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '_salva',
                          style: TextStyle(
                            color: TaipmeStyle.inputFieldTextColor,
                            fontSize: TaipmeStyle.miniTextSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomFooter(
        isChatSelected: false,
        isHomeSelected: false,
        isSettingsSelected: true,
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          color: TaipmeStyle.inputFieldTextColor,
          fontSize: TaipmeStyle.miniTextSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  bool _validateForm() {
    setState(() {
      _isEmailValid = _isValidEmail(_emailController.text);
      _isPasswordValid = _passwordController.text.isNotEmpty;
    });
    return _isEmailValid && _isPasswordValid;
  }

  void _validateEmail() {
    setState(() {
      _isEmailValid = _isValidEmail(_emailController.text);
    });
  }

  void _validatePassword() {
    setState(() {
      _isPasswordValid = _passwordController.text.isNotEmpty;
    });
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
