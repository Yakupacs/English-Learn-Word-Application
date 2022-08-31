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
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    
    var selectedID : UUID?
    var selectedUsername : String = ""
    
    var personalName : String = ""
    var personalSurname : String = ""
    var personalUsername : String = ""
    var personalPassword : String = ""
    var personalImage : UIImage?
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.layer.cornerRadius = 30
        repeatButton.layer.cornerRadius = 30
        logoutButton.setImage(UIImage(named: "logout"), for: .normal)
        logoutButton.imageView?.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = 30
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
                                userImage.image = image
                                userImage.isHidden = false
                                if let imageLet = image{
                                    personalImage = imageLet
                                }
                            }
                        }
                        
                    }
                } catch{
                    print("Error")
                }
            }
        }
        usernameLbl.text = personalUsername
        let tabbar = tabBarController as! ViewControllerTabBar
        tabbar.sendName = personalName
        tabbar.sendSurname = personalSurname
        tabbar.sendUsername = personalUsername
        tabbar.sendPassword = personalPassword
        tabbar.sendImage = personalImage
        
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }

}
