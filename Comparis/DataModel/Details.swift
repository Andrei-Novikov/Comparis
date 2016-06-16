//
//  Details.swift
//  ImageGallary
//
//  Created by Andrei Novikau on 6/13/16.
//  Copyright © 2016 IntoSoft. All rights reserved.
//

import UIKit

class Details: NSObject {
    var AdConfig = ""
    var Header = HeaderInfo()
    var AdId: Int = -1
    var AddressHistory = [AddressHistoryInfo]()
    var AdvertisementEntries: Int = -1
    var Area: Int = -1
    var Availability = false
    var BuildingArea: Int = -1
    var ChangeDate = ""
    var City = ""
    var ComparisPoints: Int = -1
    var ComparisPrice: Int = -1
    var ComparisUrl = ""
    var Contact = ContactInfo()
    var ContactFormUrl = ""
    var ContactSiteID: Int = -1
    var ContactSiteName = ""
    var CurrencyID = ""
    var DealTypeID: Int = -1
    var Description = ""
    var DetailImpressionTrackingUrl = ""
    var Distances = ""
    var ExtraCosts: Int = -1
    var Features = ""
    var Floor: Int = -1
    var GeoCoordinates = Coordinates()
    var ImageCount: Int = 0
    var ImageUrls = [String]()
    var IsActive = false
    var IsAddressDistinct = false
    var IsStuffleAd = false
    var LastRelevantChangeDate = ""
    var LivingSpace: Int = -1
    var LocationFactors = LocationFactorsInfo()
    var OverallPriceChange: Int = -1
    var PhoneCallTrackingUrl = ""
    var Price: Int = -1
    var PriceDevelopment: Int = -1
    var PriceType: Int = -1
    var PriceValue: Int = -1
    var PropertyTypeID: Int = -1
    var RedirectLinks = RedirectLinksInfo()
    var ReleaseDate = ""
    var RentInclusiveHeating: Int = -1
    var Rooms: Float = -1
    var SavingPotential: Int = -1
    var SiteID: Int = -1
    var SiteName = ""
    var SiteSource: Int = -1
    var StreetName = ""
    var SubPropertyTypeID: Int = -1
    var Title = ""
    var UsefulArea: Int = -1
    var YearOfConstruction: Int = -1
    var Zip = ""
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let AdConfig = dict["AdConfig"] as? String {
            self.AdConfig = AdConfig
        }
        if let Header = dict["Header"] as? [String: AnyObject] {
            self.Header = HeaderInfo(dict: Header)
        }
        if let AdId = dict["AdId"] as? Int {
            self.AdId = AdId
        }
        if let AddressHistory = dict["AddressHistory"] as? [[String: AnyObject]] {
            for item in AddressHistory {
                self.AddressHistory.append(AddressHistoryInfo(dict: item))
            }
        }
        if let AdvertisementEntries = dict["AdvertisementEntries"] as? Int {
            self.AdvertisementEntries = AdvertisementEntries
        }
        if let Area = dict["Area"] as? Int {
            self.Area = Area
        }
        if let Availability = dict["Availability"] as? Bool {
            self.Availability = Availability
        }
        if let BuildingArea = dict["BuildingArea"] as? Int {
            self.BuildingArea = BuildingArea
        }
        if let ChangeDate = dict["ChangeDate"] as? String {
            self.ChangeDate = ChangeDate
        }
        if let City = dict["City"] as? String {
            self.City = City
        }
        if let ComparisPoints = dict["ComparisPoints"] as? Int {
            self.ComparisPoints = ComparisPoints
        }
        if let ComparisPrice = dict["ComparisPrice"] as? Int {
            self.ComparisPrice = ComparisPrice
        }
        if let ComparisUrl = dict["ComparisUrl"] as? String {
            self.ComparisUrl = ComparisUrl
        }
        if let Contact = dict["Contact"] as? [String: AnyObject] {
            self.Contact = ContactInfo(dict: Contact)
        }
        if let ContactFormUrl = dict["ContactFormUrl"] as? String {
            self.ContactFormUrl = ContactFormUrl
        }
        if let ContactSiteID = dict["ContactSiteID"] as? Int {
            self.ContactSiteID = ContactSiteID
        }
        if let ContactSiteName = dict["ContactSiteName"] as? String {
            self.ContactSiteName = ContactSiteName
        }
        if let CurrencyID = dict["CurrencyID"] as? String {
            self.CurrencyID = CurrencyID
        }
        if let DealTypeID = dict["DealTypeID"] as? Int {
            self.DealTypeID = DealTypeID
        }
        if let Description = dict["Description"] as? String {
            self.Description = Description
        }
        if let DetailImpressionTrackingUrl = dict["DetailImpressionTrackingUrl"] as? String {
            self.DetailImpressionTrackingUrl = DetailImpressionTrackingUrl
        }
        if let Distances = dict["Distances"] as? String {
            self.Distances = Distances
        }
        if let ExtraCosts = dict["ExtraCosts"] as? Int {
            self.ExtraCosts = ExtraCosts
        }
        if let Features = dict["Features"] as? String {
            self.Features = Features
        }
        if let Floor = dict["Floor"] as? Int {
            self.Floor = Floor
        }
        if let GeoCoordinates = dict["GeoCoordinates"] as? [String: AnyObject] {
            self.GeoCoordinates = Coordinates(dict: GeoCoordinates)
        }
        if let ImageCount = dict["ImageCount"] as? Int {
            self.ImageCount = ImageCount
        }
        if let ImageUrls = dict["ImageUrls"] as? [String] {
            self.ImageUrls = ImageUrls
        }
        if let IsActive = dict["IsActive"] as? Bool {
            self.IsActive = IsActive
        }
        if let IsAddressDistinct = dict["IsAddressDistinct"] as? Bool {
            self.IsAddressDistinct = IsAddressDistinct
        }
        if let IsStuffleAd = dict["IsStuffleAd"] as? Bool {
            self.IsStuffleAd = IsStuffleAd
        }
        if let LastRelevantChangeDate = dict["LastRelevantChangeDate"] as? String {
            self.LastRelevantChangeDate = LastRelevantChangeDate
        }
        if let LivingSpace = dict["LivingSpace"] as? Int {
            self.LivingSpace = LivingSpace
        }
        if let LocationFactors = dict["LocationFactors"] as? [String: AnyObject] {
            self.LocationFactors = LocationFactorsInfo(dict: LocationFactors)
        }
        if let OverallPriceChange = dict["OverallPriceChange"] as? Int {
            self.OverallPriceChange = OverallPriceChange
        }
        if let PhoneCallTrackingUrl = dict["PhoneCallTrackingUrl"] as? String {
            self.PhoneCallTrackingUrl = PhoneCallTrackingUrl
        }
        if let Price = dict["Price"] as? Int {
            self.Price = Price
        }
        if let PriceDevelopment = dict["PriceDevelopment"] as? Int {
            self.PriceDevelopment = PriceDevelopment
        }
        if let PriceType = dict["PriceType"] as? Int {
            self.PriceType = PriceType
        }
        if let PriceValue = dict["PriceValue"] as? Int {
            self.PriceValue = PriceValue
        }
        if let PropertyTypeID = dict["PropertyTypeID"] as? Int {
            self.PropertyTypeID = PropertyTypeID
        }
        if let RedirectLinks = dict["RedirectLinks"] as? [[String: AnyObject]] {
            if let data = RedirectLinks.first {
                self.RedirectLinks = RedirectLinksInfo(dict: data)
            }
        }
        if let ReleaseDate = dict["ReleaseDate"] as? String {
            self.ReleaseDate = ReleaseDate
        }
        if let RentInclusiveHeating = dict["RentInclusiveHeating"] as? Int {
            self.RentInclusiveHeating = RentInclusiveHeating
        }
        if let Rooms = dict["Rooms"] as? Float {
            self.Rooms = Rooms
        }
        if let SavingPotential = dict["SavingPotential"] as? Int {
            self.SavingPotential = SavingPotential
        }
        if let SiteID = dict["SiteID"] as? Int {
            self.SiteID = SiteID
        }
        if let SiteName = dict["SiteName"] as? String {
            self.SiteName = SiteName
        }
        if let SiteSource = dict["SiteSource"] as? Int {
            self.SiteSource = SiteSource
        }
        if let StreetName = dict["StreetName"] as? String {
            self.StreetName = StreetName
        }
        if let SubPropertyTypeID = dict["SubPropertyTypeID"] as? Int {
            self.SubPropertyTypeID = SubPropertyTypeID
        }
        if let Title = dict["Title"] as? String {
            self.Title = Title
        }
        if let UsefulArea = dict["UsefulArea"] as? Int {
            self.UsefulArea = UsefulArea
        }
        if let YearOfConstruction = dict["YearOfConstruction"] as? Int {
            self.YearOfConstruction = YearOfConstruction
        }
        if let Zip = dict["Zip"] as? String {
            self.Zip = Zip
        }
    }
}
