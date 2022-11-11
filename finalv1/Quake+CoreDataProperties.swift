import Foundation
import CoreData

extension Quake{
    @nonobjc public class func  fetchRequest() -> NSFetchRequest<Quake>{
        return NSFetchRequest<Quake>(entityName: "Quake")
    }
    @NSManaged public var magnitude: Float
    @NSManaged public var place:String
    @NSManaged public var time: Date?
    @NSManaged  public var  contries: NSSet?
    
}

extension Quake{
    @objc(addCountriesObject:)
    @NSManaged public func addToCountries(_ value: Country)
    
    @objc(removeCountriesObject:)
    @NSManaged public func removeFromCountries(_ value: Country)
    
    @objc(addCountries:)
    @NSManaged public func addToCountries(_ value: NSSet)
    
    @objc(removeCountries:)
    @NSManaed public func removeFromCountries(_ value: NSSet)
}
