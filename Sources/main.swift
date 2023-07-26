//
//  File.swift
//
//
//  Created by playhong on 2023/07/26.
//

import Foundation

func spacer() {
    print("")
}

func divider() {
    print("------------------------------------")
}

func welcomMessage() {
    let welcomeMessage = """
            ------------------------------------
            ⏐ iOS 개발자 채용시장에 오신 것을 환영합니다 ⏐
            ------------------------------------
            """
    print(welcomeMessage)
}

class RecruitmentService {
    
    private var isRunning = true
    private let menu = Menu()
    
    
    func run() {
        while isRunning {
            getMenu()
        }
    }
    
    private func getMenu() {
        menu.showMenu()
    }
    
    
//    private func showDeveloperMenu() {
//        spacer()
//        print(" 1. 면접 안내하기")
//        print(" 0. 뒤로가기")
//        showInterviewerList(number: getNumber())
//    }
//
//
//    private func showInterviewMenu() {
//        spacer()
//        print(" 1. 면접 안내하기")
//        print(" 2. 면접 명단에서 삭제하기")
//        showInterviewerList(number: getNumber())
//    }
//
//    private func showMyPage() {
//        spacer()
//        print("          [ 마이 페이지 ]")
//        spacer()
//        print("1. 회사 잔고 확인하기")
//        print("2. 이벤트 참여하기")
//    }
//
//    private func showRemovalMenu() {
//        print("           [ 면접 명단에서 삭제하기 ]")
//        print("")
//        showEmploymentList()
//        print(" 삭제하고 싶은 개발자의 번호를 입력해주세요.")
//        if let input = readLine(), let number = Int(input), number <= recruitManger.getEmploymentList().count {
//            let developer = recruitManger.getEmploymentList()[number - 1]
//            recruitManger.remove(interviewer: developer)
//            sleep(2)
//        } else {
//            print("번호를 다시 입력해주세요.")
//            sleep(2)
//            showRemovalMenu()
//        }
//    }
//
//
//
//    private func showEmploymentList() {
//        print("           [ 채용 명단 ]")
//        print("")
//        let employmentList = recruitManger.getEmploymentList()
//        if employmentList.isEmpty {
//            print(" 채용 명단이 비어있습니다.")
//        } else {
//            var index = 0
//            for developer in employmentList {
//                index += 1
//                print(" \(index). \(developer.name) | MBTI: \(developer.mbti) | 기술 스택: \(developer.techStack)  | 희망 연봉: \(developer.salary)원")
//            }
//        }
//    }
}

RecruitmentService().run()


