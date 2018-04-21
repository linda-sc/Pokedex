//
//  Pokemon.swift
//  Pokedex
//
//  Created by John Gallaugher on 4/3/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon {
    
    //We need this to store basic reference information in the table.
    struct PokeReferenceData {
        var name = ""
        var url = ""
    }
    
    //We we have an array of all the names and their urls.
    var pokeArray: [PokeReferenceData] = []
    
    //We need this URL to reference the API
    let pokemonURL = "https://pokeapi.co/api/v2/pokemon/"
    
    
    //This escaping function downloads all the names and individual URLs from the main URL.
    //If we want our function to force other code to wait for it to finish, this is how we do it.
    //Later, when we reference this function, we can pocket other code inside it.
    //This makes sure that the other code doesn't go until this is finished.
    func getPokemon(completed: @escaping () -> ()) {
        //We request data from the main URL here
        Alamofire.request(pokemonURL).responseJSON {response in
            switch response.result {
            //If everything goes smoothly...
            case .success(let value):
                //Cast the data as a JSON object so we can work with the info
                let json = JSON(value)
                let numberOfPokemon = json["results"].count
                
                //For all the Pokemon that we downloaded...
                for index in 0...numberOfPokemon - 1 {
                    
                    let name = json["results"][index]["name"].stringValue
                    let url = json["results"][index]["url"].stringValue
                    
                    //Turn the info into a piece of PokeReferenceData and add it to our array.
                    self.pokeArray.append(PokeReferenceData(name: name, url: url))
                    print(">>> Data check, \(index) \(name) \(url)")
                }
            
            //If something goes wrong...
            case .failure(let error):
                
                print("*** ERROR: failed to get data from url \(self.pokemonURL) \(error.localizedDescription)")
            }
            
            //This is an escaping function that downloads data from the internet.
            //Since this takes longer than normal code, we use the line "completed()."
            //That tells us that the function call is officially finished.
            //Then we can make sure that we only work with the data after it has been downloaded.
            completed()
        }
        
    }
}
