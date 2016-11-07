//
//  Meal.swift
//  FoodMeal
//
//  Created by Mac on 16/10/7.
//  Copyright © 2016年 Mac. All rights reserved.
//

import UIKit

class Meal:NSObject,NSCoding {
    // MARK: Properties
    
    //MARK:Achieving paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")

    
    //MARK:types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
        
        static let commentKey = "comment"
    }
    
    var name: String
    var photo: UIImage?
    var rating: Int
    var comment: String
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int, comment: String) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        self.comment = comment
        super.init()
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    //MARK:NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name,forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo,forKey: PropertyKey.photoKey)
        aCoder.encodeObject(rating,forKey: PropertyKey.ratingKey)
        aCoder.encodeObject(comment,forKey: PropertyKey.commentKey)
    }
    required convenience init?(coder aDeCoder:NSCoder){
        let name = aDeCoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDeCoder.decodeObjectForKey(PropertyKey.photoKey) as! UIImage
        let rating = aDeCoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        let comment = aDeCoder.decodeObjectForKey(PropertyKey.commentKey) as! String
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating,comment: comment)
    }
    }
