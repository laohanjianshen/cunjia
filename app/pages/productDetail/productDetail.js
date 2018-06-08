// pages/productDetail/productDetail.js
const network = require("../../utils/network.js");
const util = require("../../utils/util.js");
const App = getApp();
var boxLunchId = 0;
var startX = 0;
var endX = 0;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    condimentType:1,
    boxLunchType:1,
    boxLunch: {},
    showCart: false,
    networkFail: false,
    timeoutModal: false,
    flavor_num: [10, 30, 50, 70, 90],//评价笑脸标准
    goodData: {},//商品详情
    time: {},//订餐倒计时，优惠倒计时
    // boxLunchSalePrice:0,//折扣价
    // boxLunchPrice:0,//原价
    //banner
    imgUrls: [
      'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg',
      'http://img06.tooopen.com/images/20160818/tooopen_sy_175866434296.jpg',
      'http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg'
    ],
    plData:[],
    manyiArr:["差","一般","还不错","满意","非常满意"],
    swiperCurrent: 0,
    //点赞
    isZan: false,
    //规格
    standardNum: 0,//套餐默认选择规格的下标
    condimentNum: 0,//调料包默认下标
    standard_isshow: false,//选规格是否出现，true：出现，false:不出现
    goodNums: 1,//商品数量
    goodZongJia: 0,//单个商品总价
    skuList: [],
    condimentLIst: [],
    //购物车总价
    cartCount: 0,
    //购物车数量
    cartNum: false,
    // 倒计时对象
    offset: {
      offsetHours: '00',
      offsetMinutes: '00',
      offsetSeconds: '00'
    },
    boxLunchId:0
  },
  // banner 
  swiperChange(e) {
    this.setData({
      swiperCurrent: e.detail.current
    })
  },
  dotTap(e) {
    this.setData({
      swiperCurrent: e.target.dataset.current
    })
  },
  //点赞
  dianzan() {
    this.setData({
      isZan: !this.data.isZan
    })
  },
  //点餐
  order() {
    this.setData({
      standard_isshow: true,
      // 是否有调料包
      // 初始化所选套餐，调料包
      skuId: this.data.skuList[0].skuId,
      standardNum:0,
      goodZongJia: this.data.skuList[0].skuSalePrice,
      condimentId: '',
      condimentNum:-1,
      goodNums: 1,
      // 当前商品id
      boxLunchId: boxLunchId,
      //当前商品日期
      boxLunchDate: this.data.boxLunch.boxLunchDate,
    })
  },
  createOrder: function (e) {
    // 提交订单
    if (!this.data.cartNum) {
      //若购物车为空，返回
      return;
    }
    var data = { "dateList": [] };
    network.ajax({
      url: network.shopView,
      method: "GET",
      data: {},
      success(res) {
        if (res.data) {
          for (var i = 0; i < res.data.length; i++) {
            var x = { boxLunchDate: res.data[i].boxLunchDate, boxLunchList: [] };
            for (var j = 0; j < res.data[i].cartInfoVOList.length; j++) {
              x.boxLunchList.push({ boxLunchId: res.data[i].cartInfoVOList[j].boxLunchId, skuId: res.data[i].cartInfoVOList[j].skuId });
            }
            data.dateList.push(x);

          }
          wx.setStorage({
            key: 'personOrderSubmit',
            data: data,
          });
          wx.navigateTo({
            url: '../../pages/submitOrder/submitOrder?orderType=0',
          });
        }

      }
    });
  },
  selectcondiment: function (e) {
    this.setData({
      condimentNum: e.target.dataset.standard,
      condimentId: this.data.condimentLIst[e.target.dataset.standard].condimentId,
      goodZongJia: util.getFloat2
        (
        (
          parseFloat(this.data.condimentLIst[e.target.dataset.standard].condimentPrice) +
          parseFloat(this.data.skuList[this.data.standardNum].skuSalePrice)
        )
        * this.data.goodNums
        )
    })
  },
  selectStandard(e) {//规格切换
    if (this.data.condimentNum>-1){
      var count = parseFloat(this.data.condimentLIst[this.data.condimentNum].condimentPrice);
    }else{
      var count = 0;
    }
    this.setData({
      skuId: this.data.skuList[e.target.dataset.standard].skuId,
      standardNum: e.target.dataset.standard,
      goodZongJia: util.getFloat2
        (
          parseFloat( count + parseFloat(this.data.skuList[e.target.dataset.standard].skuSalePrice))
        * this.data.goodNums
        )
    });
  },
  cancelStandard() {//取消选规格
    this.setData({
      standard_isshow: false
    })
  },
  addShop() {//加入购物车
    // 添加到购物车
    this.setData({
      standard_isshow: false,
      cartNum: true,
      cartCount: (parseFloat(this.data.cartCount) + parseFloat(this.data.goodZongJia)).toFixed(2)
    });
    // 要传输的data
    var data = {
        shopBuyDeadline: /*this.data.time.shopBuyDeadline */ 1527569844000,
        shopDiscountDeadline: /*this.data.time.shopDiscountDeadline */ 1527569844000,
        boxLunchNumber: this.data.goodNums,
        boxLunchId: boxLunchId, 
        boxLunchDate: /*this.data.boxLunchDate*/1528509603000, 
        boxLunchType: this.data.boxLunchType,
    };
    if (this.data.boxLunchType == 1) {
      data.skuId = this.data.skuId;
    }
    if (this.data.condimentType == 1){
      data.condimentId =this.data.condimentId;
    }
    network.ajax({
      url: network.shopAdd,
      method: "POST",
      data: data,
      success(res) {
        console.log(res);
      }
    });
  },
  //开始滑动
  getBeforeX: function (e) {
    startX = e.touches[0].clientX;
    endX = 0;
  },
  // 滑动过程
  getAfterX: function (e) {
    endX = e.touches[0].clientX;
  },
  // 滑动结束
  leftMove: function (e) {
    if (endX) {
      if (startX > endX + 20) {
        this.setData({
          delItem: e.currentTarget.dataset.index
        });
      } else if (endX > startX + 20) {
        this.setData({
          delItem: -1
        });
      }
    } else {
      return;
    }
  },
  sub: function (e) {
    // 购物车商品数量增加或减少或者删除商品
    var that = this;
    var index = e.target.dataset.index.split("-");
    var item = this.data.cartList[index[0]].cartInfoVOList[index[1]];
    if (!e.target.dataset.add && !index[2] && item.boxLunchNumber == 1) {
      //若数量为1，不能再减少
      return;
    }
    if (e.target.dataset.add && item.boxLunchNumber > 19) {
      this.setData({
        overNumToast: true
      });
      setTimeout(function () {
        that.setData({
          overNumToast: false
        });
      }, 2000);
      return;
    }
    var data = { boxLunchId: item.boxLunchId, boxLunchType: item.skuId ? 1 : 0, boxLunchDate: this.data.cartList[index[0]].boxLunchDate, boxLunchNumber: index[2] ? item.boxLunchNumber : 1 };
    if (item.skuId) {
      //若是sku套餐
      data.skuId = item.skuId;
    }
    var url = e.target.dataset.add ? network.shopAdd : network.shopDelete;
    network.ajax({
      url: url,
      method: "POST",
      data: data,
      success(res) {
        if (index[2]) {
          //删除商品
          var del = that.data.cartList[index[0]].cartInfoVOList.splice(index[1], 1);
          //delPrice是删除商品所减少的价格，现在暂定原价，到时候要判断是否在优惠期间从而确定价格
          var delPrice = del[0].boxLunchPrice * del[0].boxLunchNumber;
          if (that.data.cartList[index[0]].cartInfoVOList.length > 0) {
            that.setData({
              delItem: -1,
              ["cartList[" + index[0] + "].cartInfoVOList"]: that.data.cartList[index[0]].cartInfoVOList,
              ["cartList[" + index[0] + "].personalTotalPrice"]: parseFloat(parseFloat(that.data.cartList[index[0]].personalTotalPrice) - delPrice).toFixed(2),
              cartCount: parseFloat(parseFloat(that.data.cartCount) - delPrice).toFixed(2)
            });
          } else {
            that.data.cartList.splice(index[0], 1);
            that.setData({
              delItem: -1,
              ["cartList"]: that.data.cartList,
              cartCount: parseFloat(parseFloat(that.data.cartCount) - delPrice).toFixed(2)
            });
            //如果购物车为空了
            if (that.data.cartList.length == 0) {
              that.setData({
                cartNum: false,
                showCart: false,
                cartCount: 0
              });
            }
          }
        } else {
          var num = e.target.dataset.add ? item.boxLunchNumber + 1 : item.boxLunchNumber - 1;
          // price 的计算暂时使用boxLunchPrice，到时候要根据实际情况进行判断
          var price = e.target.dataset.add ? parseFloat(item.boxLunchPrice).toFixed(2) : -parseFloat(item.boxLunchPrice).toFixed(2);
          that.setData({
            ["cartList[" + index[0] + "].personalTotalPrice"]: parseFloat(parseFloat(that.data.cartList[index[0]].personalTotalPrice) + parseFloat(price)).toFixed(2),
            ["cartList[" + index[0] + "].cartInfoVOList[" + index[1] + "].boxLunchNumber"]: num,
            cartCount: parseFloat(parseFloat(that.data.cartCount) + parseFloat(price)).toFixed(2)
          });
        }
      }
    });
  },
  clearCart: function () {
    //清空购物车
    var that = this;
    network.ajax({
      url: network.shopClear,
      method: "GET",
      data: {},
      success(res) {
        that.setData({
          cartList: [],
          showCart: false,
          cartNum: false,
          cartCount: 0
        })
      }
    });
  },
  addNum() {//数量+1
    if (this.data.goodNums <20){
      if (this.data.condimentNum>-1){
        var condimentCount = parseFloat(this.data.condimentLIst[this.data.condimentNum].condimentPrice);
      }else{
        var condimentCount=0;
      }
      this.setData({
        goodNums: this.data.goodNums + 1,
        goodZongJia: util.getFloat2((condimentCount + parseFloat(this.data.skuList[this.data.standardNum].skuSalePrice)) * (this.data.goodNums + 1))
      });
    } else {
      this.setData({
        overNumToast: true
      });
      var that = this;
      setTimeout(function () {
        that.setData({
          overNumToast: false
        });
      }, 2000);
    }

  },
  subNum() {//数量-1
    if (this.data.goodNums > 1) {
      if (this.data.condimentNum > -1) {
        var condimentCount = parseFloat(this.data.condimentLIst[this.data.condimentNum].condimentPrice);
      } else {
        var condimentCount = 0;
      }
      this.setData({
        goodNums: this.data.goodNums - 1,
        goodZongJia: util.getFloat2((condimentCount+ parseFloat(this.data.skuList[this.data.standardNum].skuSalePrice)) * (this.data.goodNums - 1))
      })
    }

  },
  //关闭倒计时描述
  closeYouhuiModal: function () {
    this.setData({
      timeoutModal: false
    });
  },
  //倒计时描述页面
  deadlineAnswer: function () {
    this.setData({
      timeoutModal: true
    });
  },


  /**
  * 生命周期函数--监听页面加载
  */
  onLoad: function (options) {
    console.log(options)
    var that = this;
    boxLunchId = options.id;
    that.setData({
      boxLunchId
    })
    var now = new Date();
    var lastNight = new Date()      //今天零点
    var nextMoring = new Date()     //明天零点
    //当天已过9点
    if (now.getHours() >= 9) {
      nextMoring.setHours(0)
      nextMoring.setMinutes(0)
      nextMoring.setSeconds(0)
      nextMoring.setTime(nextMoring.getTime() + 24 * 60 * 60 * 1000)
    }
    else {
      lastNight.setHours(0)
      lastNight.setMinutes(0)
      lastNight.setSeconds(0)
    }
    network.ajax({
      url: network.getBoxLunch,
      method: "POST",
      data: {
        boxLunchId: boxLunchId,
        // boxLunchTimestamp: now.getHours() >= 9 ? nextMoring.getTime():lastNight.getTime()
        boxLunchTimestamp: options.personalTimestamp
      },
      success: function (res) {
        console.log(res)
        that.setData({
          skuList: util.pointTwo(res.data.sku ? res.data.sku.list : [], ['skuPrice', 'skuSalePrice']), //套餐列表
          condimentLIst: util.pointTwo(res.data.condiment ? res.data.condiment.list : [], ['condimentPrice']),   //调料列表
          boxLunch: util.pointTwo([res.data.boxLunch], ['boxLunchPrice', 'boxLunchSalePrice'])[0],//盒饭详情
          time: res.data.shopTimestamp,  //倒计时时间戳
        })
        // 如果规格或调料为空
        if (that.data.skuList.length == 0) {
          console.log('null1')
          that.setData({
            boxLunchType:0,
            skuList: [{
              skuName: '无可选规格',
              skuPrice: that.data.boxLunch.boxLunchPrice,
              skuSalePrice: that.data.boxLunch.boxLunchSalePrice
            }],
          })
        }
        if (that.data.condimentLIst.length < 1) {
          console.log('null2')
          that.setData({
            condimentType:0,
            condimentLIst: [{
              condimentName: '无可选调料包',
              condimentPrice: 0
            }],
          })
        }
        // 设置默认规格的价格
        that.setData({
          goodZongJia: util.getFloat2
            (
            (
              parseFloat(that.data.condimentLIst[that.data.condimentNum].condimentPrice) +
              parseFloat(that.data.skuList[that.data.standardNum].skuSalePrice)
            )
            * that.data.goodNums
            ),
        })

        //判断购物车是否为空
        network.ajax({
          url: network.shopView,
          method: "GET",
          data: {},
          success(res) {
            if (res.data) {
              var cartCount = 0;
              for (var i = 0; i < res.data.length; i++) {

                cartCount += res.data[i].personalTotalPrice;
              }
              that.setData({
                cartNum: true,
                cartCount: cartCount.toFixed(2)
              });
            }
          }
        });
        setInterval(that.startCount2, 500)
      },
      fail: function (res) {
        console.log("fail")
        that.setData({
          networkFail: true
        })
      }
    })

    // 获取评价列表
    network.ajax({
      url:network.getCommentList,
      method:"POST",
      data:{
        goodsId:boxLunchId,
        commentSource:1,
        goodsDescribeId:0,
        offset:0,
        limit:2,
        boxLunchIsFire:0
      },
      success(res){
        that.getCommentListSuccess(res)
      }
     })
    that.commentPercent()
  },
  commentPercent(){
    var that=this;
    network.ajax({
      url:network.commentPercent,
      method:"POST",
      data:{
        goodsId:that.data.boxLunchId,
        commentSource:1
      },
      success(res){
        console.log("***********获取百分比****************");
        console.log(res)
        that.setData({
          percentNum:res.data
        })
      }
    })
  },
  getCommentListSuccess(res){
    console.log("***********获取评价列表****************");
    var that=this;
    if(res.status==0){//success
      var arr=that.data.plData.length==0?[]:that.data.plData;
      var arr2=[];
      for(var i=0;i<res.data.length;i++){
        arr2.push(res.data[i]);
        arr2[i].commentDate=res.data[i].commentDate.substr(0,10)
        arr2[i].selectAll=true;
        arr2[i].showNum=3;
        if(res.data[i].pictureUrl){
          arr2[i].pictureUrl=res.data[i].pictureUrl.split(",");
        }else{
          arr2[i].pictureUrl=[];
        }
        
      }
      this.setData({
        plData:arr.concat(arr2)
      })
     
    }else{//失败
      wx.showToast({
        title: '提交失败，请重试',
        icon: 'none',
        duration: 1000
      })
    }
    console.log(this.data.plData)
  },
  // 使用模板里的倒计时
  startCount2: function () {
    var now = new Date()
    var offsetObj = util.startCount(now.getTime(), this.data.time.shopDiscountDeadline)
    this.setData({
      offset: {
        offsetHours: offsetObj.offsetHours,
        offsetMinutes: offsetObj.offsetMinutes,
        offsetSeconds: offsetObj.offsetSeconds
      }
    })
    // console.log(offsetObj)
  },
  // 显示购餐车
  showCart: function () {
    console.log('显示购车')
    if (this.data.cartNum) {
      var that = this;
      network.ajax({
        url: network.shopView,
        method: "GET",
        data: {},
        success(res) {
          if (res.data) {
            var cartList = util.pointTwo(res.data, ["personalTotalPrice"]);
            for (var i = 0; i < cartList.length; i++) {
              var time = new Date(cartList[i].boxLunchDate);
              var month = (time.getMonth() + 1) > 9 ? (time.getMonth() + 1) : '0' + (time.getMonth() + 1);
              var day = time.getDate() > 9 ? time.getDate() : '0' + time.getDate();
              switch (time.getDay()) {
                case 0: cartList[i].week = "周日"; break
                case 1: cartList[i].week = "周一"; break
                case 2: cartList[i].week = "周二"; break
                case 3: cartList[i].week = "周三"; break
                case 4: cartList[i].week = "周四"; break
                case 5: cartList[i].week = "周五"; break
                case 6: cartList[i].week = "周六"; break
              }
              cartList[i].date = time.getFullYear() + "-" + month + "-" + day;
              cartList[i].cartInfoVOList = util.pointTwo(cartList[i].cartInfoVOList, ["boxLunchSalePrice", "boxLunchPrice"]);
            }
          }
          that.setData({
            showCart: !that.data.showCart,
            cartList: cartList ? cartList : []
          });
        }
      })
    } else {
      return;
    }
  },
  //隐藏购物车
  hideCart: function () {
    this.setData({
      showCart: false,
      delItem: -1
    });
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
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function (e) {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})