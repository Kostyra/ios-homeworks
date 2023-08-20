import UIKit

//MARK: - extasion
extension UIColor {
    static func createColor(lightMode:UIColor , darkMode:UIColor) ->  UIColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light  ? lightMode : darkMode
        }
    }
}

extension CGColor {
    static func createColor(lightMode:CGColor , darkMode:CGColor) ->  CGColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? UIColor(cgColor: lightMode) : UIColor(cgColor: darkMode)
        }.cgColor
    }
}

 
