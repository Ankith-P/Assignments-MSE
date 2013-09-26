#import<Foundation/Foundation.h>
#include<stdlib.h>
#include<time.h>





int main(int argc, const char* argv[])
{
	NSAutoreleasePool *mempool = [[NSAutoreleasePool alloc]init];
   
	NSTimeInterval secondsperDay = 24*60*60;
   int lp=0;
   NSTimeInterval randDate = 0;
   
	NSDate *now = [NSDate date];

	NSLog(@"Today's date is: %@", now);
	NSDate *dayAfterTom = [[NSDate alloc] initWithTimeIntervalSinceNow:secondsperDay*2]; //today

   NSLog(@"Day after tomorrow's date is: %@", dayAfterTom); //day after tomorrow

   NSDate *altThursday = [NSDate dateWithNaturalLanguageString: @"Thursday last week"];
   NSLog(@"Using natural language last Thursday's date is: %@",altThursday);
   
   NSDate *dateGen = nil;	
	secondsperDay = 24*3600; 
   NSMutableArray *dateList = [[NSMutableArray alloc]init];

	NSLog(@"Random Dates: \n");
   
	for(lp = 0;lp < 5;lp++)
	{
		randDate = secondsperDay* (rand()%5);
		dateGen = [[NSDate alloc] initWithTimeIntervalSinceNow:randDate];
		[dateList addObject:dateGen];
		NSLog(@"%@", dateGen);
	}
   
	NSDate *oldDate = nil;
   
	for(id someDate in dateList)
	{

		if(oldDate == nil)      //finding oldest date
		{
			oldDate = someDate;
		}
		else if([oldDate compare:someDate] == NSOrderedDescending)
		{
			oldDate = someDate;
		}
	}
   
	NSLog(@"The oldest date in the list is: %@", oldDate);

   int firstday = 0;
   int tenthday = (firstday +2)%7;
   
   NSArray *myDays;
   myDays = [NSArray arrayWithObjects: @"Sunday", @"Monday", @"Tuesday", @"Wednesday",@"Thursday",@"Friday",@"Saturday",nil];
   
   
   NSLog(@"1st day of month is %@ & 10th day of month is %@\n",[myDays objectAtIndex:firstday],[myDays objectAtIndex:tenthday]);

	[mempool release];
	return 0;
}