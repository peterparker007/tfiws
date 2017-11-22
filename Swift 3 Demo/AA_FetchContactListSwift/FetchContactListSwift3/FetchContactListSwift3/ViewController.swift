//
//  ViewController.swift
//  FetchContactListSwift3


import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController {

    var contacts = [CNContact]()       // Contact Model
    var contactStore = CNContactStore()
    
    var arrayModelContact = [CNMutableContact]()
    
    let appdelObj: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tblAddReferral: UITableView!
    //MARK:- UITextField  IBOutlet
    @IBOutlet weak var txtSearch: UITextField!

    var strSearch : NSString = NSString()
    var arrtempList : NSArray = NSArray()
    var arrContactList : NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tblAddReferral.contentInset = UIEdgeInsetsMake(0, 0, 0, 0); //values
        tblAddReferral.estimatedRowHeight = 110
        tblAddReferral.rowHeight = UITableViewAutomaticDimension
        
        txtSearch.padding(width: 22)
        txtSearch.cornerRadiusAndBorder()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getContactList()
    }

    //MARK:- Fetch Contact
    func getContactList() {
        arrContactList.removeAllObjects()
        let contactStore = CNContactStore()
        contacts.removeAll()
        let keys = [CNContactPhoneNumbersKey, CNContactGivenNameKey, CNContactMiddleNameKey, CNContactFamilyNameKey, CNContactBirthdayKey, CNContactViewController.descriptorForRequiredKeys()] as [Any]
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        let sortOrder = CNContactSortOrder.userDefault
        
        appdelObj.showHUD(viewNew: self.view)
        DispatchQueue.global(qos: .background).async {
            fetchRequest.sortOrder = sortOrder
            do {
                try contactStore.enumerateContacts(with: fetchRequest, usingBlock: { ( contact, stop) -> Void in
                    self.contacts.append(contact)
                })
            }
            catch let error as NSError {
                self.appdelObj.HideHud()
                print(error.localizedDescription)
            }
            
            if self.contacts.count > 0 {
                for index in 0..<self.contacts.count {
                    let dic: NSMutableDictionary = NSMutableDictionary()
                    let currentContact = self.contacts[index]
                    var firstName: String!
                    var lastName: String!
                    var strmobileNo: String = ""
                    var strDialcode = ""
                    var strCountryName = ""
                    
                    firstName = "\(currentContact.givenName)"
                    lastName  = "\(currentContact.familyName)"
                    
                    if currentContact.isKeyAvailable(CNContactPhoneNumbersKey) {
                        let arrPhoneList = (currentContact.phoneNumbers)
                        if arrPhoneList.count > 0 {
                            strmobileNo  = "\(((currentContact.phoneNumbers[0].value).value(forKey: "digits") as! String))"
                            
                            let strTemp = "\(((currentContact.phoneNumbers[0].value).value(forKey: "countryCode") as! String))"
                            
                            if strTemp.isEmpty{
                            } else{
                                strDialcode = self.getCountryDialCodeFromCountryCode(code: strTemp).0
                                
                                strCountryName = self.getCountryDialCodeFromCountryCode(code: strTemp).1
                                print(strCountryName)
                            }
                        }
                    }
                    
                    if firstName != "" && lastName != "" && strmobileNo != "" {
                        
                        var strFullname = ""
                        if let strname :String = CNContactFormatter.string(from: currentContact, style: .fullName) {
                            strFullname  = strname
                        }
                        
                        dic.setValue(strFullname, forKey: "fullname")
                        dic.setValue(strmobileNo, forKey: "mobile")
                        dic.setValue(self.contacts[index], forKey: "contactModel")
                        
                        let index1 = strmobileNo.index(strmobileNo.startIndex, offsetBy: strDialcode.characters.count)
                        
                        let substring1 = strmobileNo.substring(from: index1)
                        
                        dic.setValue("0", forKey: "isadded")
            
                        dic.setValue(strDialcode, forKey: "isdcode")
                        dic.setValue(strCountryName, forKey: "countryName")
                        
                        let indexpathTemp: NSIndexPath = NSIndexPath(row: index, section: 0)
                        
                        if !currentContact.isKeyAvailable(CNContactBirthdayKey) || !currentContact.isKeyAvailable(CNContactImageDataKey) ||  !currentContact.isKeyAvailable(CNContactEmailAddressesKey) {
                            self.refetchContact(contact: currentContact, atIndexPath: indexpathTemp as IndexPath)
                        }
                        else {
                            
                            // Set the birthday info.
                            if let birthday = currentContact.birthday {
                                // cell.lblBirthday.text = "\(birthday.year)-\(birthday.month)-\(birthday.day)"
                                
                                // print("\(getDateStringFromComponents(birthday))")
                            }
                            else {
                                
                                print("Birthday Not Availabel")
                            }
                            
                            // Set the contact image.
                            if let imageData = currentContact.imageData {
                                // Cell.imgContactImage.image = UIImage(data: imageData)
                                
                            }
                            
                            // Set the contact's work email address.
                            var homeEmailAddress: String!
                            for emailAddress in currentContact.emailAddresses {
                                if emailAddress.label == CNLabelHome {
                                    homeEmailAddress = emailAddress.value as String
                                    break
                                }
                            }
                            if homeEmailAddress != nil {
                                dic.setValue("\(homeEmailAddress)", forKey: "email")
                            } else {
                                dic.setValue("", forKey: "email")
                            }
                        }
                        self.arrContactList.add(dic)
                    }
                }
            }
            
            let sortByName = NSSortDescriptor(key: "fullname", ascending: true)
            let sortDescriptors = [sortByName]
            let sortedArray : NSArray = (self.arrContactList as NSMutableArray).sortedArray(using:
                sortDescriptors) as NSArray
            
            if sortedArray.count > 0 {
                self.arrContactList = sortedArray.mutableCopy() as! NSMutableArray
            }
            
            DispatchQueue.main.async {
                self.appdelObj.HideHud()
                self.arrtempList =  self.arrContactList.mutableCopy() as! NSArray
                self.tblAddReferral.reloadData()
            }
        }
    }
    
    func refetchContact(contact: CNContact, atIndexPath indexPath: IndexPath) {
        self.requestForAccess { (accessGranted) -> Void in
            if accessGranted {
                let keys = [CNContactFormatter.descriptorForRequiredKeys(for: CNContactFormatterStyle.fullName), CNContactEmailAddressesKey, CNContactBirthdayKey, CNContactImageDataKey] as [Any]
                
                do {
                    let contactRefetched = try self.contactStore.unifiedContact(withIdentifier: contact.identifier, keysToFetch: keys as! [CNKeyDescriptor])
                    self.contacts[indexPath.row] = contactRefetched
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.tblAddReferral.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                    })
                }
                catch {
                    print("Unable to refetch the contact: \(contact)", separator: "", terminator: "\n")
                }
            }
        }
    }
    
    func requestForAccess(_ completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
        let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        switch authorizationStatus {
        case .authorized:
            completionHandler(true)
        case .denied, .notDetermined:
            self.contactStore.requestAccess(for: CNEntityType.contacts, completionHandler: { (access, accessError) -> Void in
                if access {
                    completionHandler(access)
                } else {
                    if authorizationStatus == CNAuthorizationStatus.denied {
                        let message = "\(accessError!.localizedDescription)\n\nPlease allow the app to access your contacts through the Settings."
                        self.alertShow(strMessage: message)
                    }
                }
            })
        default:
            completionHandler(false)
        }
    }
    
    func getCountryDialCodeFromCountryCode(code: String) -> (String,String){
        var tempArr : NSArray = NSArray()
        let filePath = Bundle.main.path(forResource: "CountryCodes", ofType: "json")!
        if let countyData: NSData = NSData(contentsOfFile: filePath) {
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: countyData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableArray
                
                // print(jsonResult)
                tempArr = jsonResult.mutableCopy() as! NSArray
                
            } catch {
                print("JSON Processing Failed")
            }
        }
        var strDial = ""
        var strName = ""
        for dicnew in tempArr {
            let dic : NSDictionary = dicnew as! NSDictionary
            
            if dic.object(forKey: "code") as! String == code.uppercased() {
                strDial = dic.object(forKey: "dial_code") as! String
                strName = dic.object(forKey: "name") as! String
            }
        }
        return (strDial,strName)
    }
    
    //MARK:- Search Update
    func searchFunction(textField: UITextField){
        if textField == txtSearch {
                if arrtempList.count > 0 {
            updatedResults(NormalListArr: arrtempList as! NSMutableArray, strKey: "fullname")
    
            }
        }
    }
    
    func updatedResults(NormalListArr: NSMutableArray, strKey: NSString) {
        var filteredListarr: NSMutableArray?
        filteredListarr = nil
        filteredListarr = NSMutableArray.init(array: NormalListArr)
        let predicate: NSPredicate?
//        if strKey.length > 0 {
//            predicate = NSPredicate(format: "%K BEGINSWITH[cd]%@", strKey, "\(strSearch)")
//        } else {
//            predicate = NSPredicate(format: "self BEGINSWITH[cd] %@", "\(strSearch)")
//        }
        
        if strKey.length > 0 {
            predicate = NSPredicate(format: "%K contains[c]%@", strKey, "\(strSearch)")
        } else {
            predicate = NSPredicate(format: "self contains[c] %@", "\(strSearch)")
        }
        
        filteredListarr?.filter(using: predicate!)
        if strSearch.length == 0 {
                updateContactListTableView(filteredarr: NormalListArr)
        } else {
                updateContactListTableView(filteredarr: filteredListarr!)
        }
    }
    
    func updateContactListTableView(filteredarr: NSMutableArray) {
        if filteredarr.count > 0 {
            self.tblAddReferral.isHidden = false
            self.arrContactList = filteredarr
            self.tblAddReferral.reloadData()
        } else {
            self.tblAddReferral.isHidden = true
        }
    }
    
    //MARK:- Cell UIButton Actions
    func btnAddInCell(sender: UIButton)  {
        print(sender.tag)
        let dic: NSDictionary =  arrContactList[sender.tag] as! NSDictionary
        let strCheck = dic.object(forKey: "isadded") as! String
        
        if strCheck == "0" {
            dic.setValue("1", forKey: "isadded")
            arrContactList.replaceObject(at: sender.tag, with: dic)
        }
        else{
            dic.setValue("0", forKey: "isadded")
            arrContactList.replaceObject(at: sender.tag, with: dic)
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            let indexpath: NSIndexPath = NSIndexPath(row: sender.tag, section: 0)
            self.tblAddReferral.reloadRows(at: [indexpath as IndexPath], with: UITableViewRowAnimation.none)
        })
    }
    
    //MARK:- Alert Function
    func alertShow(strMessage: String) {
        let alert = UIAlertController(title: "ContactDemoSwift3", message: strMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        txtSearch.resignFirstResponder()
        let addContactVCobj = self.storyboard?.instantiateViewController(withIdentifier: "AddContactVC") as? AddContactVC
        self.present(addContactVCobj!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: UITextFieldDelegate
{
    //MARK:- UITextField Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if strSearch == "" {
            txtSearch.text = ""
        } else {
            txtSearch.text = strSearch as String
        }
        searchFunction(textField: textField)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString = (textField.text! as NSString)
            .replacingCharacters(in: range, with: string)
        strSearch = String(format: "%@", currentString) as NSString
        searchFunction(textField: textField)
        return true
    }
}

extension ViewController: UITableViewDataSource{
    //MARK:- UITableViewDataSource  Methods
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContactList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ContactTableCell
        
        let dic: NSDictionary = arrContactList[indexPath.row] as! NSDictionary
        
        let btnadd: UIButton = Cell.btnAdd
        btnadd.tag = indexPath.row
        btnadd.addTarget(self, action: #selector(self.btnAddInCell), for: .touchUpInside)
        
        let name = dic.object(forKey: "fullname") as! String?
        let mobile = dic.object(forKey: "mobile") as! String?
        let isdcode = dic.object(forKey: "isdcode") as! String?
        let countryName = dic.object(forKey: "countryName") as! String?
    
        Cell.lblName.text = name
        Cell.countryName.text = countryName
        
        var newString = ""
        if (mobile?.hasPrefix(isdcode!))! {
            let strremain = mobile?.substring(from: (mobile?.index((mobile?.startIndex)!, offsetBy: (isdcode?.characters.count)!))!)
            
            newString = strremain!
        }
        else{
            newString = mobile!
        }
        
        if isdcode == "" {
            Cell.lblMobile.text = newString
        }
        else{
            Cell.lblMobile.text = isdcode! + "-" + newString
        }
        
        Cell.backgroundColor = UIColor.clear
        Cell.selectionStyle = UITableViewCellSelectionStyle.none
        return Cell
    }
}

extension ViewController: UITableViewDelegate{
    //MARK:- UITableViewDelegate  Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //txtSearch.resignFirstResponder()
        let addContactVCobj = self.storyboard?.instantiateViewController(withIdentifier: "AddContactVC") as? AddContactVC
        
       let dic: NSDictionary =  arrContactList[indexPath.row] as! NSDictionary
       let cModel = dic.object(forKey: "contactModel") as! CNContact?
       addContactVCobj?.contactModel = cModel
       addContactVCobj?.dicData = dic
        
        DispatchQueue.main.async {
             self.present(addContactVCobj!, animated: true, completion: nil)
        }
    }
}
