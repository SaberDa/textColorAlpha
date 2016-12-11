//
//  ViewController.m
//  半透明的Label
//
//  Created by 李庚达 on 16/9/5.
//  Copyright © 2016年 李庚达. All rights reserved.
//

//在文字上面添加一个渐变透明的效果

#import "ViewController.h"

#define SCREEN_WIGHT

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建透明层（这么理解？）
    UIView *gradientView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-20, self.view.frame.size.height-100-100)];
    [self.view addSubview:gradientView];
    
    
    /**
     *  CAGrandientLayer 是苹果专门为处理梯度显示
        给他设置一个颜色的数组就可以了
        CAGrandientLayer会让这些颜色平缓过渡
     */
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    /**
     *  clearcolor
            透明度为0：黑色
            透明度为0.5
            透明度为1：设置为透明
     */
    NSArray *color = [NSArray arrayWithObjects:
                      
                      /*
                       (id)[[UIColor colorWithWhite:0 alpha:0]CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0.5]CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1]CGColor],
                       */
                      (id)[[UIColor colorWithRed:1 green:0.5 blue:0.8 alpha:0]CGColor],
                      (id)[[UIColor colorWithRed:0.5 green:0.6 blue:0.5 alpha:0.5]CGColor],
                      (id)[[UIColor colorWithRed:0.8 green:1 blue:0.2 alpha:1]CGColor],
                      nil];
    
    //设置透明层基本设施
    [gradientLayer setColors:color];
    [gradientLayer setStartPoint:CGPointMake(0.0f, 0.0f)];
    [gradientLayer setEndPoint:CGPointMake(0.0f, 00.2f)];
    [gradientLayer setFrame:gradientView.bounds];
    [[gradientView layer] setMask:gradientLayer];
    
    //设置滚动层
    UIScrollView *mainScroll = [[UIScrollView alloc]initWithFrame:gradientView.bounds];
    mainScroll.backgroundColor = [UIColor whiteColor];
    mainScroll.showsVerticalScrollIndicator = NO;
    [gradientView addSubview:mainScroll];
    
    //设置文本层
    NSString *text = self.text;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(self.view.frame.size.width-40, 0)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{
                                               NSFontAttributeName:[UIFont systemFontOfSize:18]
                                               } context:nil];
    CGFloat height = rect.size.height;
    mainScroll.contentSize = CGSizeMake(0, height);
    
    //添加文本以及设置文本的基础设置
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mainScroll.bounds.size.width, mainScroll.bounds.size.height)];
    textLabel.textColor = [UIColor blackColor];
    textLabel.textAlignment = NSTextAlignmentLeft;
    textLabel.text = text;
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:18];
    [mainScroll addSubview:textLabel];
}

- (NSString *)text {
    return @"\t大一上学期期末考试期间，\n我有重温了一遍《全职高手》，\n\t因此我萌发了一个想玩一个大型的RPG游戏，\n于是把现行的比较火的RPG拎出来看了看，\n\t情不自禁的就下载了魔兽。\n一是我一直就想体验一下RPG的祖宗，\n\t更主要的是就魔兽一款游戏有Mac平台的游戏，\n\t不得不说，\n和暴雪比起来，\n国内的游戏公司就是腊鸡。\n游戏了这么长的时间，\n我感触最深的一点就是魔兽玩家的素质，可以说，我从一级打到满级，没有一个玩家因我是新手而嫌弃我，没有一个玩家因我是新手就坑我，几乎所有人都会耐心的告诉我这里该怎么走，那里该怎么打，\n不管我问的问题在他们眼里有多无知，都会耐心的回答我。我敢断言，这种现象在现在最火的游戏某盟是绝对不会发生的。\n我现在还清楚的记得，我在幽暗城里迷路了随便找了一个玩家问路，他立即就把我领出了城。\n在游戏里，\n有个叫血灵的大哥非常照顾我，在我满级后我很迷茫我接下来怎么做，\n他一步一步的告诉我该去哪里做什么，\n还给我邮寄了一个传家宝，虽然到现在我也没有收到（他可能是寄错人了），但不管怎样，我在魔兽这个大家庭里很温暖";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
