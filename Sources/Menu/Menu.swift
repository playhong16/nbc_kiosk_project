//
//  File.swift
//
//
//  Created by playhong on 2023/07/26.
//

import Foundation

class Menu {
    
    private lazy var developerMenu = DeveloperMenu()
    private lazy var interviewMenu = InterviewMenu()
    
    func showMenu() {
        welcomMessage()
        print("              [ 메뉴 ]")
        spacer()
        print("1. 지원 목록 | 지원한 개발자 보기.")
        spacer()
        print("2. 면접 명단 | 면접 명단 보기")
        spacer()
        print("3. 합격 명단 | 합격 명단 보기")
        spacer()
        print("0. 종   료  | 프로그램 종료하기.")
        selectMenu(number: getNumber())
    }
    
    private func selectMenu(number: Int) {
        switch number {
        case 1:
            developerMenu.showDeveloperList()
        case 2:
            interviewMenu.showInterviewerList()
        case 3:
            spacer()
        case 0:
            spacer()
        default:
            print("잘못 입력하셨습니다.")
        }
    }
    
    func getNumber() -> Int {
        divider()
        print("원하는 번호를 입력해주세요.")
        guard let input = readLine() else { return 0 }
        guard let number = Int(input) else {
            print("번호를 입력해주세요.")
            sleep(1)
            return 0
        }
        return number
    }

}
