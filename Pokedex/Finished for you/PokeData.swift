//
//  PokeData.swift
//  Pokedex
//
//  Created by John Gallaugher on 4/3/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import Foundation
//There might be an error here, but ignore it; the code will still run.
import Alamofire
import SwiftyJSON

class PokeData {
    //Imagine this as a "Pokemon Object" - Each Pokemon has this information.
    //This represents an individual pokemon with all of its specific information.
    var name = ""
    var weight = 0.0
    var height = 0.0
    var imageURL = ""
    var url = ""
    
    
    //Each pokemon should be able to get its information from its individual URL.
    //If we want our function to force other code to wait for it to finish, this is how we do it.
    //Later, when we reference this function, we can pocket other code inside it.
    //This makes sure that our other code doesn't go until this is finished.
    func getPokemon(completed: @escaping () -> ()) {
        //Use Alamofire to call the url for JSON data
        Alamofire.request(self.url).responseJSON {response in
            switch response.result {
            //If everything goes smoothly...
            case .success(let value):
                let json = JSON(value)
                //Put the JSON data straight into our data variables for this particular Pokemon
                self.height = json["height"].doubleValue
                self.weight = json["weight"].doubleValue
                self.imageURL = json["sprites"]["front_default"].stringValue
            //If something goes wrong...
            case .failure(let error):
                print("*** ERROR: failed to get data from url \(self.url) \(error.localizedDescription)")
            }
            //This is an escaping function that downloads data from the internet.
            //Since this takes longer than normal code, we use the line "completed()."
            //That tells us that the function call is officially finished.
            //Then we can make sure that we only work with the data after it has been downloaded.
            completed()
        }
    }
}
