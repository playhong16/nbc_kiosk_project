//
//  File.swift
//
//
//  Created by playhong on 2023/07/26.
//

import Foundation

class DeveloperMenu: Menu {
    
    private let developerManager = DeveloperManager.shared
    private let recruitManager = RecruitManager.shared
    
    // MARK: - 보여주는 기능을 하는 메서드는 show 로 정의.

    func showDeveloperList() {
        if developerManager.getDeveloperList().isEmpty {
            print(" 등록된 개발자가 없습니다.")
            spacer()
        } else {
            print("          [개발자 명단]")
            spacer()
            var index = 0
            for developer in developerManager.getDeveloperList() {
                index += 1
                print(" \(index). \(developer.name)")
            }
            showDetailPage(index: getNumber() - 1)
        }
    }
    
    private func showDetailPage(index: Int) {
        let developer = developerManager.getDeveloperList()[index]
        print(Constant.divisionLine)
        print("[ \(developer.name) 님의 상세페이지 ]")
        print("이름 : \(developer.name)")
        print("MBTI : \(developer.mbti)")
        print("기술 스택 : \(developer.techStack)")
        print("희망 연봉 : \(developer.salary) 원")
        print(Constant.divisionLine)
        print("0. 뒤로가기")
        print("1. 면접 명단에 추가하기")
        selectDetailMenu(number: getNumber(), developer: developer)
    }
    
    // MARK: - 선택을 처리하는 메서드는 select 로 정의

    private func selectDetailMenu(number: Int, developer: Developer) {
        switch number {
        case 0:
            return
        case 1:
            recruitManager.add(interviewer: developer)
            sleep(2)
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showDetailPage(index: developerManager.getDeveloperList().firstIndex(where: { $0.name == developer.name }) ?? 0)
        }
    }
}
