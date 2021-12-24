//
//  CharacterModel.swift
//  Star Wars API
//
//  Created by admin on 24/12/2021.
//

import Foundation

struct ResultCharecter : Codable {
    let results : [People]
}

struct People : Codable {
    let name : String
    let gender : String
    let birth_year : String
    let mass : String
}
