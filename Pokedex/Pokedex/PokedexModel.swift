import Foundation


class PokedexModel {
    
    var races: [Race]
    
    var types: [Type]
    
    init() {

        let path = NSBundle.mainBundle().pathForResource("pokemons", ofType: "plist")!
        
        let plist = NSDictionary(contentsOfFile: path)!
        
        let allNames = plist["nombres"]! as! [String:String]
        let allIcons = plist["iconos"]!  as! [String:String]
        let allTypes = plist["tipos"]!   as! [String:[Int]]
        let allTypeIcons = plist["icono_tipo"] as! [String:String]
        
        races = []
        for (code,name) in allNames {
            races.append(Race(code: code, name: name, icon: allIcons[code]!))
        }
        races.sortInPlace({ (race1:Race, race2:Race) -> Bool in
            return race1.name < race2.name
        })
        
        types = []
        for (name,raceCodes) in allTypes {
            var racesOfThisType: [Race] = raceCodes.map({ (code) -> Race in
                for race in self.races {
                    if race.code == "\(code)" {
                        return race
                    }
                }
                return Race(code: "\(code)", name: "????", icon: "")
            })
            racesOfThisType.sortInPlace({ (race1:Race, race2:Race) -> Bool in
                return race1.name < race2.name
            })
            types.append(Type(name: name, races: racesOfThisType, type_icon: allTypeIcons[name]!))
        }

        types.sortInPlace({ (type1, type2) -> Bool in
            return type1.name < type2.name
        })
    
    }
}




