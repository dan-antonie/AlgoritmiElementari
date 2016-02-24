//
//  MyFlickerPhoto.m
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

#import "MyFlickerPhoto.h"

@implementation MyFlickerPhoto
-(id)initFromDictionary:(NSDictionary*) dic{
    self = [super init];
    self.title = [dic valueForKey:@"title"];
    self.photoURL = [dic valueForKey:@"link"];
    self.media = [[dic valueForKey:@"media"]valueForKey:@"m"];
    self.dateTaken = [dic valueForKey:@"date_taken"];
    self.photoDescription = [dic valueForKey:@"description"];
    self.published = [dic valueForKey:@"published"];
    self.author = [dic valueForKey:@"author"];
    self.author_id = [dic valueForKey:@"author_id"];
    self.tags = [dic valueForKey:@"tags"];
    return self;
}
@end
