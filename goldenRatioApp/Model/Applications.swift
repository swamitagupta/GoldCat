//
//  Applications.swift
//  goldenRatioApp
//
//  Created by Swamita on 10/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//
import UIKit
import Foundation

struct Applications {
    var list: [String]
    var images: [UIImage?]
}

let design = Applications(list: ["Apple Logo", "Google Logo", "Nat-Geo Logo", "Adidas Logo", "Twitter Logo", "Pepsi Logo", "Firefox Logo", "Website Layout", "Poster Shapes"], images: [UIImage(named: "design-apple"),
UIImage(named: "design-google"),
UIImage(named: "design-natgeo"),
UIImage(named: "design-adidas"),
UIImage(named: "design-twitter"),
UIImage(named: "design-pepsi"),
UIImage(named: "design-firefox"),
UIImage(named: "design-layout"),
UIImage(named: "design-poster")
])

let architecture = Applications(list: ["The Parthenon","Taj Mahal","Notre Dame","Great Mosque of Kairouan","Stupa of Borobudur","The Temple of zeus"], images: [UIImage(named: "arch-parthenon"), UIImage(named: "arch-tj"),
UIImage(named: "arch-notre"),
UIImage(named: "arch-kairouan"),
UIImage(named: "arch-borobudur"),
UIImage(named: "arch-zeus")])

let engineering = Applications(list: ["Fibonacci sequence","Symmetries"], images: <#T##[UIImage]#>)
let art = Applications(list: ["Fibonacci sequence","Symmetries"], images: <#T##[UIImage]#>)
let music = Applications(list: ["Fibonacci sequence","Symmetries"], images: <#T##[UIImage]#>)
let finance = Applications(list: ["Fibonacci sequence","Symmetries"], images: <#T##[UIImage]#>)
let nature = Applications(list: ["Fibonacci sequence","Symmetries"], images: <#T##[UIImage]#>)
let math = Applications(list: ["Fibonacci sequence","Symmetries"], images: <#T##[UIImage]#>)
let pyramids = Applications(list: ["Fibonacci sequence","Symmetries"], images: <#T##[UIImage]#>)

let listing = [design, architecture, engineering, art, music, finance,nature,math,pyramids]
