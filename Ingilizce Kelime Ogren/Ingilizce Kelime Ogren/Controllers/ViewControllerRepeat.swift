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
    
    var selectedID : UUID?
    var selectedName = ""
    var selectedUsername = ""
    var selectedPassword = ""
    
    var personal : Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.layer.cornerRadius = 30
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
                                personal?.name = name
                            }
                            
                            if let surname = result.value(forKey: "surname") as? String{
                                personal?.surname = surname
                            }
                            
                            if let username = result.value(forKey: "username") as? String{
                                personal?.username = username
                            }
                            
                            if let password = result.value(forKey: "password") as? String{
                                personal?.password = password
                            }
                            
                            if let imageData = result.value(forKey: "image") as? Data{
                                let image = UIImage(data: imageData)
                                userImage.image = image
                            }
                        }
                        
                    }
                } catch{
                    print("Error")
                }
            }
        }
        
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        performSegue(withIdentifier: "toBackLogin", sender: nil)
    }
    

}
