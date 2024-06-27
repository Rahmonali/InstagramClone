//
//  Helpers.swift
//  InstagramClone
//
//  Created by Rahmonali on 26/06/24.
//

import Foundation

func timeAgoSinceDate(_ date: Date) -> String {
    let calendar = Calendar.current
    let now = Date()
    let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear, .month, .year], from: date, to: now)

    if let year = components.year, year >= 2 {
        return "\(year) years ago"
    } else if let year = components.year, year >= 1 {
        return "Last year"
    } else if let month = components.month, month >= 2 {
        return "\(month) months ago"
    } else if let month = components.month, month >= 1 {
        return "Last month"
    } else if let week = components.weekOfYear, week >= 2 {
        return "\(week) weeks ago"
    } else if let week = components.weekOfYear, week >= 1 {
        return "Last week"
    } else if let day = components.day, day >= 2 {
        return "\(day) days ago"
    } else if let day = components.day, day >= 1 {
        return "Yesterday"
    } else if let hour = components.hour, hour >= 2 {
        return "\(hour) hours ago"
    } else if let hour = components.hour, hour >= 1 {
        return "An hour ago"
    } else if let minute = components.minute, minute >= 2 {
        return "\(minute) minutes ago"
    } else if let minute = components.minute, minute >= 1 {
        return "A minute ago"
    } else {
        return "Just now"
    }
}
