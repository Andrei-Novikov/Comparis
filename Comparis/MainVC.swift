//
//  MainVC.swift
//  Comparis
//
//  Created by Andrei Novikau on 6/14/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit
import AFNetworking
import SDWebImage
import UIActivityIndicator_for_SDWebImage
import SwipeView
import MBProgressHUD

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var commentLabel: UILabel?
    @IBOutlet weak var textView: UITextView?
}

typealias CompletionHandler = (response : AnyObject? , error : ErrorType?) -> Void

class MainVC: UIViewController {
    
    @IBOutlet weak var infoTableView: UITableView!
    @IBOutlet weak var swipeView: SwipeView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var refreshButton: UIButton!
    
    private let darkTextColor = UIColor(red: 32/355, green: 32/355, blue: 32/355, alpha: 1)
    private let grayTextColor = UIColor(red: 154/255, green: 154/255, blue: 154/255, alpha: 1)
    private let mediumFont = UIFont.systemFontOfSize(15, weight: UIFontWeightMedium)
    private let regularFont = UIFont.systemFontOfSize(15)
    
    private let headerTextColor = UIColor(red: 97/255, green: 189/255, blue: 109/255, alpha: 1)
    private let headerFont = UIFont.systemFontOfSize(24, weight: UIFontWeightMedium)
    
    private let imageHeight: CGFloat = 200
    private let httpManager = AFHTTPSessionManager()
    var details = Details()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTableView.estimatedRowHeight = 44
        infoTableView.rowHeight = UITableViewAutomaticDimension
        
        pageControl.numberOfPages = 1
        
        infoTableView.alpha = 0
        headerView.alpha = 0
        refreshButton.alpha = 0
        
        refresh(refreshButton)
    }
    
    func loadData(completion: CompletionHandler) {
        httpManager.requestSerializer = AFJSONRequestSerializer()
        httpManager.responseSerializer.acceptableContentTypes = ["application/json"]
        
        let testLink = "https://en.comparis.ch/immobilien/webservices/mobile_v2.svc/json/getdetails"
        let header = ["ApplicationVersion": "null", "BundleName": "null", "Device": "null", "DeviceApplicationGUID": "00000000-0000-0000-0000-000000000000", "Language": "de", "Model": "null", "RequestKey": 0, "ScreenHeight": 0, "ScreenWidth": 0]
        let params = ["AdId": 14823955, "Header": header]
        
        httpManager.POST(testLink, parameters: params, progress: { (progress) in
            
            }, success: { (task, response) in
                print(response)
                if let details = response as? [String: AnyObject] {
                    completion(response: Details(dict: details), error: nil)
                } else {
                    completion(response: nil, error: nil)
                }
        }) { (task, error) in
            print(error)
            completion(response: nil, error: error)
        }
    }
    
    @IBAction func refresh(sender: UIButton) {
        let progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progressHUD.labelText = "Load Data From Server..."
        
        loadData { (response, error) in
            if response != nil {
                self.details = response as! Details
                self.infoTableView.reloadData()
                self.swipeView.reloadData()
                self.pageControl.numberOfPages = self.details.ImageUrls.count
                
                progressHUD.labelText = "Success"
                
                UIView.animateWithDuration(1, animations: {
                    self.infoTableView.alpha = 1
                    self.headerView.alpha = 1
                })
            } else if error != nil {
                progressHUD.labelText = "Connecting Server Error"
                self.refreshButton.alpha = 1
            }
            progressHUD.hide(true, afterDelay: 2)
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "fullScreenImage" {
            let destVC = segue.destinationViewController as! ImageFullScreenVC
            destVC.imageUrlString = sender as! String
        }
    }
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        switch section {
        case 1: numberOfRows = 7
        case 2: numberOfRows = 2
        case 0,3...6: numberOfRows = 1
        default: break
        }
        return numberOfRows
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return imageHeight + 60
        }
        return UITableViewAutomaticDimension
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 44
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView()
        }
        
        let header = UIView(frame: CGRectMake(0,0, max(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height), 44))
        header.backgroundColor = UIColor.whiteColor()
        
        let titleLabel = UILabel(frame: CGRectMake(15,10,header.bounds.size.width - 30, 34))
        titleLabel.textColor = headerTextColor
        titleLabel.font = headerFont
        
        switch section {
        case 1: titleLabel.text = "Details"
        case 2: titleLabel.text = "Location factors"
        case 3: titleLabel.text = "Construction standard"
        case 4: titleLabel.text = "Nearby"
        case 5: titleLabel.text = "Contacts"
        case 6: titleLabel.text = "Description"
        default: break
        }
        header.addSubview(titleLabel)
        
        let topLine = UIView(frame: CGRectMake(0,0, header.bounds.size.width, 1/UIScreen.mainScreen().scale))
        topLine.backgroundColor = tableView.separatorColor
        header.addSubview(topLine)
        
        let bottomLine = UIView(frame: CGRectMake(0,header.bounds.size.height - 1/UIScreen.mainScreen().scale, header.bounds.size.width, 1/UIScreen.mainScreen().scale))
        bottomLine.backgroundColor = tableView.separatorColor
        header.addSubview(bottomLine)

        return header
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: DetailTableViewCell!

        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("Address Cell", forIndexPath: indexPath) as! DetailTableViewCell
            cell.titleLabel?.text = details.StreetName
            cell.subtitleLabel?.text = "\(details.Zip) \(details.City)"
            cell.commentLabel?.text =  details.PriceValue > 0 ? "CHF \(details.PriceValue)" : ""
        } else if indexPath.section < 5 {
            cell = tableView.dequeueReusableCellWithIdentifier("Detail Cell", forIndexPath: indexPath) as! DetailTableViewCell
            
            var title = ""
            var subtitle = ""
            
            switch (indexPath.section, indexPath.row) {
            case (1,0):
                title = "Property type"
                subtitle = "Commercial property"
            case (1,1):
                title = "Rent per month"
                subtitle = details.RentInclusiveHeating > 0 ? "CHF \(details.RentInclusiveHeating)" : ""
            case (1,2):
                title = "Rent per month (without charges)"
                subtitle = details.RentInclusiveHeating - details.ExtraCosts > 0 ? "CHF \(details.RentInclusiveHeating - details.ExtraCosts)" : ""
            case (1,3):
                title = "Supplementary charges"
                subtitle = details.ExtraCosts > 0 ? "CHF \(details.ExtraCosts)" : ""
            case (1,4):
                title = "Floor space"
                subtitle = details.Area > 0 ? "\(details.Area) m2" : ""
            case (1,5):
                title = "Rooms"
                subtitle = details.Rooms > 0 ? "\(details.Rooms)" : ""
            case (1,6):
                title = "Year of construction"
                subtitle = details.YearOfConstruction > 0 ? "\(details.YearOfConstruction)" : ""
            case (2,0):
                title = "Altitude"
                subtitle = details.LocationFactors.Height > 0 ? "\(details.LocationFactors.Height) m. above sea level" : ""
            case (2,1):
                title = "Sunshine hours"
                subtitle = "\(details.LocationFactors.SunshineHoursSummer)h (summer)\n\(details.LocationFactors.SunshineHoursWinter)h (winter)"
            case (3,0):
                title = ""
                subtitle = details.Features.stringByReplacingOccurrencesOfString(", ", withString: "\n")
            case (4,0):
                title = ""
                subtitle = details.Distances.stringByReplacingOccurrencesOfString(", ", withString: " m\n") + " m"
            default: break
            }
            
            cell.titleLabel?.text = title
            cell.subtitleLabel?.text = subtitle
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("Detail Text Cell", forIndexPath: indexPath) as! DetailTableViewCell
            if indexPath.section == 5 {
                let attrString = NSMutableAttributedString(string: "\(details.Contact.ContactName)\n", attributes: [NSFontAttributeName: mediumFont, NSForegroundColorAttributeName: grayTextColor])
                attrString.appendAttributedString(NSAttributedString(string: "\(details.Contact.ContactTel)\n", attributes: [NSFontAttributeName: regularFont, NSForegroundColorAttributeName: darkTextColor]))
                attrString.appendAttributedString(NSAttributedString(string: "\(details.Contact.VendorContact)\n", attributes: [NSFontAttributeName: mediumFont, NSForegroundColorAttributeName: darkTextColor]))
                attrString.appendAttributedString(NSAttributedString(string: "\nOriginal listing with contact details\n", attributes: [NSFontAttributeName: mediumFont, NSForegroundColorAttributeName: grayTextColor]))
                attrString.appendAttributedString(NSAttributedString(string: "\(details.RedirectLinks.SiteName)", attributes: [NSFontAttributeName: regularFont, NSForegroundColorAttributeName: darkTextColor]))
                
                cell.textView?.attributedText = attrString
            } else {
                cell.textView?.text = self.details.Description
            }
            cell.textView?.dataDetectorTypes = .All
        }

        return cell
    }
}

