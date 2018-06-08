// pages/orderComment/orderComment.js
const netWork=require("../../utils/network.js");
const qiniuUploader=require("../../libs/qiniuUploader.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    //总评价星星
    star:5,
    starDetail:["差","一般","还不错","满意","非常满意"],
    commentTips: [],
    // 口味
    selectedTaste:5,
    //包装
    selectedWrap:5,
    // 评价内容
    commentText:'',
    // 是否匿名
    niming:false,
    localImage:[],
    //上传的图片数组
    uploadImages:[],
    qiniuToken:"",//七牛云token
    commentSource:1,//盒饭来源
    goodsId:2,//商品id
  },
  // 评价星级
  changeStar:function (e) {
    this.setData({
      star:e.target.dataset.id
    })
  },
  // 选择评价关键词
  selectTips:function (e) {
      // console.log(e)
      var index = e.target.dataset.index;
      var tip = 'commentTips[' + index + '].selected';
      this.setData({
        [tip]: !this.data.commentTips[index].selected
      })
  },
  // 选择口味
  selectTaste: function (e) {
    this.setData({
      selectedTaste:e.target.dataset.num
    });
  },
  // 选择包装
  selectWrap: function (e) {
    this.setData({
      selectedWrap: e.target.dataset.num
    });
  },
  //上传图片
  uploadImage :function() {
    var tempFilePaths=[];
    var _this=this;
    if (this.data.localImage.length<3){
      wx.chooseImage({
        count: 1, // 数量
        sizeType: ['compressed'], // 可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
        success: function (res) {
          // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
          var old = _this.data.uploadImages;
          var old2 = _this.data.localImage;
          var filePath = res.tempFilePaths[0];
          qiniuUploader.upload(filePath,(d)=>{
              _this.setData({
                uploadImages: old.concat(d.imageURL)
              });
              // console.log(d.imageURL)
          },(error)=>{
            console.log("error:"+error)
          },{
            region:"ECN",
            uploadURL: 'http://p8p794w7d.bkt.clouddn.com',
            domain:"http://p8p794w7d.bkt.clouddn.com",
            uptoken: _this.data.qiniuToken
          })
          // console.log(res)
         
          _this.setData({
            localImage:old2.concat(filePath)
          })
          
        }
      });
    }else{
      wx.showModal({
        title: '提示',
        content: '最多上传三张图片',
        success: function (res) {
          
        }
      })
    }
  },
  //删除图片
  deleteImage:function(e) {
    var old = this.data.uploadImages;
    old.splice(e.target.dataset.id, 1);
      this.setData({
        uploadImages: old
      });
  },
  // 匿名
  nimingchange: function () {
    this.setData({
      niming:!this.data.niming
    })
  },
  //获取评价内容
  getCommentText: function (e) {
    this.setData({
      commentText: e.detail.value
    })

  },
  //提交评价
  submitComment: function () {
    var that=this;
    var selectedTips=[];
    for (var i = 0; i < this.data.commentTips.length; i++){
      if (this.data.commentTips[i].selected){
        selectedTips.push({
          goodsDescribeId:this.data.commentTips[i].goodsDescribeId
        });
      }
    }
    var temp=JSON.stringify(selectedTips);
    // console.log(that.data.uploadImages)
    var data = { 
      commentDetail: that.data.commentText,//评价内容
      commentSource:that.data.commentSource,//盒饭
      flavor: that.data.selectedTaste,//口味
      comment: temp,//评价关键词
      goodsId:that.data.goodsId,//商品id
      isAnonymous: that.data.niming?1:0,//是否匿名
      packing: that.data.selectedWrap,//包装,
      pictureUrl: that.data.uploadImages.join(','),//图片
      totalEvaluate: that.data.star,//总评价星级
    };
      // console.log(data)
      netWork.ajax({
        url:netWork.insertCommentFirstLevel,
        method:"POST",
        data:data,
        success(res){
          console.log(res)
          if(res.status==0){//成功
            wx.redirectTo({
              url: 'commentEnd?goodsId='+that.data.goodsId
            })
          }else{
            wx.showToast({
              title: '提交失败，请重试',
              icon: 'none',
              duration: 1000
            })
          }
        }

      })
   
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
    netWork.ajax({
      url:netWork.listGoodsDescribe,
      method:"GET",
      success(res){
        /*console.log("*******获取按钮列表**********");
        console.log(res)*/
        that.setData({
          commentTips:res.data
        })
      }
    })
    netWork.ajax({
        url:netWork.getQiniuToken,
        method:"GET",
        success(res){
          // console.log("******获取七牛token*******");
          that.setData({
            qiniuToken:res.data
          })
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