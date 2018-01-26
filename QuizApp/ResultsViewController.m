//
//  ResultsViewController.m
//  QuizApp
//
//  Created by ITHS on 2018-01-24.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "ResultsViewController.h"
#import "GameModel.h"

@interface ResultsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultCommentLabel;
@property (nonatomic) int corrInt;
@property (nonatomic) int wrInt;

@end

@implementation ResultsViewController

@synthesize wrongAnswersInt, corrAnswersInt;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.corrAnswersInt.text = [NSString stringWithFormat:@"%d", [GameModel getCorrectGuesses]];
    
     self.wrongAnswersInt.text = [NSString stringWithFormat:@"%d", [GameModel getWrongGuesses]];

    NSLog(@"C: %@, W: %@", self.corrAnswersInt.text, self.wrongAnswersInt.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)continueButtonClicked:(id)sender {
    NSLog(@"Continue clicked"); 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
