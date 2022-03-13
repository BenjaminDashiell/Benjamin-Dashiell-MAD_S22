//
//  RecipeHandler.swift
//  firebaseFollowAlong
//
//  Created by BenD on 3/8/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class RecipeHandler{
    let db = Firestore.firestore() //referencing the firestone via the GoogleService file
    var recipeData = [Recipe]()
    
    func getFirebaseData() async{
        do{
            let snapshot = try await db.collection("recipes").getDocuments()
            self.recipeData = snapshot.documents.compactMap{document->Recipe? in
                return try? document.data(as:Recipe.self)}
        print(self.recipeData)
        }
        catch{
            print("error fetching document: \(error.localizedDescription)")
        }
        //NOTE: If a document doesn't match the structure of your struct, then it won't return. Would have to handle that.
    }
    
    func getRecipes()->[Recipe]{
        return recipeData
    }
    
    func addRecipe(name: String, url:String){
        let recipeCOllection = db.collection("recipes")
    }
}
