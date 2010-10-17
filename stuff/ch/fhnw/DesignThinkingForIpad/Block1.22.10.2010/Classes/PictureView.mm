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
		
		// change here to adjust the border width and color:
		borderSize = 0;
		borderColor = [UIColor clearColor];
		
		// initialize all parameters:
		scaleFactor = 1.0;		
		
		// add foreground image:
		picture = [[UIImageView alloc] initWithFrame:itemArea];
		[self addSubview:picture];
    }
    return self;
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


	// if full screen, then adjust to full size:
	if( fullScreenMode) 
	{
		scaleFactor = self.frame.size.width / itemArea.size.width;
	}
	else 
	{
		scaleFactor = 1;
	}

	itemArea.size.width *= scaleFactor;
	itemArea.size.height *= scaleFactor;
	
	
	picture.frame = itemArea;
	[self setTitle:iImageName];
	
	
	// adjust the border of the image:
	[self addBorder:borderSize andColor: borderColor];
}


- (void)dealloc
{
	[picture release];
	[super dealloc];
}


@end