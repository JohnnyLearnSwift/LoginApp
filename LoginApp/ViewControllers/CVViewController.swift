//
//  CVViewController.swift
//  LoginApp
//
//  Created by Eugenie Tyan on 18.07.2022.
//

import UIKit

class CVViewController: UIViewController {

    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelDateOfBirth: UILabel!
    @IBOutlet var labelEmail: UILabel!
    @IBOutlet var labelTel: UILabel!
    @IBOutlet var labelSkills: UILabel!
    @IBOutlet var labelSoftskills: UILabel!
    @IBOutlet var labelHobbies: UILabel!
    var userCV: CV!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = "\(userCV.userInfo.name) \(userCV.userInfo.surname)"
        labelDateOfBirth.text = "\(userCV.userInfo.dateOfBirth)"
        labelEmail.text = "\(userCV.userInfo.email)"
        labelTel.text = "\(userCV.userInfo.tel)"
        labelSkills.text = arrayToString(array: userCV.skills)
        labelSoftskills.text = arrayToString(array: userCV.softSkiils)
        labelHobbies.text = arrayToString(array: userCV.hobbies)
    }
    
    func arrayToString(array: [String]) -> String {
        var resultString = ""
        for string in array {
            resultString += "\(string), "
        }
        return resultString
    }
}
