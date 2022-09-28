//
//  ViewControllerRepeat.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit
import CoreData

class ViewControllerRepeat: UIViewController {

    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var englishLbl: UILabel!
    @IBOutlet weak var turkishLbl: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var imageLogo: UIImageView!
    
    var selectedID : UUID?
    var selectedUsername : String = ""
    
    var personalName : String = ""
    var personalSurname : String = ""
    var personalUsername : String = ""
    var personalPassword : String = ""
    var personalWords : Dictionary = ["" : ""]
    var personalImage : UIImage?
    var i = 0
    
    var transferWords : Dictionary = ["" : ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        englishLbl.lineBreakMode = .byWordWrapping
        turkishLbl.lineBreakMode = .byWordWrapping
        
        pageView.layer.cornerRadius = 60
        repeatButton.layer.cornerRadius = 30
        logoutButton.setImage(UIImage(named: "logout"), for: .normal)
        logoutButton.imageView?.contentMode = .scaleAspectFill
        if selectedUsername != ""{
            if let uuidString = selectedID?.uuidString{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
                
                // Add Filter
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    let results = try context.fetch(fetchRequest)
                    
                    if results.count > 0{
                        
                        for result in results as! [NSManagedObject]{
                            
                            if let name = result.value(forKey: "name") as? String{
                                personalName = name
                            }
                            
                            if let surname = result.value(forKey: "surname") as? String{
                                personalSurname = surname
                            }
                            
                            if let username = result.value(forKey: "username") as? String{
                                personalUsername = username
                            }
                            
                            if let password = result.value(forKey: "password") as? String{
                                personalPassword = password
                            }
                            
                            if let imageData = result.value(forKey: "image") as? Data{
                                let image = UIImage(data: imageData)
                                if let imageLet = image{
                                    personalImage = imageLet
                                }
                            }
                            
                            if let words = result.value(forKey: "words") as? Dictionary<String, String>{
                                personalWords = words
                            }
                        }
                        
                    }
                } catch{
                    print("Error")
                }
            }
        }
        let tabbar = tabBarController as! ViewControllerTabBar
        tabbar.sendID = selectedID
        tabbar.sendName = personalName
        tabbar.sendSurname = personalSurname
        tabbar.sendUsername = personalUsername
        tabbar.sendPassword = personalPassword
        tabbar.sendImage = personalImage
        tabbar.sendWords = personalWords
    }
    
    override func viewWillAppear(_ animated: Bool) {
        transferWords.removeAll()
        let tabbar = tabBarController as! ViewControllerTabBar
        personalWords = tabbar.sendWords
        transferWords = personalWords
        for (english, _) in transferWords{
            if english == ""{
                transferWords.removeValue(forKey: "")
                break
            }
        }
        wordsList()
        pageView.backgroundColor = UIColor.red
        repeatButton.backgroundColor = UIColor.red
        if (personalWords.count == 1){
            englishLbl.text = "Henüz Kelime Öğrenmedin"
        }
    }
    
    @objc func goToDetails(){
        performSegue(withIdentifier: "toDetails", sender: nil)
    }

    func wordsList(){
        i += 1
        for (english, _) in transferWords{
            if english == ""{
                transferWords.removeValue(forKey: "")
                break
            }
        }
        if (transferWords.count > 0){
            for (english, turkish) in transferWords{
                turkishLbl.text = turkish
                englishLbl.text = english
                transferWords.removeValue(forKey: english)
                break
            }
        }
        else{
            turkishLbl.text = ""
            englishLbl.text = "Tebrikler, Kelimeler Bitti"
        }
    }

    @IBAction func shuffleFunc(_ sender: Any) {
        if (personalWords.count == 1){
            englishLbl.text = "Henüz Kelime Öğrenmedin"
        }
        else{
            if englishLbl.text != "Tebrikler, Kelimeler Bitti"{
                animationWord()
            }
        }
    }
    
    func animationWord(){
        let pageView2 = UIView()
        pageView2.backgroundColor = UIColor.red
        pageView2.frame = CGRect(x: 57, y: 338, width: 308, height: 348)
        pageView2.layer.cornerRadius = 60
        view.addSubview(pageView2)
        pageView2.layer.zPosition = 0
        pageView.layer.zPosition = 1
        
        UIView.animate(withDuration: 0.5, animations: {
            let aciAl = CGAffineTransform(rotationAngle: 25 * .pi/180)
            let sagAsagi = CGAffineTransform(translationX: 50, y: 25)
            let x = aciAl.concatenating(sagAsagi)
            self.pageView.transform = x
        }) { (true) in
            self.pageView.transform = CGAffineTransform(rotationAngle: 0 * .pi/180)
            self.pageView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.wordsList()
            pageView2.isHidden = true
        }
    }
}
