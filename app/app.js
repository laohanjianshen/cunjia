const util = require("/utils/util.js");
const constant = require("/utils/constant.js");
const network = require("/utils/network.js");


//app.js
App({
  onLaunch: function () {
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)
    this.login();
  },

  login() {
    // 登录
    var that = this;
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
        console.log("res.code:"+res.code)
        wx.request({
          url: network.weChatLogin,
          method: "POST",
          header: { "Content-Type": "application/x-www-form-urlencoded" },
          data: {
            userWxCode: res.code
          },
          success(d) {
            console.log("*******token****************")
            console.log(d)
            //清楚本地存储
            // wx.clearStorageSync()
            // that.globalData.access_token = d.data.data.userToken;
            that.globalData.access_token ="SeZ8SwzT4nmKbDFjWyHD1XRkO1ISbdVXCYt3g6rMzpJ4dX8eRsq/Lw==";
            if(that.globalData.access_token!=''){//access_token获取到了
                if(that.globalData.userInfo){
                  that.saveUser();
                }
              }

            //记录第一次登陆
            wx.getStorage({
              key: 'firstLogin',
              success: function(res) {
                  console.log("success location")
                  that.globalData.firstLogin=false;
              },
              fail(){
                console.log("fail location");
                that.globalData.firstLogin=true;
                wx.setStorage({
                  key:"firstLogin",
                  data:"this is first"
                })
              }
            })
            // that.upUserInfo();
          },
          fail(){
            console.log(1)
          }
        })
      },
      fail(){
        console.log("fail")
      }
    })
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {

          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              // console.log(res)
              // 可以将 res 发送给后台解码出 unionId
              that.globalData.userInfo = res.userInfo;//nickName-昵称,avatarUrl-头像
               console.log("********获取用户*********")
               console.log(res)
              if(that.globalData.userInfo){//userInfo获取到了
                that.saveUser();
              }
              // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
              // 所以此处加入 callback 以防止这种情况
              if (this.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  },
  //存储用户
  saveUser(){
    var that=this;
    console.log("********更新用户*********")
    console.log(that.globalData)
    this.upUserInfo(that.globalData.userInfo.nickName);
    wx.setStorage({//用户名，头像存储
      key:"userInfo",
      value:that.globalData.userInfo
    })
  },
  //更新用户
  upUserInfo(nickName){
    var that=this;
    network.ajax({
      url:network.updateUserInfo,
      method:"POST",
      data:{
        userNickname:nickName
      },
      success(res){
        /*console.log("*****更新用户**********")
        console.log(res)*/
        that.getShopInfo();
      },
      fail(res){
        // console.log(res)
      }
    })
  },
  
  //获取商铺信息
  getShopInfo(){
    var that=this;
    network.ajax({
      url:network.getShopInfo,
      method:"POST",
      success(res){
        that.globalData.shop=res.data;
        console.log("商铺")
        console.log(that.globalData.shop)
      },
      fail(res){
        // console.log(res)
      }
    })
  },
  onHide: function () {
    // 清除缓存
    // console.log('清除缓存')
    // wx.clearStorage()
  },
  globalData: {
    amap_key: '941a5d14ca57d32c79830c2dbd09d553',     //高德地图api
    qq_map_key: 'OLNBZ-WIFRF-DGVJB-JGJCG-7NW6J-TJBKK',//腾讯地图api
    userInfo: null,
    access_token: "",
    location: null,
    shop:{},//商铺信息
  }
})