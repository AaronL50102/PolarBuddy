import SwiftUI
//import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

@MainActor class User: ObservableObject {
    @Published var name: String = ""
    @Published var polarName: String = ""
    @Published var age: Int = 18
    //    @Published var polarName: String = ""
    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var subscribe: Bool = false
    @Published var uid: String = ""
    @Published var loggedIn: Bool = false
    @Published var waterBottle: Int = 79
    @Published var aluminumCan: Int = 68
    @Published var cardboard: Int = 57
    @Published var groceryBag: Int = 46
    @Published var hasScarf: Bool = false
    @Published var hasHat: Bool = false
    @Published var hasGlasses: Bool = false
    @Published var hasBag: Bool = false
    @Published var hasIceberg: Bool = false
    @Published var hasFlowers: Bool = false
    @Published var hasSkirt: Bool = false
    @Published var hasWatch: Bool = false
    @Published var hasNecklace: Bool = false
    @Published var points: Int = 0
    @Published var stars: Int = 0
    
    init(emailAddress: String = "", password: String = "", polarName: String = "") {
    }
    
    
    init(emailAddress: String = "", password: String = "", polarName: String = "", uid: String = "") {
        
        self.emailAddress = emailAddress
        self.password = password
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        self.uid = uid
        self.loggedIn = false
        self.subscribe = false
    }
    
    func setHasScarf(bool: Bool) -> Void {
        hasScarf = bool
    }
    
    func setHasHat(bool: Bool) -> Void {
        hasHat = bool
    }
    
    func setHasGlasses(bool: Bool) -> Void {
        hasGlasses = bool
    }
    
    func setHasBag(bool: Bool) -> Void {
        
        hasBag = bool
        
    }
    func setHasIceberg(bool: Bool) -> Void {
        
        hasIceberg = bool
        
    }
    func setHasFlower(bool: Bool) -> Void {
        
        hasFlowers = bool
        
    }
    func setHasSkirt(bool: Bool) -> Void {
        
        hasSkirt = bool
        
    }
    func setHasWatch(bool: Bool) -> Void {
        
        hasWatch = bool
        
    }
    func setHasNecklace(bool: Bool) -> Void {
        
        hasNecklace = bool
        
    }
    
    func co2Emissions() -> Double {
        return Double(self.waterBottle) * 0.84 + Double(self.aluminumCan) * 0.097 + Double(self.cardboard) * 1.81 + Double(self.groceryBag) * 1.58
    }
    
    func addBottle() -> Void {
        self.waterBottle += 1
        self.points += 15
        
        // update database
        Database.database().reference().child("user/\(uid)/bottles").setValue(waterBottle)
        Database.database().reference().child("user/\(uid)/points").setValue(points)
        
    }
    
    //Temporary test function
    func getBottle() -> Int {
        return self.waterBottle
    }
    
    func addCan() -> Void {
        self.aluminumCan += 1
        self.points += 10
        
        // update database
        Database.database().reference().child("user/\(uid)/aluminumCan").setValue(aluminumCan)
        Database.database().reference().child("user/\(uid)/points").setValue(points)
    }
    
    func addCardboard() -> Void {
        self.cardboard += 1
        self.points += 20
        
        // update database
        Database.database().reference().child("user/\(uid)/cardboard").setValue(cardboard)
        Database.database().reference().child("user/\(uid)/points").setValue(points)
        
    }
    
    func addBag() -> Void {
        self.groceryBag += 1
        self.points += 5
        
        // update database
        Database.database().reference().child("user/\(uid)/groceryBag").setValue(groceryBag)
        Database.database().reference().child("user/\(uid)/points").setValue(points)
    }
    
    func subtractStars(numStars: Int) -> Void {
        self.stars -= numStars
        Database.database().reference().child("user/\(uid)/stars").setValue(stars)
        
    }
    
    func updateStars() -> Void {
        if points >= 100 {
            self.points = points % 100
            self.stars += 1
            
            // update database
            Database.database().reference().child("user/\(uid)/points").setValue(points)
            Database.database().reference().child("user/\(uid)/stars").setValue(stars)
        }
    }
    
    func updateHat() -> Void {
        Database.database().reference().child("user/\(uid)/hasHat").setValue(hasHat)
    }
    
