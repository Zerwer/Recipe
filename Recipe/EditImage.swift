//
//  EditImage.swift
//  Recipe
//
//  Created by Aidan Zerwer on 2017-12-03.
//  Copyright © 2017 Aidan Zerwer. All rights reserved.
//

import Foundation
import UIKit

class EditImage : UIImage{
    // Function takes the recipe strings and converts them to an image that can be printed and cut into cards
    func recipeToImage(recipe : [String]) -> UIImage{
        let fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let nameFont = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 36.0), NSAttributedStringKey.foregroundColor : fontColor] as [NSAttributedStringKey : Any]
        let recipeFont = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12.0), NSAttributedStringKey.foregroundColor : fontColor] as [NSAttributedStringKey : Any]
        let ingFont = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 11.0), NSAttributedStringKey.foregroundColor : fontColor] as [NSAttributedStringKey : Any]
        let indexX = [52, 52, 222, 534, 534, 702, 52, 52, 222, 534, 534, 702]
        let indexY = [120, 170, 170, 120, 170, 170, 410, 460, 460, 410, 460, 460]
        let indexW = [470, 170, 300, 470, 170, 300, 470, 170, 300, 470, 170, 300]
        let indexH = [50, 238, 238, 50, 238, 238, 50, 238, 238, 50, 238, 238]
        let indexF = [nameFont, ingFont, recipeFont, nameFont, ingFont, recipeFont, nameFont, ingFont, recipeFont, nameFont, ingFont, recipeFont]
        var i = 0
        let template = UIImage(named: "RecipeTemplate.png")

        //let rect = CGRect(origin: CGPoint(x: 52, y: 120), size: CGSize(width: 470, height: 50))
        
        UIGraphicsBeginImageContext(template!.size)
        
        
        template!.draw(at: CGPoint(x: 0,y: 0))
        //"Test".draw(in: rect, withAttributes: nameFont)
        
        while i < recipe.count{
            recipe[i].draw(in: CGRect(origin: CGPoint(x: indexX[i], y: indexY[i]), size: CGSize(width: indexW[i], height: indexH[i])), withAttributes: indexF[i])
            i += 1
        }
        
        let recipeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return recipeImage!
    }
    
}
