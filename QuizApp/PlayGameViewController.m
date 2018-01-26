//
//  PlayGameViewController.m
//  QuizApp
//
//  Created by ITHS on 2018-01-26.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "PlayGameViewController.h"
#import "GameModel.h"

@interface PlayGameViewController ()
//buttons
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *checkResultButton;
//labels
@property (weak, nonatomic) IBOutlet UILabel *questionTitle;
@property (weak, nonatomic) IBOutlet UITextView *questionText;
@property (weak, nonatomic) IBOutlet UILabel *questionFeedback;
//other
@property (nonatomic) int questionNr;
@property (nonatomic) NSDictionary *currentQuestion;
@property (nonatomic) GameModel *game;
@property (nonatomic) NSString *correctAnswer;
@property (nonatomic) int correctGuesses;
@property (nonatomic) int wrongGuesses;

@end

@implementation PlayGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Vied Did Load");
    [self startNewGame];
}

- (void)startNewGame {
    self.checkResultButton.hidden = YES;
    self.questionNr = 1;
    self.nextButton.hidden = YES;
    self.questionFeedback.text = @"";
    self.game = [[GameModel alloc] init];
    self.correctGuesses = 0;
    self.wrongGuesses = 0;
    // [GameModel setCorrectGuesses:0];
    // [GameModel setWrongGuesses:0];
    [self setUpQuestion];
}

- (void)setUpQuestion {
    [self.game createQuestions];
    self.currentQuestion = [self.game getQuestion];
    self.questionText.text = self.currentQuestion[@"question"];
    [self.button1 setTitle:self.currentQuestion[@"answer1"] forState:UIControlStateNormal];
     [self.button2 setTitle:self.currentQuestion[@"answer2"] forState:UIControlStateNormal];
     [self.button3 setTitle:self.currentQuestion[@"answer3"] forState:UIControlStateNormal];
     [self.button4 setTitle:self.currentQuestion[@"answer4"] forState:UIControlStateNormal];
    self.correctAnswer = self.currentQuestion[@"correctAnswer"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (IBAction)nextButtonClicked:(id)sender {
    self.questionNr++;
    self.questionFeedback.text = @"";
    self.questionTitle.text = [NSString stringWithFormat:@"Question %d", self.questionNr];
    [self setUpQuestion];
    [self enableAnswerButtons];
}

- (IBAction)button1Clicked:(id)sender {
    [self checkAnswerButton: [sender titleForState:UIControlStateSelected]];
}

- (IBAction)button2Clicked:(id)sender {
      [self checkAnswerButton: [sender titleForState:UIControlStateSelected]];
}

- (IBAction)button3Clicked:(id)sender {
      [self checkAnswerButton: [sender titleForState:UIControlStateSelected]];
}

- (IBAction)button4Clicked:(id)sender {
      [self checkAnswerButton: [sender titleForState:UIControlStateSelected]];
}

- (void)checkAnswerButton:(NSString*)answer {
    if([answer isEqualToString:self.correctAnswer]){
        self.questionFeedback.text = @"Correct answer!";
        self.correctGuesses++;
        [GameModel setCorrectGuesses:self.correctGuesses];
       
    } else {
        self.questionFeedback.text = [NSString stringWithFormat:@"Wrong answer, the correct answer should be: %@", self.correctAnswer];
         self.wrongGuesses++;
       [GameModel setWrongGuesses:self.wrongGuesses];
    }
    [self disableAnswerButtons];
    NSLog(@"Correct: %d, Wrong: %d", self.correctGuesses, self.wrongGuesses);
    
         [self checkResult];
}

-(void)checkResult {
    if(self.correctGuesses + self.wrongGuesses == 5){
           self.nextButton.hidden = YES;
        self.checkResultButton.hidden = NO;
        /*
        NSString * storyboardName = @"Main";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        UIViewController * resultView = [storyboard instantiateViewControllerWithIdentifier:@"ResultWindow"];
        [self presentViewController:resultView animated:YES completion:nil];
         */
        
        NSLog(@"Checking result");
        
        NSString * storyboardName = @"Main";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        UIViewController * resultView = [storyboard instantiateViewControllerWithIdentifier:@"ResultWindow"];
        
        [self.navigationController pushViewController:resultView animated:YES];
           NSLog(@"Pushing viewcontroller");
        
        
    }
}

/*
#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    NSLog(@"Prepare for segue, %@", segue.identifier);
    
    if([segue.identifier isEqualToString:@"ResultSegue"]){
      
    
  ResultsViewController *resultView = [segue destinationViewController];
        resultView.corrAnswersInt.text = [NSString stringWithFormat:@"%d", self.correctGuesses];
        resultView.wrongAnswersInt.text = [NSString stringWithFormat:@"%d", self.wrongGuesses];
        
        NSLog(@" IF; Wrong: %@", resultView.wrongAnswersInt.text); 
    }
    
} */

-(void)disableAnswerButtons {
    self.button1.enabled = NO;
    self.button2.enabled = NO;
    self.button3.enabled = NO;
    self.button4.enabled = NO;
    self.nextButton.hidden = NO;
}

-(void)enableAnswerButtons {
    self.button1.enabled = YES;
    self.button2.enabled = YES;
    self.button3.enabled = YES;
    self.button4.enabled = YES;
    self.nextButton.hidden = YES;
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
