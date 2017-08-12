//
//  XXTools.swift
//  Xiuxiu
//
//  Created by 张一奇 on 17/8/13.
//  Copyright © 2017年 Xiuxiu. All rights reserved.
//

import UIKit

/// 输出日志
///
/// - Parameters:
///   - message: 日志消息
///   - logError: 错误标记，默认是 false，如果是 true，发布时仍然会输出
///   - file: 文件名
///   - method: 方法名
///   - line: 代码行数
func printLog<T>(_ message: T,
              logError: Bool = false,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    if logError {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    } else {
        #if DEBUG
            print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
        #endif
    }
}


//MARK:--颜色
/// RGB颜色
func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
}

/// 随机颜色
func RandomColor() -> UIColor {
    return RGB(r: CGFloat(arc4random()).truncatingRemainder(dividingBy: 255), g: CGFloat(arc4random()).truncatingRemainder(dividingBy: 255), b: CGFloat(arc4random()).truncatingRemainder(dividingBy: 255))
}

/// 16进制 转 RGBA
func ZYRgbaColorFromHex(rgb:Int, alpha: CGFloat) ->UIColor {
    return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                   alpha: alpha)
}

/// 16进制 转 RGB
func ZYRgbColorFromHex(rgb:Int) -> UIColor {
    return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                   alpha: 1.0)
}

//MARK:-- =========== 屏幕相关 ============
/// 屏幕宽度
let kUIScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕高度
let KUIScreenHeight = UIScreen.main.bounds.size.height
/// 屏幕大小
let kUIScreenSize = UIScreen.main.bounds.size
/// 屏幕的bounds
let kUIScreenBounds = UIScreen.main.bounds


/**
 *  扩展部分
 */
extension UIColor {
    
    /// 16进制 转 RGBA
    ///
    /// - Parameters:
    ///   - rgb: 16进制颜色
    ///   - alpha: 透明度
    /// - Returns: 颜色
    class func rgbaColorFromHex(rgb:Int, alpha: CGFloat) ->UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    /// 16进制 转 RGB
    ///
    /// - Parameter rgb: 16进制颜色
    /// - Returns: 颜色
    class func rgbColorFromHex(rgb:Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
}


