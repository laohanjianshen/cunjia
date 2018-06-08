// pages/submitRefund/submitRefund.js
const network = require("../../utils/network.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // lyy网络请求状态
    networkFail: false,
    reasons:['','买错了，买多了，买少了','送达时间选错了','地址、电话填写错了','计划有变，不想要了'],
    pickerVal:'选择退款原因',//退款原因
    reason:'',//确定的原因
    linshiReson:'',//原因未确定前
    pickerIsShow:false,//选择原因出现与否
  },
  onLoad:function () {
    var that = this;
    /*
    network.ajax({
      url: network.xx,
      method: "POST",
      data: {},
      success(res) {
      },
      fail(res) {
        // lyy请求失败
        that.setData({
          networkFail: true
        });
      }
    });
    */
  },
  changePicker(e){//选择原因
    this.setData({
      linshiReson:this.data.reasons[e.detail.value[0]]
    })
  },
  selectReason(){//选择原因出现
    this.setData({
      pickerIsShow:true
    })
  },
  cancel(){//选择原因消失
    this.setData({
      pickerIsShow:false
    })
  },
  ok(){
    if(this.data.linshiReson==''){
      this.setData({
        pickerVal:"请选择退款原因"
      })
    }else{
      this.setData({
        pickerVal:this.data.linshiReson
      })
    }
    
    this.cancel();
  }
})