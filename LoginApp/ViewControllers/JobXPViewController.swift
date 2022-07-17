//
//  JobXPViewController.swift
//  LoginApp
//
//  Created by Eugenie Tyan on 18.07.2022.
//

import UIKit

class JobXPViewController: UIViewController {

    @IBOutlet var jobXPTF: UITextView!
    var userCV: CV!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobXPTF.text = arrayToString(array: userCV.jobs)
    }
    
    func arrayToString(array: [Job]) -> String {
        var result = ""
        for job in array {
            result += "\(job.companyName)\n\(job.jobTitle)\n\(job.startDate) - \(job.endDate)\n\n"
        }
        return result
    }
}