extension MainVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == infoTableView && (scrollView.contentOffset.y < imageHeight || headerViewHeightConstraint.constant > 0) {
            headerViewHeightConstraint.constant = scrollView.contentOffset.y < imageHeight ? abs(imageHeight - scrollView.contentOffset.y) : 0
            headerView.setNeedsLayout()
        }
    }
}

// MARK: - SwipeViewDataSource
extension MainVC: SwipeViewDataSource {
    
    func numberOfItemsInSwipeView(swipeView: SwipeView!) -> Int {
        return details.ImageUrls.count
    }
    
    func swipeView(swipeView: SwipeView!, viewForItemAtIndex index: Int, reusingView view: UIView!) -> UIView! {
        let imageView = UIImageView(frame: CGRectMake(0, 0, swipeView.bounds.size.width, swipeView.bounds.size.height))
        imageView.contentMode = .ScaleAspectFill
        
        var urlString = details.ImageUrls[index]
        urlString = urlString.stringByReplacingOccurrencesOfString("%WIDTH%", withString: "\(imageView.bounds.size.width)")
        urlString = urlString.stringByReplacingOccurrencesOfString("%HEIGHT%", withString: "\(imageHeight)")
        
        imageView.setImageWithURL(NSURL(string: urlString), placeholderImage: nil, options: .RetryFailed, completed: { (image, error, cacheType, url) in
            if error != nil {
                print("Load Error \(self.details.ImageUrls[index])")
                print(error)
            }
            }, usingActivityIndicatorStyle: .Gray)
        return imageView
    }
}

// MARK: - SwipeViewDelegate
extension MainVC: SwipeViewDelegate {
    
    func swipeViewItemSize(swipeView: SwipeView!) -> CGSize {
        return swipeView.bounds.size
    }
    
    func swipeViewCurrentItemIndexDidChange(swipeView: SwipeView!) {
        pageControl.currentPage = swipeView.currentPage
    }
    
    func swipeView(swipeView: SwipeView!, didSelectItemAtIndex index: Int) {
        self.performSegueWithIdentifier("fullScreenImage", sender: details.ImageUrls[index])
    }
}
