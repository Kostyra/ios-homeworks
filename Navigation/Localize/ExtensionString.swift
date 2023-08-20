//
//  ExtasionString.swift
//  Navigation
//
//  Created by Юлия Филиппова on 17.08.2023.
//

import Foundation



extension String {
    var localized: String {
        NSLocalizedString(self, comment: self)
    }
}