    func updateScarf() -> Void {
        Database.database().reference().child("user/\(uid)/hasScarf").setValue(hasScarf)
    }
    
    func updateGlasses() -> Void {
        Database.database().reference().child("user/\(uid)/hasGlasses").setValue(hasGlasses)
    }
    
    func updateBag() -> Void {
        Database.database().reference().child("user/\(uid)/hasBag").setValue(hasGlasses)
    }
    
    func updateIceberg() -> Void {
        Database.database().reference().child("user/\(uid)/hasIceberg").setValue(hasIceberg)
    }
    func updateFlowers() -> Void {
        Database.database().reference().child("user/\(uid)/hasFlowers").setValue(hasFlowers)
    }
    func updateSkirt() -> Void {
        Database.database().reference().child("user/\(uid)/hasSkirt").setValue(hasSkirt)
    }
    func updateWatch() -> Void {
        Database.database().reference().child("user/\(uid)/hasWatch").setValue(hasWatch)
    }
    func updateNecklacce() -> Void {
        Database.database().reference().child("user/\(uid)/hasNecklace").setValue(hasNecklace)
    }
    
    func challengeUpdate() -> Void {
        if waterBottle % 10 == 0 {
            points += 50
            updateStars()
        }
        if aluminumCan % 10 == 0 {
            points += 50
            updateStars()
        }
        if cardboard % 10 == 0 {
            points += 50
            updateStars()
        }
        if groceryBag % 10 == 0 {
            points += 50
            updateStars()
        }
        if (waterBottle + aluminumCan + cardboard + groceryBag) % 50 == 0 {
            points += 100
            updateStars()
        }
    }
    
    func totalRecycled() -> Int {
        return waterBottle + aluminumCan + cardboard + groceryBag
    }
    
    func getUserData() -> Void {
        print("it is being called")
        print(uid)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        self.uid = uid
        
        Task {
            print("running it is")
            
            //            guard let u = try? await Database.database().reference().child("user/\(uid)/uid").getData() else {return}
            //            self.uid = u.value as? String ?? ""
            
            guard let n = try? await Database.database().reference().child("user/\(uid)/name").getData() else {return}
            self.name = n.value as? String ?? ""
            
            guard let a = try? await Database.database().reference().child("user/\(uid)/age").getData() else {return}
            self.age = a.value as? Int ?? 18
            guard let p = try? await Database.database().reference().child("user/\(uid)/polarName").getData() else {return}
            
            self.polarName = p.value as? String ?? ""
            
            guard let w = try? await Database.database().reference().child("user/\(uid)/bottles").getData() else {
                print("it failed sorry :(")
                return
            }
            self.waterBottle = w.value as? Int ?? 0
            print("updated water bottles to \(self.waterBottle)" )
            guard let a = try? await Database.database().reference().child("user/\(uid)/aluminumCan").getData() else {return}
            self.aluminumCan = a.value as? Int ?? 0
            
            guard let c = try? await Database.database().reference().child("user/\(uid)/cardboard").getData() else {return}
            self.cardboard = c.value as? Int ?? 0
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/groceryBag").getData() else {return}
            self.groceryBag = g.value as? Int ?? 0
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasScarf").getData() else {return}
            self.hasScarf = g.value as? Bool ?? false
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasHat").getData() else {return}
            self.hasHat = g.value as? Bool ?? false
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasGlasses").getData() else {return}
            self.hasGlasses = g.value as? Bool ?? false
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasBag").getData() else {return}
            self.hasBag = g.value as? Bool ?? false
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasIceberg").getData() else {return}
            self.hasIceberg = g.value as? Bool ?? false
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasFlowers").getData() else {return}
            self.hasFlowers = g.value as? Bool ?? false
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasSkirt").getData() else {return}
            self.hasSkirt = g.value as? Bool ?? false
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasWatch").getData() else {return}
            self.hasWatch = g.value as? Bool ?? false
            
            guard let g = try? await Database.database().reference().child("user/\(uid)/hasNecklace").getData() else {return}
            self.hasNecklace = g.value as? Bool ?? false
            
            guard let p = try? await Database.database().reference().child("user/\(uid)/points").getData() else {return}
            self.points = p.value as? Int ?? 0
            
            guard let s = try? await Database.database().reference().child("user/\(uid)/stars").getData() else {return}
            self.stars = s.value as? Int ?? 0
        }
    }
}
