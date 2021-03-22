//
//  MainViewController.swift
//  25_UITable_View
//
//  Created by Pham Toan on 18/03/2021.
//

import UIKit



class MainViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableViewAAA: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodTableViewCell
        let food : Food = foods[indexPath.row]
        if food.image == nil {
            cell.imageFood.image = UIImage(named: food.imageName!)
        }else{
            cell.imageFood.image = food.image
        }
        cell.foodName.text = food.foodName
        cell.foodDescipt.text = food.description
        cell.foodRate.text = ""
        
        
        for _ in 1...(food.rating ?? 1){
            cell.foodRate.text! += "🥰"
        }
        return cell
    }
    // update and delete a item
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click",indexPath.row)
    }

    
    

}
