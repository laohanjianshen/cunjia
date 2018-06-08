const util = require("util.js");
const constant = require("constant.js");


//baseUrl
var baseUrl="http://192.168.1.250:8999/";//服务器
// var baseUrl = "http://192.168.1.202:8080/";//靳楠楠
// var baseUrl = "http://192.168.1.163:8080/";//黄一帆
// var baseUrl = "http://192.168.1.149:8080/";//邢鹏成

//商铺基本信息
var getShopInfo=baseUrl+"shop/getShopInfo";
//盒饭详情
var getBoxLunch = baseUrl + "boxLunch/getBoxLunch";
// 爆款盒饭
var personalFire = baseUrl + "boxLunch/personalFire";
// 盒饭分类列表
var personalClassify = baseUrl +"boxLunch/personalClassify";
//用户信息
//登陆
var weChatLogin = baseUrl + "user/weChatLogin";
//获取用户信息
var getUser = baseUrl + "user/getUser";
//更新用户信息
var updateUserInfo = baseUrl + "user/updateUserInfo";
//地址
//新增
var insertAddresses = baseUrl +  "addresses/insertAddresses";
//获取配送区域
var listLocations = baseUrl + "addresses/listLocations";
//获取用户收货地址
var listAddresses = baseUrl + "addresses/listAddresses";
//更新收货地址
var updateAddress = baseUrl + "addresses/updateAddress";
//删除收货地址
var deleteAddresses = baseUrl + "addresses/deleteAddresses";
//购物车
//查看购物车
var shopView = baseUrl + "cart/view/personal";
//减购
var shopDelete = baseUrl + "cart/decrease/personal";
//加购
var shopAdd = baseUrl + "cart/add/personal";
//清空
var shopClear = baseUrl + "cart/clear/personal";
//订单
//获取订单列表
var getOrderList = baseUrl + "order/getOrderList";
//创建订单
var createOrder = baseUrl + "order/createOrder";
// 个人点餐
var personOrder = baseUrl + "boxLunch/personalBoxLunch";
// 自助点餐商品详情
var getFood = baseUrl + "food/getFood";
// 我的-意见与建议提交
var adviseSubmit = baseUrl + "advise/submit";
//评价btn
var listGoodsDescribe=baseUrl+"commentFirstLevel/listGoodsDescribe";
//添加一级评价
var insertCommentFirstLevel=baseUrl+"commentFirstLevel/insertCommentFirstLevel";
//总体评价
var sumGoodsDescribe=baseUrl+"commentFirstLevel/SumGoodsDescribe";
//获取评价列表
var getCommentList=baseUrl+"commentFirstLevel/listCommentFirstLevel";
//获取口味和包装的平均值、百分比，好评度的百分比
var commentPercent=baseUrl+"commentFirstLevel/listFlavorAndPacking";
//对评论点赞
var dianzan=baseUrl+"commentFirstLevel/insertCommentPraise";
//对评论取消点赞
var cancelDianzan=baseUrl+"commentFirstLevel/updateCommentPraise";
//添加二级评论
var addSecondPinglun=baseUrl+"commentFirstLevel/insertCommentSecondLevel";
// 个人点餐确认订单
var confirmPersonOrder = baseUrl + 'order/confirmPersonOrder';
//获取七牛tocken
var getQiniuToken=baseUrl+"qiniu/getQiniuToken";
//自助点餐必点，选点列表
var getFoodClassify=baseUrl+'food/getFoodClassify';
//自助点餐-列表
var selfFood=baseUrl+"food/selfFood";
// 获取订单详情
var getOrderDetail = baseUrl +"order/getOrderDetail";
//自主点餐时间
var getSelfTimestamp=baseUrl+"food/getSelfTimestamp";
//自助点餐-加购
var buffetShop=baseUrl+"cart/add/self";
// 获取红包列表
var redPacketList = baseUrl +"redPacketUser/listNotExpiredRedPacket";
// 过期红包列表
var expiredRedPacket = baseUrl+"redPacketUser/listIsExpiredRedPacket";
//自助点餐-确认订单
var buffetComfireOrder=baseUrl+"order/confirmSelfOrder";
//首页轮播图
var listBanner = baseUrl + 'index/listBanner'
//网络请求
function ajax(config) {
  var access_token = getApp().globalData.access_token;
  console.log(access_token)
  var that = this;
  config.requestNum = config.requestNum || 0;
   if (access_token != "") {
    var url = config.url || "";
    var data = config.data || {};
    var method = config.method || "GET";
    var loading = typeof config.loading === "undefined" ? true : config.loading;
    var success = config.success;
    var fail = config.fail;
    var complete = config.complete || function () { };
    var header = method == "GET" ? { 'Content-Type': 'application/json' } : { "Content-Type": "application/x-www-form-urlencoded" };
    var app_key = constant.app_key;
    if (loading) {
      util.showLoading();
    }
    data.userToken = access_token
    data.app_key = app_key
    // util.showDataLog("请求的所有参数", data);
    wx.request({
      url,
      data,
      method,
      header,
      success(res) {
        //回调成功的函数
        success(res.data);
      },
      fail(res) {
        fail();
        // util.showDataLog("请求失败", res);
        // util.alertViewWithCancel("网络请求失败", "消息提示", that.ajax, true, "重试", config);
      },
      complete(res) {
        if (loading) util.hideToast();
        complete(res);
      }
    })
    } else {
    if (config.requestNum <= 9) {//请求次数少于9次
      setTimeout(function () {
        config.requestNum++;
        that.ajax(config);
      }, 100);
    } else {//请求次数多余9次，都失败
      /*setTimeout(function () {
        config.requestNum = 0;
        that.ajax(config);
        console.log("请求超时，未获取到access_token,重新启动");
      }, 100)*/
    }
  }
}


