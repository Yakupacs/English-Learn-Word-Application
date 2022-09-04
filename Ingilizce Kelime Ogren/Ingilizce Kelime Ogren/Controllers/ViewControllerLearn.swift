//
//  ViewControllerLearn.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit
import CoreData

class ViewControllerLearn: UIViewController {

    @IBOutlet weak var imageLearn: UIImageView!
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var englishLbl: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var turkishLbl: UILabel!
    
    var easyWord = [
        "About" : "Hakkında, Aşağı Yukarı, Yaklaşık",
        "Baby" : "Bebek, Yavru",
        "Cafe" : "Kafe, Bar",
        "Dad" : "Baba",
        "Each" : "Her biri",
        "Face" : "Yüz, Yüzleşmek",
        "Game" : "Oyun",
        "Hair" : "Saç"
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
    
    var personalID : UUID?
    var personalName : String = ""
    var personalSurname : String = ""
    var personalUsername : String = ""
    var personalPassword : String = ""
    var personalImage : UIImage?
    var personalWords : Dictionary = ["":""]
    var sign : Bool = false
    
    var learnEasyCount : Int = 0
    var learnMiddleCount : Int = 0
    var learnHardCount : Int = 0
    var learnSentenceCount : Int = 0
    
    var learnEasyArray : Dictionary = ["":""]
    var learnMiddleArray : Dictionary = ["":""]
    var learnHardArray : Dictionary = ["":""]
    var learnSentenceArray : Dictionary = ["":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.layer.cornerRadius = 60
        yesButton.layer.cornerRadius = 32
        noButton.layer.cornerRadius = 32
        
        logoutButton.setImage(UIImage(named: "logout"), for: .normal)
        logoutButton.imageView?.contentMode = .scaleAspectFill
        
        englishLbl.lineBreakMode = .byWordWrapping
        turkishLbl.lineBreakMode = .byWordWrapping
        
        let englishWord = easyWord.randomElement()
        if let englishWordLet = englishWord{
            englishLbl.text = englishWordLet.key
            turkishLbl.text = englishWordLet.value
        }
        pageView.backgroundColor = .systemGreen
        
        let tabbar = tabBarController as! ViewControllerTabBar
        personalID = tabbar.sendID
        personalImage = tabbar.sendImage
        personalName = tabbar.sendName
        personalSurname = tabbar.sendSurname
        personalUsername = tabbar.sendUsername
        personalPassword = tabbar.sendPassword
        personalWords = tabbar.sendWords
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, delay: 0.25) {
            self.imageLearn.frame.size.width += 20
            self.imageLearn.frame.size.height += 20
            
        }
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        wordsRandom()
    }
    @IBAction func logoutFunc(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }
    
    @IBAction func noFunc(_ sender: Any) {
        print(personalWords)
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            if learnMiddleCount != easyWord.count{
                wordsRandom()
            }
        case 1:
            if learnMiddleCount != middleWord.count{
                wordsRandom()
            }
        case 2:
            if learnHardCount != hardWord.count{
                wordsRandom()
            }
        case 3:
            if learnSentenceCount != sentence.count{
                wordsRandom()
            }
        default:
            break
        }
    }
    @IBAction func yesFunc(_ sender: Any) {
        learnEasyCount = learnEasyArray.count - 1
        learnMiddleCount = learnMiddleArray.count - 1
        learnHardCount = learnHardArray.count - 1
        learnSentenceCount = learnSentenceArray.count - 1
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            if learnEasyCount != easyWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                personalWords = personalWords.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnEasyArray = learnEasyArray.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnEasyCount = learnEasyArray.count - 1
                wordsRandom()
                let tabbar = tabBarController as! ViewControllerTabBar
                tabbar.sendWords = personalWords
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 1:
            if learnMiddleCount != middleWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                personalWords = personalWords.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnMiddleArray = learnMiddleArray.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnMiddleCount = learnMiddleArray.count - 1
                wordsRandom()
                let tabbar = tabBarController as! ViewControllerTabBar
                tabbar.sendWords = personalWords
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 2:
            if learnHardCount != hardWord.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                personalWords = personalWords.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnHardArray = learnHardArray.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnHardCount = learnHardArray.count - 1
                wordsRandom()
                let tabbar = tabBarController as! ViewControllerTabBar
                tabbar.sendWords = personalWords
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 3:
            if learnSentenceCount != sentence.count{
                let dictionaryWord = [englishLbl.text!:turkishLbl.text!]
                personalWords = personalWords.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnSentenceArray = learnSentenceArray.merging(dictionaryWord, uniquingKeysWith: {(first, _) in first})
                learnSentenceCount = learnSentenceArray.count - 1
                wordsRandom()
                let tabbar = tabBarController as! ViewControllerTabBar
                tabbar.sendWords = personalWords
            }
            else{
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        default:
            break
        }

        print(personalWords)
    }
    
    func wordsRandom(){
        learnEasyCount = learnEasyArray.count - 1
        learnMiddleCount = learnMiddleArray.count - 1
        learnHardCount = learnHardArray.count - 1
        learnSentenceCount = learnSentenceArray.count - 1
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            
            pageView.backgroundColor = .systemGreen
            if easyWord.count != learnEasyCount{
                let randomEnglishWord = easyWord.randomElement()
                for (english, _) in personalWords{
                    if let englishWordLet = randomEnglishWord{
                        if english == englishWordLet.key{
                            break
                        }
                        else if english != englishWordLet.key{
                            englishLbl.text = englishWordLet.key
                            turkishLbl.text = englishWordLet.value
                            break
                        }
                    }
                }
            }
            else{
                pageView.backgroundColor = .systemGreen
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 1:
            pageView.backgroundColor = .systemOrange
            if middleWord.count != learnMiddleCount{
                let randomEnglishWord = middleWord.randomElement()
                for (english, _) in personalWords{
                    if let englishWordLet = randomEnglishWord{
                        if english == englishWordLet.key{
                            break
                        }
                        else if english != englishWordLet.key{
                            englishLbl.text = englishWordLet.key
                            turkishLbl.text = englishWordLet.value
                            break
                        }
                    }
                }
            }
            else{
                pageView.backgroundColor = .systemOrange
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }

        case 2:
            pageView.backgroundColor = .systemRed
            if hardWord.count != learnHardCount{
                let randomEnglishWord = hardWord.randomElement()
                for (english, _) in personalWords{
                    if let englishWordLet = randomEnglishWord{
                        if english == englishWordLet.key{
                            break
                        }
                        else if english != englishWordLet.key{
                            englishLbl.text = englishWordLet.key
                            turkishLbl.text = englishWordLet.value
                            break
                        }
                    }
                }
            }
            else{
                pageView.backgroundColor = .systemRed
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        case 3:
            pageView.backgroundColor = .systemBlue
            if sentence.count != learnSentenceCount{
                let randomEnglishWord = sentence.randomElement()
                for (english, _) in personalWords{
                    if let englishWordLet = randomEnglishWord{
                        if english == englishWordLet.key{
                            break
                        }
                        else if english != englishWordLet.key{
                            englishLbl.text = englishWordLet.key
                            turkishLbl.text = englishWordLet.value
                            break
                        }
                    }
                }
            }
            else{
                pageView.backgroundColor = .systemBlue
                englishLbl.text = "Bu Kategorideki Kelimeler Tükendi."
                turkishLbl.text = ""
            }
        default:
            break
        }
    }
    
}
