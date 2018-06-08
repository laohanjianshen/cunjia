// pages/addAddress/addAddress.js
const utils = require("../../utils/util.js");
const networkTool = require("../../utils/network.js")
Page({
  /**
   * 页面的初始数据
   */
  data: {
    man_icon: '../../images/icon/not_selected.png',
    woman_icon: '../../images/icon/not_selected.png',
    delete_status: false,
    add_status: false,//判断是否从新增按钮跳转过来的
    edit_status: false,//判断是否从编辑按钮跳转过来的
    complete: false,
    save_ground: '',
    savebt_ground: '',
    span: " ",
    currentAddress: {
      addressName: '',
      addressId: null,
      locationId: null,
      cityName: '',
      districtName: '',
      locationBuilding: '点击选择',
      addressDetail: '',//详细地址
      addressPhone: '',
      addressSex: 0         //	性别0、男性；1、女性
    }
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 从编辑按钮跳转过来，需要一些数据回复
    if (options.edit == 1) {
      // console.log('edit'+options.edit)
      // 保存按钮点亮，删除按钮出现
      this.setData({
        edit_status: true,
        save_ground: '#fc9c02',
        savebt_color: '#fff',
      })
      // 从缓存取被点击地址
      var that = this;
      wx.getStorage({
        key: 'currentAddress',
        success: function (res) {
          // console.log(res.data)
          that.setData({
            currentAddress: res.data
          })
          // 恢复性别信息
          if (res.data.addressSex == 0) {
            that.setData({
              man_icon: '../../images/icon/selected.png',
              woman_icon: '../../images/icon/not_selected.png'
            })
          }
          else {
            that.setData({
              man_icon: '../../images/icon/not_selected.png',
              woman_icon: '../../images/icon/selected.png'
            })
          }
          // console.log(that.data.currentAddress)
        },
      })
    }
    // 从新建按钮跳转过来
    if (options.add == 1) {
      this.setData({
        add_status: true,
      })
    }
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    // console.log('onReady')
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    console.log('onShow')
    var that = this;
    wx.getStorage({
      key: 'currentAddress',
      success: function (res) {
        // console.log(res)
        if (that.data.currentAddress != null) {
          that.setData({
            save_ground: '#fc9c02',
            savebt_color: '#fff',
            complete: true,
            currentAddress: {
              addressSex: that.data.currentAddress.addressSex,
              cityName: res.data.cityName,
              districtName: res.data.districtName,
              locationId: res.data.locationId,
              locationBuilding: res.data.locationBuilding,
              addressPhone: that.data.currentAddress.addressPhone,
              addressName: that.data.currentAddress.addressName,
              addressDetail: res.data.addressDetail,
              addressId: that.data.currentAddress.addressId
            }
          })

          // 重新更新缓存
          wx.setStorage({
            key: 'currentAddress',
            data: that.data.currentAddress,
          })
        }
        console.log(that.data.currentAddress)
        // console.log(that.data.currentAddress)
      },
      fail: function (res) {
        // console.log('用户还没添加地址')
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
  //用户选择性别男
  selectSex0: function (e) {
    this.setData({
      man_icon: '../../images/icon/selected.png',
      woman_icon: '../../images/icon/not_selected.png'
    })
    this.data.currentAddress.addressSex = 0;
    // console.log(this.data.currentAddress)
  },
  //用户选择性别女
  selectSex1: function (e) {
    this.setData({
      man_icon: '../../images/icon/not_selected.png',
      woman_icon: '../../images/icon/selected.png'
    })
    this.data.currentAddress.addressSex = 1;
    // console.log(this.data.currentAddress)
  },
  update_name:function(e){
    console.log('用户名改变')
    var userName = e.detail.value
    this.setData({
      currentAddress:
      {
        addressSex: this.data.currentAddress.addressSex,
        cityName: this.data.currentAddress.cityName,
        districtName: this.data.currentAddress.districtName,
        locationId: this.data.currentAddress.locationId,
        locationBuilding: this.data.currentAddress.locationBuilding,
        addressPhone: this.data.currentAddress.addressPhone,
        addressName: userName,
        addressDetail: this.data.currentAddress.addressDetail,
        addressId: this.data.currentAddress.addressId
      }
    })
  },
  // 收货人姓名检查
  username_check: function (e) {
    console.log('收货人姓名检查')
    console.log(e)
    var userName = e.detail.value
    if (userName.length < 2 || userName.length > 5) {
      utils.showErrorDialog('收货人姓名长度异常')
    }
    else {
      this.setData({
        currentAddress:
        {
          addressSex: this.data.currentAddress.addressSex,
          cityName: this.data.currentAddress.cityName,
          districtName: this.data.currentAddress.districtName,
          locationId: this.data.currentAddress.locationId,
          locationBuilding: this.data.currentAddress.locationBuilding,
          addressPhone: this.data.currentAddress.addressPhone,
          addressName: userName,
          addressDetail: this.data.currentAddress.addressDetail,
          addressId: this.data.currentAddress.addressId
        }
      })
    }
  },
  update_phone: function (e) {
    var phoneNumber = e.detail.value
    // this.data.currentAddress.addressPhone = phoneNumber
    this.setData({
      currentAddress:
      {
        addressSex: this.data.currentAddress.addressSex,
        cityName: this.data.currentAddress.cityName,
        districtName: this.data.currentAddress.districtName,
        locationId: this.data.currentAddress.locationId,
        locationBuilding: this.data.currentAddress.locationBuilding,
        addressPhone: phoneNumber,
        addressName: this.data.currentAddress.addressName,
        addressDetail: this.data.currentAddress.addressDetail,
        addressId: this.data.currentAddress.addressId
      }
    })
    console.log(this.data.currentAddress)

  },
  // 手机号码检查
  phone_check: function (e) {
    var phoneNumber = e.detail.value
    if (!utils.checkPhone(phoneNumber)) {
      utils.showErrorDialog('手机号码格式错误！')
    }
    else {
      // this.data.currentAddress.addressPhone = phoneNumber
      this.setData({
        currentAddress:
        {
          addressSex: this.data.currentAddress.addressSex,
          cityName: this.data.currentAddress.cityName,
          districtName: this.data.currentAddress.districtName,
          locationId: this.data.currentAddress.locationId,
          locationBuilding: this.data.currentAddress.locationBuilding,
          addressPhone: phoneNumber,
          addressName: this.data.currentAddress.addressName,
          addressDetail: this.data.currentAddress.addressDetail,
          addressId: this.data.currentAddress.addressId
        }
      })
      console.log(this.data.currentAddress)
    }
  },
  check_username_phone:function(){
    var phoneNumber = this.data.currentAddress.addressPhone;
    var userName = this.data.currentAddress.addressName;
    if (!utils.checkPhone(phoneNumber)) {
      utils.showErrorDialog('手机号码格式错误！')
      return false
    }
    if (userName.length < 2 || userName.length > 5) {
      utils.showErrorDialog('收货人姓名长度异常')
      return false;
    }
    return true;
  },
  navigateToInputAddress: function () {
    // var phoneNumber = this.data.currentAddress.addressPhone;
    // var userName = this.data.currentAddress.addressName;
    // if (userName.length < 2 || userName.length > 5) {
    //   utils.showErrorDialog('收货人姓名长度异常')
    // }
    // else if (!utils.checkPhone(phoneNumber)) {
    //   utils.showErrorDialog('手机号码格式错误！')
    // }
   // else {
      wx.navigateTo({
        url: 'inputAddress',
        success: function (res) { },
        fail: function (res) { },
        complete: function (res) { },
      })
   // }
  },
  // 将地址保存到服务器
  saveAddress: function () {
    // 新增收货地址
    if (this.data.add_status && this.data.complete && this.check_username_phone()) {
      //调用接口保存新增的收货地址
      // console.log('url = ' + networkTool.insertAddresses)
      var that = this;
      networkTool.ajax({
        url: networkTool.insertAddresses,
        method: 'POST',
        data: {
          userToken: getApp().globalData.access_token,
          addressName: that.data.currentAddress.addressName,
          addressSex: that.data.currentAddress.addressSex,
          addressPhone: that.data.currentAddress.addressPhone,
          locationId: that.data.currentAddress.locationId
        },
        success: function (res) {
          if (res.status == 60003) {
            utils.showErrorDialog('手机号码格式错误！')
          }
          else {
            wx.navigateBack({
              delta: 1,
            })
          }
        }
      })
    }
    //编辑收货地址
    if (this.data.edit_status && this.data.complete) {
      if (!this.check_username_phone()) {
        return
      }
      var that = this;
      //调用接口bianji收货地址
      console.log('尝试编辑收货地址that.data.currentAddress.addressId=' + that.data.currentAddress.addressId)
      // console.log('url = ' + networkTool.updateAddress)
      // console.log('this.username_check() ')
      // this.username_check()
      networkTool.ajax({
        url: networkTool.updateAddress,
        method: 'POST',
        data: {
          userToken: getApp().globalData.access_token,
          addressName: that.data.currentAddress.addressName,
          addressSex: that.data.currentAddress.addressSex,
          addressPhone: that.data.currentAddress.addressPhone,
          locationId: that.data.currentAddress.locationId,
          addressId: that.data.currentAddress.addressId
        },
        success: function (res) {
          console.log('尝试编辑收货地址')
          console.log(res)
          if (res.status == 60003) {
            utils.showErrorDialog('手机号码格式错误！')
          }
          else {
            wx.navigateBack({
              delta: 1,
            })
          }
        }
      })
    }

  },
  //删除收货地址
  deleteAddress: function () {
    var that = this;
    //调用接口删除收货地址
    // console.log('尝试删除收货地址that.data.currentAddress.addressId=' + that.data.currentAddress.addressId)
    // console.log('url = ' + networkTool.deleteAddresses)
    networkTool.ajax({
      url: networkTool.deleteAddresses,
      method: 'POST',
      data: {
        userToken: getApp().globalData.access_token,
        addressId: that.data.currentAddress.addressId
      },
      success: function (res) {
        console.log(res)
      }
    })
    wx.navigateBack({
      delta: 1,
    })
  },
  // 删除地址按钮
  toggle_delete: function (e) {
    console.log('delete toggle')
    var that = this;
    that.setData({
      delete_status: !that.data.delete_status
    })
  },
})