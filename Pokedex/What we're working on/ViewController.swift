//
//  ViewController.swift
//  Pokedex
//
//  Created by John Gallaugher on 4/3/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Create the table view outlet here!
    
    //Making data the easy way:
    let pokemon = ["Bulbasaur", "Charmander", "Squirtle", "Pikachu", "Rayquaza", "Latios"]
    
    //IF YOU WANT TO USE REAL API DATA:
    //Initialize the Pokemon class - we're going to be working with the code there.
//    var pokemon = Pokemon()
    

    
    //This function just does whatever needs to be done once the scene loads.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make sure that the table view is connected to the code we're going to write.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Download the data from the API:
        //Reload the table view
//        pokemon.getPokemon {
//            self.tableView.reloadData()
//        }
    }
    
    //Prepare for the segue to the detail view.
    //We're going to pass the information from the row we clicked on to the next scene.
    //We'll put it into the variable "pokeData" that the next scene has.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // let destination = ???
        // let selectedIndex = ???
        // destination.pokeData???
    }
}












//We'll use an extension to keep things organized here.
//We need to subclass this VC to tell our program that it's also responsible for the table view.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //You need to tell the table how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //return number of rows
    }
    
    
    //What is going in each row?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // What is the cell.textLabel?.text?
        //Return the cell once you're done.
    }
}

