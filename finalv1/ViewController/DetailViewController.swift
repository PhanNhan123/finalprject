import UIKit
class DetailViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let  defaults = UserDefaults.standard
        if let name  = defaults.string(forKey: "userNamekey"){
            print(name)
        }
        print("detailviewcontroller")
    }
}

