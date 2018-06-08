// pages/productDetail/productDetail.js
const network=require("../../utils/network.js");
const util=require("../../utils/util.js");
const App=getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    networkFail:false,
    flavor_num:[10,30,50,70,90],//评价笑脸标准
    start:[1,2,3,4,5],
    startInfo:["差","一般","还不错","满意","非常满意"],
    imgUrls: [
      'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg',
      'http://img06.tooopen.com/images/20160818/tooopen_sy_175866434296.jpg',
      'http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg'
    ],
    swiperCurrent: 0, 
    //点赞
    isZan: false,
    boxLunchLikeNumber:1314,
    foodId:2,   //食物id，请求参数
    food:{},     //食物对象，接收参数
    foodtype:"",//食物类型
    isAdd:0,//是否可以加入购物车
    boxLunchLikeNumber:1314,
    plData:[],

  },
  // banner 
  swiperChange(e){
    this.setData({
      swiperCurrent: e.detail.current
    })
  },
  dotTap(e){
    this.setData({
      swiperCurrent:e.target.dataset.current
    })
  },
  //点赞
  dianzan(){
    this.setData({
      isZan:!this.data.isZan
    })
  },
  //点餐
  order(){
    var that=this;
    if(this.data.isAdd==0){//不可以点餐
      wx.showToast({
      title: '请先选择送餐日期',
      icon: 'none',
      duration: 2000
    })
    }else{//可以点餐
      var food=this.data.food;
      food.type=this.data.foodtype;
      food.isDelete=false;
      food.foodNumber=1;
      wx.getStorage({
        key:"foods",
        success(res){
          var arr=res.data;
          console.log(res.data)
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
              wx.setStorage({
                key:"haveAllPrice",
                data:{
                  allPrice:util.getFloat2(sum),
                  isRead:true
                }
              })
              /*that.setData({
                allPrice:util.getFloat2(sum),
                isRead:true
              })*/
            }
          })

        },
        fail(){
          console.log("fail")
          var arr=[];
          arr.push(food);
          wx.setStorage({
            key:"foods",
            data:arr,
            success(d){
              // console.log(food)
              that.setData({
                allPrice:util.getFloat2(food.foodPrice),
                isRead:true
              })
            }
          })
        }
      })
      
    }
  },
  
   /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(options)
    var that=this;
    this.setData({
      foodId:options.foodId,
      food:JSON.parse(options.food),
      foodtype:options.foodtype,
      isAdd:options.isAdd
    })
    network.ajax({
      url: network.getFood,
      method:'POST',
      data:{
        foodId: that.data.foodId
      },
      success:function(res){
        console.log(res.data);
        var jsonData=res.data;
        jsonData.foodSalePrice=util.getFloat2(jsonData.foodSalePrice)
        jsonData.foodPrice=util.getFloat2(jsonData.foodPrice)
        that.setData({
          food:jsonData
        })
      },
      fail:function(res){
        // console.log(res.data)
      }
    })

     // 获取评价列表
    network.ajax({
      url:network.getCommentList,
      method:"POST",
      data:{
        goodsId:that.data.foodId,
        commentSource:2,
        goodsDescribeId:0,
        offset:0,
        limit:2,
        boxLunchIsFire:0
      },
      success(res){
        that.getCommentListSuccess(res)
      }
     })
    that.commentPercent()
  },
  commentPercent(){
    var that=this;
    network.ajax({
      url:network.commentPercent,
      method:"POST",
      data:{
        goodsId:that.data.foodId,
        commentSource:2
      },
      success(res){
        console.log("***********获取百分比****************");
        console.log(res)  
        that.setData({
          percentNum:res.data
        })
      }
    })
  },
   getCommentListSuccess(res){
    console.log("***********获取评价列表****************");
    var that=this;
    if(res.status==0){//success
      var arr=that.data.plData.length==0?[]:that.data.plData;
      var arr2=[];
      for(var i=0;i<res.data.length;i++){
        arr2.push(res.data[i]);
        arr2[i].commentDate=res.data[i].commentDate.substr(0,10)
        arr2[i].selectAll=true;
        arr2[i].showNum=3;
        if(res.data[i].pictureUrl){
          arr2[i].pictureUrl=res.data[i].pictureUrl.split(",");
        }else{
          arr2[i].pictureUrl=[];
        }
        
      }
      this.setData({
        plData:arr.concat(arr2)
      })
     
    }else{//失败
      wx.showToast({
        title: '提交失败，请重试',
        icon: 'none',
        duration: 1000
      })
    }
    console.log(this.data.plData)
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
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function (e) {
   
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})