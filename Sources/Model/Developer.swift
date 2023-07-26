

import Foundation

class Developer {
    let name: String
    let mbti: String
    let techStack: String
    var salary: Int
    var isLiked = false
    
    init(name: String, mbti: String, techStack: String, salary: Int, isLiked: Bool = false) {
        self.name = name
        self.mbti = mbti
        self.techStack = techStack
        self.salary = salary
        self.isLiked = isLiked
    }
}


