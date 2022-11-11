import UIKit
import CoreData

class  UserViewController : UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource{
    let tableViewData = Array(repeating: "Item", count: 5)
    var fetchedResultsController: NSFetchedResultsController<User>!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        var user : [NSManagedObject] = []
        super.viewDidLoad()
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"TableViewCell")
        //        tableView.dataSource = self
        //  NSUserDefault
        let  defaults = UserDefaults.standard
        defaults.set("Coding Explorer", forKey: "userNameKey")
        defaults.set("Coding Explorer 2",forKey:"userNameKey")
        defaults.set(true,forKey:"isActive")
        defaults.set(NSDate(),forKey:"currentDate")
        let friend = ["name1","name2"]
        defaults.set(friend, forKey: "friendname")
        if let name = defaults.string(forKey: "userNameKey")
        {
            print(name)
        }
        
        //        if let status  = defaults.bool(forKey: "isActive")
        //        {
        //            print("status: \(status)")
        //        }
        if let currentDate  = defaults.object(forKey: "currentDate")
        {
            print("currentDate: \(currentDate)")
        }
        if let friendname = defaults.object(forKey:"friendname") {
            print("friendname: \(friendname)")
        }
        
        
        // core data
        guard user != nil else{
            fatalError("This view need persistent container.")
        }
        
        
        save(title: "Tí", link: "link", image : "image")
        save(title: "Tèo", link: "link", image: "image")
        save(title: "Linh", link:"link", image: "image")
        save(title: "Trang", link: "link", image: "image")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int)-> Int{
        fetchedResultsController.fetchedObjects!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->  UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = fetchedResultsController.object(at: indexPath)
        
        cell.titleLabel.text = user.title
        cell.linkLabel.text = user.link
        cell.imageLable.text = user.image
        
        return cell
    }
    func  save(title: String, link: String, image: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext =  appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(title, forKey: "title")
        user.setValue(link, forKey: "link")
        user.setValue(image, forKey: "image")
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func initializeFetchedResultsController(){
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true   )]
        
        guard let appDelegate  = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        fetchedResultsController =  NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        do{
            try fetchedResultsController.performFetch()
        }catch{
            fatalError("Failed  to initialize FetchedResultsController: \(error)")
        }
    }
    
    

    
    /* note https://fxstudio.dev/basic-ios-tutorial-core-data/    */
    
}

