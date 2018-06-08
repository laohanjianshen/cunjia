// pages/mine/redPacket.js
const network = require("../../utils/network.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
    networkFail: false,
    // 红包说明弹出框状态
    redPacketModal:false,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    //获取红包列表
    network.ajax({
      url: network.redPacketList,
      method: "POST",
      data: {},
      success(res) {
        console.log("**************")
        console.log(res)
        console.log("**************")
        if (res.data.length>0){
          var redPacket=0;
          for(var i=0;i<res.data.length;i++){
            redPacket += res.data[i].redPacketPrice;
            res.data[i].redPacketPrice = parseFloat(res.data[i].redPacketPrice).toFixed(2);
            var date = new Date(res.data[i].redPacketGetTime);
            var year=date.getFullYear();
            var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0" + (date.getMonth() + 1);
            var day=new Date(year,month,0).getDate();
            res.data[i].deadline=res.data[i].redPacketGetTime.substring(0,10)
          }
          that.setData({
            redPacketList:res.data,
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
    // 获取过期红包列表
    network.ajax({
      url: network.expiredRedPacket,
      method: "POST",
      data: {},
      success(res) {
        for (var i = 0; i < res.data.length; i++) {
          res.data[i].redPacketPrice = parseFloat(res.data[i].redPacketPrice).toFixed(2);
          var date = new Date(res.data[i].redPacketGetTime);
          var year = date.getFullYear();
          var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0" + (date.getMonth() + 1);
          var day = new Date(year, month, 0).getDate();
          res.data[i].deadline = res.data[i].redPacketGetTime.substring(0,10)
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
    
  },
  // 分享赚红包
  onShareAppMessage: function (res) {
    if (res.from === 'button') {
      // 来自页面内转发按钮
      console.log(res.target)
    }
    return {
      title: '自定义转发标题',
      path: '/mine/redPacket?id=123',
      success: function (res) {
        // 转发成功
        console.log(res.shareTickets);
      },
      fail: function (res) {
        // 转发失败
      }
    }
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
      redPacketModal: true
    });
  },
  // 关闭红包说明
  closeRedPacketModal: function () {
    this.setData({
      redPacketModal: false
    });
  },
  // 空函数
  emptyFunc: function () {

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
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})