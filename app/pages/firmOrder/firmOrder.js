// pages/firmOrder/firmOrder.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    bg_url:'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs_vch9r9yQvxvmfVOAoy9kM.zp9H4P7Mj6Mhee9124e9aa7476ba611878005fad430a.png',
    // bg_url:'../../images/firmOrder/firm_order_bg.png'
    // bg2_url:'../../images/firmOrder/firm_order_bg2.png',
    bg2_url:'http://p8p794w7d.bkt.clouddn.com/tmp/wx7a8795e5bef769da.o6zAJs_vch9r9yQvxvmfVOAoy9kM.k6bKpHgu6oND134f06e4967b746154cc57ff12482cf4.png',
    firm_order_note:'说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字',
    showNote:false,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
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
  // 显示企业团餐提示
  toggle_note:function(){
  this.setData({
    showNote: !this.data.showNote
  })
  },
  // 拨打订餐电话
  makePhoneCall:function(){
    wx.makePhoneCall({
      phoneNumber: '4006661753',
    })
  }
})