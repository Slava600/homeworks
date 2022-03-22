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
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}



