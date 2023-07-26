

import Foundation

final class RecruitManager {
    
    static let shared = RecruitManager()

    private var employmentList: [Developer] = []
    
    private init() {}
    
    func add(developer: Developer) {
        if developer.isLiked {
            print("이미 채용된 개발자입니다.")
        } else {
            developer.isLiked = true
            employmentList.append(developer)
            print("\(developer.name) 님이 채용 명단에 추가되었습니다.\n")
        }
    }
    
    // 개발자를 채용 명단에서 삭제하는 메소드
    func remove(developer: Developer) {
        if let index = employmentList.firstIndex(where: { $0.name == developer.name }) {
            developer.isLiked = false
            employmentList.remove(at: index)
            print("\n\(developer.name) 님이 채용 명단에서 제거되었습니다.\n")
        } else {
            print("\(developer.name) 님은 채용 명단에 없습니다.")
        }
    }
    
    func getEmploymentList() -> [Developer] {
        return employmentList
    }
    
    func isEmploymentListEmpty() -> Bool {
        return getEmploymentList().isEmpty
    }
}

