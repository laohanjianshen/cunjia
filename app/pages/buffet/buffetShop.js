// pages/buffet/buffetShop.js
const network = require("../../utils/network.js");
const util = require("../../utils/util.js");
var deleteStartX=0;
var deleteEndX=0;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isDelete:false,
    send_time:'',//送达时间
    xiaocaiArr:[],//小菜
    feiXiaocaiArr:[],//非小菜
    allPrice:0,//总价
    tip:"",
    tipStatus:false,//true显示，false,隐藏
  },
  //准备删除
  readyDeleteStart(e){
    deleteStartX=e.touches[0].clientX;
    deleteEndX=0;
  },
  readyDeleteMove(e){
    deleteEndX=e.touches[0].clientX;
  },
  readyDeleteEnd(e){
    
    var that=this;
    var index=e.currentTarget.dataset.index;
    var type=e.currentTarget.dataset.type;
    if(type=="小菜"){
      var tempData=that.data.xiaocaiArr;
    }else{
      var tempData=that.data.feiXiaocaiArr;
    }
    if(deleteEndX){
      if(deleteEndX>deleteStartX+20){//右滑
        tempData[index].isDelete=false;
      }else if(deleteEndX+20<deleteStartX){//左滑
        tempData[index].isDelete=true;
      }else{
        return;
      }
    }else{//未滑动
      return;
    }
    if(type=="小菜"){
      that.setData({
        xiaocaiArr:tempData
      })
    }else{
      that.setData({
        feiXiaocaiArr:tempData
      })
    }
  },
  //点击删除按钮
  deleteOne(e){
    var index=e.target.dataset.index;
    var type=e.target.dataset.type;
    var that=this;
    if(type=="小菜"){
      var tempData=this.data.xiaocaiArr;
      tempData[index].isDelete=false;
      tempData.splice(index,1)
      
      this.setData({
        xiaocaiArr:tempData
      })
    }else{
      var tempData=this.data.feiXiaocaiArr;
       tempData[index].isDelete=false;
      tempData.splice(index,1)
      this.setData({
        feiXiaocaiArr:tempData
      })
    }
    var foodList=this.data.xiaocaiArr.concat(this.data.feiXiaocaiArr);
    wx.setStorage({
      key:"foods",
      data:foodList,
      success(){
        that.dealData()
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
    wx.getStorage({
      key:"time",
      success(res){
        that.setData({
          send_time:res.data
        })
      }
    })
    
    var that=this;
    this.dealData()
  },
  dealData(isAddShop){
    var that=this;
    var timestamp=0;
    wx.getStorage({
      key:"timestamp",
      success(res){
        timestamp=res.data;
      }
    })
    wx.getStorage({
      key: 'foods',
      success: function(res) {
        var oldData=res.data;
        that.setData({
          foodList:oldData
        })
        console.log(res.data)
        var data=[];//给后台传的数据
        var xiaocaiArr=[];
        var feiXiaocaiArr=[];
        var sum=0;
        for(var i=0;i<oldData.length;i++){
          sum+=parseFloat(oldData[i].foodSalePrice)
          if(oldData[i].type=="小菜"){
            xiaocaiArr.push(oldData[i])
            if(data.length==0){
              data.push(oldData[i])
            }else{
              for(var j=0;j<data.length;j++){
                if(data[j].foodId==oldData[i].foodId){
                  data[j].foodNumber=data[j].foodNumber+1;
                  break;
                }
                if(j==data.length-1){
                  data.push(oldData[i]);
                }
              }
            }
            
          }else{
            feiXiaocaiArr.push(oldData[i]);
            data.push(oldData[i]);
          }
        }

        
        console.log(data)
        var dealJson={
          "主菜":1,
          "辅菜":1,
          "小菜":1,
          "主食":1
        }
        for(var i=0;i<data.length;i++){
          switch(data[i].type){
            case "主菜":
              dealJson["主菜"]=0;break;
            case "辅菜":
              dealJson["辅菜"]=0;break;
            case "小菜":
              dealJson["小菜"]=0;break;
            case "主食":
              dealJson["主食"]=0;break;
          }
        }
        for(var j in dealJson){
          if(dealJson[j]){
            that.setData({
              tip:"请选择"+j,
              tipStatus:true,
            })
            break;
          }
          if(j==dealJson.length-1){
            that.setData({
              tip:'',
              tipStatus:false,
            })
            break;
          }
        }
        //点击选好了
        console.log(data)
        if(!that.data.tipStatus&&isAddShop){
          data=JSON.stringify(data);
          network.ajax({
            url:network.buffetShop,
            method:"POST",
            data:{
              cartSelfDTOList:data,
              boxLunchDate:timestamp
            },
            success(res){
              console.log("*******加购***********")
              console.log(res);
              if(res.status==0){//加入购物车成功
                wx.showModal({
                  title: '请确认送餐日期',
                  content: that.data.send_time.substr(2),
                  confirmText:"买单",
                  confirmColor:"#fc9c02",
                  cancelColor:"#aaa",
                  success: function(d) {
                    if (d.confirm) {
                      // console.log('用户点击确定');
                      wx.redirectTo({
                        url: '../submitOrder/submitOrder?boxLunchId='+res.data+'&boxLunchDate='+timestamp+'&orderType=1'
                      })
                      
                    } else if (d.cancel) {
                      // console.log('用户点击取消')
                    }
                  }
                })
              }else{//加入购物车失败
                wx.showToast({
                  title: '系统异常，稍后重试',
                  duration: 1000
                })
              }
            }
          })
        }


        that.setData({
          xiaocaiArr,
          feiXiaocaiArr,
          allPrice:util.getFloat2(sum)
        })
        wx.setStorage({
            key:"haveAllPrice",
            data:{
              allPrice:that.data.allPrice,
              isRead:that.data.allPrice>0?true:false
            }
          })
      } 
    })
  },
  addShop(){//加入购物车
    var that=this;
    if(!this.data.tipStatus){//可以加入购物车
      that.dealData(true);
    }else{//不可以加入购物车
      wx.showToast({
        title: that.data.tip,
        icon: 'none',
        duration: 2000
      })
    }
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
  
  }
})