//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetsCollectionViewController: UICollectionViewController {
    
    @IBAction func unwindToPlanetsVC(_ sender: UIStoryboardSegue) { }
    
    //MARK: - properties
    
    let planetController = PlanetController()
    //computed property = does not have a stored value. Its a code that gets run every time that property is accessed.
    var planets: [Planet] {
        let shouldShowPluto = UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
        var result = planetController.planets
        //if its true.
        if shouldShowPluto {
            result.append(Planet(name: "Pluto", imageName: "pluto"))
        }
       // return planetController.planets
        return result
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return planets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "planetCell", for: indexPath) as! PlanetCollectionViewCell
        
        let planet = planets[indexPath.item]
        
        cell.imageView.image = planet.image
        cell.textLabel.text = planet.name
    
        return cell
    }
    
   
    
}
