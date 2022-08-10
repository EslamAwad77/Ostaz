//
//  HomeResponseModel.swift
//  Ostaz
//
//  Created by eslam awad elsayed awad on 24/07/2022.
//

import Foundation

struct HomeResponse {
    var message: String?
    var homeCategory: [HomeCategoryModel]?
    var homeMostViewed: [HomeMostViewedModel]?
    var homePaidInstructor: [HomeMostViewedModel]?
}
