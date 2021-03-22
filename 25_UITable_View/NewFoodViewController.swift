//
//  NewFoodViewController.swift
//  25_UITable_View
//
//  Created by Pham Toan on 19/03/2021.
//

import UIKit

class NewFoodViewController: UIViewController,
                             UIImagePickerControllerDelegate ,
                             UINavigationControllerDelegate,
                             UITextFieldDelegate
                             {

    @IBOutlet weak var txtFoodName : UITextField!
    @IBOutlet weak var imageName : UIImageView!
    @IBOutlet weak var rating : UILabel!

    var newFood : Food = Food()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tabGestureToImageView = UITapGestureRecognizer(target: self, action: #selector(tapToImageView(sender:)))
        tabGestureToImageView.numberOfTapsRequired = 1
        imageName.isUserInteractionEnabled = true
        imageName.addGestureRecognizer(tabGestureToImageView)
        
        //pan to ranting
        
        let panGestureToRating = UIPanGestureRecognizer(target: self, action: #selector(panInRating(sender:)))
        rating.isUserInteractionEnabled = true;
        rating.addGestureRecognizer(panGestureToRating)
        
        // tap to rating
        
        let tapGestureToRating = UITapGestureRecognizer(target: self, action: #selector(panInRating(sender:)))
        rating.addGestureRecognizer(tapGestureToRating)
        tapGestureToRating.numberOfTapsRequired = 1

    }
    
   
    
    
    // pick image from photo
    @objc func tapToImageView(sender:UIGestureRecognizer){
        let pickController = UIImagePickerController()
        pickController.delegate = self;
        pickController.allowsEditing = true;
        pickController.sourceType = .photoLibrary
        self.present(pickController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chooseImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as! UIImage
        imageName.image = chooseImage
        newFood.image = chooseImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    // pan or tap rating 
    @objc func panInRating(sender:UIGestureRecognizer){
        let locationInView = sender.location(in: view.self)
        let newLabelRatingFramce = self.view.convert(rating.frame, from: rating.superview)
        
        let frame1 = CGRect(x: newLabelRatingFramce.origin.x,
                            y: newLabelRatingFramce.origin.y,
                            width: newLabelRatingFramce.size.width/5,
                            height: newLabelRatingFramce.size.height)
        let frame2 = CGRect(x: newLabelRatingFramce.origin.x,
                            y: newLabelRatingFramce.origin.y,
                            width:2 * newLabelRatingFramce.size.width/5,
                            height: newLabelRatingFramce.size.height)
        let frame3 = CGRect(x: newLabelRatingFramce.origin.x,
                            y: newLabelRatingFramce.origin.y,
                            width:3 * newLabelRatingFramce.size.width/5,
                            height: newLabelRatingFramce.size.height)
        let frame4 = CGRect(x: newLabelRatingFramce.origin.x,
                            y: newLabelRatingFramce.origin.y,
                            width:4 * newLabelRatingFramce.size.width/5,
                            height: newLabelRatingFramce.size.height)
        let frame5 = CGRect(x: newLabelRatingFramce.origin.x,
                            y: newLabelRatingFramce.origin.y,
                            width:5 *  newLabelRatingFramce.size.width/5,
                            height: newLabelRatingFramce.size.height)
        if frame1.contains(locationInView){
            rating.text = "★☆☆☆☆"
            newFood.rating = 1
        } else if frame2.contains(locationInView){
            rating.text = "★★☆☆☆"
            newFood.rating = 2

        }else if frame3.contains(locationInView){
            rating.text = "★★★☆☆"
            newFood.rating = 3

        }else if frame4.contains(locationInView){
            rating.text = "★★★★☆"
            newFood.rating = 4

        }else if frame5.contains(locationInView){
            rating.text = "★★★★★"
            newFood.rating = 5

        }
        
    }

    @IBAction func btnSave (_ sender : UIButton){
        if (newFood.image == nil || newFood.rating == nil || newFood.foodName?.count == 0 ){
           let alertController = UIAlertController(title: "Alert", message: "please full info ", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Yes", style: .default)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            foods.append(newFood)


//            foods.append(newFood)
            navigationController?.popViewController(animated: true)
            let mainViewController = self.navigationController?.topViewController as? MainViewController
            mainViewController?.tableViewAAA?.reloadData()
        }
    }
    
    
    // MARk UItextFieldDelegate
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        newFood.foodName = txtFoodName.text
//        newFood.description = "huhuhuhhuh"

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
