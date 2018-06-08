// pages/mine/suggest.js
const network = require("../../utils/network.js")
Page({

  /**
   * 页面的初始数据
   */
  data: {
    suggetContent:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
  },
  // 获取反馈内容
  getContent:function (e) {
    this.setData({
      suggetContent:e.detail.value
    });
  },
  // 提交反馈
  submitTo:function () {
    var that = this;
    network.ajax({
      url: network.adviseSubmit,
      method: "POST",
      data: {content: that.data.suggetContent},
      success(res) {
        console.log(res);
        if(res.msg=="success"){
          wx.showToast({
            title: '提交成功',
            icon: 'none',
            duration: 2000
          });
          setTimeout(function () {
           wx.navigateBack({});
          }, 2000);
        }else{
          wx.showToast({
            title: res.msg,
            icon: 'none',
            duration: 6000
          });
        }
        
      },
      fail(res) {
        console.log("shibai");
        // 请求失败
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
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})