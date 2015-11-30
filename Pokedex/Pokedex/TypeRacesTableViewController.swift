import UIKit

class TypeRacesTableViewController: UITableViewController {
    
    var pokedexModel = PokedexModel()
    var type : Type?
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return type!.races.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Race Cell", forIndexPath: indexPath)
        
        let race = type!.races[indexPath.row]
        
        cell.imageView?.image = UIImage(named: race.icon)
        cell.textLabel?.text = race.name.capitalizedString
        cell.detailTextLabel?.text = race.code
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return type!.name.capitalizedString
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Web Info" {
            
            if let nc = segue.destinationViewController as? UINavigationController,
                let wvc = nc.topViewController as? WebViewController,
                let cell = sender as? UITableViewCell,
                let ip = tableView.indexPathForCell(cell) {
                    
                    wvc.race = type!.races[ip.row]
                    
                    wvc.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    wvc.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
}
