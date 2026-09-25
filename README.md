# ercan_ant

Modern, hızlı ve ölçeklenebilir bir Flutter uygulaması.  
Bu proje, gerçek bir müşteri ihtiyacı için geliştirilmekte olan ticari bir üründür.

## 🚀 Özellikler

- Flutter tabanlı çapraz platform mimari
- Web desteği
- Modüler proje yapısı
- Asset yönetimi (images, books, icons)
- Yönlendirme altyapısı (`go_router`)

## 🧱 Teknoloji Yığını

- **Flutter / Dart**
- **go_router**
- **Material Design**
- Web desteği için Flutter Web

## 📁 Proje Yapısı

```text
ercan_ant/
├─ lib/                 # Uygulama kaynak kodları
├─ assets/
│  ├─ images/           # Görseller
│  ├─ books/            # İçerik dosyaları
│  └─ icons/            # İkon dosyaları
├─ test/                # Test dosyaları
├─ web/                 # Web yapılandırma dosyaları
├─ pubspec.yaml         # Bağımlılıklar ve asset tanımları
└─ analysis_options.yaml# Lint/analiz kuralları
```

## ⚙️ Kurulum

### Gereksinimler

- Flutter SDK (güncel stabil sürüm)
- Dart SDK (Flutter ile birlikte gelir)
- Android Studio / VS Code (önerilir)

### Çalıştırma

```bash
git clone https://github.com/Erhant-ant/ercan_ant.git
cd ercan_ant
flutter pub get
flutter run
```

### Web için çalıştırma

```bash
flutter run -d chrome
```

## 🧪 Test

```bash
flutter test
```

## 🛠️ Build

### Android APK

```bash
flutter build apk --release
```

### Web Build

```bash
flutter build web --release
```

### GitHub Pages'te yayınlama

`main` dalına yapılan her push sonrasında GitHub Actions web uygulamasını otomatik olarak yayınlar.

1. GitHub repository'sinde **Settings > Pages** sayfasını açın.
2. **Build and deployment > Source** alanında **GitHub Actions** seçin.
3. `main` dalına push yapın veya **Actions > Deploy Flutter Web to GitHub Pages > Run workflow** seçeneğini kullanın.

Site adresi:

```text
https://erhant-ant.github.io/ercan_ant/
```

## 📌 Notlar

Bu repository aktif olarak geliştirilmektedir.  
Özellikler, klasör yapısı ve ekranlar müşteri ihtiyaçlarına göre güncellenebilir.

## 📄 Lisans

Bu proje [MIT License](LICENSE) altında lisanslanmıştır.
