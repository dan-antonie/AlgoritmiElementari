//
//  MyFlickerPhoto.h
//  PhotosFromFlicker
//
//  Created by Horatiu on 08/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//
//{
//    "title": "United link strengthens as Mou hints at EPL stay",
//    "link": "http://www.flickr.com/photos/unitednewsclub/24891358055/",
//    "media": {"m":"http://farm2.staticflickr.com/1460/24891358055_f4ce405b14_m.jpg"},
//    "date_taken": "2016-02-08T01:02:46-08:00",
//    "description": " <p><a href=\"http://www.flickr.com/people/unitednewsclub/\">unitednewsclub<\/a> posted a photo:<\/p> <p><a href=\"http://www.flickr.com/photos/unitednewsclub/24891358055/\" title=\"United link strengthens as Mou hints at EPL stay\"><img src=\"http://farm2.staticflickr.com/1460/24891358055_f4ce405b14_m.jpg\" width=\"240\" height=\"160\" alt=\"United link strengthens as Mou hints at EPL stay\" /><\/a><\/p> <p>Portuguese manager Jose Mourinho is getting closer than ever to becoming the next Manchester United manager.<br /> <br /> In an interview with [Sky Sports] Mourinho hinted that he doesn\'t wish to go back to Spain claiming that he wants competition every week.<br /> <br /> <br /> It is understood that the 53 year old ... <br /> <br /> <a href=\"http://unitednews.club/team-news/united-link-strengthens-mou-hints-epl-stay-27175/\" rel=\"nofollow\">unitednews.club/team-news/united-link-strengthens-mou-hin...<\/a><\/p>",
//    "published": "2016-02-08T09:02:46Z",
//    "author": "nobody@flickr.com (unitednewsclub)",
//    "author_id": "132734970@N02",
//    "tags": "football soccer united manchesterunited mufc premierleague epl unitednewsclub"
//},



#import <Foundation/Foundation.h>

@interface MyFlickerPhoto : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *photoURL;
@property (nonatomic,strong) NSString *media;
@property (nonatomic,strong) NSString *dateTaken;
@property (nonatomic,strong) NSString *photoDescription;
@property (nonatomic,strong) NSString *published;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *author_id;
@property (nonatomic,strong) NSString *tags;

-(id)initFromDictionary:(NSDictionary*) dic;

@end
