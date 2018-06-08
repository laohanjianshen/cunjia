// pages/mine/bindTel.js
const util=require("../../utils/util.js");
var time=null;
const timeNum=60;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    tel:'',//电话号码
    code:'',//验证码
    btnInfo:'获取验证码',//获取验证码按钮的内容
    submitStatus:false//是否满足提交的条件
  },
  //输入电话号码
    inputTel(e){
      this.setData({
        tel:e.detail.value
      })
      this.checkStatus();
    },
    inputCode(e){
      this.setData({
        code:e.detail.value
      })
      this.checkStatus();
    },
  //获取验证码
    getCode(){
      if(time){
        return;
      }
      if(util.checkPhone(this.data.tel)){//手机验证通过
        var num=timeNum;
        time=setInterval(()=>{
          num--;
          this.setData({
            btnInfo:num+"秒后重试"
          })
          if(num<0){
            this.setData({
              btnInfo:"获取验证码"
            })
            clearInterval(time);
            time=null;
          }
        },1000)
      }else{//手机验证未通过
        wx.showToast({
          title: '请输入正确的手机号',
          icon: 'none',
          duration: 1000
        })
      }
    },
  //验证提交的状态
    checkStatus(){
      if(util.checkPhone(this.data.tel)&&this.data.code!=''){//可以提交
        this.setData({
          submitStatus:true
        })
      }else{//不可以提交
        this.setData({
          submitStatus:false
        })
      }
      
    },
  //提交
    submit(){
      if(this.data.submitStatus){//可以提交
        console.log("success")
      }
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
  
  }
})