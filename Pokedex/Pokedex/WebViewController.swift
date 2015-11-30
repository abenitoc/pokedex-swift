
import UIKit

class WebViewController: UIViewController {


    var race: Race?
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var str = "http://es.pokemon.wikia.com"
        
        if race != nil {

            title = race!.name

            if let path = "wiki/\(race!.name)"
                .stringByAddingPercentEncodingWithAllowedCharacters(.URLPathAllowedCharacterSet()) {
                str = "\(str)/\(path)"
            }
        } else {

            title = "Pokedex"
        }
        
        if let url = NSURL(string: str) {
            let req = NSURLRequest(URL: url)
            webView.loadRequest(req)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
