// pages/myOrder/myOrder.js
const network = require("../../utils/network.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
    networkFail: false,
    loadMore:false,
    // 当前页面已加载的订单数
    orderNum:0,
    orders:[],
    request_data:{
      orderStatus:0,
      offset:0,
      limit:10
    },
    boxLunchVOList: [
      {
        pic: '../../images/index/example.png',
        name: '酸辣土豆丝',
        quantity: 2,
        price: 16
      },
      {
        pic: '../../images/index/example.png',
        name: '酸辣土豆丝',
        quantity: 2,
        price: 16
      }
    ],
    orderList:[],
    ifShowStatus: [true, true, true, true, true],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  toOrderDetail(e){//进入详情
    console.log("*********进入详情*******")
    console.log(e)
    var type=e.currentTarget.dataset.ordertype;
    var id=e.currentTarget.dataset.orderid;
    var status=e.currentTarget.dataset.orderstatus;
    wx.navigateTo({
      url:"../orderDetail/orderDetail?orderType="+type+"&orderId="+id+"&orderStatus="+status
    })
  },
  onLoad: function (options) {
    this.loadOrders({
      orderStatus: 0, offset: this.data.orderNum, limit:5
    })
  },
  /**
   * 加载订单
   * config为参数
   */
  loadOrders:function(config){
    var that = this;
    var tmpOrders = that.data.orderList;
    network.ajax({
      url: network.getOrderList,
      method: "POST",
      data: config,
      success(res) {
        console.log("**************获取订单列表-orderList****************")
        console.log(res)
        for (var i = 0; i < res.data.length; i++) {
          var totalPrice = 0;
          for (var j = 0; j < res.data[i].boxLunchList.length; j++) {
            totalPrice += res.data[i].boxLunchList[j].boxLunchPrice;
          }
          res.data[i].orderCreateTime = res.data[i].orderCreateTime.substring(0,19);
          // console.log(res.data[i].orderCreateTime)
          res.data[i].totalPrice = totalPrice;
          tmpOrders.push(res.data[i])
        }
        that.setData({
          orderList: tmpOrders,
          orderNum: that.data.orderNum + res.data.length
        })
        console.log(that.data.orderList)
      },
      fail(res) {
        // lyy请求失败
        that.setData({
          networkFail: true
        });
      }
    });
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
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    this.setData({
      loadMore: true
    })
    this.loadOrders({
      orderStatus: 0, offset: this.data.orderNum, limit: 5
    })
    this.setData({
      loadMore: false
    })
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  /**
   * 变更显示的订单状态
   */
  toogle_orderStatus:function(e){
    var arr_index0 = e.currentTarget.dataset.start;
    var arr_index1 = e.currentTarget.dataset.end;
    var tmpArr = []
    for (var i = 0; i < arr_index0;i ++){
      tmpArr.push(false)
    }
    for (var i = arr_index0; i < arr_index1;i ++){
      tmpArr.push(true)
    }
    for (var i = arr_index1; i < 5; i++) {
      tmpArr.push(false)
    }
    this.setData({
      ifShowStatus:tmpArr
    })
  },
  // 时间标准化
  timeReDesign1:function(tmpDate){
    return ('' + tmpDate.getFullYear() + '-' + (tmpDate.getMonth() + 1) + '-' + tmpDate.getDate() + ' ' + 
    tmpDate.getHours() + ':' + 
    (tmpDate.getMinutes() > 9 ? tmpDate.getMinutes() : '0' + tmpDate.getMinutes()) + ':' + 
    (tmpDate.getSeconds() > 9 ? tmpDate.getSeconds() : '0' + tmpDate.getSeconds()));
  },
  timeReDesign2: function (tmpDate) {
    return ('' + tmpDate.getFullYear() + '-' + (tmpDate.getMonth() + 1) + '-' + tmpDate.getDate() + ' ' +
      tmpDate.getHours() + ':' +
      tmpDate.getMinutes() + ':' +
      tmpDate.getSeconds());
  },
  //评价
  comment:function(e){
    console.log(e);
    var id=e.currentTarget.dataset.id;
    var type=e.currentTarget.dataset.type;
    if(type==0){//个人
      var commentSource=1;
    }else{//自助
      var commentSource=2;
    }
    wx.navigateTo({
      url:"../orderComment/orderComment?goodsId="+id+"&commentSource="+commentSource
    })
  }
})