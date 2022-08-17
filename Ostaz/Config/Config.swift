//  Config.swift
//  Ostaz
//  Created by eslam awad elsayed awad on 02/07/2022.

import Foundation

struct URLs {
    static let main = "https://inst.roqay.solutions/api/"
    // Auth
    
    /// POST {email, password}
    static let login = main + "login"
    /// POST {name, email, password, config-Password }
    static let register = main + "register"
    /// GET {}
    static let logout = main + "logout"
    /// POST {email}
    static let froget = main + "forget-password"
    /// POST {Otp, Password, Confirm_Password}
    static let reset = main + "reset-password"
    /// POST {area_id, city_id}
    static let setLocation = main + "set-location"
    /// GET {}
    static let getLocation = main + "all-user-location"
    
    // Profile
    
    /// GET {}
    static let profile = main + "profile"
    /// POST {email, image}
    static let updateProfile = main + "update-profile"
    /// POST {oldPass, newPass}
    static let editPassword = main + "change-password"
    /// POST {number, area1, area2, specialization1, specialization2, email }
    static let upgradeUserToInstructor = main + "upgrade"
    /// POST {instructor id}
    static let showProfile = main + "show-profile"

    
    // Home
    
    /// GET{}
    static let search = main + "search"
    /// GET{}
    static let getAllCategories = main + "getcats"
    /// GET{}
    static let getAllInstructors = main + "getinsts"
    
    // Caegory
    
    ///Get{}
    static let category = main + "specializations"
    ///Get{}
    static let subCategory = main + "specializations"
    ///Get{}
    static let instructorOfSubCategory = main + "subSpecializations"
    
    // WishList
    
    ///GET{}
    static let wishlist = main + "wishlist"
    ///POST{favorite_id}
    static let addToWishlist = main + "like-dislike"
    
    ///GET{}
    static let methodsList = main + "method-list"
    ///POST{online}
    static let methodCreate = main + "create-method"
    
    
    // Home
    /// GET{}
    static let home = main + "home"
    
    // City
    /// GET{}
    static let city = main + "city-list"

    // Area
    ///POST{cityID}
    static let area = main + "area-list"
    
    // Course
    
    ///GET()
    static let getCourses = main + "my-courses"
    ///POST{course_ID}
    static let courseSubscribe = main + "course-subscrib"
}
