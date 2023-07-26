//
//  File.swift
//
//
//  Created by playhong on 2023/07/26.
//

import Foundation

// 개발자 메뉴 객체
class DeveloperMenu: Menu {
    
    private let developerManager = DeveloperManager.shared
    private let interviewerManger = InterviewerManager.shared
    private let recruitManager = RecruitmentManager.shared
    
    // MARK: - 보여주는 기능을 하는 메서드는 show 로 정의.
    
    func showDeveloperList() {
        showList(title: "개발자", manager: developerManager)
    }
    
    func showList(title: String, manager: Manager) {
        if manager.getList().isEmpty {
            print("\(title) 목록이 비어있습니다. ")
        } else {
            print("           [ \(title) 명단 ]")
            spacer()
            var index = 0
            for developer in manager.getList() {
                index += 1
                print("[\(index)]. \(developer.name)")
                spacer()
            }
            back()
            showDetailPage(index: getNumber(), manager: manager)
        }
    }
    
    private func showDetailPage(index: Int, manager: Manager) {
        guard index > 0 else { return }
        let developer = manager.getList()[index - 1]
        divider()
        print("[ \(developer.name) 님의 상세페이지 ]")
        print("이름 : \(developer.name)")
        print("MBTI : \(developer.mbti)")
        print("기술 스택 : \(developer.techStack)")
        print("희망 연봉 : \(developer.salary) 원")
        back()
        print("[1]. 면접자 명단에 추가하기")
        selectDetailMenu(developer: developer, manager: interviewerManger)
    }
    
    // MARK: - 선택을 처리하는 메서드는 select 로 정의
    
    private func selectDetailMenu(developer: Developer, manager: Manager) {
        switch getNumber() {
        case 0:
            return
        case 1:
            manager.add(developer: developer)
            sleep(2)
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showDetailPage(index: manager.getList().firstIndex(where: { $0.name == developer.name }) ?? 0, manager: manager)
        }
    }
}
