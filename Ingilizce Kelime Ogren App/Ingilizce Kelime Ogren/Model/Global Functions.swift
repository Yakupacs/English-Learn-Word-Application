//
//  globalFunctions.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup on 8.12.2022.
//

import Foundation
import UIKit

var easyWord = [
        "About" : "Aşağı Yukarı, Hakkında",
        "Above" : "Üzerine, Yukarısında",
        "Across" : "Karşıya",
        "Action" : "Çalışma",
        "Activity" : "Etkinlik",
        "Actor" : "Oyuncu",
        "Actress" : "Artist, Oyuncu",
        "Add" : "Toplamak, Eklemek",
        "Address" : "Hitap Etmek, Adres, Söylev",
        "Adult" : "Yetişkin",
        "Advice" : "Nasihat, Tavsiye",
        "Afraid" : "Korkmuş, Korkan",
        "After" : "Sonra, Öğleden Sonra",
        "Afternoon" : "Öğleden Sonra",
        "Again" : "Bir daha",
        "Age" : "Yaş",
        "Ago" : "Evvel",
        "Agree" : "Aynı fikirde olmak, Anlaşmak",
        "Air" : "Havalandırmak, Hava",
        "Airport" : "Havalimanı, Havaalanı",
        "All" : "Tüm, Bütün",
        "Also" : "Ayrıca, Yine",
        "Always" : "Hep, Her Zaman",
        "Amazing" : "Şaşırtıcı",
        "And" : "Ve, İle",
        "Angry" : "Kızmış, Sinirli",
        "Animal" : "Hayvan, Hayvan",
        "Another" : "Öbür, Başka",
        "Answer" : "Yanıt Vermek, Cevaplamak",
        "Any" : "Hiç",
        "Anyone" : "Hiç kimse, Kimse",
        "Anything" : "Hiçbir şey",
        "Apartment" : "Daire, Apartman Katı",
        "Apple" : "Elma",
        "April" : "Nisan",
        "Area" : "Alan",
        "Arm" : "Kol",
        "Around" : "Çevrede, Etrafında",
        "Arrive" : "Varmak, Ulaşmak",
        "Art" : "Sanat, Beceri",
        "Article" : "Madde, (sözleşmede) Madde",
        "Artist" : "Sanatkar, Sanatçı",
        "As" : "Olarak, Gibi, Dahi",
        "Ask" : "Soru Sormak",
        "At" : "Üzere, Nezdinde",
        "August" : "Ağustos",
        "Aunt" : "Hala, Teyze, Yenge",
        "Autumn" : "Güz, Sonbahar, Hazan",
        "Away" : "Uzak",
        "Baby" : "Yavru, Bebek, Şımartmak",
        "Back" : "Art, Arkalık ,Sırt",
        "Bad" : "Kötü, Fena, Bozuk",
        "Bag" : "Poşet ,Torba ,Çanta",
        "Ball" : "Balo, Yumak, Bilye",
        "Banana" : "Muz",
        "Band" : "Bant ,Bando ,Şerit",
        "Bank" : "Banka, Önlemek, Kümelenmek",
        "Bath" : "Yıkanmak, Banyo, Banyo yapmak",
        "Bathroom" : "Tuvalet, Banyo, Banyo odası",
        "Be" : "Bulunmak, Olmak, Var olmak",
        "Beach" : "Sahil, Kumsal, Plaj",
        "Beautiful" : "Güzel, Tatlı, Ahım Şahım",
        "Because" : "Çünkü, -dığı için, Zira",
        "Become" : "Haline gelmek, Olmak, Dönüşmek",
        "Bed" : "Yatak, Gömmek, Oturtmak",
        "Bedroom" : "Yatak odası, Yatak odası şebistan",
        "Beer" : "Bira, Arpasuyu ingiltere'de yerleşim yeri",
        "Before" : "Evvel, Önce, Daha önce",
        "Begin" : "Başlatmak, Başlamak",
        "Beginning" : "Başlangıç, Baş, İlk adım",
        "Behind" : "Ardındaki, Arkaya, Geriye",
        "Believe" : "İnanmak, Kanmak",
        "Below" : "Alttaki, Aşağıdaki, Altta",
        "Best" : "En İyi, Geçmek, Baskın çıkmak",
        "Better" : "Daha İyi, İyileştirmek, Islah etmek",
        "Between" : "Arasında, Arasına, Ortada",
        "Bicycle" : "Bisiklet, Bisiklet kullanarak gitmek, Bisikletle gezmek",
        "Big" : "İri, Büyük, Kapı gibi",
        "Bike" : "Bisiklete binmek,Bisiklet, Bisiklet sürmek",
        "Bill" : "Senet, Fatura, İlan etmek",
        "Bird" : "Kuş, Manita, Kus",
        "Birthday" : "Yaş Günü, Doğum günü",
        "Black" : "Siyahi, Kara, Siyah",
        "Blog" : "Web Günlüğü, İnternet Günlüğü",
        "Blonde" : "Sarışın",
        "Blue" : "Mavi",
        "Boat" : "Tekne",
        "Body" : "Ceset, Gövde, Vücut",
        "Book" : "Kitap",
        "Boot" : "Bot",
        "Bored" : "Sıkılmış",
        "Boring" : "Bıktırıcı",
        "Born" : "Doğan",
        "Both" : "Her ikisi de",
        "Bottle" : "Şişe",
        "Box" : "Kutu",
        "Boy" : "Erkek Çocuk",
        "Boyfriend" : "Flört, Erkek Arkadaş",
        "Bread" : "Ekmek",
        "Break" : "Kopmak, Kırmak",
        "Breakfast" : "Kahvaltı",
        "Bring" : "Getirmek",
        "Brother" : "Erkek Kardeş",
        "Brown" : "Kahverengi",
        "Build" : "İnşa Etmek",
        "Bulding" : "İnşaat, Bina",
        "Bus" : "Otobüs",
        "Business" : "İşletme",
        "Busy" : "Meşgul",
        "But" : "Ancak",
        "Butter" : "Tereyağı",
        "Buy" : "Satın Almak",
        "By" : "Geçecek Biçimde, Yakın",
        "Bye" : "Hoşçakal",
        "Cafe" : "Kafe, Bar",
        "Cake" : "Kek, Pasta",
        "Call" : "Çağırmak, Telefon Açmak",
        "Camera" : "Fotoğraf Makinesi",
        "Can" : "Olabilmek",
        "Cannot" : "Edememek",
        "Capital" : "Sermaye, Başkent",
        "Car" : "Araba",
        "Card": "Kart",
        "Career" : "Kariyer",
        "Carrot" : "Havuç, Kızıl Saç",
        "Carry" : "Taşımak, Sürüklemek, Elde Etmek",
        "Cat" : "Kedi",
        "CD" : "Dış Çap, CD",
        "Cent" : "Sent",
        "Centre" : "Merkez",
        "Century" : "Asır",
        "Chair" : "Koltuk",
        "Change" : "Değiştirmek",
        "Chart" : "Çizelge",
        "Cheap" : "Ucuz",
        "Check" : "Denetlemek",
        "Cheese" : "Peynir",
        "Chicken" : "Tavuk",
        "Child" : "Çocuk",
        "Chocolate" : "Çikolata",
        "Choose" : "Seçmek",
        "Cinema" : "Sinema",
        "City" : "Kent",
        "Class" : "Sınıf, Ders",
        "Classroom" : "Dershane, Sınıf, Derslik",
        "Clean" : "Temizlemek",
        "Climb" : "Tırmanmak",
        "Clock" : "Saat",
        "Close" : "Kapatmak",
        "Clothes" : "Giyse",
        "Club" : "Kulüp",
        "Coat" : "Kaplamak, Kaban, Mont",
        "Coffee" : "Kahve",
        "Cold": "Soğukluk",
        "College" : "Yüksekokul",
        "Colour" : "Renk",
        "Come" : "Gelmek",
        "Common" : "Yaygın, Alışılmış",
        "Company" : "Şirket",
        "Compare" : "Kıyaslamak",
        "Complete" : "Tamamlamak",
        "Computer" : "Bilgisayar",
        "Concert" : "Konser",
        "Conversation" : "Konuşma, Sohbet",
        "Cook" : "Yemek Pişirmek",
        "Cooking" : "Yemek Pişirme, Mutfak",
        "Cool" : "Soğutmak, Serinlik",
        "Correct" : "Düzeltmek, Doğru",
        "Cost" : "Masraf, Ücret",
        "Could" : "-abilirdi, -er misin, -ebilirdi",
        "Country" : "Yurt, Memleket",
        "Course" : "Kurs",
        "Cousin" : "Kuzen",
        "Cow" : "İnek",
        "Cream" : "Krema",
        "Create" : "Meydana Getirmek, Oluşturmak",
        "Culture" : "Kültür",
        "Cup" : "Kupa",
        "Customer" : "Müşteri",
        "Cut" : "Kesmek",
        "Dad" : "Baba",
        "Dance" : "Dans Etmek",
        "Dancer" : "Dansöz, Dansçı",
        "Dancing" : "Dans Etme, Oynama",
        "Dangerous" : "Tehlikeli",
        "Dark" : "Karanlık",
        "Date" : "Çıkmak, Randevuya Çıkmak",
        "Daughter" : "Kız Çocuk",
        "Day" : "Gün",
        "Dear" : "Sevgili, Canım",
        "December" : "Aralık",
        "Decide" : "Karar Vermek",
        "Delicious" : "Leziz",
        "Describe" : "Tanımlamak",
        "Description" : "Tasvir, betimleme",
        "Design" : "Tasarlamak, dizayn etmek",
        "Desk" : "Çalışma masası",
        "Detail" : "Detay, ayrıntı",
        "Dialogue" : "Diyalog, karşılıklı konuşma",
        "Dictionary" : "Sözlük",
        "Die" : "Ölmek",
        "Diet" : "Diyet",
        "Difference" : "Ayrım",
        "Different" : "Farklı",
        "Difficult" : "Zor, çetin",
        "Dinner" : "Akşam yemeği",
        "Dirty" : "Pisletmek, pis",
        "Discuss" : "Görüşmek, tartışmak",
        "Dish" : "Tabak, mahvetmek",
        "Do" : "Etmek, yapmak",
        "Doctor" : "Doktor",
        "Dog" : "Köpek",
        "Dollar" : "Dolar",
        "Door" : "Kapı",
        "Down" : "Aşağıya doğru",
        "Downstairs" : "Aşağı katta",
        "Draw" : "Karalamak",
        "Dress" : "Giymek",
        "Drink" : "İçmek",
        "Drive" : "Sürmek",
        "Driver" : "Sürücü",
        "During" : "Zarfında, süresince",
        "Each" : "Her biri, herbir",
        "Ear" : "Kulak",
        "Early" : "Erken",
        "East" : "Doğu",
        "Easy" : "Rahat, kolay",
        "Eat" : "Yemek yemek",
        "Egg" : "Yumurta",
        "Eight" : "Sekiz",
        "Eighteen" : "Onsekiz",
        "Eighty" : "Seksen",
        "Elephant" : "Fil",
        "Eleven" : "Onbir",
        "Else" : "Başka",
        "Email" : "Email göndermek",
        "End" : "Sona ermek",
        "Enjoy" : "Tadını çıkarmak",
        "Enough" : "Yeterli",
        "Euro" : "Euro",
        "Even" : "Düzgün",
        "Evening" : "Akşam",
        "Event" : "Etkinlik",
        "Ever" : "Her zaman",
        "Every" : "Her, bütün",
        "Everybody" : "Cümle alem",
        "Everyone" : "Herkes",
        "Everything" : "Her şey",
        "Exam" : "Sınav",
        "Example" : "Örnek",
        "Excited" : "Heyecanlı",
        "Exciting" : "Heyecan verici",
        "Exercise" : "Egzersiz yapma",
        "Expensive" : "Pahalı",
        "Extra" : "Ekstra",
        "Eye" : "Göz",
        "Face" : "Yüzleşmek, yüz yüze gelmek",
        "Fact" : "Vaka",
        "Fall" : "İnmek",
        "False" : "Sahte, düzmece",
        "Family" : "Aile",
        "Famous" : "Ünlü",
        "Fantastic" : "Fantastik",
        "Far" : "Uzak",
        "Farm" : "Çiftlik",
        "Farmer" : "Çiftçi",
        "Fast" : "Süratli",
        "Fat" : "Şişmanlatmak, yağ",
        "Father" : "Baba",
        "Favourite" : "Favori"
    ]
    
    var middleWord = [
        "Absolutely" : "Kesinlikle, Mutlaka",
        "Academic" : "Akademik, Üniversite Öğretim Görevlisi",
        "Access" : "Erişim",
        "Accommodation" : "Konaklama",
        "Account" : "Hesap",
        "Achievement" : "Başarı"
    ]
    
    var hardWord = [
        "Abolish" : "Feshetmek",
        "Abortion" : "Bebek Aldırma, Kürtaj",
        "Absence" : "Bulunmayış",
        "Absent" : "Hazır Bulunmayan",
        "Absurd" : "Absürt, Saçma",
        "Abundance" : "Çokluk, Bereket",
        "Abuse" : "Suistimal Etmek, Kötüye Kullanmak",
        "Academy" : "Akademi, Yüksekokul",
        "Accelerate" : "Hızlanmak",
        "Acceptance" : "Kabul, Alma",
        "Accessible" : "Ulaşılabilir",
        "Accomplishment" : "Başarma, Becerme",
        "Accordance" : "Uygunluk",
        "Accordingly" : "Dolayısıyla"
    ]
    
    var sentence = [
        "What's up?" : "Naber?",
        "So so" : "İdare Eder",
        "How is it going?" : "Nasıl Gidiyor?",
        "Let's go" : "Haydi Gidelim!",
        "Let's go on" : "Devam Edelim!",
        "Give me a hand!" : "Yardım et, bir el at!",
        "I will see to it!" : "İlgileneceğim, bakacağım",
        "Get out of here" : "Defol buradan!",
        "My head is killing me!" : "Başım beni öldürüyor!",
        "What a beatiful girl!" : "Ne güzel bir kız!",
        "I am broke!" : "Parasızım",
        "I am hungry!" : "Açım!",
        "I am starving!" : "Açlıktan Ölüyorum",
        "Don't get me wrong!" : "Beni yanlış anlama!",
        "It sounds good!" : "Kulağa Hoş Geliyor!",
        "It is beyond me!" : "Bu beni aşar!",
        "It is up to you!" : "Sana bağlı, sen bilirsin.",
        "You can trust me!" : "Bana güvenebilirsin!",
        "Let's get to the point!" : "Sadede gelelim!",
        "Guess what!" : "Bil bakalım!",
        "I am out of condition!" : "Formdan düştüm!",
        "My battery is dead" : "Şarjım az bitti.",
        "My battery is low" : "Şarjım az kaldı.",
        "You know what!" : "Ne diyeceğimi biliyorsun!",
        "It is better than nothing!" : "Hiç yoktan iyidir",
        "I'll get the phone/door!" : "Kapıya, telefona ben bakarım.",
        "It's my turn!" : "Benim sıram!",
        "It doesn't matter!" : "Sorun değil",
        "You are welcome." : "Rica ederim.",
        "Long time no see!" : "Görüşmeyeli uzun zaman oldu!",
        "Long time no talk!" : "Konuşmayalı uzun zaman oldu!",
        "Do you wanna hangout?" : "Takılmak ister misin?",
        "Let's hangout tonight" : "Bu gece buluşalım.",
        "I hope so!" : "Öyle Umuyorum",
        "I have no idea!" : "Hiçbir fikrim yok!",
        "Let's meet!" : "Buluşalım",
        "You don't look your age!" : "Yaşını göstermiyorsun!",
        "We are safe and sound!" : "Güvendeyiz",
        "Don't piss me of!" : "Beni kızdırma!",
        "Get well soon!" : "Geçmiş olsun",
        "I lost my temper" : "Sinirlerim bozuldu!",
        "Make yourself at home!" : "Kendini evinde hisset!",
        "Hurry up!" : "Acele et!",
        "Calm Down!" : "Sakin ol!",
        "Help yourself" : "Buyrun",
        "In my opinion" : "Benim düşünceme göre",
        "I dont mind" : "Benim için fark etmez",
        "Do you know each other?" : "Birbirinizi tanıyor musunuz?",
        "Are you on facebook?" : "Facebook'un var mı?",
        "What brings you to here?" : "Seni buraya getiren nedir?",
        "Don't blame me!" : "Beni suçlama!",
        "I am in touch with Sally!" : "Sally ile hala görüşüyorum",
        "I have an idea" : "Bir fikrim var",
        "I have hands full now" : "Şu an ellerim dolu",
        "My room is an a mess" : "Odam çok dağınık",
        "Are you kidding?" : "Şaka mı yapıyorsun?",
        "As soon as possible" : "Mümkün olası en kısa sürede",
        "By the way" : "Bu arada",
        "Do me a favor" : "Bana bir iyilik yap",
        "She can't take a joke" : "O şaka kaldırmaz",
        "I am his/her fan." : "Onun hayranıyım.",
        "I am lost." : "Kayboldum.",
        "Lets keep in touch." : "İletişimde kalalım.",
        "Mind your own business." : "Kendi işine bak.",
        "Sooner or later" : "Er ya da geç.",
        "I promise" : "Söz veriyorum.",
        "I am proud of you!" : "Seninle gurur duyuyorum.",
        "I have a surprise for you." : "Sana bir sürprizim var.",
        "Follow me." : "Beni takip et.",
        "No way!" : "Olamaz!",
        "I agree" : "Aynı fikirdeyim.",
        "Have fun." : "İyi eğlenceler.",
        "Don’t bother!" : "Zahmet etme.",
        "I am speechless." : "Nutkum tutuldu.",
        "Happy Eid!" : "İyi bayramlar!",
        "Keep your head held high!" : "Boynunu bükme, dik tut!",
        "Keep your nose clean!" : "Pis işlere bulaşma!",
        "Time’s up!" : "Vakit doldu.",
        "Forget it!" : "Unut bunu!",
        "Forgive me!" : "Affet beni!",
        "Dont move!" : "Kımıldama!",
        "Dont worry!" : "Endişelenme!",
        "Dont touch!" : "Dokunma!",
        "Enjoy your meal!" : "Afiyet olsun.",
        "Enjoy yourself!" : "Keyfine bak!",
        "Have nice time!" : "İyi eğlenceler.",
        "Bless you!" : "Çok yaşa!",
        "Bottoms up!" : "Şerefe!",
        "Cheer up!" : "Neşelen!",
        "Come on!" : "Neşelen!",
        "Be quit!" : "Sessiz ol!",
        "Be calm!" : "Sakin ol!",
        "Be careful" : "Dikkatli ol!",
        "Be patient!" : "Sabırlı ol!",
        "After you!" : "Senden sonra!",
        "Allow me!" : "İzin ver!",
        "As for me" : "Bence",
        "How terrifying!" : "Nasıl ürkütücü!",
        "I have no choice!" : "Bir seçeneğim yok!",
        "What a shame!" : "Yazıklar olsun!",
        "It is on me!" : "Benden olsun (Ismarlama)",
        "Maybe not!" : "Olmayabilir!",
        "Don’t mention!" : "Lafı, sözü bile edilmez!",
        "All aboard!" : "Herkes binsin! (Arabaya, gemiye, trene vs…)",
        "Imagine!" : "Hayal et!",
        "If anything happens, give me call!" : "Bir şey olursa bir alo de!",
        "If not…" : "Eğer olmazsa, eğer öyle değilse…",
        "Take a rest!" : "Dinlenmek!",
        "Keep in touch!" : "İletişimde kalalım!",
        "Keep in your mind!" : "Aklında bulunsun!",
        "Keep doing!" : "Yapmaya devam et!",
        "Keep going!" : "İlerlemeye devam et!",
        "Have a nice sleep!" : "İyi uykular!",
        "Come here!" : "Buraya gel!",
        "Once a day" : "Günde bir kez",
        "Twice a day" : "Günde iki kez.",
        "Three times a day" : "Günde üç kez",
        "Let me guess!" : "Dur tahmin edelim!",
        "Just a moment!" : "Bir dakika!",
        "Not yet!" : "Henüz değil!",
        "Have a heart!" : "İnsaf be!, insafın kurusun!"
    ]

    var allWords = [String:String]()

