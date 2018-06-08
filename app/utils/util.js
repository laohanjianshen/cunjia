// 公共方法


/**
 * 显示错误信息的弹框
 * 注：只有一个确认button来取消弹框;title内容固定为：提示
 */
function showErrorDialog(content) {
  wx.showModal({
    title: '提示',
    showCancel: false,
    content: content,
  })
}

/**
 * 二次确认的弹框
 * 注：title内容固定为：提示
 */
function showConfirmAlert(content, confirm) {
  wx.showModal({
    title: '提示',
    content: content,
    success: function (res) {
      if (res.confirm) {
        confirm()
      }
    }
  })
}
/**
 * 显示3秒的成功Toast
 */
function showToast(title) {
  wx.showToast({
    title: title,
    icon: 'success',
    duration: 3000
  })
}
/**
  * 判断手机号格式是否正确并弹出提示dialog
  * 注：只判断首位是否为1和是否为11位
  */
function checkPhone(mobile) {
  if ((/^1\d{10}$/.test(mobile))) {
    return true;
  } else {
    return false;
  }
}
/**
 * 判断文本是否为空并弹出提示dialog
 */
function checkTextIsEmpty(text, msg) {
  if (!text) {
    this.showErrorDialog(msg)
    return false;
  } else {
    return true;
  }
}

/**
 * 成功提示
 */
function showSuccessToast(title = "请求成功", duration = 3000) {
  wx.showToast({
    title: title,
    // image: '/images/common/success.png',
    mask: true,
    duration: (duration <= 0) ? 3000 : duration
  });
}
/**
 * 失败提示
 */
function showFailToast(title = "请求失败", duration = 3000) {
  wx.showToast({
    title: title,
    // image: '/images/common/fail.png',
    mask: true,
    duration: (duration <= 0) ? 3000 : duration
  });
}
//loading提示
function showLoading(title = "请稍后", duration = 3000) {
  wx.showToast({
    title: title,
    icon: 'loading',
    duration: (duration <= 0) ? 3000 : duration
  });
}
//隐藏提示框
function hideToast() {
  wx.hideToast();
}
//显示带取消按钮的消息提示框
function alertViewWithCancel(title = "提示", content = "消息提示", confirm, showCancel = true, confirmText = "确定",params) {
  wx.showModal({
    title: title,
    content: content,
    showCancel: showCancel,
    confirmText: confirmText,
    success: function (res) {
      if (res.confirm) {
        confirm(params);
      }
    }
  });
}
/**
 * 在控制台区分每一个请求log，方便查看
 */
function showLine() {
    console.log("---------------------------------------------------------------------------------------------")
}
/**
 * 在控制台显示请求成功的数据
 */
function showDataLog(msg, res) {
    console.log(msg)
    console.log(res)
    console.log("***********参数结束*********************");
}
/**
 * 价格保留两位
 */
 function getFloat2(num){
  return parseFloat(num).toFixed(2);
 }
/**
 * 倒计时，传入现在和将来的时间戳，返回一个包含offset对象包含了（时，分，秒）
 */
 function startCount(now, future) {
   var offset = parseInt(future - now)
   if (offset < 0) {
     var offsetHours = '00'
     var offsetMinutes = '00'
     var offsetSeconds = '00'
     return {
       offsetHours:offsetHours,
       offsetMinutes:offsetMinutes,
       offsetSeconds:offsetSeconds,
     }
   }
   var  offsetHours = parseInt(offset / (60 * 60 * 1000)) > 9 ? parseInt(offset / (60 * 60 * 1000)) : '0' + parseInt(offset / (60 * 60 * 1000))
   offset = offset - (parseInt(offset / (60 * 60 * 1000))) * (60 * 60 * 1000)
   var offsetMinutes = parseInt(offset / (60 * 1000)) > 9 ? parseInt(offset / (60 * 1000)) : '0' + parseInt(offset / (60 * 1000))
   offset = offset - (parseInt(offset / (60 * 1000))) * (60 * 1000)
   var offsetSeconds = parseInt(offset / 1000) > 9 ? parseInt(offset / 1000) : '0' + parseInt(offset / 1000)
   return {
     offsetHours: offsetHours,
     offsetMinutes: offsetMinutes,
     offsetSeconds: offsetSeconds,
   }
 }
 //获取网络状态
 function networkType(that){
   wx.getNetworkType({
     success: function (res) {
       // 返回网络类型, 有效值：
       // wifi/2g/3g/4g/unknown(Android下不常见的网络类型)/none(无网络)
       if (res.networkType=="none"){
         that.setData({
           networkFail: true
         });
       }else{
         if(!getApp().globalData.access_token){
           getApp().login();
         }
         that.setData({
           networkFail: false
         });
       }
     }
   });
 }

 /*小于10  前面补0*/
function time0(num){
  if(num>10) return num;
  else return '0'+num;
}
// 控制两个价格保持两位小数
function pointTwo(list, price) {
  // console.log(list)
  for (var i = 0; i < list.length; i++) {
    if (Object.prototype.toString.call(price) == '[object Array]') {
      // console.log('数组')
      for (var j = 0; j < price.length; j++) {
        list[i][price[j]] = parseFloat(list[i][price[j]]).toFixed(2);
        // console.log(list[i][price[j]])
      }
    } else {
      list[i][price] = parseFloat(list[i][price]).toFixed(2);
    }
  }
  console.log(list.length)
  return list;
}
module.exports = {
  showErrorDialog,//错误消息弹框
  showConfirmAlert,//二次确认弹框
  showToast,//显示3s的成功toast
  checkPhone,//验证手机号
  showSuccessToast,//成功提示
  showFailToast,//失败提示
  showLoading,//loading提示
  hideToast,//隐藏提示框
  alertViewWithCancel,//显示带取消按钮的消息提示框
  showLine,//在控制台区分每一个请求log，方便查看
  showDataLog,//在控制台打印请求数据成功的参数
  getFloat2,//价格保留两位
  startCount,//倒计时
  networkType,//获取网络状态
  time0,//小于10  前面补0
  pointTwo,
}
