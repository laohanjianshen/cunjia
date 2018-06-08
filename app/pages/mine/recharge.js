// pages/mine/recharge.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    num:''
  },
  //输入金额
    inputMoney(e){
      this.setData({
        num:Math.round(parseFloat(e.detail.value)*100)/100
      })
    },
  //充值
    recharge(){
      console.log(this.data.num)
    },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
  },
})