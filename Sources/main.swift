//
//  File.swift
//  
//
//  Created by playhong on 2023/07/26.
//

import Foundation

class RecruitmentService {
    
    private let developerManager = DeveloperManager.shared
    private let recruitManger = RecruitManager.shared
    private var isRunning = true
    
    func run() {
        while isRunning {
            showMenu()
        }
    }
    
    private func showMenu() {
        print(Constant.welcomeMessage)
        printDeveloperList()
        showRecruitMenu()
        print(Constant.divisionLine)
        print(" 0. 종료")
        getNumber()
    }
    
    private func showRecruitMenu() {
        if !recruitManger.isEmploymentListEmpty() {
            print("           [ 채용 메뉴 ]")
            print("")
            print(" 8. 채용 명단 보기")
            print(" 9. 채용 명단에서 삭제하기")
        }
    }
    
    private func printDeveloperList() {
        if developerManager.getFilteredList().isEmpty {
            print(" 등록된 개발자가 없습니다.")
            print("")
        } else {
            var index = 0
            for developer in developerManager.getFilteredList() {
                index += 1
                print(" \(index). \(developer.name)")
            }
        }
    }
    
    private func getNumber() {
        print(Constant.divisionLine)
        print(" 원하시는 개발자의 번호를 입력해주세요.")
        guard let input = readLine() else { return }
        guard let number = Int(input) else {
            print(" 번호를 입력해주세요.")
            sleep(1)
            return
        }
        selectMenu(number: number)
    }
    
    private func selectMenu(number: Int) {
        switch number {
        case 0:
            isRunning = false
        case ...developerManager.getFilteredList().count:
            showDetailPage(index: number - 1)
        case 8:
            if recruitManger.getEmploymentList().isEmpty {
                print(" 채용 명단이 비어있습니다.")
                sleep(2)
            } else {
                showEmploymentList()
                sleep(2)
            }
        case 9:
            if recruitManger.getEmploymentList().isEmpty {
                print(" 채용 명단이 비어있습니다.")
                sleep(2)
            } else {
                showRemovalMenu()
            }
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
        }
    }
    
    private func showRemovalMenu() {
        print("           [ 채용 명단에서 삭제하기 ]")
        print("")
        showEmploymentList()
        print(" 삭제하고 싶은 개발자의 번호를 입력해주세요.")
        if let input = readLine(), let number = Int(input), number <= recruitManger.getEmploymentList().count {
            let developer = recruitManger.getEmploymentList()[number - 1]
            recruitManger.remove(developer: developer)
            sleep(2)
        } else {
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showRemovalMenu()
        }
    }
    
    private func showDetailPage(index: Int) {
        let developer = developerManager.getFilteredList()[index]
        print(Constant.divisionLine)
        print("[ \(developer.name) 님의 상세페이지 ]")
        print("이름 : \(developer.name)")
        print("MBTI : \(developer.mbti)")
        print("기술 스택 : \(developer.techStack)")
        print("희망 연봉 : \(developer.salary) 원")
        print(Constant.divisionLine)
        print("0. 뒤로가기")
        print("1. 채용 명단에 추가하기")
        if let input = readLine() {
            selectDetailPageMenu(number: input, developer: developer)
        }
    }
    
    private func selectDetailPageMenu(number: String, developer: Developer) {
        switch number {
        case "0":
            showMenu()
        case "1":
            recruitManger.add(developer: developer)
            sleep(2)
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showDetailPage(index: developerManager.getFilteredList().firstIndex(where: { $0.name == developer.name }) ?? 0)
        }
    }
    
    private func showEmploymentList() {
        print("           [ 채용 명단 ]")
        print("")
        let employmentList = recruitManger.getEmploymentList()
        if employmentList.isEmpty {
            print(" 채용 명단이 비어있습니다.")
        } else {
            var index = 0
            for developer in employmentList {
                index += 1
                print(" \(index). \(developer.name) | MBTI: \(developer.mbti) | 기술 스택: \(developer.techStack)  | 희망 연봉: \(developer.salary)원")
            }
        }
    }
}

RecruitmentService().run()


