// pages/personOrder/personOrder.js
const network = require("../../utils/network.js");
const util = require("../../utils/util.js");
var startX = 0;
var endX = 0;
// 今天是周几
var today = new Date().getDay() == 0 ? 7 : new Date().getDay();
// 定时器全局
var timer = { timerorder: null, timerdiscount: null };
Page({
  /**
   * 商品列表
   */
  data: {
    // 网络请求状态
    networkFail: false,
    //是否本周，1为是,2为下周
    isThisWeek: 1,
    //当前套餐类型
    selectedItem: 'fire',
    //星期几
    selectedDate: 1,
    //购物车总价
    cartCount: 0,
    //购物车数量
    cartNum: false,
    //订餐倒计时是否是小时形式
    discountHour: true,
    //优惠倒计时是否是小时形式
    orderHour: true,
    //倒计时描述模态框是否出现
    timeoutModal: false,
    // 是否正在加载状态
    searchLoading: false,
    // 显示购餐车
    showCart: false,
    //规格
    standardArr: [],
    // 选中的商品套餐
    standardNum: 0,
    // 是否在优惠期间,用于点餐时候显示规格的哪个价格，暂时没有使用
    duringDiscount: 0,
    standard_isshow: false,
    goodNums: 1,
    orderTime: { day: '00', hour: '00', minute: '00', second: '00' },
    discountTime: { day: '00', hour: '00', minute: '00', second: '00' },
    foodsList: [],
    // 左边的星期tab信息
    dateItem: [
      {
        id: 1,
        name: 'Monday',
        color: '#ed1e79',
        cname: '周一'
      }, {
        id: 2,
        name: 'Tuesday',
        color: '#2ca6e0',
        cname: '周二'
      }, {
        id: 3,
        name: 'Wednesday',
        color: '#8dc21f',
        cname: '周三'
      }, {
        id: 4,
        name: 'Thursday',
        color: '#faed00',
        cname: '周四'
      }, {
        id: 5,
        name: 'Friday',
        color: '#f7b52c',
        cname: '周五'
      }, {
        id: 6,
        name: 'Saturday',
        color: '#5f1985',
        cname: '周六'
      }, {
        id: 7,
        name: 'Sunday',
        color: '#e50012',
        cname: '周日'
      }],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    util.networkType(this);
    var that = this;
    // 默认显示今天
    this.setData({
      selectedDate: today
    });
    // 获取爆款personalFire
    network.ajax({
      url: network.personalFire,
      method: "POST",
      data: { offset: 0, limit: 10 },
      success(res) {
        // 价格保持两位小数
        that.setData({
          foodsList: { list: that.pointTwo(res.data.boxLunchFireList, ["boxLunchPrice", "boxLunchSalePrice"]), moreData: true }
        });
        //  缓存数据
        wx.setStorage({
          key: "personOrder_fire",
          data: that.data.foodsList
        });
      },
      fail(res) {
        // 请求失败
        that.setData({
          networkFail: true
        });
      }
    });
    //var personalTimestamp=new Date(new Date().toLocaleDateString()).getTime();
    var personalTimestamp = 1525881600000;
    //获取分类列表
    network.ajax({
      url: network.personalClassify,
      method: "POST",
      data: { personalTimestamp: personalTimestamp },
      success(res) {
        that.setData({
          personalClassify: res.data.boxLunchClassifyList,
          //保存订餐倒计时
          shopBuyDeadline: res.data.shopTimestamp.shopBuyDeadline,
          //保存优惠倒计时
          shopDiscountDeadline: res.data.shopTimestamp.shopDiscountDeadline
        });
        that.countDown(res.data.shopTimestamp.shopBuyDeadline, "order");
        that.countDown(res.data.shopTimestamp.shopDiscountDeadline, "discount");
      },
      fail(res) {
        // 请求失败
        that.setData({
          networkFail: true
        });
      }
    });
    
  },
  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    //判断购物车是否为空
    var that=this;
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
  },
  //下拉刷新
  onPullDownRefresh: function () {
    wx.showNavigationBarLoading() //在标题栏中显示加载
    //清除当前页面缓存
    wx.getStorageInfo({
      success: function (res) {
        for (var i = 0; i < res.keys.length; i++) {
          if (res.keys[i].slice(0, 12) == "personOrder_") {
            wx.removeStorage({
              key: res.keys[i],
              success: function (res) { },
            })
          }

        }
      },
    });
    this.onLoad();
    //模拟加载
    setTimeout(function () {
      // complete
      wx.hideNavigationBarLoading() //完成停止加载
      wx.stopPullDownRefresh() //停止下拉刷新
    }, 500);
  },
  onHide: function () {
    
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
  // 显示购餐车
  showCart: function () {
    if (this.data.cartNum) {
      var that = this;
      network.ajax({
        url: network.shopView,
        method: "GET",
        data: {},
        success(res) {
          if (res.data) {
            var cartList = that.pointTwo(res.data, ["personalTotalPrice"]);
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
              cartList[i].cartInfoVOList = that.pointTwo(cartList[i].cartInfoVOList, ["boxLunchSalePrice", "boxLunchPrice"]);
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
  hideCart: function () {
    this.setData({
      showCart: false,
      delItem: -1
    });
  },
  // 控制两个价格保持两位小数
  pointTwo: function (list, price) {
    for (var i = 0; i < list.length; i++) {
      if (Object.prototype.toString.call(price) == '[object Array]') {
        for (var j = 0; j < price.length; j++) {
          list[i][price[j]] = parseFloat(list[i][price[j]]).toFixed(2);
        }
      } else {
        list[i][price] = parseFloat(list[i][price]).toFixed(2);
      }
    }
    return list;
  },
  //倒计时函数
  countDown: function (times, orderDiscount) {
    // 传入的参数times是订餐截止时间或者优惠截止时间
    var that = this;
    clearInterval(timer["timer" + orderDiscount]);
    //var currentTime = parseInt(new Date().getTime());//获取的是毫秒数
    var currentTime =1525831203000;
    times = times - currentTime;
    that.setData({
      // 优惠剩余时间
      duringDiscount: 0
    });
    if (times > 0) {
      times = parseInt(times / 1000);
    } else {
      times = 0;
      that.setData({
        [orderDiscount + "Time"]: { day: '00', hour: '00', minute: '00', second: '00' }
      });
      return;
    }
    timer["timer" + orderDiscount] = setInterval(function () {
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
      if (day > 0) {
        that.setData({
          [orderDiscount + "Hour"]: false
        });
      } else {
        that.setData({
          [orderDiscount + "Hour"]: true
        });
      }
      if (day <= 9) day = '0' + day;
      if (hour <= 9) hour = '0' + hour;
      if (minute <= 9) minute = '0' + minute;
      if (second <= 9) second = '0' + second;
      that.setData({
        [orderDiscount + "Time"]: { day: day, hour: hour, minute: minute, second: second },
        // 优惠剩余时间
        duringDiscount: times
      });
      times--;
    }, 1000);
  },
  changeweek: function (e) {
    //本周下周切换函数
    var id = e.target.dataset.id;
    if (id == 1) {
      var myDate = new Date();
      var today = myDate.getDay();
      this.setData({
        isThisWeek: id,
        selectedDate: today == 0 ? 7 : today
      });
    } else if (id == 2) {
      this.setData({
        isThisWeek: id,
        selectedDate: 1
      });
    }
    this.checkStorage();
  },
  selectModel: function (e) {
    // 套餐类型切换
    this.setData({
      selectedItem: e.target.dataset.id
    });
    this.checkStorage();
  },
  showItemDetail: function (e) {
    // 跳转到商品详情
    var that=this;
    var id = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: '/pages/productDetail/productDetail?id=' + id + '&' + 'personalTimestamp=' + this.personalTimestamp(),
    })
  },
  //上拉加载
  loadMore: function () {
    var that = this;
    if (that.data.searchLoading) {
      return;
    }
    if (this.data.selectedItem == "fire") {
      //爆款
      var data = { limit: 10, offset: this.data.foodsList.list.length };
      // 请求数据
      network.ajax({
        url: network.personalFire,
        method: "POST",
        data: data,
        success(res) {
          //所有数据是否加载完
          if (res.data.boxLunchFireList.length < 1) {
            that.setData({
              foodsList: { list: that.data.foodsList.list, moreData: false },
            })
          } else if (res.data.boxLunchFireList.length > 0) {
            that.setData({
              foodsList: {
                list: that.data.foodsList.list.concat(that.pointTwo(res.data.boxLunchFireList, ["boxLunchPrice", "boxLunchSalePrice"])), moreData: true
              }
            });
          }
          //  缓存数据
          wx.setStorage({
            key: "personOrder_fire",
            data: that.data.foodsList
          });
        },
        fail(res) {
          // 请求失败
          that.setData({
            networkFail: true
          });
        }
      });
    } else {
      //普通套餐
      var data = { limit: 10, offset: this.data.foodsList.list.length, personalTimestamp: this.personalTimestamp(), categoryId: this.data.selectedItem };

      // 请求数据
      network.ajax({
        url: network.personOrder,
        method: "POST",
        data: data,
        success(res) {
          //所有数据是否加载完
          if (res.data.personalBoxLunchList.length < 1) {
            that.setData({
              foodsList: { list: that.data.foodsList.list, moreData: false },
            })
          } else if (res.data.personalBoxLunchList[0].boxLunchVOList.length > 0) {
            that.setData({
              foodsList: { list: that.data.foodsList.list.concat(that.pointTwo(res.data.personalBoxLunchList[0].boxLunchVOList, ["boxLunchPrice", "boxLunchSalePrice"])), moreData: true }
            });
          }
          //  缓存数据
          wx.setStorage({
            key: "personOrder_"+that.data.selectedDate + "_" + that.data.isThisWeek + "_" + that.data.selectedItem,
            data: that.data.foodsList
          });
        },
        fail(res) {
          // 请求失败
          that.setData({
            networkFail: true
          });
        }
      });
    }

  },
  addCart: function (e) {
    //加入购物车
    var index = e.target.dataset.index;
    var price = e.target.dataset.price;
    this.setData({
      standard_isshow: true,
      // 是否有调料包
      IsCondiment: this.data.foodsList.list[index].boxLunchIsCondiment,
      goodsSalePrice: price,
      // 初始化所选套餐，调料包
      standardNum: this.data.foodsList.list[index].boxLunchSkuVOList[0].skuId,
      condimentId: '',
      goodNums: 1,
      // 当前商品id
      boxLunchId: this.data.foodsList.list[index].boxLunchId,
      //当前商品日期
      boxLunchDate: this.data.foodsList.list[index].boxLunchDate,
      //套餐单价
      skuPrice: parseFloat(price).toFixed(2),
      //套餐总价初始化
      priceCount: parseFloat(price).toFixed(2),
      // 规格
      standardArr: this.pointTwo(this.data.foodsList.list[index].boxLunchSkuVOList, ["skuPrice", "skuSalePrice"]),
      // 调料包
      condimentList: this.data.foodsList.list[index].condimentList
    });

  },
  selectDate: function (e) {
    // 选择星期几
    var id = e.currentTarget.dataset.id;
    this.setData({
      selectedDate: id
    });
    this.checkStorage();
  },
  // 获取所选日期的零点时间戳
  personalTimestamp: function () {
    //var personalTimestamp=new Date(new Date().toLocaleDateString()).getTime();
    var personalTimestamp = 1525881600000;
    //判断时间戳
    var that = this;
    var target = that.data.selectedDate;
    var week = that.data.isThisWeek;
    if (week == 1) {
      personalTimestamp = personalTimestamp + (target - today) * 24 * 60 * 60000;
    } else if (week = 2) {
      personalTimestamp = personalTimestamp + (7 - today + target) * 24 * 60 * 60000;
    }
    return personalTimestamp;
  },
  // 判断是否有缓存
  checkStorage: function () {
    var that = this;
    var haveStorage = false;
    var personalTimestamp = that.personalTimestamp();
    //获取分类列表
    network.ajax({
      url: network.personalClassify,
      method: "POST",
      data: { personalTimestamp: personalTimestamp },
      success(res) {
        that.setData({
          personalClassify: res.data.boxLunchClassifyList,
          shopBuyDeadline: res.data.shopTimestamp.shopBuyDeadline,
          shopDiscountDeadline: res.data.shopTimestamp.shopDiscountDeadline
        });
        that.countDown(res.data.shopTimestamp.shopBuyDeadline, "order");
        that.countDown(res.data.shopTimestamp.shopDiscountDeadline, "discount");
      },
      fail(res) {
        // 请求失败
        that.setData({
          networkFail: true
        });
      }
    });
    wx.getStorageInfo({
      success: function (res) {
        //如果是爆款，取缓存，结束函数
        if (that.data.selectedItem == "fire") {
          wx.getStorage({
            key: "personOrder_fire",
            success: function (res) {
              that.setData({
                foodsList: res.data
              });
            }
          });
          return;
        }
        for (var i = 0; i < res.keys.length; i++) {
          // 如果不是爆款
          if (res.keys[i] == (that.data.selectedDate + "_" + that.data.isThisWeek + "_" + that.data.selectedItem)) {
            haveStorage = true;
            break;
          }
        }
        if (haveStorage) {
          wx.getStorage({
            key: "personOrder_"+that.data.selectedDate + "_" + that.data.isThisWeek + "_" + that.data.selectedItem,
            success: function (res) {
              that.setData({
                foodsList: res.data
              });
            }
          });

        } else {
          network.ajax({
            url: network.personOrder,
            method: "POST",
            data: { personalTimestamp: personalTimestamp, categoryId: that.data.selectedItem, offset: 0, limit: 10 },
            success(res) {
              that.setData({
                foodsList: { list: that.pointTwo(res.data.personalBoxLunchList[0].boxLunchVOList, ["boxLunchPrice", "boxLunchSalePrice"]), moreData: true }
              });
              //  缓存数据
              wx.setStorage({
                key: "personOrder_"+that.data.selectedDate + "_" + that.data.isThisWeek + "_" + that.data.selectedItem,
                data: that.data.foodsList
              });
            },
            fail(res) {
              // 请求失败
              that.setData({
                networkFail: true
              });
            }
          });
        }
      }
    })

  },

  praise: function (e) {
    // 给商品点赞
    var id = e.target.dataset.id;
    for (var i = 0; i < this.data.foodsList.list.length; i++) {
      if (this.data.foodsList.list[i].boxLunchId == id) {
        var praise = 'foodsList.list[' + i + '].ispraised';
        var newNum = 'foodsList.list[' + i + '].boxLunchLikeNumber';
        var old = this.data.foodsList.list[i].ispraised;
        var num = this.data.foodsList.list[i].boxLunchLikeNumber||0;
        this.setData({
          [newNum]: old ? --num : ++num,
          [praise]: !old,
        });
        break;
      }
    }
  },
  // 空函数
  emptyFunc: function () {

  },
  //倒计时描述页面
  deadlineAnswer: function () {
    this.setData({
      timeoutModal: true
    });
  },
  //关闭倒计时描述
  closeYouhuiModal: function () {
    this.setData({
      timeoutModal: false
    });
  },
  createOrder: function (e) {
    // 提交订单
    if (!this.data.cartNum){
      //若购物车为空，返回
      return;
    }
    var data = {"dateList": []};
    network.ajax({
      url: network.shopView,
      method: "GET",
      data: {},
      success(res) {
        if(res.data){
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
  // 选择调料包
  selectCondiment: function (e) {
    var index = e.target.dataset.index;
    this.setData({
      // 选中的调料包
      condimentId: e.target.dataset.id,
    })
  },
  selectStandard(e) {//规格切换
    var index = e.target.dataset.index;
    // var price = this.data.duringDiscount ? this.data.standardArr[index].skuSalePrice : this.data.standardArr[index].skuPrice;
    var price = this.data.standardArr[index].skuPrice;
    this.setData({
      goodNums: 1,
      standardNum: e.target.dataset.id,
      skuPrice: parseFloat(price).toFixed(2),
      priceCount: parseFloat(price).toFixed(2)
    })
  },
  cancelStandard() {//取消选规格
    this.setData({
      standard_isshow: false
    })
  },
  addShop(e) {
    // 添加到购物车
    this.setData({
      standard_isshow: false,
      cartNum: true,
      cartCount: parseFloat(parseFloat(this.data.cartCount) + parseFloat(this.data.priceCount)).toFixed(2),
    })
    // 要传输的data
    var data = {
      shopBuyDeadline: this.data.shopBuyDeadline,
      shopDiscountDeadline: this.data.shopDiscountDeadline, boxLunchNumber: this.data.goodNums, boxLunchId: this.data.boxLunchId, condimentId: this.data.condimentId, boxLunchDate: /*this.data.boxLunchDate*/1528509603000, boxLunchType: this.data.standardNum?1:0};

    if (this.data.standardNum){
      data.skuId = this.data.standardNum;
    }
    network.ajax({
      url: network.shopAdd,
      method: "POST",
      data: data,
      success(res) {
        //console.log(res);
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
  addNum() {
    if (this.data.goodNums < 20) {
      this.setData({
        goodNums: this.data.goodNums + 1,
        priceCount: parseFloat(this.data.skuPrice * (this.data.goodNums + 1)).toFixed(2)
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
  subNum() {
    if (this.data.goodNums > 1) {
      this.setData({
        goodNums: this.data.goodNums - 1,
        priceCount: parseFloat(this.data.skuPrice * (this.data.goodNums - 1)).toFixed(2)
      });
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
    if (e.target.dataset.add && item.boxLunchNumber>19){
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
    var data = { boxLunchId: item.boxLunchId, boxLunchType: item.skuId ? 1 : 0, boxLunchDate: this.data.cartList[index[0]].boxLunchDate, boxLunchNumber: index[2] ? item.boxLunchNumber:1};
    if (item.skuId){
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
  }
})