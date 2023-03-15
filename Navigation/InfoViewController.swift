

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Info"
        view.backgroundColor = .darkGray
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            let alertButton = UIAlertController(title: "Title", message: "Messsage", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default) {
                (actionOk) in
                if actionOk.title == "Ok" {
                    print("Ok")
                }
            }
            let actionNotOk = UIAlertAction(title: "Not Ok", style: .default) {
                (actionNotOk) in
                if actionNotOk.title == "Not Ok" {
                print("Not Ok")
                }
            }
           
            alertButton.addAction(actionOk)
            alertButton.addAction(actionNotOk)

            self.present(alertButton, animated: true, completion: nil)
        }
    
    

}
