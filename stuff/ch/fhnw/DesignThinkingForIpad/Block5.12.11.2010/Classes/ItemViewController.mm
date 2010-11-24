//
//  ItemViewController.mm
//  iPad Block 1-4 
//
//  Created by Lukas Mueller.
//  Copyright by FHNW 2010. All rights reserved.
//

#import "ItemViewController.h"


#import "TapIcon.h"
#import <QuartzCore/QuartzCore.h>


@implementation ItemViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) 
	{
		// make a gradient background
		CAGradientLayer *gradient = [CAGradientLayer layer];
		gradient.frame = self.view.frame;
		UIColor *startColor = [UIColor colorWithWhite: 0.5 alpha: 1.0];
		UIColor *endColor = [UIColor blackColor];
		gradient.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id) [endColor CGColor], nil];
		[self.view.layer insertSublayer:gradient atIndex:1];
		
		col = 0;
		row = 0;
					
    }
    return self;
}

- (void)addTapItem:(int)iIndex withTitle:(NSString*) iTitle
{
	
	int x = 30;
	int y = 30;
	CGRect area = CGRectMake(x, y, 300, 300 );
	
	TapIcon* item = [[TapIcon alloc] initWithFrame:area];
	[ item setItemIndex: iIndex ];
	
	UIImage* image = [UIImage imageNamed:@"icon.jpg"];
	[ item setIcon: image];
	[ item setTitle:iTitle];
	item.delegate = self;
	
	
	area.origin.x += col * (area.size.width + 30);
	area.origin.y += row * (area.size.height + 30);
	
	col++;
	if( col == 2 )
	{
		col = 0;
		row++;
	}
	
	item.frame = area;
	
	[self.view addSubview: item ];
	
}

- (void)addTapItem:(int)iIndex 
{
	[self addTapItem:iIndex withTitle:@"No title Set"];
}


- (void)viewDidLoad 
{
	[super viewDidLoad];
}


- (void)dealloc 
{
	[super dealloc];
}


-(void)tapOnItem:(int)iItemIndex
{
	NSLog(@"Tapped on TapItem: %d", iItemIndex );
	[ delegate didSelectItem:iItemIndex];
}


@end