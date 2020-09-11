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

let all = Applications(list: ["Apple Logo", "Google Logo", "Nat-Geo Logo", "Adidas Logo", "Twitter Logo", "Pepsi Logo", "Firefox Logo", "Website Layout", "Poster Shapes","The Parthenon","Taj Mahal","The Great Pyramid","Notre Dame","Great Mosque of Kairouan","Stupa of Borobudur","The Temple of zeus","Car Manufacturing","Clock Angles","Face Detection","Fibonacci sequence","Monalisa","Bathers at Asnières","Piet Mondrian's Composition", "The Sacrament of the Last Supper","Violin","Piano","Shankh","Notes","Stock Market","Fibonacci Retracements","Rose","Human","Sea Shell", "Waves","Butterfly","The Golden Triangle","Unit circle"],
                       images: [UIImage(named: "design-apple"),
UIImage(named: "design-google"),
UIImage(named: "design-natgeo"),
UIImage(named: "design-adidas"),
UIImage(named: "design-twitter"),
UIImage(named: "design-pepsi"),
UIImage(named: "design-firefox"),
UIImage(named: "design-layout"),
UIImage(named: "design-poster"),UIImage(named: "arch-parthenon"), UIImage(named: "arch-tj"),UIImage(named: "arch-pyr"),
UIImage(named: "arch-notre"),
UIImage(named: "arch-kairouan"),
UIImage(named: "arch-borobudur"),
UIImage(named: "arch-zeus"), UIImage(named: "eng-am"), UIImage(named: "eng-clock"),UIImage(named: "eng-fd"), UIImage(named: "eng-fibo"),UIImage(named: "art-monalisa"), UIImage(named: "art-bathers"), UIImage(named: "art-pm"), UIImage(named: "art-sacrament"), UIImage(named: "mus-violin"), UIImage(named: "mus-piano"),UIImage(named: "mus-shankh"), UIImage(named: "mus-notes"), UIImage(named: "fin-stock"), UIImage(named: "fin-fibo"), UIImage(named: "nat-rose"), UIImage(named: "nat-human"),UIImage(named: "nat-shell"), UIImage(named: "nat-wave"),UIImage(named: "nat-bf"),UIImage(named: "mat-t"), UIImage(named: "mat-uc")
])

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

let architecture = Applications(list: ["The Parthenon","Taj Mahal","The Great Pyramid","Notre Dame","Great Mosque of Kairouan","Stupa of Borobudur","The Temple of zeus"], images: [UIImage(named: "arch-parthenon"), UIImage(named: "arch-tj"),UIImage(named: "arch-pyr"),
UIImage(named: "arch-notre"),
UIImage(named: "arch-kairouan"),
UIImage(named: "arch-borobudur"),
UIImage(named: "arch-zeus")])

let engineering = Applications(list: ["Car Manufacturing","Clock Angles","Face Detection","Fibonacci sequence"], images: [UIImage(named: "eng-am"), UIImage(named: "eng-clock"),UIImage(named: "eng-fd"), UIImage(named: "eng-fibo")])

let art = Applications(list: ["Monalisa","Bathers at Asnières","Piet Mondrian's Composition", "The Sacrament of the Last Supper"], images: [UIImage(named: "art-monalisa"), UIImage(named: "art-bathers"), UIImage(named: "art-pm"), UIImage(named: "art-sacrament")])

let music = Applications(list: ["Violin","Piano","Shankh","Notes"], images: [UIImage(named: "mus-violin"), UIImage(named: "mus-piano"),UIImage(named: "mus-shankh"), UIImage(named: "mus-notes")])

let finance = Applications(list: ["Stock Market","Fibonacci Retracements"], images: [UIImage(named: "fin-stock"), UIImage(named: "fin-fibo")])

let nature = Applications(list: ["Rose","Human","Sea Shell", "Waves","Butterfly"], images: [UIImage(named: "nat-rose"), UIImage(named: "nat-human"),UIImage(named: "nat-shell"), UIImage(named: "nat-wave"),UIImage(named: "nat-bf")])

let math = Applications(list: ["The Golden Triangle","Unit circle"], images: [UIImage(named: "mat-t"), UIImage(named: "mat-uc")])

let listing = [all, design, architecture, engineering, art, music, finance,nature,math]
