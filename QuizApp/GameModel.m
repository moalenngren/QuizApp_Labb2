//
//  GameModel.m
//  QuizApp
//
//  Created by ITHS on 2018-01-24.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import "GameModel.h"

static int correctGuesses;
static int wrongGuesses;
@implementation GameModel


- (void)createQuestions {
    
    self.questionsArray = [@[@{
                                @"question": @"How many strings does a ukulele have?",
                                @"answer1": @"4",
                                @"answer2": @"6",
                                @"answer3": @"8",
                                @"answer4": @"12",
                                @"correctAnswer": @"4"
                             
                                } , @{@"question": @"What is a cajún?",
                                    @"answer1":
                                    @"Small guitar",
                                    @"answer2": @"Drum",
                                    @"answer3": @"Harmonica",
                                    @"answer4": @"Rhythm claves",
                                    @"correctAnswer": @"Drum"
                                     } ] mutableCopy]; 
  
}

- (NSDictionary*)getQuestion {
    self.index = arc4random_uniform((int)self.questionsArray.count);
    return self.questionsArray[self.index];
//removeObjectsAtIndexes:index; //SPARA TILL EFTERÅT
}

-(void)deleteQuestion {
    [self.questionsArray removeObjectAtIndex:self.index];
}

+(int)getCorrectGuesses {
    return correctGuesses;
}
+(int)getWrongGuesses {
    return wrongGuesses;
}
+(void)setCorrectGuesses:(int)guesses {
    correctGuesses = guesses;
}
+(void)setWrongGuesses:(int)guesses {
    wrongGuesses = guesses;
}


//How many strings does a ukulele have? 4, 6, 8, 12,
//What is a cajún? Small guitar, Drum, Harmonica, Rhythm claves
//What's it called when you tune down the lowest string on a guitar two half steps? DADGAD, Low key, Minor chord, Drop D
//What of the following is NOT an actual note? A# Cb Db F#
//How are the strings on a bass tuned (from high to low)? EBGD, GADE, GDAE, BDGE
//How many notes are there in an octave? 8, 10, 12, 16
//What is it called to play the strings on a violin with your fingers? Staccato, Fortissimo, Allegro, Pizzicato
//Which name can be referred to as a triplet? Annika, Charlotte, Magdalena, My
//Which notes are used in an E minor chord? E,F,B, C,E,G  D,F,E  E,G,B
//What does bpm stand for? Banjos Per Man, B:s Per Major, Beats Per Minute, Blasts Per Machine
//What is the function of the PFL button on a mixing console? Line out the signal, Fade down the limiter, Listen before fader, Gain the input
//Which of the following is the most famous live vocal microphone? Sennheizer 12C, Shure SM48, Niemann 1330, JJ LABS K14
//What does +48 stand for? Behringer console inputs, Piano keys, Compressor threshold, Phantom power



@end
