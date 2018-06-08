// pages/orderComment/commentEnd.js
const network=require("../../utils/network.js")
Page({

  /**
   * 页面的初始数据
   */
  data: {
    goodsId:""
  },
  onLoad(options){
    this.setData({
      goodsId:options.goodsId
    })
  },
  toComment(){
    var that=this;
    wx.redirectTo({
      url:"../productComment/productComment?goodsId="+that.data.goodsId
    })
  },
  toIndex(){
    wx.switchTab({
      url: '../index/index'
    })
  }
  
})