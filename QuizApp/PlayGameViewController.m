//
//  PlayGameViewController.m
//  QuizApp
//
//  Created by ITHS on 2018-01-26.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "PlayGameViewController.h"
#import "GameModel.h"
#import <QuartzCore/QuartzCore.h>

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
@property (nonatomic) int clicks;
@property (weak, nonatomic) IBOutlet UIImageView *topBackground;
@property (weak, nonatomic) IBOutlet UIImageView *bottomBackground;

@end

@implementation PlayGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button1.layer.cornerRadius = 15;
    self.button1.clipsToBounds = YES;
    self.button2.layer.cornerRadius = 15;
    self.button2.clipsToBounds = YES;
    self.button3.layer.cornerRadius = 15;
    self.button3.clipsToBounds = YES;
    self.button4.layer.cornerRadius = 15;
    self.button4.clipsToBounds = YES;
    self.nextButton.layer.cornerRadius = 15;
    self.nextButton.clipsToBounds = YES;
    self.topBackground.layer.cornerRadius = 15;
    self.topBackground.clipsToBounds = YES;
    self.bottomBackground.layer.cornerRadius = 15;
    self.bottomBackground.clipsToBounds = YES;
    [self startNewGame];
}

- (void)startNewGame {
    [self showButtons];
    self.clicks = 0;
    self.questionNr = 1;
    self.questionTitle.text = [NSString stringWithFormat:@"Question %d", self.questionNr];
    [self enableAnswerButtons];
    self.questionFeedback.text = @"";
    self.game = [[GameModel alloc] init];
    self.correctGuesses = 0;
    self.wrongGuesses = 0;
    [self.game createQuestions];
    [self setUpQuestion];
}

- (void)setUpQuestion {
    self.currentQuestion = [self.game getQuestion];
    self.questionText.text = self.currentQuestion[@"question"];
    [self.button1 setTitle:self.currentQuestion[@"answer1"] forState:UIControlStateNormal];
     [self.button2 setTitle:self.currentQuestion[@"answer2"] forState:UIControlStateNormal];
     [self.button3 setTitle:self.currentQuestion[@"answer3"] forState:UIControlStateNormal];
     [self.button4 setTitle:self.currentQuestion[@"answer4"] forState:UIControlStateNormal];
    self.correctAnswer = self.currentQuestion[@"correctAnswer"];
     [self.nextButton setTitle:@"Next question" forState:UIControlStateNormal];
    [self.game deleteQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)nextButtonClicked:(id)sender {
    self.clicks++;
    if(self.clicks == 5){
        [self pauseGame:@"Your results so far"];
        [self.nextButton setTitle:@"Continue" forState:UIControlStateNormal];
        
    } else if (self.clicks == 11){
        [self pauseGame:@"Game is finished!"];
        [self.nextButton setTitle:@"Play again" forState:UIControlStateNormal];
        
    } else if (self.clicks == 12){
        [self startNewGame];
        
    } else {
        [self enableAnswerButtons];
        self.questionNr++;
        self.questionFeedback.text = @"";
        self.questionTitle.text = [NSString stringWithFormat:@"Question %d", self.questionNr];
        [self setUpQuestion];
    }
}

- (IBAction)button1Clicked:(id)sender {
    [self checkAnswer: [sender titleForState:UIControlStateSelected]];
}

- (IBAction)button2Clicked:(id)sender {
      [self checkAnswer: [sender titleForState:UIControlStateSelected]];
}

- (IBAction)button3Clicked:(id)sender {
      [self checkAnswer: [sender titleForState:UIControlStateSelected]];
}

- (IBAction)button4Clicked:(id)sender {
      [self checkAnswer: [sender titleForState:UIControlStateSelected]];
}

- (void)checkAnswer:(NSString*)answer {
    if([answer isEqualToString:self.correctAnswer]){
        self.questionFeedback.text = @"Correct answer!";
        self.correctGuesses++;
       
    } else {
        self.questionFeedback.text = [NSString stringWithFormat:@"Wrong answer, the correct answer should be: %@", self.correctAnswer];
         self.wrongGuesses++;
    }
    
    [self disableAnswerButtons];
    [self checkResult];
}

-(void)checkResult {

    if(self.correctGuesses + self.wrongGuesses == 5 || self.correctGuesses + self.wrongGuesses == 10){
        [self.nextButton setTitle:@"See stats" forState:UIControlStateNormal];
    }
}

-(void)pauseGame:(NSString*)text {
    [self setFeedbackText];
    self.button1.hidden = YES;
    self.button2.hidden = YES;
    self.button3.hidden = YES;
    self.button4.hidden = YES;
    self.questionTitle.text = text;
    self.questionText.text = [NSString stringWithFormat:@"Correct guesses: %d \n Wrong guesses: %d", self.correctGuesses, self.wrongGuesses];
}

-(void)showButtons {
    self.button1.hidden = NO;
    self.button2.hidden = NO;
    self.button3.hidden = NO;
    self.button4.hidden = NO;
}

/*
#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    NSLog(@"Prepare for segue, %@", segue.identifier);
    
    if([segue.identifier isEqualToString:@"ResultSegue"]){
 
  ResultsViewController *resultView = [segue destinationViewController];
        resultView.corrAnswers.text = [NSString stringWithFormat:@"%d", self.correctGuesses];
        resultView.wrongAnswers.text = [NSString stringWithFormat:@"%d", self.wrongGuesses];
        
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
    [self showButtons];
    self.button1.enabled = YES;
    self.button2.enabled = YES;
    self.button3.enabled = YES;
    self.button4.enabled = YES;
    self.nextButton.hidden = YES;
}

-(void)setFeedbackText {
    if(self.correctGuesses > self.wrongGuesses){
        self.questionFeedback.text = @"Cool! Well done!";
    } else {
        self.questionFeedback.text = @"Nah, you can do better!";
    }
}

@end
