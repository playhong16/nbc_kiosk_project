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
    private lazy var recruitmnetMenu = RecruitmentMenu()
    
    func showMenu() -> Bool {
        welcomMessage()
        print("              [ 메뉴 ]")
        spacer()
        print("[1]. 지원자 명단 | 지원한 개발자 보기.")
        spacer()
        print("[2]. 면접자 명단 | 면접 명단 보기.")
        spacer()
        print("[3]. 합격자 명단 | 합격 명단 보기.")
        spacer()
        print("[0]. 종  료    | 프로그램 종료하기.")
        let number = getNumber()
        selectMenu(number: number)
        return number == 0 // number 가 0 인 경우 true 를 반환해서 RecruitmentService 의 isRunning = false 로 바꾼다.
    }
    
    private func selectMenu(number: Int) {
        switch number {
        case 1:
            developerMenu.showDeveloperList()
        case 2:
            interviewMenu.showInterviewerList()
        case 3:
            recruitmnetMenu.showPasserList()
        case 0:
            return
        default:
            print("잘못 입력하셨습니다.")
        }
    }
    
    func getNumber() -> Int {
        divider()
        print("번호를 입력해주세요.")
        guard let input = readLine() else { return 0 }
        guard let number = Int(input) else {
            print("번호를 입력해주세요.")
            sleep(1)
            return 0
        }
        return number
    }
    
    func back() {
        divider()
        print("[0]. 뒤로가기")
    }
}
