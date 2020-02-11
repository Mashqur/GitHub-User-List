

import UIKit

class GitHubUserListController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    @IBOutlet weak var userList: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        userList.dataSource = self
        PlaceMarkersController.loadPlaceMarkers(tableView: userList)
        // Do any additional setup after loading the view, typically from a nib.
//        NotificationCenter.default.addObserver(forName: PlaceMarkersController.PLACE_MARKER_ADDED_NOTIFICATION, object: nil, queue: nil) {
//            notification in
//            self.carList.reloadData()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaceMarkersController.sharePlaceMarkers().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userList.dequeueReusableCell(withIdentifier: "Cell") as! CarCell
        
        var locations = PlaceMarkersController.sharePlaceMarkers()
        cell.name.text = locations[indexPath.row].name
//        cell.address.text = locations[indexPath.row].address
//        let numberFormatter = NumberFormatter()
//        cell.fuel.text = numberFormatter.string(from: locations[indexPath.row].fuel! as NSNumber)
//        cell.vin.text = locations[indexPath.row].vin
//        cell.interior.text = locations[indexPath.row].interior
//        cell.exterior.text = locations[indexPath.row].exterior
//        cell.engineType.text = locations[indexPath.row].engineType
            
        return cell
    }


}

