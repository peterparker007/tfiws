//
//  ViewController.swift
//  CameraDemo
//
//  Created by bhumesh on 11/29/17.
//  Copyright © 2017 bhumesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource   {
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
   return 1
    }

    @IBOutlet var imgvw3: UIImageView!
    @IBOutlet var imgvw2: UIImageView!
    @IBOutlet var imgVW: UIImageView!
  let picker = UIImagePickerController()
    var type = ""
    
    @IBOutlet var itemPicker: UIPickerView! = UIPickerView()
//    var itemPicker: UIPickerView! = UIPickerView()
    var seasonalItems = ["savedPhotosAlbum", "camera", "photoLibrary"]
    override func viewDidLoad() {
        super.viewDidLoad()
        itemPicker.delegate = self;
        itemPicker.dataSource = self
        
         picker.delegate = self
        
        itemPicker.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//savedPhotosAlbum
//camera
//photoLibrary
    
    @IBAction func ClickME(_ sender: AnyObject) {
itemPicker.isHidden=false
       
      
    }
    
   public  func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        //scaleAspectFit means it convert image into there aspect ratio to fit our imageview our image view H/W not change.
         print(picker.sourceType)
        imgVW.contentMode = .scaleToFill //3
        if type == "savedPhotosAlbum"
        {
             imgVW.image = chosenImage
        }
        else if type == "photoLibrary"
        {
             imgvw2.image = chosenImage
             imgvw3.image = chosenImage
        }
        else
        {
            
        }
        //4
        print(imgVW.frame)
        dismiss(animated:true, completion: nil)
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // returns the # of rows in each component..
   public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return seasonalItems.count
    }
    
   public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return seasonalItems[row]
    }
    
  public  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        picker.allowsEditing = false
        switch row {
        case 0:
            type = "savedPhotosAlbum"
            picker.sourceType = .savedPhotosAlbum
             picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum)!
            break
        case 1:
              type = "camera"
            picker.sourceType = .camera
              picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            break
        case 2:
             type = "photoLibrary"
            picker.sourceType = .photoLibrary
             picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            break
            
        default:
            picker.sourceType = .savedPhotosAlbum
            break
            
        }
             
     
        present(picker, animated: true, completion: nil)
      
        
//        pickerTextfield.text = seasonalItems[row]
        itemPicker.isHidden = true
    }
    
   
}