module.exports = {
  baseUrl,
  getShopInfo,//获取商铺基本信息
  ajax,//网络请求
  getBoxLunch,//盒饭详情
  weChatLogin,//登陆
  getUser,//获取用户信息
  updateUserInfo,//更新用户信息
  insertAddresses,//新增地址
  listLocations,//获取配送区域
  shopView,//查看购物车
  shopDelete,//减购
  shopAdd,//加购
  shopClear,//清空购物车
  getOrderList,//获取订单列表
  listAddresses,//获取用户收货地址
  updateAddress,//更新用户收货地址
  deleteAddresses,//删除收货地址
  personOrder,//个人点餐
  getFood,//自助点餐食品详情
  adviseSubmit, // 我的-意见与建议提交
  listGoodsDescribe,//评价的btn
  insertCommentFirstLevel,//添加一级评价
  sumGoodsDescribe,//总体评价
  getCommentList,//获取评价列表
  commentPercent,//获取口味和包装的平均值、百分比，好评度的百分比
  dianzan,//对评论点赞
  cancelDianzan,//取消对评论的点赞
  addSecondPinglun,//添加二级评论
  personalFire,//爆款盒饭
  personalClassify,//盒饭分类列表
  confirmPersonOrder, // 个人点餐确认订单
  getQiniuToken,//获取七牛tocken
  getFoodClassify,//自助点餐必点，选点列表
  selfFood,//自助点餐-列表
  createOrder,//创建订单
  getOrderDetail,//获取订单详情
  confirmPersonOrder ,// 个人点餐确认订单
  getOrderList,//获取订单列表
  getQiniuToken,//获取七牛tocken
  getFoodClassify,//自助点餐必点，选点列表
  selfFood,//自助点餐-列表
  getSelfTimestamp,//自主点餐时间戳
  buffetShop,//自助点餐加购
  redPacketList,//红包列表
  expiredRedPacket,//过期红包列表
  buffetComfireOrder,//自助点餐-确认订单
  listBanner,//首页-轮播图
}










