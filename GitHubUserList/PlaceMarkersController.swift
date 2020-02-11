

import Foundation
import UIKit
class PlaceMarkersController:NSObject {
    
    public static let PLACE_MARKER_ADDED_NOTIFICATION = NSNotification.Name("PLACE_MARKER_ADDED_NOTIFICATION")
    static var placeMarkerArray = [PlaceMarker]()
    
    class func sharePlaceMarkers() -> [PlaceMarker]{
        return placeMarkerArray
    }
    
    class func addPlaceMarker(placeMarker: PlaceMarker, tableView : UITableView) {
        placeMarkerArray.append(placeMarker)
        tableView.reloadData()
        
        //NotificationCenter.default.post(name:PLACE_MARKER_ADDED_NOTIFICATION , object: placeMarker)
    }
    
    class func loadPlaceMarkers(tableView : UITableView) {
        let url = URL(string: "https://api.github.com/users")
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url!) { (data, response, error) in
            do {
                    let fetchUser = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                    
                    for marker in fetchUser {
                        let location = PlaceMarker()
                        let mark = marker as! [String : Any]
                        location.address = mark["address"] as? String
                        location.engineType = mark["engineType"] as? String
                        location.exterior = mark["exterior"] as? String
                        location.fuel = mark["fuel"] as? Int
                        location.interior = mark["interior"] as? String
                        location.name = mark["login"] as? String
                        location.vin = mark["vin"] as? String
                        addPlaceMarker(placeMarker: location, tableView: tableView)
                        
                    }
                
            } catch {
                print(error)
            }
        }
        task.resume()        
    }
}
