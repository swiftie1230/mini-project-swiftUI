//
//  Profile.swift
//  mini_project_swiftUI
//
//  Created by íŠėė§ on 2023/02/23.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "đˇ"
        case summer = "đ"
        case autumn = "đ"
        case winter = "âī¸"
        
        var id: String { rawValue }
    }
    
}
