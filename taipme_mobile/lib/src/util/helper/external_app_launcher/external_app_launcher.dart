import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/util/helper/snackbar/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

part 'external_app_launcher.g.dart';

@riverpod
class ExternalAppLauncher extends _$ExternalAppLauncher {
  @override
  void build() {}

  void openWhatsApp() async {
    final url = Uri.parse("https://whatsapp.com/channel/0029Va7dGqBDOQIVEhNNlK3w");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      await ref.read(
        snackBarProvider(text: 'Non siamo riusciti ad aprire WhatsApp').future,
      );
    }
  }

  void openTelegram() async {
    final url = Uri.parse("https://t.me/taipme_com");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      await ref.read(
        snackBarProvider(text: 'Non siamo riusciti ad aprire Telegram').future,
      );
    }
  }
}