extension UIViewController {
    func getEasyWords() -> [String:String]{
        return easyWord
    }
    
    func getMiddleWords() -> [String:String]{
        return middleWord
    }
    
    func getHardWords() -> [String:String]{
        return hardWord
    }
    
    func getSentenceWords() -> [String:String]{
        return sentence
    }
    
    func getAllWords() -> [String:String]{
        allWords = allWords.merging(easyWord, uniquingKeysWith: {(first, _) in first})
        allWords = allWords.merging(middleWord, uniquingKeysWith: {(first, _) in first})
        allWords = allWords.merging(hardWord, uniquingKeysWith: {(first, _) in first})
        allWords = allWords.merging(sentence, uniquingKeysWith: {(first, _) in first})
        allWords = (allWords.merging(allWords, uniquingKeysWith: {(first, _) in first}))
        return allWords
    }
    
    func setGradientBackground(colorTop: UInt, colorBottom: UInt) {
        let colorTop =  UIColorFromRGB(rgbValue: colorTop).cgColor
        let colorBottom = UIColorFromRGB(rgbValue: colorBottom).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func copyToDatabase(){
        let bundlePath = Bundle.main.path(forResource: "ingilizceApp", ofType: ".sqlite")
        
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let copyAdress = URL(fileURLWithPath: targetPath).appendingPathComponent("ingilizceApp.sqlite")
        
        if fileManager.fileExists(atPath: copyAdress.path){
            print("Veritabanı zaten var. Kopyalamaya gerek yok.")
        }
        else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyAdress.path)
            }catch{
                print(error)
            }
        }
    }
}