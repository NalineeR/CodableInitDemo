//
//  Modal.swift
//  CodableDecodable
//  Created by Nalinee on 22/03/2023.

import Foundation

// MARK: - Welcome
struct EmployeeData: Codable {
    let status: String
    let data: [Employee]
    let message: String
}

// MARK: - Datum
struct Employee: Codable {
    let id: Int
    let employeeName: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let intId = try? container.decode(Int.self, forKey: .id){
            //if received as int then parse as is
            id = intId
        }else if let strId = try? container.decode(String.self, forKey: .id){
            //if received as String then convert to Int and set
            id = Int(strId) ?? 0
        }else{
            id = 0
        }
        employeeName = try container.decode(String.self, forKey: .employeeName) 
    }
}
