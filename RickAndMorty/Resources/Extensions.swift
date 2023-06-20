//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Teja on 20/06/23.
//

import Foundation
import UIKit

extension UIView{
    func addSubViews(_ views:UIView...){
        views.forEach({
            self.addSubview($0)
        })
    }
}
