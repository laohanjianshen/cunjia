// pages/addressManage/addressManage.js
const utils = require("../../utils/util.js");
const networkTool = require("../../utils/network.js")
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
    networkFail: false,
    delete_status: false,
    index: 0,
    address: [],    //保留地址数组
    scroll_into_view_array: [],
    span: ' '
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    utils.networkType(this);
    // 没网络的时候测试用
    // var tmparray = []
    // var that = this;
    // var i = 0
    // for (i = 0; i < that.data.address.length; i++) {
    //   var obj = {}
    //   obj.scroll_into_view = 'scrollitem0' + i;
    //   tmparray.push(obj)
    // }
    // that.setData({
    //   scroll_into_view_array: tmparray
    // })
    // console.log(tmparray)
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

    var that = this;
    // 调用接口查询该用户收货地址
    networkTool.ajax({
      url: networkTool.listAddresses,
      method: 'POSt',
      success: function (res) {
        console.log('以获取所有收获地址:')
        console.log(res.data)
        that.setData({
          address: res.data,
          // currentAddress: res.data[0]   //目前默认地址需求还不明确，先默认第一个收货地址为默认
        })
        var i = 0;
        var tmparray = []
        for (i = 0; i < that.data.address.length; i++) {
          var obj = {}
          obj.scroll_into_view = 'scrollitem0' + i;
          tmparray.push(obj)
        }
        that.setData({
          scroll_into_view_array: tmparray
        })
      },
      fail: function () {
        var tmparray = []
        var i = 0
        for (i = 0; i < that.data.address.length; i++) {
          var obj = {}
          obj.scroll_into_view = 'scrollitem0' + i;
          tmparray.push(obj)
        }
        that.setData({
          scroll_into_view_array: tmparray
        });
        // lyy请求失败
        that.setData({
          networkFail: true
        });
      }
    })
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
    wx.showNavigationBarLoading() //在标题栏中显示加载
    this.onLoad();
    //模拟加载
    setTimeout(function () {
      // complete
      wx.hideNavigationBarLoading() //完成停止加载
      wx.stopPullDownRefresh() //停止下拉刷新
    }, 500);
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
  // 编辑收货地址
  edit_address: function (e) {
    var that = this;
    console.log(e)
    var tmpId = e.currentTarget.dataset.address_id
    // 遍历出被点击的地址
    var i;
    for (i = 0; ; i++) {
      if (that.data.address[i].addressId == tmpId) {
        break;
      }
    }
    // 将被选中将被编辑的地址缓存
    wx.setStorage({
      key: 'currentAddress',
      data: that.data.address[i],
    })
    console.log(that.data.address[i])
    wx.navigateTo({
      url: '../addAddress/addAddress?edit=1',
      success: function (res) { },
      fail: function (res) { },
      complete: function (res) { },
    })
  },
  /**
   * 跳转到新增地址页面
   */
  navigate_to_add: function () {
    // 清空当前缓存中的currentAddress
    wx.removeStorage({
      key: 'currentAddress',
      success: function (res) {
        console.log('清空当前缓存中的currentAddress')
      }
    })
    wx.navigateTo({
      url: '../addAddress/addAddress?add=1',
      success: function (res) { },
      complete: function (res) { },
    })
  },
  bindscroll: function (e) {
    console.log('scroll')
    var tmpId = e.currentTarget.dataset.scroll_id;
    var i = 0;
    var tmparray = []
    for (i = 0; i < this.data.scroll_into_view_array.length; i++) {
      if (i == tmpId) {
        console.log("tnpId = " + tmpId)
        var obj = {}
        //obj.scroll_into_view = 'scrollitem3' + i;
        tmparray.push(obj)
      }
      else {
        var obj = {}
        obj.scroll_into_view = 'scrollitem0' + i;
        tmparray.push(obj)
      }
    }
    this.setData({
      scroll_into_view_array: tmparray
    })
    console.log(e)
    console.log(this.data.scroll_into_view_array)
  },
  //删除收货地址
  deleteAddress: function (e) {
    console.log('尝试删除收货地址')
    console.log(e)
    var currentaddressId = e.currentTarget.dataset.address_id;
    console.log('currentaddressId = ' + currentaddressId)
    var that = this;
    //调用接口删除收货地址
    // console.log('url = ' + networkTool.deleteAddresses)
    networkTool.ajax({
      url: networkTool.deleteAddresses,
      method: 'POST',
      data: {
        userToken: getApp().globalData.access_token,
        addressId: currentaddressId,
      },
      success: function (res) {
        console.log(res)
        var that = this;
        // 调用接口查询该用户收货地址
      }
    })
    this.onShow()
  },

})
