//
//  JFFoundationMacro.h
//  Pods
//
//  Created by huangdonghong on 2021/7/20.
//

#ifndef JFFoundationMacro_h
#define JFFoundationMacro_h

#define jf_dispatch_main_sync_safe(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_sync(dispatch_get_main_queue(), block);\
    }

#define jf_dispatch_main_async_safe(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }

#endif /* JFFoundationMacro_h */
