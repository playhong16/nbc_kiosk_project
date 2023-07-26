//
//  File.swift
//  
//
//  Created by playhong on 2023/07/26.
//

import Foundation

// 합격자 메뉴 객체
class RecruitmentMenu: Menu {
    
    private let recruitmentManager = RecruitmentManager.shared
    
    func showPasserList() {
        showList(title: "합격자", manager: recruitmentManager)
    }
    
    private func showList(title: String, manager: Manager) {
        var total = 0
        if manager.getList().isEmpty {
            print("\(title) 목록이 비어있습니다. ")
        } else {
            print("           [ \(title) 명단 ]")
            spacer()
            var index = 0
            for developer in manager.getList() {
                index += 1
                total += developer.salary
                print("\(index). \(developer.name) | 희망 연봉 : \(developer.salary) 원")
            }
            showTotal(total: total)
            back()
            print("[1]. 채용하기")
            selectDetailMenu(number: getNumber())
        }
    }
    
    private func showTotal(total: Int) {
        spacer()
        print("            [ Total ]")
        spacer()
        print("전원 채용 시 지출 금액은 \(total)원 입니다.")
        spacer()
    }
    
    private func selectDetailMenu(number: Int) {
        switch number {
        case 0:
            return
        case ...recruitmentManager.getList().count:
            guard number - 1 == 0 else { fallthrough }
            let developer = recruitmentManager.getList()[number - 1]
            remove(developer: developer)
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showPasserList()
        }
    }
    
    private func remove(developer: Developer) {
        recruitmentManager.remove(passer: developer)
        sleep(2)
    }
}

