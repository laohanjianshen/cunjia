//index.js
//获取应用实例
// 引入SDK核心类
var QQMapWX = require('../../libs/qqmap-wx-jssdk.js');
var amapFile = require('../../libs/amap-wx.js')
const network = require("../../utils/network.js");
const utils = require("../../utils/util.js");
const app = getApp()
var qqMapWXTool = new QQMapWX({
  key: app.globalData.qq_map_key // 必填
});
Page({
  data: {
    // lyy网络请求状态
    networkFail: false,
    isHideLoadMore: true,
    isAutoPlay:true,//轮播图是否自动滚动
    amap_key: '941a5d14ca57d32c79830c2dbd09d553',     //高德地图api
    qq_map_key: 'OLNBZ-WIFRF-DGVJB-JGJCG-7NW6J-TJBKK',//腾讯地图api
    latitude: 1,
    longtitude: 1,
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    imgUrls: [
      '../../images/\product_detail/test2.png',
      '../../images/order/car.png',
      'http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg'
    ],
    swiperCurrent: 0,
    location_icon_url: '../../images/icon/dingwei.png',
    // location_icon_url:'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg'
    order_choose_desc: [
      {
        imageurl: "../../images/icon/single_order_icon.png",
        text: "个人点餐",
        navigateUrl: '../personOrder/personOrder'
      },
      {
        imageurl: "../../images/icon/zizhu.png",
        text: "自助点餐",
        navigateUrl: '../buffet/buffet'
      },
      {
        imageurl: "../../images/index/qiyetuancan.png",
        text: "企业团餐",
        navigateUrl: '../firmOrder/firmOrder'
      }
    ],
    recommend_items_desc: [
      {}, {}, {}, {}, {}
    ],
    endhour: 24,
    endminute: 0,
    endsecond: 0,
    hour: '',
    minute: '',
    second: '',
    food_items_desc: [
      {
        // date: new Date(2018, 4, 28[,19[,18[,56[,35]]]])
        hour: 0,
        minues: 0,
        second: 0,
        date: new Date()
      },
      {
      },
      {
      },
      {
      },
      {
      },
      {
      }
    ],
    distinct: '请选择您的配餐点',   //区域信息
    // 修改个人点餐
    //规格
    standardArr: [{ skuId: 1, skuName: "黄金套餐" }, { skuId: 2, skuName: "白银套餐" }],
    standardArr2: [],
    // 选中的套餐类型
    standardNum: 0,
    standard_isshow: false,
    goodNums: 1,
    foodsList: [{
      id: 1,
      name: "西红柿鸡蛋汤",
      currentPrice: 66.50,
      oldPrice: 0,
      img: "/images/personOrder/1.png",
      praiseNum: 1314,
      saleNum: 66666,
      ispraised: true
    }, {
      id: 2,
      name: "西红柿鸡蛋汤",
      currentPrice: 66.00,
      oldPrice: 66.00,
      img: "/images/personOrder/1.png",
      praiseNum: 1314,
      saleNum: 66666,
      ispraised: true
    }, {
      id: 3,
      name: "西红柿鸡蛋汤",
      currentPrice: 66.00,
      oldPrice: 66.00,
      img: "/images/personOrder/1.png",
      praiseNum: 1314,
      saleNum: 66666,
      ispraised: false
    }, {
      id: 4,
      name: "西红柿鸡蛋汤",
      currentPrice: 66.00,
      oldPrice: 66.00,
      img: "/images/personOrder/1.png",
      praiseNum: 1314,
      saleNum: 66666,
      ispraised: false
    },
    {
      id: 5,
      name: "西红柿鸡蛋汤",
      currentPrice: 66.00,
      oldPrice: 66.00,
      img: "/images/personOrder/1.png",
      praiseNum: 1314,
      saleNum: 66666,
      ispraised: true
    }
    ],
    // 结束修改个人点餐
  },

  onLoad: function () {
    utils.networkType(this);
    var that = this;
    this.whereAreYou();
    // 获取首页轮播图和广告
    network.ajax({
      url: network.listBanner,
      method:'GET',
      success:function(res){
        console.log(res)
      }
    })
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse) {
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          app.globalData.userInfo = res.userInfo
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }

    /**
   * 通过wx.getLocation获得经纬度，通过高德地图api逆地理编码获得当前所在城市
   */
    if (app.location == null) {
      this.getLocation2()
    }
    that.countDown();
  },
  onShow:function(){
    console.log('onShow')
    var that = this;
    this.setData({
      isAutoPlay: true
    })
    wx.getStorage({
      key: 'currentAddress',
      success: function(res) {
        var locationBuilding = res.data.locationBuilding
        that.setData({
          distinct: locationBuilding
        })
      },
    })
  },
  knowWhereAreYou:function(){
    if (app.globalData.location == null || app.globalData.location == false){
      // utils.showConfirmAlert('需要请求您的定位授权',function(){})
      // this.whereAreYou()
    }
    wx.navigateTo({
      url: '../addAddress/inputAddress',
      success: function (res) { },
      fail: function (res) { },
      complete: function (res) { },
    })
  },
  // 下拉刷新
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
  // 刷新数据
  refreshData: function (e) {

  },
  // 上拉加载
  onReachBottom: function () {
    console.log('上拉加载')
    var that = this
    var food_items_desc_copy = new Array();
    food_items_desc_copy = that.data.foodsList;
    that.setData({
      isHideLoadMore: false,
    })
    // 每次新增十条数据
    for (var i = 0; i < 10; i++) {
      food_items_desc_copy.push(that.data.foodsList[0])
    }

    that.setData({
      foodsList: food_items_desc_copy
    })
    
    that.setData({
      isHideLoadMore: true
    })
  },
  onHide:function(){
    this.setData({
      isAutoPlay:false
    })
  },
  whereAreYou: function () {
    // 通过高德小程序sdk获得地区信息
    var that = this;
    var myAmapFun = new amapFile.AMapWX({ key: '941a5d14ca57d32c79830c2dbd09d553' });
    myAmapFun.getRegeo({
      success: function (data) {
        that.setData({
          distinct: data[0].regeocodeData.addressComponent.city + data[0].regeocodeData.addressComponent.district
        })
      },
      fail: function (info) {
        app.globalData.location = false
        //失败回调
        // utils.showErrorDialog('无法加载位置')
      }
    })
    var that = this;
    that.setData({
      loadMore: true,
    })
    network.ajax({
      url: network.personOrder,
      method: "POST",
      data: { offset: 0, limit: 10 },
      success(res) {
        // 数据还没加载完
        if(1){
          that.setData({
            loadMore: false,
            noMore: false,
          });
        }else {
          //没有更多数据
          that.setData({
            loadMore: false,
            noMore: true,
          });
        }
        
      }
    });
  },

  
  whereYouAre:function(){
    qqMapWXTool.getDistrictByCityId({
      id: '110000', // 对应城市ID
      success: function (res) {
        console.log(res);
      },
      fail: function (res) {
        console.log(res);
      },
      complete: function (res) {
        console.log(res);
      }
    });
  },
  
  getLocation2: function () {
    var that = this;
    wx.getLocation({
      success: function (res) {
        app.globalData.location = true
        that.setData({
          longitude: res.longitude,
          latitude: res.latitude
        })
      },
      complete: function () {

      }
    })
  },
  swiperChange(e) {
    // console.log(e)
    this.setData({
      swiperCurrent: e.detail.current
    })
  },
  dotTap(e) {
    // console.log(e)
    this.setData({
      swiperCurrent: e.target.dataset.current
    })
  },
  getUserInfo: function (e) {
    // console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  },
  // 修改个人点餐
  praise: function (e) {
    //个人点餐 点赞
    var id = e.target.dataset.id;
  },
  addCart: function (e) {
    // 点餐事件
    var id = e.target.dataset.id;
  
    
    var price = 1;
    this.setData({
      standard_isshow: true,
      goodsSalePrice: price,
      goodNums: 1,
      // 当前商品id
      foodId: 1,
      //套餐单价
      skuPrice: parseFloat(price).toFixed(2),
      //套餐总价初始化
      priceCount: parseFloat(price).toFixed(2),
      
    });
  },
  showItemDetail: function (e) {
    var id = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../productDetail/productDetail?id=' + id,
    })
  }, //个人点餐倒计时函数
  countDown: function () {
    var that = this;
    var currentTime = parseInt(new Date().getTime());//获取的是毫秒数
    var times = new Date(new Date().toLocaleDateString()).getTime()+ 9 * 60 * 60000 - currentTime;
    if (times > 0) {
      times = parseInt(times / 1000);
    } else {
      times = 0;
      that.setData({
        orderTime: { hour: '00', minute: '00', second: '00' }
      });
      return;
    }

    var timer = setInterval(function () {
      var day = 0,
        hour = 0,
        minute = 0,
        second = 0;//时间默认值
      if (times > 0) {
        day = Math.floor(times / (60 * 60 * 24));
        hour = Math.floor(times / (60 * 60)) - (day * 24);
        minute = Math.floor(times / 60) - (day * 24 * 60) - (hour * 60);
        second = Math.floor(times) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
      }
      if (day <= 9) day = '0' + day;
      if (hour <= 9) hour = '0' + hour;
      if (minute <= 9) minute = '0' + minute;
      if (second <= 9) second = '0' + second;
      times--;
      that.setData({
        orderTime: { hour: hour, minute: minute, second: second }
      });
    }, 1000);
  },
  selectStandard(e) {//规格切换
    var index = e.target.dataset.index;
    this.setData({
      goodNums: 1,
      standardNum: e.target.dataset.id,
      priceCount: parseFloat(this.data.standardArr[index].skuSalePrice).toFixed(2)
    })
  },
  cancelStandard() {//取消选规格
    this.setData({
      standard_isshow: false
    })
  },
  emptyFunc:function(){

  },
  addShop(e) {
    // 添加到购物车
    this.setData({
      standard_isshow: false,
      cartNum: this.data.cartNum + 1,
      cartCount: this.data.cartCount + e.target.dataset.price,
    })
    var data = { goodNums: this.data.goodNums, goodsId: this.data.foodId, skuId: this.data.standardNum };
  },
  addNum() {
    this.setData({
      goodNums: this.data.goodNums + 1,
      priceCount: parseFloat(this.data.skuPrice * (this.data.goodNums + 1)).toFixed(2)
    });

  },
  subNum() {
    if (this.data.goodNums > 1) {
      this.setData({
        goodNums: this.data.goodNums - 1,
        priceCount: parseFloat(this.data.skuPrice * (this.data.goodNums - 1)).toFixed(2)
      });
    }
    if (this.data.goodNums < 1) {
      this.setData({
        goodNums: 1
      })
    }
  }
  // 结束修改个人点餐
})
