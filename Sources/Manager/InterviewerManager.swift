//
//  File.swift
//  
//
//  Created by playhong on 2023/07/26.
//

import Foundation

// 면접자를 담당하는 객체.
class InterviewerManager: Manager {
    
    static let shared = InterviewerManager()
    
    private var interviewerList: [Developer] = []
    
    private init() {}
    
    func getList() -> [Developer] {
        return interviewerList
    }
    
    func add(developer: Developer) {
        if developer.isInterviewed {
            print("\(developer.name) 님은 면접자 명단에 있습니다.")
            sleep(2)
        } else {
            developer.isInterviewed = true
            interviewerList.append(developer)
            print("\(developer.name) 님이 면접자 명단에 추가되었습니다.")
            sleep(2)
        }
    }
    
    func remove(interviewer: Developer) {
        if let index = interviewerList.firstIndex(where: { $0.name == interviewer.name }) {
            interviewer.isInterviewed = false
            interviewerList.remove(at: index)
            print("\(interviewer.name) 님에게 불합격을 통보합니다.")
            sleep(2)
        } else {
            print("\(interviewer.name) 님은 면접자 명단에 없습니다.")
            sleep(2)
        }
    }
}
