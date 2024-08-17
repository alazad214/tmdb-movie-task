import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdController extends GetxController {
  InterstitialAd? _interstitialAd;

  @override
  void onInit() {
    super.onInit();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      _loadInterstitialAd(); // Load a new ad for future use
    } else {
      print('InterstitialAd is not ready yet.');
    }
  }

  @override
  void onClose() {
    _interstitialAd?.dispose();
    super.onClose();
  }
}
