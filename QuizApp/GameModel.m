//
//  GameModel.m
//  QuizApp
//
//  Created by ITHS on 2018-01-24.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel


- (void)createQuestions {
    
    self.questionsArray = [@[@{
                                @"question": @"How many strings does a ukulele have?",
                                @"answer1": @"4",
                                @"answer2": @"6",
                                @"answer3": @"8",
                                @"answer4": @"12",
                                @"correctAnswer": @"4"},
                             
                             @{@"question": @"What is a cajún?",
                               @"answer1":
                                    @"Small guitar",
                                    @"answer2": @"Drum",
                                    @"answer3": @"Harmonica",
                                    @"answer4": @"Rhythm claves",
                                    @"correctAnswer": @"Drum"
                                     },
                             
                             @{@"question": @"What's it called when you tune down the lowest string on a guitar two half steps?",
                               @"answer1":
                                   @"DADGAD",
                               @"answer2": @"Low key",
                               @"answer3": @"Minor chord",
                               @"answer4": @"Drop D",
                               @"correctAnswer": @"Drop D"
                               },
                             
                             @{@"question": @"What of the following is NOT an actual note?",
                               @"answer1":
                                   @"A#",
                               @"answer2": @"Cb",
                               @"answer3": @"Db",
                               @"answer4": @"F#",
                               @"correctAnswer": @"Cb"
                               },
                             
                             @{@"question": @"How are the strings on a bass tuned (from high to low)?",
                               @"answer1":
                                   @"EBGD",
                               @"answer2": @"GADE",
                               @"answer3": @"GDAE",
                               @"answer4": @"BDGE",
                               @"correctAnswer": @"GDAE"
                               },
                             
                             @{@"question": @"How many notes are there in an octave?",
                               @"answer1":
                                   @"8",
                               @"answer2": @"10",
                               @"answer3": @"12",
                               @"answer4": @"16",
                               @"correctAnswer": @"12"
                               },
                             
                             @{@"question": @"What is it called to play the strings on a violin with your fingers?",
                               @"answer1":
                                   @"Staccato",
                               @"answer2": @"Fortissimo",
                               @"answer3": @"Allegro",
                               @"answer4": @"Pizzicato",
                               @"correctAnswer": @"Pizzicato"
                               },
                             
                             @{@"question": @"Which name can be referred to as a triplet?",
                               @"answer1":
                                   @"Annika",
                               @"answer2": @"Charlotte",
                               @"answer3": @"Magdalena",
                               @"answer4": @"My",
                               @"correctAnswer": @"Annika"
                               },
                             
                             @{@"question": @"Which notes are used in an E minor chord?",
                               @"answer1":
                                   @"E,F,B",
                               @"answer2": @"C,E,G",
                               @"answer3": @"D,F,E",
                               @"answer4": @"E,G,B",
                               @"correctAnswer": @"E,G,B"
                               },
                             
                             @{@"question": @"What does bpm stand for?",
                               @"answer1":
                                   @"Banjos Per Man",
                               @"answer2": @"B:s Per Major",
                               @"answer3": @"Beats Per Minute",
                               @"answer4": @"Blasts Per Machine",
                               @"correctAnswer": @"Beats Per Minute"
                               },
                             
                             @{@"question": @"What is the function of the PFL button on a mixing console?",
                               @"answer1":
                                   @"Line out the signal",
                               @"answer2": @"Fade down the limiter",
                               @"answer3": @"Listen before fader",
                               @"answer4": @"Gain the input",
                               @"correctAnswer": @"Listen before fader"
                               },
                             
                             @{@"question": @"Which of the following is the most famous live vocal microphone?",
                               @"answer1":
                                   @"Sennheizer 12C",
                               @"answer2": @"Shure SM58",
                               @"answer3": @"Niemann 1330",
                               @"answer4": @"JJ LABS K14",
                               @"correctAnswer": @"Shure SM58"
                               },
                             
                             @{@"question": @"What does +48 stand for?",
                               @"answer1":
                                   @"Behringer console",
                               @"answer2": @"Compressor threshold",
                               @"answer3": @"Piano keys",
                               @"answer4": @"Phantom power",
                               @"correctAnswer": @"Phantom power"
                               },
                             
                             ] mutableCopy];
  
}

- (NSDictionary*)getQuestion {
    self.index = arc4random_uniform((int)self.questionsArray.count);
      NSLog(@"Randomizing: %@", @(self.index));
    return self.questionsArray[self.index];
    
}

-(void)deleteQuestion {
      NSLog(@"Deleting: %@", @(self.index));
    [self.questionsArray removeObjectAtIndex:self.index];
}


@end
