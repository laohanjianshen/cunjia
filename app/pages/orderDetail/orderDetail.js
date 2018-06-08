// pages/orderDetail/orderDetail.js
// 村家经纬度
const util=require("../../utils/util.js");
const network = require("../../utils/network.js");
var lon=120.60911;
var lat=30.290281;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
      networkFail: false,
      //村家经纬度
      longitude:lon,
      latitude:lat,
      markers:[{
          id:0,
          longitude:lon,
          latitude:lat,
          iconPath:"../../images/order/address.png",
          width:155,
          height:73
      }],
      markers2:[{
            id:1,
            longitude:lon,
            latitude:lat,
            iconPath:"../../images/order/car.png",
            width:46,
            height:28,
            callout:{
              content:"配送中...",
              color:"#333",
              fontSize:12,
              bgColor:"#ffffff",
              padding:12,
              display:"ALWAYS"
            }
          }],
        // 配送信息
      deliveryInfo:{
      },
      // 订单详情
      orderList:[{
        id:1,
        name:"酸辣土豆丝",
        num:2,
        image:"../../images/personOrder/1.png",
        oldPrice:16,
        currrentPrice:14
      }, {
        id: 2,
        name: "酸辣土豆丝哈哈哈哈",
        num: 1,
        image: "../../images/personOrder/1.png",
        oldPrice:0,
        currrentPrice: 20
      }],
      requestIsShow:false,//申请退款弹框
      refundProgress:false,//退款进度
      orderType:0,
      orderId:0,
      orderDetail:{},//订单详情
      orderStatus:0,//订单状态 1、待配送；2、备货中；3、配送中、4、待评价：5、已完成

  },
  requestRefund(){//申请退款
    this.setData({
      requestIsShow:true
    })
  },
  callOffice(){
    wx.makePhoneCall({
      phoneNumber: '15737929356' //仅为示例，并非真实的电话号码
    })
  },
  cancelRequestRefund(){
    this.setData({
      requestIsShow:false
    })
  },
  cancelRefund(){//取消退款
    wx.showModal({
      title: '取消退款',
      content: "是否取消退款",
      confirmColor:"#fc9c02",
      cancelColor:"#666",
      cancelText:"否",
      confirmText:"是",
      success: function (res) {
        if (res.confirm) {
          console.log(1)
        }
      }
    })
  },
  // 查看退款进度
  readProgress(){
    this.setData({
      refundProgress:true
    })
  },
  closeReadProgress(){//关闭退款进度
    this.setData({
      refundProgress:false
    })
  },
  noCloseReadProgress(){//不关闭

  },
  // 拨打配送员电话
  callMe: function (e) {
    wx.makePhoneCall({
      phoneNumber: e.target.dataset.id 
    })
  },
  // 复制订单号
  copyOrder: function (e) {
    wx.setClipboardData({
      data: e.target.dataset.id,
      success: function (res) {
        wx.getClipboardData({
          success: function (res) {
            console.log(res.data) // data
          }
        })
      }
    })
  },
  // 评价订单
  orderComment:function (e) {
    // 跳转到评价订单页面
    wx.navigateTo({
      url: 'xxxx?id='+e.target.dataset.id,
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
    // 从我的订单页面过来
    this.setData({
      orderType:options.orderType,
      orderId:options.orderId,
      orderStatus:options.orderStatus,
    })

    network.ajax({
      url:network.getOrderDetail,
      method:"POST",
      data:{
        orderType:that.data.orderType,
        orderId:that.data.orderId
      },
      success(res){
        console.log("************获取订单详情*********************")
        console.log(res);
        if(res.data){
          var orderSendTime=parseInt(res.data[0].orderSendTime)*1000;//配送时间
          var orderCreateTime=parseInt(res.data[0].orderCreateTime)*1000;//下单时间
          orderSendTime=that.translateTime(orderSendTime);
          orderCreateTime=that.translateTime(orderCreateTime).time;
          var week=orderSendTime.time.substr(0,10)+" "+orderSendTime.week;
          var orderDetail=res.data[0];
          orderDetail.orderSendTime=orderSendTime.time;
          orderDetail.orderCreateTime=orderCreateTime;
          orderDetail.week=week;
          if(that.data.orderType==0){//个人
            that.setData({
              orderDetail
            })
          }else{
            var arr=res.data[0].boxLunchList[0].foodVOList;
            var orderDetail=res.data[0];
            orderDetail.orderList=arr;
            that.setData({
              orderDetail
            })
          }
          
        }
        
      }
    })
  
     
  },
  translateTime(num){
    var date=new Date(num);
    var year=date.getFullYear();
    var month=date.getMonth()+1>9?date.getMonth()+1:'0'+(date.getMonth()+1);
    var day=date.getDate()>9?date.getDate():'0'+date.getDate();
    var hours=date.getHours()>9?date.getHours():'0'+date.getHours();
    var minute=date.getMinutes()>9?date.getMinutes():'0'+date.getMinutes();
    var second=date.getSeconds()>9?date.getSeconds():'0'+date.getSeconds();
    var n=date.getDay();
    var arr=['周日','周一','周二','周三','周四','周五','周六'];
    return {
      time:year+"-"+month+"-"+day+" "+hours+":"+minute+":"+second,
      week:arr[n]
    }

  },
  translateMarker: function(that) {
    that.mapCtx.translateMarker({
      markerId: 1,
      autoRotate: true,
      duration: 1000,
      destination: {
        latitude:30.296507,
        longitude:120.614592,
      },
      animationEnd() {
        console.log('animation end')
      }
    })
   
  },
  onShareAppMessage: function () {
    
  }
})