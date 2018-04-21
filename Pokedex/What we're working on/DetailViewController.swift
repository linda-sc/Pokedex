//
//  DetailViewController.swift
//  Pokedex
//
//  Created by John Gallaugher on 4/3/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import UIKit

//This class is responsible for the detailed descriptions of each Pokemon.
class DetailViewController: UIViewController {
    //IB Outlets here:

    
    
    //Variable holds the individual data that got passed over
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the labels here.

        
        //This variable stores the current Pokemon we're looking at.
        let pokeData = PokeData()
        
        //CLOSURE RIGHT HERE!
        //We're using our escaping function to download the pokemon's info.
        //We are pocketing the updateUI function inside here.
        //This way, the interface won't update until the data is done downloading.
        pokeData.getPokemon {
            
            self.updateUserInterface()
        }
    }

    func updateUserInterface() {
        
        //Update height and weight labels!

        
        // code for reading in a url and displaying in an image
//        guard let imageURL = URL(string: pokeData.imageURL) else { return }
//        do {
//            let data = try Data(contentsOf: imageURL)
//            //We have to set our image view to the image we downloaded:
//            //pokemonImage.image = UIImage(data: data)
//        } catch {
//            print("**** ERROR: error thrown trying to get data from URL \(imageURL)")
//        }
    }
    
}
