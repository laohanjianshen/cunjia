// pages/mine/mine.js
const network = require("../../utils/network.js");
const App=getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
    networkFail: false,
    userInfo:null,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    if(App.globalData.userInfo){
      that.setData({
        userInfo:App.globalData.userInfo
      })
    }else{
       /*wx.getSetting({
        success: res => {
          console.log(res)
          if (res.authSetting['scope.userInfo']) {

            // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
            wx.getUserInfo({
              success: res => {
                that.setData({
                  userInfo:res.userInfo
                })
                App.upUserInfo(that.data.userInfo.nickName);
                if (this.userInfoReadyCallback) {
                  this.userInfoReadyCallback(res)
                }
              }
            })
          }
        }
      })*/
      that.myGetUser();
    }
  },
  //获取用户信息
  myGetUser(){
    var that=this;
    network.ajax({
      url:network.getUser,
      method:"POST",
      success(res){
        console.log("**********获取用户信息*****************")
        console.log(res)
        that.setData({
          userInfo:res.data
        })
      },
      fail(res){
        // console.log(res)
      }
    })
  },
  //跳转
  toBalance(){
    wx.navigateTo({
      url:"balance"
    })
  },
  // 联系客服
  callMe: function () {
    wx.makePhoneCall({
      phoneNumber: '400-666-1753' 
    })
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
  
  },
  navigate_to_addressManager:function(){
    wx.navigateTo({
      url: '../addressManage/addressManage',
      success: function(res) {},
      fail: function(res) {},
      complete: function(res) {},
    })
  }
})