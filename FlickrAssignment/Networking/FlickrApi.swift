//
//  FlickrApi.swift
//  FlickrAssignment
//
//  Created by admin on 11/03/2022.
//

import Foundation

struct Pictures: Decodable {
    let photos : Photos
    let stat : String
}

struct Photos: Decodable {
    
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [Photo]
}

struct Photo: Decodable {
    
    let id : String
    let owner : String
    let secret : String
    let server : String
    let farm : Int
    let title : String
    
}
