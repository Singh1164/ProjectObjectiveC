//
//  main.m
//  GurleenFinalExam
//
//  Created by english on 2019-12-12.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *f_name , *l_name , *gender;
    u_int age;
    
}

@property NSString *f_name, *l_name, *gender;
@property u_int age;

-(void) setPersonData : (NSString *) aFName : (NSString *) aLName : (NSString *) aGender : (int) aAge;
-(void) printPersonData;
@end

@interface Student : Person

{
    u_int studentId;
    NSString *coursename;
}
@property u_int studentId;
@property NSString *coursename;

-(void) setStudentData : (int) aStudentId : (NSString *) aCoursename;
-(void) printStudentData;

@end

@interface Teacher : Person
{
    u_int teacherId;
    NSString *courseteached;
    double salary;

}

@property u_int teacherId;
@property NSString *courseteached;
@property double salary;

-(void) setTeacherData : (int) aTeacherId : (NSString *) aCourseteached : (double) aSalary;
-(void) printTeacherData;

@end

@interface Course : Teacher
{
    
    NSString *c_name;
    u_int c_code;
    u_int h_per_week;
    
}

@property NSString *c_name;
@property u_int c_code;
@property u_int h_per_week;

-(void) setCourseData: (NSString *) aC_name : (int ) aC_code : (int) aH_per_week;
-(void) printCourseData;

@end

@interface Grade : NSObject
{
    u_int studentId;
    u_int score;
    NSString *coursename;
    NSString *grade;
}
@property u_int studentId;
@property u_int score;
@property NSString *coursename;
@property NSString *grade;

-(void) setGradeData : (int) aStudentId : (int) aScore : (NSString *) aCoursename : (NSString *) aGrade;
-(void) calculateGrade;
-(void) printGradeData;

@end
//********************************************************* Interfaces

@implementation Person

@synthesize f_name , l_name , gender , age;

-(void)setPersonData:(NSString *)aFName :(NSString *)aLName :(NSString *)aGender :(int)aAge;
{

f_name = aFName;
l_name = aLName;
gender = aGender;
age = aAge;
}
-(void) printPersonData{
    NSLog(@"Person Data : \n First Name = %@ \n Last Name =%@ \nGender = %@ \nAge =%i" , f_name,l_name,gender,age);
}
@end

@implementation Student

@synthesize studentId ,coursename;

-(void) setStudentData:(int)aStudentId :(NSString *)aCoursename;
{
    studentId = aStudentId;
    coursename = aCoursename;
}

-(void) printStudentData{
    NSLog(@"Student Data : \n Student Id = %i \n Course Name =%@",studentId,coursename);
}

@end

@implementation Teacher

@synthesize teacherId,courseteached,salary;

-(void) setTeacherData:(int)aTeacherId :(NSString *)aCourseteached :(double)aSalary;
{
    teacherId = aTeacherId;
    courseteached = aCourseteached;
    salary = aSalary;
}

-(void) printTeacherData{
    NSLog(@" Teacher Data : \n Teacher Id = %i \n Course Teached = %@ \n Salary = %.2lf",teacherId,courseteached,salary);
}

@end

@implementation Course

@synthesize c_code,c_name,h_per_week;

-(void) setCourseData:(NSString *)aC_name :(int)aC_code :(int)aH_per_week;
{
    c_name = aC_name;
    c_code = aC_code;
    h_per_week = aH_per_week;
}

-(void) printCourseData{
    NSLog(@" Course Data : \n Course Name = %@ \n Course Code = %i \n Hours Per Week = %i",c_name,c_code,h_per_week);
}

@end


@implementation Grade
@synthesize studentId,score,coursename,grade;


-(void) setGradeData:(int)aStudentId :(int)aScore :(NSString *)aCoursename :(NSString *)aGrade;
{
    studentId = aStudentId;
    score = aScore;
    coursename = aCoursename;
    grade = aGrade;
}

-(void) calculateGrade{
    int score = 0;
    if (score>=90 && score<=100) {
        NSLog(@"Grade = %c",'A' );
    }
    else if (score>=80 && score<=89.9)
    {
        NSLog(@"Grade = %c",'B' );
    }
    else if (score>=70 && score<=79.9)
    {
        NSLog(@"Grade = %c",'C' );
    }
    else if (score>=60 && score<=69.9)
    {
        NSLog(@"Grade = %c",'D' );
    }
    else if (score>=0 && score<=59.9)
    {
        NSLog(@"Grade = %c",'F' );
    }
}

-(void) printGradeData
{
    NSLog(@"Grade Data : \n Student Id = %i \n Course Name = %@ \n Score = %i \n Grade = %@",studentId,coursename,score,grade);
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        
int option;
        Student *s1 = [[Student alloc]init];
        Teacher *t1 = [[Teacher alloc]init];
        Course *c1 = [[Course alloc]init];
        
        do{
            NSLog(@"Enter 1 to enter data for the course \n Enter 2 to enter data for the Teacher \n Enter 3 to enter data for the Student \n Enter 4 to exit the application\n");
            scanf("%i",&option);
            switch (option){
            case 1 : {
                char cName[30];
                NSLog(@"Enter Course name : " );
                scanf("%s",cName);
                
                int cCode;
                NSLog(@"Enter Course Code : ");
                scanf("%i",&cCode);
                
                int hperWeek;
                NSLog(@"Hours per week for course : ");
                scanf("%i",&hperWeek);
                
                NSString *str1;
                str1 = [NSString stringWithFormat:@"%s", cName];
                
                [c1 setCourseData:str1 :cCode :hperWeek];
                
            }
                    break;
                case 2: {
                    int TeacherId;
                    NSLog(@"Enter Teacher Id : ");
                    scanf("%i",&TeacherId);
                    
                    char CourseTeached[30];
                    NSLog(@"Enter name of the course taught by teacher : ");
                    scanf("%s",CourseTeached);
                    
                    double Salary = 0.0;
                    NSLog(@"Enter salary of teacher : ");
                    scanf("%.2lf",Salary);

                    NSString *str2;
                    str2 = [NSString stringWithFormat:@"%s",CourseTeached];
                    
                    [t1 setTeacherData:TeacherId :str2 :Salary];
                    
                    
                }
                    break;
                    
                case 3:
                {
                    int StudentId;
                    NSLog(@"Enter Student Id : ");
                    scanf("%i",&StudentId);
                    
                    char CourseName[30];
                    NSLog(@"Enter name of the course : ");
                    scanf("%s",CourseName);
                    
                    
                    
                    NSString *str3;
                    str3 = [NSString stringWithFormat:@"%s",CourseName];
                    
                    [s1 setStudentData:StudentId :str3];
                }
                    break;
                    
                case 4: {
                    NSLog(@"You decide to quit?");
                }
                    break;
                    
                default: {
                    NSLog(@"Enter any key to quit.");
                }
                    break;
            }
        }
            while (option !=4);
            
      

       
        }
    return 0;
}


// Menu options were working fine.
// Cases are working well as well.
// User can enter required data in all cases.
// quit option is working well.
// There is some issues with restricting limit to all the classes but still working fine.
