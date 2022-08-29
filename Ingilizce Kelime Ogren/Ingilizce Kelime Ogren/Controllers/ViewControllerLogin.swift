//
//  ViewControllerLogin.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit
import CoreData

class ViewControllerLogin: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var pasword2Txt: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var surnameTxt: UITextField!
    @IBOutlet weak var loginInfotxt: UILabel!
    @IBOutlet weak var centerButton: NSLayoutConstraint!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var hataMesaji: UILabel!
    
    var whereSegment : Bool = false
    var idArray = [UUID]()
    var usernameArray = [String]()
    var passwordArray = [String]()
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 100
        loginButton.layer.cornerRadius = 15
        getDatas()
        print(usernameArray)
        print(passwordArray)
    }

    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            whereSegment = false
            loginButton.setTitle("Giriş Yap", for: UIControl.State.normal)
            pasword2Txt.isHidden = true
            nameTxt.isHidden = true
            surnameTxt.isHidden = true
            imageView.isHidden = true
            getDatas()
        case 1:
            // Click to Imageview
            imageView.isUserInteractionEnabled = true
            let imageGestRecog = UITapGestureRecognizer(target: self, action: #selector(selectImage))
            imageView.addGestureRecognizer(imageGestRecog)
            
            whereSegment = true
            loginButton.setTitle("Kayıt Ol", for: UIControl.State.normal)
            pasword2Txt.isHidden = false
            nameTxt.isHidden = false
            surnameTxt.isHidden = false
            imageView.isHidden = false
        default:
            break
        }
    }

    @IBAction func loginregisterButton(_ sender: Any) {
        if (whereSegment == false){
            // LOGIN
            getDatas()
            
            i = 0
            if usernameTxt.text != "" && passwordTxt.text != ""{
                if (usernameArray[i] == usernameTxt.text!){
                    if passwordArray[i] == passwordTxt.text{
                        performSegue(withIdentifier: "toMenu", sender: nil)
                    }
                    else{
                        hataMesaji.isHidden = false
                        hataMesaji.text = "Kullanıcı Adı Veya Şifre Yanlış"
                    }
                }
                else{
                    hataMesaji.isHidden = false
                    hataMesaji.text = "Kullanıcı Adı Veya Şifre Yanlış."
                }
                i += 1
            }
            else{
                hataMesaji.isHidden = false
                hataMesaji.text = "Eksik Bilgileri Doldurunuz."
            }
        }
        else{
            // REGISTER
            
            if nameTxt.text != "" && surnameTxt.text != "" && usernameTxt.text != "" && passwordTxt.text != "" && pasword2Txt.text != ""{
                if passwordTxt.text == pasword2Txt.text{
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let context = appDelegate.persistentContainer.viewContext
                    let userData = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                    
                    userData.setValue(UUID(), forKey: "id")
                    userData.setValue(nameTxt.text, forKey: "name")
                    userData.setValue(surnameTxt.text, forKey: "surname")
                    userData.setValue(usernameTxt.text, forKey: "username")
                    userData.setValue(passwordTxt.text, forKey: "password")
                    let imageData = imageView.image!.jpegData(compressionQuality: 0.5)
                    userData.setValue(imageData, forKey: "image")
                    
                    do {
                        try context.save()
                        hataMesaji.isHidden = false
                        hataMesaji.text = "Başarıyla Kayıt Olundu."
                    } catch{
                        hataMesaji.isHidden = false
                        hataMesaji.text = "Bir Sorun Oluştu, Tekrar Deneyiniz."
                    }
                    
                    
                }
                else{
                    hataMesaji.isHidden = false
                    hataMesaji.text = "Girdiğiniz Şifreler Farklı."
                }
            }
            else{
                hataMesaji.isHidden = false
                hataMesaji.text = "Eksik Bilgileri Doldurunuz."
            }
        }
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func getDatas(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let users = try context.fetch(fetchRequest)
            
            for user in users as! [NSManagedObject]{
                if let username = user.value(forKey: "username") as? String{
                    usernameArray.append(username)
                }
                if let password = user.value(forKey: "password") as? String{
                    passwordArray.append(password)
                }
                if let id = user.value(forKey: "id") as? UUID{
                    idArray.append(id)
                }
            }
            
        } catch{
            hataMesaji.text = "Hata! Veriler Yüklenemedi."
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMenu"{
            if let destVC = segue.destination as? UITabBarController{
                destVC.viewControllers?.forEach{
                    if let vc = $0 as? ViewControllerRepeat{
                        while (usernameArray.count > i){
                            if (usernameArray[i] == usernameTxt.text!){
                                if passwordArray[i] == passwordTxt.text{
                                        vc.selectedID = idArray[i]
                                        vc.selectedUsername = usernameArray[i]
                                        vc.selectedPassword = passwordArray[i]
                                }
                            }
                            i = i + 1
                        }
                    }
                }
                i = 0

            }

        }
    }
    
}
