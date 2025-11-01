//
//  L10n.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 31.10.2025.
//

import Foundation

enum L10n {
    // MARK - Main List View
    static let finances = NSLocalizedString("finances", comment: "Navigation title")
    static let searchByCategory = NSLocalizedString("search_by_category", comment: "Search bar placeholder")
    static let ok = NSLocalizedString("ok", comment: "OK button text")
    
    // MARK: - Tab Bar
    static let financeTab = NSLocalizedString("finance_tab", comment: "Tab title for Finances")
    static let chartsTab = NSLocalizedString("charts_tab", comment: "Tab title for Charts")
    static let settingsTab = NSLocalizedString("settings_tab", comment: "Tab title for Settings")
    
    // MARK: - Settings
    static let darkTheme = NSLocalizedString("dark_theme", comment: "Toggle for dark theme")
    static let changeLanguage = NSLocalizedString("change_language", comment: "Button to change app language")
    
    // MARK: - Charts
    static let statistics = NSLocalizedString("statistics", comment: "Navigation title for charts screen")
    static let income = NSLocalizedString("income", comment: "Income section title")
    static let expense = NSLocalizedString("expense", comment: "Expense section title")
    
    // MARK: - AddFinanseCellView
    static let type = NSLocalizedString("type", comment: "Picker title for income/expense")
    static let amount = NSLocalizedString("amount", comment: "Amount label")
    static let enterAmount = NSLocalizedString("enter_amount", comment: "Placeholder for amount field")
    static let category = NSLocalizedString("category", comment: "Category label")
    static let date = NSLocalizedString("date", comment: "Date label")
    static let smallNote = NSLocalizedString("small_note", comment: "Placeholder for small note field")
    static let createEntry = NSLocalizedString("create_entry", comment: "Navigation title for add finance screen")
    static let save = NSLocalizedString("save", comment: "Save button")
    
    // MARK: - FinanceStatsSection
    static let total = NSLocalizedString("total", comment: "Label for total amount")
    static let average = NSLocalizedString("average", comment: "Label for average amount")
    static let max = NSLocalizedString("max", comment: "Label for max amount")
    
    // MARK: - GroupingType
    static let day = NSLocalizedString("day", comment: "Grouping by day")
    static let month = NSLocalizedString("month", comment: "Grouping by month")
    static let year = NSLocalizedString("year", comment: "Grouping by year")
    
    // MARK: - Error messages
    static let fetchErrorTitle = NSLocalizedString("fetch_error_title", comment: "Fetch error title")
    static let fetchErrorMessage = NSLocalizedString("fetch_error_message", comment: "Fetch error message")
    
    static let saveErrorTitle = NSLocalizedString("save_error_title", comment: "Save error title")
    static let saveErrorMessage = NSLocalizedString("save_error_message", comment: "Save error message")
    
    static let deleteErrorTitle = NSLocalizedString("delete_error_title", comment: "Delete error title")
    static let deleteErrorMessage = NSLocalizedString("delete_error_message", comment: "Delete error message")
    
    static let unknownErrorTitle = NSLocalizedString("unknown_error_title", comment: "Unknown error title")
    static let unknownErrorMessage = NSLocalizedString("unknown_error_message", comment: "Unknown error message")
    
    // MARK: - Empty State
    static let emptyNoDataTitle = NSLocalizedString("emptyNoDataTitle", comment: "Title when there is no data")
    static let emptyNoResultsTitle = NSLocalizedString("emptyNoResultsTitle", comment: "Title when search returns no results")
    static let emptyNoDataSubtitle = NSLocalizedString("emptyNoDataSubtitle", comment: "Subtitle when there is no data")
    static let emptyNoResultsSubtitle = NSLocalizedString("emptyNoResultsSubtitle", comment: "Subtitle when search returns no results")
    
    // MARK: - Section View
    static let delete = NSLocalizedString("delete", comment: "delete")
    static let change = NSLocalizedString("change", comment: "change")
    
    // MARK: - Categories
    static let salary = NSLocalizedString("category_salary", comment: "Salary category")
    static let food = NSLocalizedString("category_food", comment: "Food category")
    static let transport = NSLocalizedString("category_transport", comment: "Transport category")
    static let freelance = NSLocalizedString("category_freelance", comment: "Freelance category")
    static let entertainment = NSLocalizedString("category_entertainment", comment: "Entertainment category")
    static let gifts = NSLocalizedString("category_gifts", comment: "Gifts category")
    static let sellingItems = NSLocalizedString("category_selling_items", comment: "Selling items category")
    static let water = NSLocalizedString("category_water", comment: "Water category")
    static let cafe = NSLocalizedString("category_cafe", comment: "Cafe category")
    static let restaurant = NSLocalizedString("category_restaurant", comment: "Restaurant category")
    static let pharmacy = NSLocalizedString("category_pharmacy", comment: "Pharmacy category")
    static let significantOther = NSLocalizedString("category_significant_other", comment: "Significant other category")
    static let onlineShopping = NSLocalizedString("category_online_shopping", comment: "Online shopping category")
    static let rent = NSLocalizedString("category_rent", comment: "Rent category")
    static let gift = NSLocalizedString("category_gift", comment: "Gift category")
    static let birthday = NSLocalizedString("category_birthday", comment: "Birthday category")
    static let fun = NSLocalizedString("category_fun", comment: "Fun category")
    static let cinema = NSLocalizedString("category_cinema", comment: "Cinema category")
    static let transfers = NSLocalizedString("category_transfers", comment: "Transfers category")
    
    // MARK: - Categories View
    static let categoriesTitle = NSLocalizedString("categories_title", comment: "Navigation title for CategoriesView")
    static let addCategory = NSLocalizedString("add_category", comment: "Button text to add new category")
    static let cancel = NSLocalizedString("cancel", comment: "Cancel button")
    static let enterCategory = NSLocalizedString("enter_category", comment: "Placeholder for category text field")
    static let categories = NSLocalizedString("categories", comment: "Common word for Categories")
    static let add = NSLocalizedString("add", comment: "Common word for Add")
}

