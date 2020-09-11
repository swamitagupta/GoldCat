//
//  NewsModel.swift
//  goldenRatioApp
//
//  Created by Swamita on 11/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//
import UIKit
import Foundation

struct NewsModel {
    var title: String
    var description: String
    var url: String
}

struct FetchedModel {
    var titles: [String]
    var descriptions: [String]
    var urls: [String]
}
