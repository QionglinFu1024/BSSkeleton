

#import <UIKit/UIKit.h>

/// 自定义颜色  如：BSCustomColor(@"006600")
#define BSCustomColor(colorString) [UIColor bs_colorWithHexString:colorString]


NS_ASSUME_NONNULL_BEGIN


@interface UIColor (BSMatch)

/**
 *  使用HEX命名方式的颜色字符串生成一个UIColor对象
 *
 *  @param hexString 支持以 # 开头和不以 # 开头的 hex 字符串
 *      #RGB        例如#f0f，等同于#ffff00ff，RGBA(255, 0, 255, 1)
 *      #ARGB       例如#0f0f，等同于#00ff00ff，RGBA(255, 0, 255, 0)
 *      #RRGGBB     例如#ff00ff，等同于#ffff00ff，RGBA(255, 0, 255, 1)
 *      #AARRGGBB   例如#00ff00ff，等同于RGBA(255, 0, 255, 0)
 *
 * @return UIColor对象
 */
+ (nullable UIColor *)bs_colorWithHexString:(nullable NSString *)hexString;


@end

NS_ASSUME_NONNULL_END
