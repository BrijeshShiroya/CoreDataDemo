//
//  ViewController.swift
//  DemoCoreData
//
//  Created by Brijesh on 28/05/18.
//  Copyright © 2018 Brijesh. All rights reserved.
//

import UIKit
import CoreData
let AppDelegateObj = UIApplication.shared.delegate as! AppDelegate
class ViewController: UIViewController {

    var people:[NSManagedObject] = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSaveClicked(_ sender: UIButton) {
        let managedContext  = AppDelegateObj.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        let person:NSManagedObject = NSManagedObject.init(entity: entity!, insertInto: managedContext)
        person.setValue("Brijesh", forKey: "name")
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
}

