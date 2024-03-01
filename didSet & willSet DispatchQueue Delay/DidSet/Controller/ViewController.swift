//
//  ViewController.swift
//  DidSet
//
//  Created by RMP on 07/01/1445 AH.
//

import UIKit




class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let observer = Observer(value: ["Apple", "Microsoft", "Cisco", "IBM", "Google"])
    let newCompanies = ["LG", "CHIGO", "Dell", "E Corp", "Ascer"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Observer Stuff
        
        for time in 3...10 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(time), execute: DispatchWorkItem(block: {
                
                self.observer.value.append(self.newCompanies.randomElement()!)
                self.tableView.reloadData()
                
            }))
            
        }
        
//        observer.addNewElement { newArray in
//            
//            print("the new array is: \(newArray)")
//            
//             
//        }
        
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return observer.value.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = observer.value[indexPath.row]
        
        return cell
        
    }
    
    
    
    
}
