//
//  ViewController.swift
//  Recipe
//
//  Created by Aidan Zerwer on 2017-12-03.
//  Copyright © 2017 Aidan Zerwer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var ingredientList: UITextView!
    @IBOutlet weak var directionList: UITextView!
    @IBOutlet weak var selectedSegment: UISegmentedControl!
    
    var tempIndex = 0
    var cardElements = ["", "", "", "", "", "", "", "", "", "", "", ""]

    let editImage = EditImage()
    
    // Text boxes to enter recipe details
    @IBAction func sectionSelector(_ sender: UISegmentedControl) {
        cardElements[3 * tempIndex] = recipeName.text!
        cardElements[3 * tempIndex + 1] = ingredientList.text!
        cardElements[3 * tempIndex + 2] = directionList.text!
        
        (recipeName.text!, ingredientList.text!, directionList.text!, tempIndex) =
            (cardElements[3 * sender.selectedSegmentIndex],
             cardElements[3 * sender.selectedSegmentIndex + 1],
             cardElements[3 * sender.selectedSegmentIndex + 2],
             sender.selectedSegmentIndex)
    }
    
    // Resets recipes
    @IBAction func newButton(_ sender: UIButton) {
        let saveAlert = UIAlertController(title: "Warning!", message: "All unsaved progress will be deleted!", preferredStyle: UIAlertControllerStyle.alert)
        
        saveAlert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {action in self.new()}))
        saveAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(saveAlert, animated: true, completion: nil)
    }
    
    // Saves the recipe(s) as an image
    @IBAction func saveButton(_ sender: UIButton) {
        let saveAlert = UIAlertController(title: "Warning!", message: "Once saved, you cannot edit the saved version!", preferredStyle: UIAlertControllerStyle.alert)
        
        saveAlert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {action in self.save()}))
        saveAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(saveAlert, animated: true, completion: nil)
    }
    
    // Prints the image created
    @IBAction func printButton(_ sender: UIButton) {
        let printController = UIPrintInteractionController.shared
        let printInfo = UIPrintInfo(dictionary:nil)
        
        printInfo.jobName = "Printing recipe"
        printInfo.outputType = .general
        
        printController.printInfo = printInfo
        printController.printingItem = editImage.recipeToImage(recipe : cardElements)
        printController.present(animated: true)  { (_, isPrinted, error) in if error == nil {}
        }
    }
    
    func save(){
        cardElements[3 * selectedSegment.selectedSegmentIndex] = recipeName.text!
        cardElements[3 * selectedSegment.selectedSegmentIndex + 1] = ingredientList.text!
        cardElements[3 * selectedSegment.selectedSegmentIndex + 2] = directionList.text!
        UIImageWriteToSavedPhotosAlbum(editImage.recipeToImage(recipe : cardElements), nil, nil, nil)
    }
    
    func new(){
        (tempIndex, cardElements, selectedSegment.selectedSegmentIndex, recipeName.text!, ingredientList.text!, directionList.text!) =
            (0, ["", "", "", "", "", "", "", "", "", "", "", ""], 0, "", "", "")
    }
    
    func print(){

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        recipeName.layer.borderWidth = 1
        recipeName.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        ingredientList!.layer.borderWidth = 1
        ingredientList!.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        directionList!.layer.borderWidth = 1
        directionList!.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

