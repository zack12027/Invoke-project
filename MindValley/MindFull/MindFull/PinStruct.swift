//
//  PinStruct.swift
//  MindFull
//
//  Created by Weng Seong Cheang on 11/27/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import Foundation
struct Pintrest: Decodable {
    let id: String?
    let created_at: String?
    let width: Int?
    let height: Int?
    let color: String?
    let likes: Int?
    let liked_by_user: Bool?
    let user: User?
    let current_user_Collections: String?
    let urls: Urls?
    let categories: [Categories]
    
}

struct User: Decodable {
    let id: String?
    let username: String?
    let name: String?
    let profile_image: Profile_image?
    let links: Links?
    let urls: Urls?
    let links_: Links3?
}

struct Profile_image: Decodable {
    let small: String?
    let medium: String?
    let large: String?
}

struct Links: Decodable
{
    let self_: String?
    let html: String?
    let photos: String?
    let likes: String?
}

struct Urls: Decodable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
}

struct Categories: Decodable {
    let id: Int?
    let title: String?
    let photo_count: Int?
    let links: Links2?
}
struct Links2: Decodable {
    let self_: String?
    let photos: String?
}

struct Links3: Decodable {
    let self_: String?
    let html: String?
    let download: String?
}
