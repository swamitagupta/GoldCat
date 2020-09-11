//
//  NewsData.swift
//  goldenRatioApp
//
//  Created by Swamita on 11/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import Foundation
import UIKit

struct NewsData: Codable {
    var articles: [Articles]
}

struct Articles: Codable {
    var title: String
    var description: String
    var url: String
}
