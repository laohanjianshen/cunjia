// pages/mine/moneyDetail.js
const network = require("../../utils/network.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
    networkFail: false,
    arr:[
      {
        name:"微信充值",
        time:"2018-05-02 10:15:53",
        num:300
      },
      {
        name:"提现",
        time:"2018-05-02 10:15:53",
        num:-3
      },
      {
        name:"微信充值",
        time:"2018-05-02 10:15:53",
        num:300
      },
      {
        name:"提现",
        time:"2018-05-02 10:15:53",
        num:-3
      },
      {
        name:"微信充值",
        time:"2018-05-02 10:15:53",
        num:300
      },
      {
        name:"提现",
        time:"2018-05-02 10:15:53",
        num:-3
      },
      {
        name:"微信充值",
        time:"2018-05-02 10:15:53",
        num:300
      },
      {
        name:"提现",
        time:"2018-05-02 10:15:53",
        num:-3
      },
      {
        name:"微信充值",
        time:"2018-05-02 10:15:53",
        num:300
      }
    ]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    /*
    network.ajax({
      url: network.xx,
      method: "POST",
      data: {},
      success(res) {
      },
      fail(res) {
        // lyy请求失败
        that.setData({
          networkFail: true
        });
      }
    });
    */
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },
})