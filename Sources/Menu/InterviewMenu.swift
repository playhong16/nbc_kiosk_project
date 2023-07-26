//
//  File.swift
//
//
//  Created by playhong on 2023/07/26.
//

import Foundation

class InterviewMenu: Menu {
    
    private let recruitManager = RecruitManager.shared
    
    func showInterviewerList() {
        if recruitManager.getInterviewerList().isEmpty {
            print("등록된 면접자가 없습니다.")
            spacer()
        } else {
            print("          [면접자 명단]")
            spacer()
            var index = 0
            for developer in recruitManager.getInterviewerList() {
                index += 1
                print(" \(index). \(developer.name)")
            }
            divider()
            print("0. 뒤로가기")
            print("1. 면접자 명단에서 삭제하기")
            selectDetailMenu(number: getNumber())
        }
    }
    
    private func selectDetailMenu(number: Int) {
        switch number {
        case 0:
            return
        case ...recruitManager.getInterviewerList().count:
            self.remove()
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showInterviewerList()
        }
    }
    
    private func remove() {
        print("삭제할 면접자의 번호를 입력해주세요.")
        if let input = readLine(), let number = Int(input) {
            let developer = recruitManager.getInterviewerList()[number - 1]
            recruitManager.remove(interviewer: developer)
            sleep(2)
        } else {
            print("번호를 다시 입력해주세요.")
            sleep(2)
            remove()
        }
    }
}
