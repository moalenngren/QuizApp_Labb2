//
//  GameModel.h
//  QuizApp
//
//  Created by ITHS on 2018-01-24.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject
@property (nonatomic) NSDictionary *questionsDictionary;
@property (nonatomic) NSMutableArray *questionsArray;
@property (nonatomic) int index;

- (NSDictionary*)getQuestion;

- (void)createQuestions;

+(int)getCorrectGuesses;
+(int)getWrongGuesses;
+(void)setCorrectGuesses:(int)guesses;
+(void)setWrongGuesses:(int)guesses;

@end

