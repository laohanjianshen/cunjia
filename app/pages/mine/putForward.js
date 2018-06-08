// pages/mine/putForward.js
const network = require("../../utils/network.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
    networkFail: false,
    inputValue:'',
    putNum:'',//提现金额
    numAll:'88.00',//可提现总金额
    isMore:false,//是否超出可提现余额
    isPut:false,//满足提现条件为true
  },
  //输入提款金额
    inputPutNum(e){
      this.setData({
        putNum:Math.round(parseFloat(e.detail.value)*100)/100
      })
      if(this.data.putNum>this.data.numAll){
        this.setData({
          isMore:true
        })
      }else{
        this.setData({
          isMore:false
        })
      }
      if(!this.data.isMore&&this.data.putNum>0){
        this.setData({
          isPut:true
        })
      }else{
        this.setData({
          isPut:false
        })
      }
    },
  //全部提现
    inputPutAll(){
      this.setData({
        inputValue:this.data.numAll,
        putNum:this.data.numAll
      })
    },
  //提现
    putFoward(){
      if(!this.data.isMore){
         console.log(this.data.putNum)
      }
     
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

  
})