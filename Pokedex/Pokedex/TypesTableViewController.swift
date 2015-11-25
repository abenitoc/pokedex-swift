//
//  RacesTableViewController.swift
//  Pokedex
//
//  Created by Santiago Pavón on 11/11/15.
//  Copyright © 2015 UPM. All rights reserved.
//

import UIKit

class TypesTableViewController: UITableViewController {

    var pokedexModel = PokedexModel()

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.clearsSelectionOnViewWillAppear = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedexModel.types.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Type Cell", forIndexPath: indexPath)

        let type = pokedexModel.types[indexPath.row]
        
        cell.textLabel?.text = type.name.capitalizedString
        cell.detailTextLabel?.text = String(type.races.count)
        
        return cell
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tipos de Pokemon"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Concrete Races" {

            if let nc = segue.destinationViewController as? UINavigationController,
                let r2 = nc.topViewController as? TypeRacesTableViewController,
                let cell = sender as? UITableViewCell,
                let ip = tableView.indexPathForCell(cell) {

                    let type = pokedexModel.types[ip.row]
                    r2.type = type
                    r2.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    r2.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

}
