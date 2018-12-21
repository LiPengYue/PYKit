#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BaseAnimationHandler.h"
#import "BaseDismissAnimationHandler.h"
#import "BasePresentAnimationHandler.h"
#import "BaseProxyWeakHandler.h"
#import "BaseAnimaterHeaders.h"
#import "BaseModalShadowAnimationConfig.h"
#import "BasePresentViewControllerConfiguration.h"
#import "BasePresentNavigationController.h"
#import "BasePresentViewController.h"
#import "AnimatedTransition.h"
#import "Animater.h"

FOUNDATION_EXPORT double PYTransitionAnimaterVersionNumber;
FOUNDATION_EXPORT const unsigned char PYTransitionAnimaterVersionString[];

