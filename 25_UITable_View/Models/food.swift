//
//  food.swift
//  25_UITable_View
//
//  Created by Pham Toan on 19/03/2021.
//

import Foundation
import UIKit

class Food {
    var imageName:String?
    var foodName:String?
    var image: UIImage?
    var rating : Int?
    var description : String?
    convenience init(imageName:String , foodName:String , rating : Int , description : String ){
        self.init()
        self.foodName = foodName
        self.imageName = imageName;
        self.rating = rating;
        self.description = description
        
        
    }
}
