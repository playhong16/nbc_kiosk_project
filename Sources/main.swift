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
            ⏐                                  ⏐
            ⏐       iOS 개발자를 채용해보세요.       ⏐
            ⏐                                  ⏐
            ------------------------------------
            """
    spacer()
    print(welcomeMessage)
    spacer()
}

class RecruitmentService {
    
    private var isRunning = true
    private let menu = Menu()
    
    func run() {
        while isRunning {
            if menu.showMenu() {
                isRunning.toggle()
            }
        }
    }
}

RecruitmentService().run()


