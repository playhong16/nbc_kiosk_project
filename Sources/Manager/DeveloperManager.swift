//
//  File.swift
//  
//
//  Created by playhong on 2023/07/26.
//

import Foundation

final class DeveloperManager {
    
    static let shared = DeveloperManager()
    
    private let developers: [Developer] = [
        Developer(name: "최홍식", mbti: "ENFP", techStack: "Swift", salary: 150000000),
        Developer(name: "김귀아", mbti: "ISFJ", techStack: "Swift", salary: 50000000),
        Developer(name: "박인수", mbti: "INTP", techStack: "Swift", salary: 1000000000),
        Developer(name: "박서영", mbti: "ENTP", techStack: "Swift", salary: 60000000)
        ]
    
    private init() {}

    
    private func getDevelopers() -> [Developer] {
        return developers
    }
    
    func getFilteredList() -> [Developer] {
        let filteredList = getDevelopers().filter { developer in
            developer.isLiked == false
        }
        return filteredList
    }
}


