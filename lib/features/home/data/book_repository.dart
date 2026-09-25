import 'package:ercan_ant/features/home/domain/book.dart';
import 'package:ercan_ant/features/home/domain/purchase_link.dart';
import 'package:ercan_ant/shared/constants/asset_paths.dart';

class BookRepository {
  const BookRepository();

  List<Book> getBooks() {
    return [
      Book(
        title: 'Zemheride Açan Nergisler',

        description:
            'Ömer\'in hayatı bir gecede değişir. Bilinmezliğe uzanan bu yolculukta umut, acı ve aidiyet yeniden anlam kazanır.',

        longDescription:
            'Ömer\'in hayatı bir gecede değişir; çocukluğun neşeli, hareketli hâli yerini sessizliğe bırakır. '
            'Kendini bir anda rayları bilinmezliğe uzanan bir trenin içinde bulur. '
            'Her durakta başka bir duygu, her vagonda ayrı bir hatıra vardır.\n\n'
            'Kalbi iki yön arasında savrulurken hangi limana demir atacağını kendisi de bilmez.',

        coverPath: AssetPaths.heroBook,

        isPublished: true,

        purchaseLinks: const [
          PurchaseLink(
            storeName: 'Kitapyurdu',
            url:
                'https://www.kitapyurdu.com/kitap/zemheride-acan-nergisler/748858.html',
          ),
          PurchaseLink(
            storeName: 'Amazon TR',
            url:
                'https://www.amazon.com.tr/s?k=Zemheride+A%C3%A7an+Nergisler+Ercan+Ant',
          ),
          PurchaseLink(
            storeName: 'D&R',
            url:
                'https://www.dr.com.tr/search?q=Zemheride+A%C3%A7an+Nergisler+Ercan+Ant',
          ),
          PurchaseLink(
            storeName: 'İdefix',
            url:
                'https://www.idefix.com/arama?q=Zemheride+A%C3%A7an+Nergisler+Ercan+Ant',
          ),
          PurchaseLink(
            storeName: 'BKM Kitap',
            url:
                'https://www.bkmkitap.com/arama?q=Zemheride+A%C3%A7an+Nergisler+Ercan+Ant',
          ),
        ],
      ),
    ];
  }
}
