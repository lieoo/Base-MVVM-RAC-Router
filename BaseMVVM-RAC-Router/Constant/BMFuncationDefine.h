//
//  BMFunctionDefin.h
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/6.
//  Copyright © 2018 leios. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSIndexPath
#undef BMIndexPath
#define BMIndexPath(section, row)  ([NSIndexPath indexPathForRow:row inSection:section])

#pragma mark - 图片
#undef BMImageNamed
#define BMImageNamed(imageName)  [UIImage imageNamed:imageName]

#pragma mark - 日志打印
// 日志打印 DLog
#ifdef DEBUG
#       define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#       define DLog(...)
#endif

// 日志打印 NSLog
//#ifdef DEBUG
//#       define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
//#       define NSLog(...)
//#endif

#pragma mark - Assert functions Assert 断言
//iAssert 断言
#define BMAssert(expression, ...) \
do { if(!(expression)) { \
DLog(@"%@", \
[NSString stringWithFormat: @"Assertion failure: %s in %s on line %s:%d. %@",\
#expression, \
__PRETTY_FUNCTION__, \
__FILE__, __LINE__,  \
[NSString stringWithFormat:@"" __VA_ARGS__]]); \
abort(); } \
} while(0)


#pragma mark - Weak Strong
// weakSelf 宏定义
#undef WS
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#undef SS
#define SS(strongSelf)  __strong __typeof(&*self)strongSelf = weakSelf;

#undef WeakObj
#define WeakObj(o) __weak typeof(o) o##Weak = o;

#pragma mark - 方法禁用提示

#undef BMDeprecated
#define BMDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)


#pragma mark - nil or NULL 空判断

//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))


#pragma mark - Extern and Inline  functions 内联函数  外联函数
/*／EXTERN 外联函数*/
#if !defined(BM_EXTERN)
#  if defined(__cplusplus)
#   define BM_EXTERN extern "C"
#  else
#   define BM_EXTERN extern
#  endif
#endif

/*INLINE 内联函数*/
#if !defined(BM_INLINE)
# if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
#  define BM_INLINE static inline
# elif defined(__cplusplus)
#  define BM_INLINE static inline
# elif defined(__GNUC__)
#  define BM_INLINE static __inline__
# else
#  define BM_INLINE static
# endif
#endif


#pragma mark - Encode Decode 方法
// NSDictionary -> NSString
BM_EXTERN NSString* DecodeObjectFromDic(NSDictionary *dic, NSString *key);
// NSArray + index -> id
BM_EXTERN id        DecodeSafeObjectAtIndex(NSArray *arr, NSInteger index);
// NSDictionary -> NSString
BM_EXTERN NSString     * DecodeStringFromDic(NSDictionary *dic, NSString *key);
// NSDictionary -> NSString ？ NSString ： defaultStr
BM_EXTERN NSString* DecodeDefaultStrFromDic(NSDictionary *dic, NSString *key,NSString * defaultStr);
// NSDictionary -> NSNumber
BM_EXTERN NSNumber     * DecodeNumberFromDic(NSDictionary *dic, NSString *key);
// NSDictionary -> NSDictionary
BM_EXTERN NSDictionary *DecodeDicFromDic(NSDictionary *dic, NSString *key);
// NSDictionary -> NSArray
BM_EXTERN NSArray      *DecodeArrayFromDic(NSDictionary *dic, NSString *key);
BM_EXTERN NSArray      *DecodeArrayFromDicUsingParseBlock(NSDictionary *dic, NSString *key, id(^parseBlock)(NSDictionary *innerDic));

#pragma mark - Encode Decode 方法
// (nonull Key: nonull NSString) -> NSMutableDictionary
BM_EXTERN void EncodeUnEmptyStrObjctToDic(NSMutableDictionary *dic,NSString *object, NSString *key);
// nonull objec -> NSMutableArray
BM_EXTERN void EncodeUnEmptyObjctToArray(NSMutableArray *arr,id object);
// (nonull (Key ? key : defaultStr) : nonull Value) -> NSMutableDictionary
BM_EXTERN void EncodeDefaultStrObjctToDic(NSMutableDictionary *dic,NSString *object, NSString *key,NSString * defaultStr);
// (nonull Key: nonull object) -> NSMutableDictionary
BM_EXTERN void EncodeUnEmptyObjctToDic(NSMutableDictionary *dic,NSObject *object, NSString *key);

