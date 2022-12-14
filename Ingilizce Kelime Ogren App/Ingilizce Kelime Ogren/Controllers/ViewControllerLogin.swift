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
    @IBOutlet weak var hataMesaji: UILabel!
    
    var whereSegment : Bool = false
    var idArray = [UUID]()
    var usernameArray = [String]()
    var passwordArray = [String]()
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 20
        
        textFieldLeftImage(imageName: "name_ico", textField: nameTxt)
        textFieldLeftImage(imageName: "name_ico", textField: surnameTxt)
        textFieldLeftImage(imageName: "user_ico", textField: usernameTxt)
        textFieldLeftImage(imageName: "password_ico", textField: pasword2Txt)
        textFieldLeftImage(imageName: "password_ico", textField: passwordTxt)
        
        getDatas()
    }
    
    func textFieldLeftImage(imageName: String, textField: UITextField){
        let imageView = UIImageView(frame: CGRect(x: 10.0, y: 8.0, width: 24.0, height: 24.0))
        let image = UIImage(named: imageName);
        imageView.contentMode = .scaleAspectFit
        imageView.image = image;
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: 40))
        view.addSubview(imageView)

        textField.leftView = view;
        textField.leftViewMode = .always
        
        textField.layer.cornerRadius = 18.0
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            imageView.isHidden = true
            whereSegment = false
            loginButton.setTitle("Giri?? Yap", for: UIControl.State.normal)
            pasword2Txt.isHidden = true
            nameTxt.isHidden = true
            surnameTxt.isHidden = true
            nameTxt.text = ""
            surnameTxt.text = ""
            usernameTxt.text = ""
            passwordTxt.text = ""
            pasword2Txt.text = ""
        case 1:
            
            imageView.image = UIImage(named: "imageAdd")
            // Click to Imageview
            imageView.isUserInteractionEnabled = true
            let imageGestRecog = UITapGestureRecognizer(target: self, action: #selector(selectImage))
            imageView.addGestureRecognizer(imageGestRecog)
            
            whereSegment = true
            loginButton.setTitle("Kay??t Ol", for: UIControl.State.normal)
            pasword2Txt.isHidden = false
            nameTxt.isHidden = false
            surnameTxt.isHidden = false
            imageView.isHidden = false
            nameTxt.text = ""
            surnameTxt.text = ""
            usernameTxt.text = ""
            passwordTxt.text = ""
            pasword2Txt.text = ""
        default:
            break
        }
    }

    @IBAction func loginregisterButton(_ sender: Any) {
        if (whereSegment == false){
            // LOGIN
            i = 0
            if usernameTxt.text != "" && passwordTxt.text != ""{
                while (usernameArray.count > i){
                    if (usernameArray[i] == usernameTxt.text!){
                        if passwordArray[i] == passwordTxt.text{
                            performSegue(withIdentifier: "toMenu", sender: nil)
                            break
                        }
                        else{
                            hataMesaji.isHidden = false
                            hataMesaji.text = "Girilen ??ifre Yanl????"
                        }
                    }
                    i = i + 1
                }
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
                    userData.setValue("", forKey: "words")
                    let imageData = imageView.image!.jpegData(compressionQuality: 0.5)
                    userData.setValue(imageData, forKey: "image")
                    
                    do {
                        try context.save()
                        hataMesaji.isHidden = false
                        hataMesaji.text = "Ba??ar??yla Kay??t Olundu."
                        nameTxt.text = ""
                        surnameTxt.text = ""
                        usernameTxt.text = ""
                        passwordTxt.text = ""
                        pasword2Txt.text = ""
                        whereSegment = false
                        loginButton.setTitle("Giri?? Yap", for: UIControl.State.normal)
                        pasword2Txt.isHidden = true
                        nameTxt.isHidden = true
                        surnameTxt.isHidden = true
                        imageView.isHidden = true
                        segmentedControl.selectedSegmentIndex = 0
                        idArray.removeAll()
                        usernameArray.removeAll()
                        passwordArray.removeAll()
                        getDatas()
                    } catch{
                        hataMesaji.isHidden = false
                        hataMesaji.text = "Bir Sorun Olu??tu, Tekrar Deneyiniz."
                    }
                    
                    
                }
                else{
                    hataMesaji.isHidden = false
                    hataMesaji.text = "Girdi??iniz ??ifreler Farkl??."
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
            hataMesaji.text = "Hata! Veriler Y??klenemedi."
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
