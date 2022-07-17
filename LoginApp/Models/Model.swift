//
//  Model.swift
//  LoginApp
//
//  Created by Eugenie Tyan on 11.07.2022.
//

import Foundation

struct CV {
    let authorizationInfo: AuthorizationInfo
    let userInfo: UserInfo
    let jobs: [Job]
    let skills: [String]
    let hobbies: [String]
    let softSkiils: [String]
    
    static func getCV() -> CV {
        CV (authorizationInfo: AuthorizationInfo(login: "Jack", password: "1234"),
            userInfo: UserInfo(name: "Eugenie",
                               surname: "Tyan",
                               dateOfBirth: "23.12.1988",
                               email: "et@gmail.com",
                               tel: "+77777777777"),
            jobs: [Job(startDate: "01.01.2018",
                       endDate: "nowadays",
                       companyName: "selfemloyee",
                       jobTitle: "Director"),
                   Job(startDate: "01.07.2017",
                       endDate: "31.12.2017",
                       companyName: "Softorino",
                       jobTitle: "MacDev"),
                   Job(startDate: "01.01.2017",
                       endDate: "30.06.2017",
                       companyName: "StepIT",
                       jobTitle: "Marketer")],
            skills: ["Objective-C", "Swift", "C++", "C#"],
            hobbies: ["snowboarding", "cooking", "play guitar"],
            softSkiils: ["sense of humor", "communication", "critical thinking"])
    }
}

struct UserInfo {
    let name: String
    let surname: String
    let dateOfBirth: String
    let email: String
    let tel: String
}

struct AuthorizationInfo {
    let login: String
    let password: String
}

struct Job {
    let startDate: String
    let endDate: String
    let companyName: String
    let jobTitle: String
}
