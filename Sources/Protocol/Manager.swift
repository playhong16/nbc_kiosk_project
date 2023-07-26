//
//  File.swift
//  
//
//  Created by playhong on 2023/07/27.
//

import Foundation

protocol Manager {
    func getList() -> [Developer]
    
    func add(developer: Developer)
}
