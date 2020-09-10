//
//  Applications.swift
//  goldenRatioApp
//
//  Created by Swamita on 10/09/20.
//  Copyright © 2020 Swamita Gupta. All rights reserved.
//

import Foundation

struct Applications {
    var list: [String]
}

let design = Applications(list: ["Apple Logo", "Nike Logo"])
let architecture = Applications(list: ["The Parthenon","Great Mosque of Kairouan","Naqsh-e Jahan Square"])
let engineering = Applications(list: ["Fibonacci sequence","Symmetries"])
let art = Applications(list: ["Vitruvian Man","Divina proportione","The Sacrament of the Last Supper"])
let music = Applications(list: ["Sonneries de la Rose+Croix","Reflets dans l'eau"])
let finance = Applications(list: ["Sonneries de la Rose+Croix","Reflets dans l'eau"])
let nature = Applications(list: ["Man and woman","Plants","cobalt niobate crystals"])
let math = Applications(list: ["Irrationality","Geometry"])
let pyramids = Applications(list: ["Mathematical Pyramids","Egyptian Pyramids"])

let listing = [design, architecture, engineering, art, music, finance,nature,math,pyramids]
