//
//  GeneralSettings.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 28.02.2022.
//
import UIKit

protocol ImageZoomable {
    func performZoomInForImageView(_ imageView: UIImageView)
}


struct Const {
    
    static let leadingMargin: CGFloat = 16
    static let trailingMargin: CGFloat = -16
    static let indent: CGFloat = 16
}

extension UIView {

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

let galeryPhotos = [UIImage(named:"1")!, UIImage(named:"2")!, UIImage(named:"3")!, UIImage(named:"4")!, UIImage(named:"5")!, UIImage(named:"6")!, UIImage(named:"8")!, UIImage(named:"9")!, UIImage(named:"10")!, UIImage(named:"11")!, UIImage(named:"12")!, UIImage(named:"13")!, UIImage(named:"14")!, UIImage(named:"15")!, UIImage(named:"16")!, UIImage(named:"17")!, UIImage(named:"18")!, UIImage(named:"19")!, UIImage(named:"20")!]


