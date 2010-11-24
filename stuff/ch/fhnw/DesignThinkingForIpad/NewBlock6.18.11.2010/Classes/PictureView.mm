//
//  PictureView.mm
//  iPad Block 1-4 
//
//  Created by Lukas Mueller.
//  Copyright by FHNW 2010. All rights reserved.
//


#import "PictureView.h"
#import "StudentController.h"


@implementation PictureView


- (id)initWithFrame:(CGRect)frame 
{
    if ((self = [super initWithFrame:frame])) 
	{
		// add foreground image:
		picture = [[UIImageView alloc] initWithFrame:itemArea];
		[self addSubview:picture];
    }
    return self;
}


- (CGFloat) getHeight
{
	return picture.frame.size.height;
}
- (CGFloat) getWidth
{
	return picture.frame.size.width;
}



- (void) setImage:(NSString*) iImageName
{
	
	NSString* picturePath  = [[StudentController getDataFolderPath] stringByAppendingPathComponent:iImageName];
	picture.image = [UIImage imageWithContentsOfFile:picturePath];	
	itemArea.size = picture.image.size;

	// check that the picture isnt bigger than super view itself:
	
	if( itemArea.size.width > self.frame.size.width )
	{
		itemArea.size.width = self.frame.size.width;
	}
	if( itemArea.size.height > self.frame.size.height )
	{
		itemArea.size.height = self.frame.size.height;
	}
	
	// place the image in the center of the view
	itemArea.origin.x = (self.frame.size.width - itemArea.size.width) / 2;
	itemArea.origin.y = (self.frame.size.height - itemArea.size.height) / 2;	
	picture.frame = itemArea;	
}


- (void)dealloc
{
	[picture release];
	[super dealloc];
}


@end