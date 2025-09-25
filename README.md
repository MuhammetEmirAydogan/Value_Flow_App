# ValueFlow 🪙


[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Flutter-blue?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Language](https://img.shields.io/badge/Language-Dart-cyan?style=for-the-badge&logo=dart)](https://dart.dev)


## 📖 Proje Hakkında

ValueFlow, değerli madenler, dövizler ve kripto paralar gibi çeşitli finansal varlıkların anlık piyasa değerlerini takip etmek için geliştirilmiş, modern ve kullanıcı dostu bir mobil uygulamadır. Bu proje, Flutter ve Dart kullanılarak, state management için Provider paketi ve canlı veriler için API entegrasyonu gibi modern mobil geliştirme tekniklerini uygulamak amacıyla oluşturulmuştur.

## ✨ Özellikler

- **Canlı Veri Takibi:** CoinGecko API'si üzerinden 100'den fazla kripto para ve tokenize edilmiş değerli varlığın anlık fiyat ve değişim yüzdelerini gösterir.
- **Dinamik Grafikler:** Her varlığın detay sayfasında, seçilen zaman aralığına (1 Gün, 7 Gün, 1 Ay vb.) göre güncellenen interaktif ve animasyonlu fiyat grafikleri bulunur.
- **Favori Sistemi:** Kullanıcılar, ilgilendikleri varlıkları favorilerine ekleyerek ayrı bir sekmede kolayca takip edebilir.
- **State Management:** Provider paketi kullanılarak oluşturulmuş merkezi durum yönetimi sayesinde, kullanıcı girişi, tema ve favori listesi gibi veriler uygulama genelinde tutarlı bir şekilde yönetilir.
- **Dinamik Arayüz:** Aydınlık ve karanlık mod arasında geçiş yapma imkanı.
- **Modern ve Şık Tasarım:** Kullanıcı tarafından sağlanan orijinal UI tasarımına sadık kalınarak geliştirilmiştir.

## 🛠️ Kullanılan Teknolojiler


| **Flutter & Dart** | Cross-platform mobil uygulama geliştirme framework'ü ve programlama dili. |
| **Provider** | State management için kullanılan, basit ve güçlü bir paket. |
| **http** | API istekleri yapmak için kullanılan temel paket. |
| **flutter_svg** | Özel SVG ikonlarını arayüzde göstermek için. |
| **fl_chart** | Dinamik ve animasyonlu grafikler oluşturmak için. |
| **flutter_dotenv** | API anahtarları gibi gizli bilgileri güvenli bir şekilde saklamak için. |
| **CoinGecko API** | Tüm finansal verilerin çekildiği ana veri kaynağı. |

## 🚧 Proje Durumu ve Önemli Notlar

Bu proje aktif olarak geliştirilmeye devam etmektedir. Mevcut versiyonun bazı önemli özellikleri ve kısıtlamaları şunlardır:

- **API Entegrasyonu:** Geliştirme sürecinde, farklı varlık türleri (madenler, dövizler vb.) için birden fazla ücretsiz API entegre edilmeye çalışılmıştır. Ancak, ücretsiz API'lerin birçoğunun stabilite, kullanım limiti ve veri sağlama konularında ciddi sorunlar çıkarması nedeniyle, projenin ilerleyebilmesi için **tek ve güvenilir bir kaynak olan CoinGecko API'si** ile devam etme kararı alınmıştır. Diğer kategoriler (Değerli Madenler, Para Birimleri), CoinGecko üzerinde bulunan tokenize edilmiş ve stablecoin gibi dolaylı varlıklar kullanılarak doldurulmuştur.

- **Veritabanı:** Şu an için "Giriş Yap" ve "Kayıt Ol" ekranları tamamen arayüz ve state management (Provider) seviyesinde çalışmaktadır. Kullanıcı bilgileri veya favoriler gibi verileri kalıcı olarak saklayan bir **backend veya yerel veritabanı bağlantısı henüz kurulmamıştır.** Uygulama kapatılıp açıldığında tüm durum sıfırlanır.

## 🚀 Projeyi Yerel Makinede Çalıştırma

1.  Bu depoyu klonlayın:
    ```bash
    git clone [https://github.com/kullanici-adiniz/value_flow.git](https://github.com/kullanici-adiniz/value_flow.git)
    ```
2.  Proje dizinine gidin:
    ```bash
    cd value_flow
    ```
3.  Gerekli paketleri yükleyin:
    ```bash
    flutter pub get
    ```
4.  Proje ana dizininde **`.env`** adında bir dosya oluşturun ve içine CoinGecko API anahtarınızı ekleyin:
    ```
    COINGECKO_API_KEY=YOUR_COINGECKO_API_KEY
    ```
5.  Uygulamayı çalıştırın:
    ```bash
    flutter run
    ```

## 📜 Lisans

Bu proje **MIT Lisansı** ile lisanslanmıştır. Detaylar için `LICENSE` dosyasına bakabilirsiniz.