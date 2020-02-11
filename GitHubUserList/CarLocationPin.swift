

import Foundation
import MapKit

class CarLocationPin: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D

    init(title: String, subTitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subTitle
        self.coordinate = coordinate
    }
}
