//
//  ResultsViewController.h
//  QuizApp
//
//  Created by ITHS on 2018-01-24.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayGameViewController.h"

@interface ResultsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *wrongAnswersInt;
@property (weak, nonatomic) IBOutlet UILabel *corrAnswersInt;

@end
