//
//  File.swift
//
//
//  Created by playhong on 2023/07/26.
//

import Foundation

final class RecruitManager {
    
    static let shared = RecruitManager()
    
    private var interviewerList: [Developer] = []
    private var employmentList: [Developer] = []
    
    private init() {}
    
    // MARK: - Add

    func add(interviewer: Developer) {
        if interviewer.isInterviewed {
            print("면접자 명단에 있습니다.")
        } else {
            interviewer.isInterviewed = true
            interviewerList.append(interviewer)
            print("\(interviewer.name) 님이 면접자 명단에 추가되었습니다.")
        }
    }
    
    func add(passer: Developer) {
        if passer.isInterviewed {
            print("이미 채용된 개발자입니다.")
        } else {
            passer.isInterviewed = true
            employmentList.append(passer)
            print("\(passer.name) 님이 채용 명단에 추가되었습니다.")
        }
    }
    
    // MARK: - Remove

    func remove(interviewer: Developer) {
        if let index = interviewerList.firstIndex(where: { $0.name == interviewer.name }) {
            interviewer.isInterviewed = false
            interviewerList.remove(at: index)
            print("\(interviewer.name) 님이 채용 명단에서 제거되었습니다.")
        } else {
            print("\(interviewer.name) 님은 면접자 명단에 없습니다.")
        }
    }
    
    func remove(passer: Developer) {
        if let index = employmentList.firstIndex(where: { $0.name == passer.name }) {
            passer.isInterviewed = false
            employmentList.remove(at: index)
            print("\(passer.name) 님이 채용 명단에서 제거되었습니다.")
        } else {
            print("\(passer.name) 님은 채용 명단에 없습니다.")
        }
    }
    
    
    // 면접 명단
    func getInterviewerList() -> [Developer] {
        return interviewerList
    }
    
    // 합격 명단
    func getEmploymentList() -> [Developer] {
        return employmentList
    }
    
}

