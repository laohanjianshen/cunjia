// pages/buffet/buffet.js
const network = require("../../utils/network.js");
const util = require("../../utils/util.js");
var HLTtimer=null;
var HLTtimer2=null;
const App=getApp();

Page({
  /**
   * 页面的初始数据
   */
  data: {
    // 网络请求状态
    networkFail: false,
    //倒计时描述模态框是否出现
    timeoutModal:false,
    // 当前选择的菜单类
    selectedMenu: 0,
    // 菜单项
    necessaryList: [],//必点列表
    noNecessaryList:[],//选点列表
    foodsList: [],
    // 订餐截止日期
    order_deadline_time: null,
    deliver_time: '',
    operate_bt: '选择配送送餐日期',
    // 是否调用时间选择
    change_deliver_time: false,
    // days: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28],
    // months: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
    // years: [2018, 2019, 2020, 2021],
    time_selector: [
      {
        year: 2018,
        months: [
          {
            month: 5,
            days: [30, 31]
          },
          {
            month: 6,
            days: [1, 2]
          }
        ]
      }
    ],
    weeks: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
    hasSelectedTime: false,
    day_index: 0,
    month_index: 0,
    year_index: 0,
    offsetHours: '00',
    offsetMinutes: '00',
    offsetSeconds: '00',
    offsetHoursY: '00',
    offsetMinutesY: '00',
    offsetSecondsY: '00',
    pickerChange:false,//是否选择
    tip_is_show:false,//提示页是否显示
    menuTip:false,//菜单必选提示文
    showMenuStatus:0,
    allPrice:16,//总体价格
    isRead:false,//true,可以点击 查看点了啥，false,则不可以
    requiredMenu:false,//必点，选点规则
    selectedMenuBtn:'',//选中的列表
    limit:20,//长度
    offset:0,//偏移量
  },

  /**
   * 生命周期函数--监听页面加载
   */
   getAllPrice(){//获取总价
    var that=this;
    wx.getStorage({
      key:"haveAllPrice",
      success(res){
        console.log("success")
        console.log(res)
        that.setData({
          allPrice:res.data.allPrice,
          isRead:res.data.isRead
        })

      },
      fail(){
          console.log("fail")
        }
    })
   },
  onLoad: function (options) {
    var that=this;
    this.getAllPrice();
    util.networkType(this);
      this.setData({
        tip_is_show:App.globalData.firstLogin
      })
    var that=this;
    this.getFoodClassify();
    
  },
  hideMenu(){
    this.setData({
      showMenu: false
    });
  },
  getFoodClassify(){//获取必点，选点列表
    var that=this;
    network.ajax({
      url: network.getFoodClassify,
      method:"GET",
      success(res){ 
        // console.log("*******获取必点，选点列表********");
        // console.log(res)
        that.setData({
          necessaryList:res.data.necessaryList,//必点列表
          noNecessaryList:res.data.noNecessaryList,//选点列表
          selectedMenuBtn:res.data.necessaryList[0].categoryName,
          selectedMenu:res.data.necessaryList[0].categoryId
        });
        that.getFoodList(that.data.selectedMenu,that.data.offset,that.data.limit);
      },
      fail(res) {
        // 请求失败
        that.setData({
          networkFail:true
        });
      }
    });
  },
  getFoodList(categoryId,offset,limit){//获取列表页
    var that=this;
    network.ajax({
      url:network.selfFood,
      method:"POST",
      data:{
        categoryId,
        offset,
        limit
      },
      success(res){
        // console.log("*********获取食物列表***********")
        var data=res.data.selfFoodList.length>0?that.changePrice(res.data.selfFoodList[0].foodVOList):[];
        that.setData({
          foodsList:data
        })
        // console.log(that.data.foodsList)
      } 
    })
  },
  changePrice(arr){//价格调整2位
    var newArr=arr;
    for(var i=0;i<newArr.length;i++){
      newArr[i].foodPrice=util.getFloat2(newArr[i].foodPrice);
      newArr[i].foodSalePrice=util.getFloat2(newArr[i].foodSalePrice);
    }
    return newArr;
  },
  requiredMenuShow(){//显示必点，选点规则
    this.setData({
      requiredMenu:true
    })
  },
  requiredMenuHide(){//隐藏必点，选点规则
    this.setData({
      requiredMenu:false
    })
  },
   //倒计时描述页面
  deadlineAnswer: function () {
    this.setData({
      timeoutModal:true
    });
  },
  //关闭倒计时描述
  closeYouhuiModal: function (){
    this.setData({
      timeoutModal: false
    });
  },
  know(){//我知道了
    this.setData({
        tip_is_show:false
      })
  },
  // 切换菜单
  selectMenu: function (e) {
    console.log(e)
    var con=e.currentTarget.dataset.name;
    var id=e.currentTarget.dataset.id;
    this.setData({
      selectedMenu: id,
      selectedMenuBtn:con,
      offset:0,
      showMenu: false
    });
    this.getFoodList(this.data.selectedMenu,this.data.offset,this.data.limit);
  },

  // 显示菜单
  showMenu: function () {
    if(this.data.showMenuStatus==0){
      this.setData({
        menuTip:App.globalData.firstLogin,
        showMenuStatus:1
      })
    }
    this.setData({
      showMenu: true,
    });
  },
  menuknow(){//菜单必选提示消失
    this.setData({
      menuTip:false
    })
  },
  // 点餐
  addCart: function (e) {
    this.setData({
      showMenu: false
    });
    var that=this;
    if(this.data.deliver_time==""||(this.data.offsetHours=='00'&&this.data.offsetMinutes=='00'&&this.data.offsetSeconds=='00')){//不可以点餐
      wx.showToast({
      title: '请先选择送餐日期',
      icon: 'none',
      duration: 2000
    })
    }else{//可以点餐
      var food=e.target.dataset.food;
      food.type=e.target.dataset.foodtype;
      food.isDelete=false;
      food.foodNumber=1;
      // console.log(food)
      wx.getStorage({
        key:"foods",
        success(res){
          // console.log("success");
          var arr=res.data;
          // console.log(res.data)
          var arr2=[];//小菜
          var arr3=[];//非小菜
          for(var i=0;i<arr.length;i++){
            if(arr[i].type=="小菜"){
              arr2.push(arr[i]);
            }else{
              arr3.push(arr[i]);
            }
          }
          if(food.type=="小菜"){
            if(arr2.length>=3){
              arr2.shift();
            }
            arr2.push(food)
          }else{
            if(arr3.length==0){
              arr3.push(food)
            }
            for(var i=0;i<arr3.length;i++){
              if(arr3[i].type==food.type){
                arr3[i]=food;
                break;
              }
              if(i==arr3.length-1){
                arr3.push(food)
              }
            }
          }
          var finishArr=arr2.concat(arr3);
          wx.setStorage({
            key:"foods",
            data:finishArr,
            success(d){
              var sum=0;
              // console.log(finishArr)
              for(var i=0;i<finishArr.length;i++){
                sum+=parseFloat(finishArr[i].foodSalePrice)
              }
              that.setData({
                allPrice:util.getFloat2(sum),
                isRead:true
              })
            }
          })

        },
        fail(){
          // console.log("fail")
          var arr=[];
          arr.push(food);
          wx.setStorage({
            key:"foods",
            data:arr,
            success(d){
              // console.log(food)
              that.setData({
                allPrice: util.getFloat2(food.foodSalePrice),
                isRead:true
              })
            }
          })
        }
      })
      
    }
  },
  showItemDetail(e){//查看商品详情
    console.log(e);
    var food=JSON.stringify(e.currentTarget.dataset.food);
    var foodtype=e.currentTarget.dataset.foodtype;
    var foodId=e.currentTarget.dataset.id;
    var isAdd=1;
    if(this.data.deliver_time==""||(this.data.offsetHours=='00'&&this.data.offsetMinutes=='00'&&this.data.offsetSeconds=='00')){
      isAdd=0;
    }
    wx.navigateTo({
      url:"buffetDetail?foodId="+foodId+"&food="+food+"&foodtype="+foodtype+"&isAdd="+isAdd
    })
  },
  // 点赞
  praise: function (e) {

  },
  readShop(){//看看点了啥
    var that=this;

    if(this.data.isRead){
      wx.setStorage({
        key:"time",
        data:that.data.deliver_time,
        success(){
          wx.navigateTo({
            url: 'buffetShop'
          })
        }
      })
      
      
    }else{
      wx.showToast({
        title: '请先选择菜品',
        icon: 'none',
        duration: 1000
      })
    }
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    // 初始化时间选择器
    this.initTimeSelector();
    this.getAllPrice();
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
    wx.showNavigationBarLoading() //在标题栏中显示加载
    this.onLoad();
    //模拟加载
    setTimeout(function () {
      // complete
      wx.hideNavigationBarLoading() //完成停止加载
      wx.stopPullDownRefresh() //停止下拉刷新
    }, 500);
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  /**
   * 初始化时间选择器
   */
  initTimeSelector: function () {
    var now = new Date()
    var time_selector = []
    var tmpYear = {}
    tmpYear.year = now.getFullYear()
    tmpYear.months = []
    var tmpMonth = {}
    tmpMonth.month = now.getMonth() + 1
    tmpMonth.days = []
    var tmpDay = now.getDate();
    tmpMonth.days.push(tmpDay)
    var tag = 0;  //标记位，为1需要新增一个月
    var monthTag = 1;
    var offset = 0;
    // 先判断月份
    switch (monthTag = this.checkMonth(now.getMonth() + 1)) {
      case 1:
        if (tmpDay + 13 > 31) {
          offset = tmpDay + 13 - 31
          tag = 1;
        }
        break
      case 0:
        if (tmpDay + 13 > 30) {
          offset = tmpDay + 13 - 30
          tag = 1;
        }
        break;
      case -1:
        if (this.checkYear(now.getFullYear())) {
          if (tmpDay + 13 > 29) {
            offset = tmpDay + 13 - 29
            tag = 1;
          }
        }
        else {
          if (tmpDay + 13 > 28) {
            offset = tmpDay + 13 - 28
            tag = 1;
          }
        }
    }
    if (tag == 1) {
      // 先补满本月的
      switch (monthTag) {
        case 1:
          for (var i = 1; i <= 31 - tmpDay; i++) {
            tmpMonth.days.push(tmpDay + i)
          }
          break;
        case 0:
          for (var i = 1; i <= 30 - tmpDay; i++) {
            tmpMonth.days.push(tmpDay + i)
          }
          break;
        case -1:
          if (this.checkYear(now.getFullYear())) {
            for (var i = 1; i <= 29 - tmpDay; i++) {
              tmpMonth.days.push(tmpDay + i)
            }
          }
          else {
            for (var i = 1; i <= 28 - tmpDay; i++) {
              tmpMonth.days.push(tmpDay + i)
            }
          }
      }
      // 将本月加入本年
      tmpYear.months.push(tmpMonth)
      // 补充下月的
      // 如果已经是12月
      if (now.getMonth() == 12) {
        var nextYear = {}
        nextYear.year = now.getFullYear() + 1
        nextYear.months = []
        var nextYearFirstMonth = {}
        nextYearFirstMonth.month = 1;
        nextYearFirstMonth.days = []
        for (var i = 0; i < tmpDay + 13 - 31; i++) {
          nextYearFirstMonth.days.push(i + 1)
        }
        nextYear.months.push(nextYearFirstMonth)
        time_selector.push(tmpYear)
        time_selector.push(nextYear)
      }
      // 不是12月
      else {
        var nextMonth = {}
        nextMonth.month = now.getMonth() + 1 + 1;
        nextMonth.days = []
        for (var i = 0; i < offset; i++) {
          nextMonth.days.push(i + 1)
        }
        tmpYear.months.push(nextMonth)
        time_selector.push(tmpYear)
      }
    }
    else {
      for (var i = 0; i < 13; i++) {
        tmpMonth.days.push(tmpDay + i + 1)
      }
      // 将本月加入本年
      tmpYear.months.push(tmpMonth)
      time_selector.push(tmpYear)
    }
    this.setData({
      time_selector: time_selector
    })
  },
  change_deliver_time: function () {
    this.setData({
      change_deliver_time: !this.data.change_deliver_time
    })
  },
  timeChanged: function (e) {
    // console.log(e)

    var yearIndex = e.detail.value[0] + 1;
    var monthIndex = e.detail.value[1] + 1;
    var dayIndex = e.detail.value[2] + 1;
    var days = this.data.days
    this.setData({
      pickerChange:true,
      // days:days,
      day_index: dayIndex - 1,
      month_index: monthIndex - 1,
      year_index: yearIndex - 1
    })
  },
  setTime: function () {
    var that=this;
    clearInterval(HLTtimer)
    clearInterval(HLTtimer2)
    if(this.data.pickerChange){
      var day_index = this.data.day_index
      var month_index = this.data.month_index
      var year_index = this.data.year_index
    }else{
      var day_index = 0;
      var month_index = 0;
      var year_index = 0;
    }
    this.setData({
      pickerChange:false
    })
    // console.log(year_index + ' ' + month_index + ' ' + day_index)
    var tmpDate = new Date()
    tmpDate.setFullYear(this.data.time_selector[year_index].year);
    tmpDate.setDate(1);
    tmpDate.setMonth(this.data.time_selector[year_index].months[month_index].month-1)
    tmpDate.setDate(this.data.time_selector[year_index].months[month_index].days[day_index]);
    // 获取时间差
      tmpDate.setHours(0,0,0);//00：00：00
      var timer00=tmpDate.getTime();//00：00：00时间戳
      network.ajax({
        url:network.getSelfTimestamp,
        method:"POST",
        data:{
          selfTimestamp:timer00
        },
        success(res){
          console.log("*********获取截至时间*************");
          console.log(res)
          var shopDiscountDeadline=res.data.shopTimestamp.shopDiscountDeadline;//优惠截至时间
          var shopBuyDeadline=res.data.shopTimestamp.shopBuyDeadline;//下单截至时间
          that.startCount(shopBuyDeadline);
          that.countDown(shopDiscountDeadline);
        }
      })
    /*
    *发送时间戳，获取后台数据时间戳
    */
    this.setData({
      deliver_date:tmpDate
    })
    var weekIndex = tmpDate.getDay()
    // console.log('weekIndex='  + weekIndex + tmpDate.getMonth())
    var oldTime=this.data.deliver_time;
    var month=this.data.time_selector[year_index].months[month_index].month>9?this.data.time_selector[year_index].months[month_index].month:'0'+this.data.time_selector[year_index].months[month_index].month;
    var day=this.data.time_selector[year_index].months[month_index].days[day_index]>9?this.data.time_selector[year_index].months[month_index].days[day_index]:'0'+this.data.time_selector[year_index].months[month_index].days[day_index];
    var deliver_time= this.data.time_selector[year_index].year + '-' + month + '-' + day + ' ' + this.data.weeks[weekIndex];
    this.setData({
      hasSelectedTime: true,
      deliver_time: '预定送餐日期：'+deliver_time
    })
    wx.setStorage({
      key:"deliver_time_12",
      value:that.data.time_selector[year_index].year + '-' + month + '-' + day + ' '+'12:00'
    })
    var hltdate=new Date(this.data.time_selector[year_index].year + '/' + this.data.time_selector[year_index].months[month_index].month + '/' + this.data.time_selector[year_index].months[month_index].days[day_index]);
    var timestamp=hltdate.getTime();
    wx.setStorage({
      key:"timestamp",
      data:timestamp
    })
    this.setData({
      change_deliver_time: false,
      operate_bt:'修改'
    })
    if(oldTime!=this.data.deliver_time){
      this.setData({
        isRead:false
      })
      wx.removeStorage({
        key: 'foods'
      })
    }

  },
  // 本地的倒计时
  startCount:function(timeNum){
     var that=this;
     var t2=timeNum;
     HLTtimer=setInterval(()=>{
      var date=new Date();
      var t1=date.getTime();
      var offset=t2-t1;
      if(offset<0){
        clearInterval(HLTtimer);
        that.setData({
          offsetHours:'00',
          offsetSeconds:'00',
          offsetMinutes:'00'
        })
      }else{
        var hours=Math.floor(offset/(60*60*1000))<10?'0'+Math.floor(offset/(60*60*1000)):Math.floor(offset/(60*60*1000));
        offset%=(60*60*1000);
        var minutes=Math.floor(offset/(1000*60))<10?'0'+Math.floor(offset/(1000*60)):Math.floor(offset/(1000*60));
        offset%=(60*1000);
        var seconds=Math.floor(offset/(1000))<10?'0'+Math.floor(offset/(1000)):Math.floor(offset/(1000));
        that.setData({
          offsetHours:hours,
          offsetSeconds:seconds,
          offsetMinutes:minutes
        })
      }
     },1000)

  },
  countDown(timeNum){//优惠倒计时
    var that=this;
    var t2=timeNum;
    HLTtimer2=setInterval(()=>{
    var date=new Date();
    var t1=date.getTime();
    var offset=t2-t1;
    if(offset<0){
      clearInterval(HLTtimer2);
      that.setData({
        offsetHoursY:'00',
        offsetSecondsY:'00',
        offsetMinutesY:'00'
      })
    }else{
      var hours=Math.floor(offset/(60*60*1000))<10?'0'+Math.floor(offset/(60*60*1000)):Math.floor(offset/(60*60*1000));
      offset%=(60*60*1000);
      var minutes=Math.floor(offset/(1000*60))<10?'0'+Math.floor(offset/(1000*60)):Math.floor(offset/(1000*60));
      offset%=(60*1000);
      var seconds=Math.floor(offset/(1000))<10?'0'+Math.floor(offset/(1000)):Math.floor(offset/(1000));
      that.setData({
        offsetHoursY:hours,
        offsetSecondsY:seconds,
        offsetMinutesY:minutes
      })
    }
    },1000)
  },
  // 检查闰年
  checkYear: function (year) {
    return false;//暂时假设只有非闰年
  },
  // 检查月份，确定每月日期
  checkMonth: function (month) {
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
      return 1;   //每月31天
    }
    else if (month == 4 || month == 6 || month == 9 || month == 11) {
      return 0;   //每月30天
    }
    else {
      return -1;   //每月28/29天
    }
  }
})