//
//  TextPicker.swift
//  Navigation
//
//  Created by Юлия Филиппова on 05.07.2023.
//

import UIKit

final class TextPicker {
    static let defaultPicker = TextPicker()
    func showSingUpPicker(in viewController: UIViewController , complition: @escaping(String, String, String) ->()) {
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
            if let text1 = alert.textFields?[0].text,
               text1 != "",
               let text2 = alert.textFields?[1].text,
               text2 != "",
               let text3 = alert.textFields?[2].text,
               text3 != "" {
                complition(text1, text2, text3)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true)
        
    }
    
    private init() {}
}
