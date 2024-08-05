//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Mahmoud Elshahawy on 24/07/2024.
//

import Foundation



extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}
