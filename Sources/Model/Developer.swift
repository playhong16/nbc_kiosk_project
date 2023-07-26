//
//  File.swift
//
//
//  Created by playhong on 2023/07/26.
//

import Foundation

class Developer {
    let name: String
    let mbti: String
    let techStack: String
    var salary: Int // String 으로 바꿔서 , 찍자
    var isInterviewed = false
    var isPassed = false
    
    init(name: String, mbti: String, techStack: String, salary: Int, isInterviewed: Bool = false, isPassed: Bool = false) {
        self.name = name
        self.mbti = mbti
        self.techStack = techStack
        self.salary = salary
        self.isInterviewed = isInterviewed
        self.isPassed = isPassed
    }
}


