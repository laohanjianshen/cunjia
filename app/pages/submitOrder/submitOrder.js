// pages/submitOrder/submitOrder.js
const utils =  require("../../utils/util.js");
const networkTool = require("../../utils/network.js")
Page({
  /**
   * 页面的初始数据
   */
  data: {
    // 所有日期盒饭列表
    dateList: [],
    
    // 用户地址数据
    address: [{
      cityName: "杭州",
      districtName: "萧山区",
      locationBuilding: "华锐中心 建设一路66号",
      addressName: "秃头",

      addressPhone: 12222222222
    },""],
    span: " ",
    ifChangeAddress: false,
    sex: '先生',
    currentAddress:{
      cityName:"杭州",
      districtName:"萧山区",
      locationBuilding:"华锐中心 建设一路66号",
      addressName:"秃头",
      addressPhone:12222222222
    },
    // 是否使用红包
    useRedPacket:true,
    // 红包是否可用
    redPacket:10,
    //红包详情弹出框状态
    showRedPacket:false,
    // 过期红包状态
    overdueRedPacket:false,
    // 优惠规则弹出
    youhuiModal:false,
    // 网络状态
    networkStatus:true,
      // 红包列表
    redPacketList:[],
      //自助点餐
      buffetFormatDate:'',//自助点餐送达时间
      buffetSurfacePrice:'',//自助点餐包装费
      orderTotalPrice:0,//合计
  },


  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
    that.setData({
      orderType:options.orderType
    })
    if(options.orderType==1){// 自助点餐-确认订单-start

      var comfireData=[{
        boxLunchDate:options.boxLunchDate,
        boxLunchList:[
          {
            boxLunchId:options.boxLunchId
          }
        ]
      }];
      comfireData=JSON.stringify(comfireData);
      networkTool.ajax({//确认订单
        url:networkTool.buffetComfireOrder,
        method:"POST",
        data:{
          dateList:comfireData
        },
        success(comfireRes){
          console.log("********自助点餐-确认订单 数据************")
          console.log(comfireRes)
          if(comfireRes.status==0){//成功
            var buffetData=comfireRes.data;
            var addressJson={
              cityName:buffetData.cityName,
              districtName:buffetData.districtName,
              locationBuilding:buffetData.locationBuilding,
              addressDetail:buffetData.addressDetail,
              addressName:buffetData.addressName,
              addressPhone:buffetData.addressPhone,
              addressSex:buffetData.userSex,
              addressId:buffetData.addressId
            }
            wx.getStorage({
              key:"deliver_time_12",
              success(res){
                that.setData({
                  buffetFormatDate:res.data//送达日期
                })
              }
            })
            //处理确认订单数据
            var buffetFoodList=buffetData.dateBoxLunchList;
            var buffetAllPrice=0;
            for(var i=0;i<buffetFoodList.length;i++){
              buffetAllPrice+=buffetFoodList[i].orderSurfacePrice+buffetFoodList[i].boxLunchTotalPrice;
            		buffetFoodList[i].timestamp=buffetFoodList[i].boxLunchDate;
              var date=new Date(buffetFoodList[i].boxLunchDate);
              var month=utils.time0(date.getMonth()+1);
              var d=utils.time0(date.getDate());
              var hours=utils.time0(date.getHours());
              var minutes=utils.time0(date.getMinutes());
              buffetFoodList[i].boxLunchDate=date.getFullYear()+"-"+month+'-'+d+" "+hours+":"+minutes;
              var foodVOList=[];
              var xiaocai=false;
              for(var j=0;j<buffetFoodList[i].boxLunchList[0].foodVOList.length;j++){
                if(buffetFoodList[i].boxLunchList[0].foodVOList[j].categoryName=="小菜"){
                  if(xiaocai){
                    for(var k=0;k<foodVOList.length;k++){
                      if(foodVOList[k].categoryName=="小菜"){
                        foodVOList[k].foodName=foodVOList[k].foodName+"、"+buffetFoodList[i].boxLunchList[0].foodVOList[j].foodName;
                        break;
                      }
                    }
                  }else{
                    foodVOList.push(buffetFoodList[i].boxLunchList[0].foodVOList[j]);
                    xiaocai=true;
                  }
                }else{
                  foodVOList.push(buffetFoodList[i].boxLunchList[0].foodVOList[j])
                }
              }
              buffetFoodList[i].boxLunchList[0].foodVOList=foodVOList;
            }

            that.setData({
              // currentAddress:addressJson,//地址
              orderList:buffetFoodList,//自主点餐列表
              orderTotalPrice:buffetAllPrice
            })

          }else{//失败
            wx.showToast({
              title: '系统异常，稍后重试',
              duration: 1000
            })
          }
        },
        fail(){
          wx.showToast({
            title: '系统异常，稍后重试',
            duration: 1000
          })
        }
      })
    }else{//个人点餐
      var data = {};
      wx.getStorage({
        key: 'personOrderSubmit',
        success: function (res) {
          data = res.data.dateList;
          //提交订单页面加载
          networkTool.ajax({
            url: networkTool.confirmPersonOrder,
            method: 'POST',
            data: { dateList: JSON.stringify(data) },
            success: function (res) {
              var orderList = res.data.dateBoxLunchList;
              var orderTotalPrice = 0;//订单实际总价
              for(var i =0; i<orderList.length;i++){
                orderList[i].boxLunchTotalPrice = parseFloat(orderList[i].boxLunchTotalPrice).toFixed(2);
                var date = new Date(orderList[i].boxLunchDate);
                var year = date.getFullYear();
                var month = (date.getMonth() + 1) > 9 ? date.getMonth() + 1 : "0" + (date.getMonth() + 1);
                var strDate = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
                var hours = date.getHours() > 9 ? date.getHours() : "0" + date.getHours();
                var minutes = date.getMinutes() > 9 ? date.getMinutes() : "0" + date.getMinutes();
                orderList[i].formatDate = year + "-" + month + "-" + strDate + " " + hours+":"+minutes;
               var surfacePrice=0;
               for (var j = 0; j < orderList[i].boxLunchList.length;j++){
                 surfacePrice += orderList[i].boxLunchList[j].boxLunchSurfacePrice;
                 orderList[i].boxLunchList[j].boxLunchPrice = parseFloat(orderList[i].boxLunchList[j].boxLunchPrice).toFixed(2);
                 orderList[i].boxLunchList[j].boxLunchSalePrice = parseFloat(orderList[i].boxLunchList[j].boxLunchSalePrice).toFixed(2);
               }
               orderList[i].surfacePrice = parseFloat(surfacePrice).toFixed(2);
               orderTotalPrice += parseFloat(orderList[i].boxLunchTotalPrice);
              }
              that.setData({
                orderList: orderList,
                orderType: options.orderType,
                orderTotalPrice: parseFloat(orderTotalPrice).toFixed(2)//订单实际总价
              });
            },
            fail: function (res) {
              console.log('请求失败')
            }
          })

        },
      });
    }
    //获取红包列表
    networkTool.ajax({
      url: networkTool.redPacketList,
      method: "POST",
      data: {},
      success(res) {
        console.log("**************")
        console.log(res)
        console.log("**************")
        if (res.data.length > 0) {
          var redPacket = 0;
          for (var i = 0; i < res.data.length; i++) {
            redPacket += res.data[i].redPacketPrice;
            res.data[i].redPacketPrice = parseFloat(res.data[i].redPacketPrice).toFixed(2);
            var date = new Date(res.data[i].redPacketGetTime);
            var year = date.getFullYear();
            var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0" + (date.getMonth() + 1);
            var day = new Date(year, month, 0).getDate();
            res.data[i].deadline = year + "-" + month + "-" + day;
          }
          that.setData({
            redPacketList: res.data,
            redPacket: parseFloat(redPacket).toFixed(2)//红包总额
          });
        }
      },
      fail(res) {
        // lyy请求失败
        that.setData({
          networkFail: true
        });
      }
    });
    
  },
  // 编辑收货地址
  edit_address: function (e) {
    var that = this;
    console.log(e)
    var tmpId = e.currentTarget.dataset.address_id
    // 遍历出被点击的地址
    var i;
    for (i = 0;;i ++){
      if (that.data.address[i].addressId == tmpId){
        break;
      }
    }
    // 将被选中将被编辑的地址缓存
    wx.setStorage({
      key: 'currentAddress',
      data: that.data.address[i],
    })
    console.log(that.data.address[i])
    wx.navigateTo({
      url: '../addAddress/addAddress?edit=1',
      success: function (res) { },
      fail: function (res) { },
      complete: function (res) { },
    })
  },
  // 选择收货地址
  toggle_change: function () {
    var that = this;
    that.setData({
      ifChangeAddress: !that.data.ifChangeAddress,
    })
  },
  /**
   * 跳转到新增地址页面
   */
  navigate_to_add: function () {
    // 清空当前缓存中的currentAddress
    wx.removeStorage({
      key: 'currentAddress',
      success: function (res) {
        console.log('清空当前缓存中的currentAddress')
        // console.log(res.data)
      }
    })
    wx.navigateTo({
      url: '../addAddress/addAddress?add=1',
      success: function (res) { },
      complete: function (res) { },
    })
  },
  // 红包弹窗
  showRedPacket: function (e) {
    var that=this;
    // 获取过期红包列表
    networkTool.ajax({
      url: networkTool.expiredRedPacket,
      method: "POST",
      data: {},
      success(res) {
        for (var i = 0; i < res.data.length; i++) {
          res.data[i].redPacketPrice = parseFloat(res.data[i].redPacketPrice).toFixed(2);
          var date = new Date(res.data[i].redPacketGetTime);
          var year = date.getFullYear();
          var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0" + (date.getMonth() + 1);
          var day = new Date(year, month, 0).getDate();
          res.data[i].deadline = year + "-" + month + "-" + day;
        }
        that.setData({
          expiredRedPacket: res.data
        });
      },
      fail(res) {
        // lyy请求失败
        that.setData({
          networkFail: true
        });
      }
    });
    this.setData({
      showRedPacket:true,
      // 当前操作红包的订单id
      currentOrderId:e.currentTarget.dataset.orderid,
      currentOrderSum: e.currentTarget.dataset.ordersum
    });
  },
  // 关闭红包弹窗
  closeRedPacket: function () {
    this.setData({
      showRedPacket: false
    });
  },
  //分享获得红包
  share:function () {

  },
  redPacketTotal:function(){
    //计算优惠总额
    var redPacketTotal=0;
    var orderTotalPrice=0;//最下方合计
    var orderList = this.data.orderList;
    for(var i=0;i<orderList.length;i++){
      if (orderList[i].redPacketValue){
        redPacketTotal += parseFloat(orderList[i].redPacketValue);
        orderList[i].littleTotal = (parseFloat(orderList[i].boxLunchTotalPrice) - parseFloat(orderList[i].redPacketValue)).toFixed(2);
      }
      orderTotalPrice += orderList[i].boxLunchTotalPrice - (orderList[i].redPacketValue||0)+orderList[i].orderSurfacePrice;
    }
    this.setData({
      redPacketTotal: redPacketTotal,
      orderList: orderList,
      orderTotalPrice: parseFloat(orderTotalPrice).toFixed(2)
    });
  },
  // 不使用红包、使用红包切换
  unuseRedPacket: function () {
    this.setData({
      useRedPacket: false,
      showRedPacket: false
    });
    for (var i = 0; i < this.data.orderList.length;i++){
      var id = "orderList[" + i +"].redPacketId";
      var val = "orderList[" + i +"].redPacketValue";
      this.setData({
        [id]: 0,
        [val]: 0
      });
    }
    for (var i = 0; i < this.data.redPacketList.length; i++) {
      var id ="redPacketList["+i+"].check";
      this.setData({
        [id]: 0,
      });
      
    }
    this.redPacketTotal();
  },
  // 空函数
  emptyFunc:function (){

  },
  // 查看过期红包
  showOverduePacket: function () {
    var overdueRedPacket = this.data.overdueRedPacket;
    this.setData({
      overdueRedPacket: !overdueRedPacket
    });
  },
  // 红包说明弹出
  openRedPacketModal: function () {
    this.setData({
      youhuiModal: true
    });
  },
  // 关闭红包说明
  closeRedPacketModal: function (){
    this.setData({
      youhuiModal: false
    });
  },
  // 变更收货地址
  changeAddress:function(e){
    console.log(e)
    var index = e.currentTarget.dataset.id;
    this.setData({
      currentAddress:this.data.address[index],
      ifChangeAddress:false
    })
  },
  // 选择红包
  chooseRedPacket:function(e){
    var index ="redPacketList["+e.currentTarget.dataset.id+"].check";
    var old = this.data.redPacketList[e.currentTarget.dataset.id].check;

    if (old == this.data.currentOrderId){
      //当前已选择，则取消选择
      this.setData({
        [index]: 0
      });
      for (var j = 0; j < this.data.orderList.length; j++) {
        if (this.data.orderList[j].boxLunchDate == this.data.currentOrderId) {
          var x = "orderList[" + j + "].redPacketId";
          var y = "orderList[" + j + "].redPacketValue";
          this.setData({
            [x]: 0,
            [y]: 0
          });
          break;
        }
      }
    }else{
      if (this.data.redPacketList[e.currentTarget.dataset.id].check > 0 && old!=this.data.currentOrderId){
        // 红包已经被其他订单选择
        return;
      }else{
        // 当前选择的红包金额是否大于当前订单金额
        if (parseFloat(this.data.currentOrderSum) < this.data.redPacketList[e.currentTarget.dataset.id].redPacketPrice){
          wx.showModal({
            title: '温馨提示',
            content: '红包金额不能大于订单金额',
          });
          return;
        }
        for (var i = 0; i < this.data.redPacketList.length; i++) {
          // 当前订单是否已经选择了其他红包，若是的话，取消其他的选择当前选择的
          var ind = "redPacketList[" + i + "].check";
          if (this.data.redPacketList[i].check == this.data.currentOrderId){
            this.setData({
              [ind]: 0
            });
          }

        }
        this.setData({
          [index]: this.data.currentOrderId
        });
        for (var j = 0; j < this.data.orderList.length;j++){
          if (this.data.orderList[j].boxLunchDate == this.data.currentOrderId){
            var x = "orderList[" + j +"].redPacketId";
            var y = "orderList[" + j +"].redPacketValue";
            this.setData({
              [x]: this.data.redPacketList[e.currentTarget.dataset.id].redPacketId,
              [y]: this.data.redPacketList[e.currentTarget.dataset.id].redPacketPrice
            });
            break;
          }
        }
      }
      
    }
    this.redPacketTotal();
    this.setData({
      showRedPacket: false
    });
  },
  createOrder:function(){
  // 提交订单
    var that=this;
    var boxLunchList=[];
    if(that.data.orderType==0){//个人点餐
      for (var i = 0; i < that.data.orderList.length;i++){
        boxLunchList.push({ 
          boxLunchDate: that.data.orderList[i].boxLunchDate,
          orderTotalPrice: parseFloat(that.data.orderList[i].boxLunchTotalPrice),
          redPacketId: that.data.orderList[i].redPacketId||0,
          boxLunchList:[]
        });
        for (var j = 0; j < that.data.orderList[i].boxLunchList.length; j++){
          boxLunchList[i].boxLunchList.push({
            boxLunchId: that.data.orderList[i].boxLunchList[j].boxLunchId,
            skuId: that.data.orderList[i].boxLunchList[j].skuId,
            skuName: that.data.orderList[i].boxLunchList[j].skuName ,
            condimentId: that.data.orderList[i].boxLunchList[j].condimentId||0,
            condimentName: that.data.orderList[i].boxLunchList[j].condimentName||"",
            boxLunchNumber: that.data.orderList[i].boxLunchList[j].boxLunchNumber
          });
        }
      }
      var data = { addressId: that.data.currentAddress.addressId, orderPayType: 0, orderType: that.data.orderType, dateList: JSON.stringify(boxLunchList)};
    }else{//自主点餐
		//    console.log("***创建订单****")
		//    console.log(that.data.orderList)
      for(var i=0;i<that.data.orderList.length;i++){
      	var minBoxLunchList=[];
      	for(var j=0;j<that.data.orderList[i].boxLunchList.length;j++){
      		minBoxLunchList.push({
      			boxLunchId:that.data.orderList[i].boxLunchList[j].boxLunchId,
      			boxLunchNumber:that.data.orderList[i].boxLunchList[j].boxLunchNumber,
      		})
      	}
      	boxLunchList.push({
      		boxLunchDate:that.data.orderList[i].timestamp,
      		redPacketId:that.data.orderList[i].redPacketId||0,
      		orderTotalPrice:that.data.orderList[i].boxLunchTotalPrice,
      		boxLunchList:minBoxLunchList,
      		orderSurfacePrice:that.data.orderList[i].orderSurfacePrice
      	})
      }
      var data={
      	addressId:that.data.currentAddress.addressId,
      	orderPayType:0,
      	orderType:1,
      	dateList:JSON.stringify(boxLunchList)
      }
    }
    
    networkTool.ajax({
      url: networkTool.createOrder,
      method: 'POST',
      data: data,
      success: function (res) {
        console.log("订单完成")
      	console.log(res)
        if (boxLunchList.length>1){
          //多订单
          wx.redirectTo({
            url: '../../pages/complexOrder/complexOrder',
          });
        }else{
          //单个订单
          wx.redirectTo({
            url: '../../pages/orderDetail/orderDetail?orderType='+that.data.orderType+"&orderId="+res.data[0].orderId+"&orderStatus=1",
          })
        }
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
    var that = this;
    // 调用接口查询该用户收货地址
    networkTool.ajax({
      url: networkTool.listAddresses,
      method: 'POST',
      success: function (res) {
        console.log('以获取所有收获地址:')
        // console.log(res.data)
        that.setData({
          address: res.data,
         // currentAddress: res.data[0]   //目前默认地址需求还不明确，先默认第一个收货地址为默认
        })
        if (that.data.address.length > 0){          //有时候返回成功但没有查到地址
          that.setData({
            currentAddress: res.data[0],   //目前默认地址需求还不明确，先默认第一个收货地址为默认
            notAddress: false
          })
          
        }else{
          //若没有地址
          that.setData({
            notAddress:true   //若没有地址
          })
        }
        console.log(that.data.address)
      }
    })
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
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})
