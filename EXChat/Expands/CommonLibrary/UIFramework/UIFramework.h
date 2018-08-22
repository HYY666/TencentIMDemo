//
//  UIFramework.h
//  CommonLibrary
//
//  Created by Alexi on 13-11-6.
//  Copyright (c) 2013年 ywchen. All rights reserved.
//

#ifndef CommonLibrary_UIFramework_h
#define CommonLibrary_UIFramework_h


#define kSupportLibraryPage 0
#define kSupportPopupView 0
#define kSupportScrollController 0

#import "UIViewController+Layout.h"
#import "CommonBaseViewController.h"
#import "NavigationViewController.h"

#import "BaseViewController.h"

#if kSupportScrollController
#import "ScrollBaseViewController.h"

#endif

#import "UIView+Layout.h"



#if kSupportPopupView
#import "PopupView.h"
#endif

#import "MenuAbleItem.h"
#import "MenuItem.h"


#import "PageScrollView.h"

#import "BaseAppDelegate.h"

// 过渡动画
#import "UINavigationController+Transition.h"


#import "RefreshAbleView.h"

#import "RefreshView.h"

#import "ScrollRefreshViewController.h"

#import "TableRefreshViewController.h"



#if kSupportLibraryPage

#import "PageMenuScrollView.h"

#import "LibraryNavigationPanel.h"

#import "LibraryScrollView.h"

#import "LibraryViewController.h"
#endif

#endif
