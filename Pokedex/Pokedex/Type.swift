
import Foundation


class Type {
    
    var name: String
    
    var races: [Race]
    
    var type_icon: String
    
    init(name: String, races: [Race], type_icon: String) {
        
        self.name = name
        self.races = races
        self.type_icon = type_icon
    }
    
}
