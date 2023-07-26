//
//  File.swift
//
//
//  Created by playhong on 2023/07/26.
//

import Foundation

// 합격자를 담당하는 객체
final class RecruitmentManager: Manager {
    
    static let shared = RecruitmentManager()
    
    private var passerList: [Developer] = []
    
    private init() {}
    
    // MARK: - Get

    func getList() -> [Developer] {
        return passerList
    }
    
    // MARK: - Add
    
    func add(developer: Developer) {
        if developer.isPassed {
            print("이미 합격된 개발자입니다.")
            sleep(2)
        } else {
            developer.isPassed = true
            passerList.append(developer)
            print("\(developer.name) 님이 합격자 명단에 추가되었습니다.")
            sleep(2)
        }
    }
    
    // MARK: - Remove

    func remove(passer: Developer) {
        if let index = passerList.firstIndex(where: { $0.name == passer.name }) {
            passer.isPassed = false
            passerList.remove(at: index)
            print("\(passer.name) 님에게 불합격을 통보합니다.")
            sleep(2)
        } else {
            print("\(passer.name) 님은 합격자 명단에 없습니다.")
            sleep(2)
        }
    }
}

