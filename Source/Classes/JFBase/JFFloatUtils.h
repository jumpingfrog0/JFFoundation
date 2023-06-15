//
//  JFFloatUtils.h
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/14.
//

#ifndef JFFloatUtils_h
#define JFFloatUtils_h

#define JF_OVERLOADABLE_ATTR    __attribute__((overloadable))

NS_INLINE BOOL JFFloatIsNormal(float fVal) JF_OVERLOADABLE_ATTR
{
    return __inline_isnormalf(fVal);
}

NS_INLINE BOOL JFFloatIsNormal(double fVal) JF_OVERLOADABLE_ATTR
{
    return __inline_isnormald(fVal);
}

NS_INLINE BOOL JFFloatIsNormal(long double fVal) JF_OVERLOADABLE_ATTR
{
    return __inline_isnormall(fVal);
}

#define JF_IS_NORMAL(x) isnormal(x)

NS_INLINE BOOL JFFloatIsEqual(float f1, float f2)
{
    return (fabs(f1 - f2) < FLT_EPSILON);
}

//#define JF_IS_NORMAL(x) JFFloatIsNormal(x)

#endif /* JFFloatUtils_h */
