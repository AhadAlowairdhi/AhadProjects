//
//  FilmsModel.swift
//  Star Wars API
//
//  Created by admin on 24/12/2021.
//

import Foundation

struct ResultFilm : Codable {
    let results : [Films]
}

struct Films : Codable {
    let title : String
    let release_date : String
    let director : String
    let opening_crawl : String
}
