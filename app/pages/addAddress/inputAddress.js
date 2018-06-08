// 引入SDK核心类
var QQMapWX = require('../../libs/qqmap-wx-jssdk.js');
// pages/addAddress/inputAddress.js
const utils = require("../../utils/util.js");
const networkTool = require("../../utils/network.js")
Page({
  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
    networkFail: false,
    index: 1,  // index参数用于列表渲染时计数
    qq_map_key: 'OLNBZ-WIFRF-DGVJB-JGJCG-7NW6J-TJBKK',
    letter: ['B', 'H', 'N', 'S'],
    search_status: false, //是否处于搜索态
    key_word: '',
    search_address: [],// 搜索出的配送地址
    // 官方给定的区域信息
    region: [
      {
        tag: 'B',
        cityName: '北京市',
        districtList: [
          {
            districtName: '西单'
          },
        ]
      },
      {
        tag: 'H',
        cityName: '杭州市',
        districtList: [
          {
            districtName: '江干区',
            // builds代表每个区下的大厦
            localtionsList: [
              {
                locationId: 0,
                locationBuilding: '浙江工商大学',
                addressDetail: '浙江省 杭州市 江干区 下沙街道25号'
              },
            ]
          },
          {
            districtName: '萧山区',
            localtionsList: [
              {
                locationId: 1,
                locationBuilding: '村家餐饮总部大楼',
                addressDetail: '浙江省杭州市萧山区临江工业园区纬六路508号'
              },
              {
                locationId: 2,
                locationBuilding: '新多大集团',
                addressDetail: '浙江省杭州市萧山区临江工业园区纬六路508号'
              }
            ]
          },
          {
            districtName: '西湖区',
            localtionsList: [

            ]
          },
          {
            districtName: '滨江区',
            localtionsList: [

            ]
          }
        ]
      },
      {
        tag: 'N',
        cityName: '宁波市',
        districtList: [

        ]
      },
      {
        tag: 'S',
        cityName: '上海市',
        districtList: [

        ]
      },
      {
        cityName: '苏州市',
        districtList: [

        ]
      },
    ],
    span: " ",
    //腾讯地图sdk搜索出的半径内的大厦，格式见
    pois: null,
    // 默认的选择项
    values: [1, 1],
    selected_city: 0,
    selected_distinct: 1,
    citys_index: 0,
    isShowCitys: false,
    isShowdistincts: false,
    isShowNearby: true,
    isShowAllAddress: true,
    isShowAllAddressContent: false,
    hasLocationAuth: false, //是否有定位权限
    // urls
    all_address_icon2_url: ['../../images/icon/down.png', '../../images/icon/up.png'],
    all_address_icon_url: ['../../images/icon/close_eye.png', '../../images/icon/open_eye.png'],
    url_index: 0
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    utils.networkType(this);
    var that = this;

    // 调用接口获得所有配送区域
    networkTool.ajax({
      url: networkTool.listLocations,
      success: function (res) {
        // console.log('以获取所有配送地址')
        // console.log(res)
        that.setData({
          region: res.data
        })
      },
      fail(res) {
        // lyy请求失败
        that.setData({
          networkFail: true
        });
      }
    })
    // 实例化API核心类
    var qqMapObj = new QQMapWX({
      key: this.data.qq_map_key // 必填
    });
    qqMapObj.reverseGeocoder({
      get_poi: 1,
      poi_options: 'radius=1000',
      success: function (res) {
        // console.log('#####################################################')
        // console.log('半径内的大厦：')
        // console.log(res.result)
        // console.log('#####################################################')
        that.setData({
          pois: res.result.pois,
          hasLocationAuth: true
        })
      },
      fail: function (res) {
        console.log(res);
        // console.log('用户不给权限');
        that.setData({
          hasLocationAuth: false
        })
      },
      complete: function (res) {
        // console.log(res);
      }
    })
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

  //在所有地址中查询关键字
  searchAddress: function (e) {
    console.log(e)
    var that = this;
    var key_word = e.detail.value;
    that.setData({
      key_word: e.detail.value,
      search_status: true
    })
    if (e.detail.value == '') {
      that.setData({
        search_status: false
      })
    }
    else {
      var tmpadds = []
      var i = 0;
      for (i = 0; i < this.data.region.length; i++) {
        var city = this.data.region[i];     //市
        var j = 0;
        for (j = 0; j < city.districtList.length; j++) {
          var district = city.districtList[j];
          // console.log(district)
          var k = 0;
          for (k = 0; k < district.localtionsList.length; k++) {
            var building = district.localtionsList[k];
            if (building.locationBuilding.match(key_word)) {
              console.log(building)
              tmpadds.push(building)
            }
          }
        }
      }
      this.setData({
        search_address: tmpadds
      })
      console.log(this.data.search_address)
    }
  },
  // 将用户的地址添加到本地缓存,方便在上一个页面获取将地址信息保存到服务器
  setAddress: function (e) {
    // 通过locationId反定位处cityName和districtName
    var that = this;
    var cityName = '';
    var districtName = '';
    var locationId = e.currentTarget.dataset.poi_id;
    var i = 0;
    for (i = 0; i < that.data.region.length; i++) {
      var city = that.data.region[i];     //市
      var j = 0;
      for (j = 0; j < city.districtList.length; j++) {
        var district = city.districtList[j];
        var k = 0;
        for (k = 0; k < district.localtionsList.length; k++) {
          var building = district.localtionsList[k];
          if (building.locationId == locationId) {
            console.log(city.cityName)
            console.log(district.districtName)
            cityName = city.cityName;
            districtName = district.districtName;
            break;
          }
        }
      }
    }
    wx.setStorage({
      key: 'currentAddress',
      data: {
        cityName: cityName,
        districtName: districtName,
        locationId: e.currentTarget.dataset.poi_id,
        addressDetail: e.currentTarget.dataset.poi_address,
        locationBuilding: e.currentTarget.dataset.poi_title
      },
    })
    // 缓存好后回到上级菜单
    wx.navigateBack({
      delta: 1,
    })
  },
  toggleCity: function () {
    var that = this;
    that.setData({
      isShowCitys: !that.data.isShowCitys,
      isShowNearby: false,
      isShowAllAddress: false,
      isShowdistincts: false
    })
    if (!that.data.isShowdistincts && !that.data.isShowCitys) {
      that.setData({
        isShowNearby: true,
        isShowAllAddress: true
      })
    }
    // console.log(that.data.isHiddenCitys)
  },
  toggleDistinct: function () {
    var that = this;
    that.setData({
      isShowdistincts: !that.data.isShowdistincts,
      isShowNearby: false,
      isShowAllAddress: false,
      isShowCitys: false
    })
    console.log('isShowNearby' + that.data.isShowNearby)
    if (!that.data.isShowCitys && !that.data.isShowdistincts) {
      console.log('市区都不显示，显示附近')
      that.setData({
        isShowNearby: true,
        isShowAllAddress: true
      })
    }
    console.log(that.data.isHiddenCitys)
  },
  // 点击显示所有大厦
  showAllAddress: function () {
    var that = this;
    that.setData({
      isShowAllAddressContent: !that.data.isShowAllAddressContent,
      url_index: (that.data.url_index + 1) % 2
    })

  },
  setCity: function (e) {
    console.log(e)
    var city_index = e.currentTarget.dataset.city_id;
    var that = this;
    that.setData({
      selected_city: city_index,
    })
    this.toggleCity();
  },
  setDistinct: function (e) {
    console.log(e)
    var that = this;
    var district_index = e.currentTarget.dataset.district_id;
    that.setData({
      selected_distinct: district_index,
    })
    this.toggleDistinct()
  }
  // 用选择器实现切换地址时的函数
  // setCity: function (e) {
  //   var that = this;
  //   var val = e.detail.value
  //   console.log(val)
  //   that.setData({
  //     selected_city: val[0],
  //   })
  // },
  // setDistinct: function (e) {
  //   var that = this;
  //   var val = e.detail.value
  //   console.log(val)
  //   that.setData({
  //     selected_distinct: val[0],
  //   })
  // }
})