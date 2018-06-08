// pages/productComment/productComment.js
const network=require("../../utils/network.js");
const util=require("../../utils/util.js");
const App=getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isLoad:true,
    secondPinglunId:'',//二级评论的评论的id
    secondPinglunIndex:'',//二级评论的评论的下标
    pinglunInputStatus:false,//评论输入框出现状态
    hotItem:false,//热度排序选择框状态
    hotSortArr:['按热度','按时间'],//排序条件
    hotSortArrIndex:0,////排序条件下标
    percentNum:{},
    flavor_num:[10,30,50,70,90],
    pinglunBtns:[{
      describeName:"全部",
      goodsDescribeId:0,
      sumNumber:0
    }],
    PL_select_btn:0,//评论选择按钮
    PL_select_btn_index:0,
    haveImg:false,//有图评价
    manyiArr:["差","一般","还不错","满意","非常满意"],
    //评论数据
    plData:[],

    //全局参数
    goodsId:2,
    commentSource:1,
    boxLunchIsFire:0,
    limit:10,

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      goodsId:options.goodsId
    })
    var that=this;
     network.ajax({
      url:network.sumGoodsDescribe,
      method:"POST",
      data:{
        goodsId:that.data.goodsId,
        commentSource:that.data.commentSource
      },
      success(res){
        console.log("*********获取评论筛选按钮***********");
        var arr=that.data.pinglunBtns;
        arr=arr.concat(res.data);
        for (var i = 0; i < arr.length; i++) {
          arr[i].offset=0;
        };
        that.setData({
          pinglunBtns:arr
        })
        console.log(that.data.pinglunBtns)
      },
      fail(){
        console.log("网络连接失败")
      }
    })
    //获取评价百分比
    this.commentPercent();
     
  },
  getCommentList(goodsDescribeId,offset,isFire){
    var that=this;   
    if(goodsDescribeId){
      network.ajax({
      url:network.getCommentList,
      method:"POST",
      data:{
        goodsId:that.data.goodsId,
        commentSource:that.data.commentSource,
        goodsDescribeId:goodsDescribeId,
        offset:offset,
        limit:that.data.limit,
        boxLunchIsFire:isFire
      },
      success(res){
        that.getCommentListSuccess(res)
      }
     })
    }else{
       network.ajax({
          url:network.getCommentList,
          method:"POST",
          data:{
            goodsId:that.data.goodsId,
            commentSource:that.data.commentSource,
            offset:offset,
            limit:that.data.limit,
            boxLunchIsFire:isFire
          },
          success(res){
            that.getCommentListSuccess(res)
          }
         })
    }
    
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
  readInfoAll(e){//查看全部二级评价
    var index=e.currentTarget.dataset.index;
    var arr=this.data.plData;
    arr[index].showNum=arr.length;
    arr[index].selectAll=false;
    // console.log(e)
    this.setData({
      plData:arr
    })
  },
  commentPercent(){
    var that=this;
    network.ajax({
      url:network.commentPercent,
      method:"POST",
      data:{
        goodsId:that.data.goodsId,
        commentSource:that.data.commentSource
      },
      success(res){
        console.log("***********获取百分比****************");
        var arr=that.data.pinglunBtns;
        arr[0].sumNumber=res.data.commentNumber;
        that.setData({
          pinglunBtns:arr,
          percentNum:res.data
        })
        //获取评价列表
        that.getCommentList(0,0,that.data.boxLunchIsFire);
      }
    })
  },
  selectPL(e){//全部评价，快速准时等切换
    var index=e.target.dataset.index;
    var arr=this.data.pinglunBtns;
    arr[index].offset=0;
    this.setData({
      PL_select_btn:e.target.dataset.plbtn,
      PL_select_btn_index:index,
      pinglunBtns:arr,
      plData:[],
      isLoad:true
    })
    this.getCommentList(this.data.PL_select_btn,0,this.data.boxLunchIsFire);

  },
  haveImgPL(){//有图评价
    this.setData({
      haveImg:!this.data.haveImg
    })
  },
  plDianzanTap(e){//单条评论点赞
        // console.log(e)
        var plId=e.target.dataset.plid;
        var index=e.target.dataset.index;
        var arr=this.data.plData;
        var that=this;
        if(arr[e.target.dataset.index].isPraise==0){
          network.ajax({
            url:network.dianzan,
            method:"POST",
            data:{
              commentFirstLevelId:plId
            },
            success(res){
              console.log("*********点赞**************");
              
              arr[index].praiseNumber=arr[index].praiseNumber+1;
              arr[index].isPraise=(that.data.plData[index].isPraise==0)?1:0;
              that.setData({
                plData:arr
              });
              if(res.data){
                console.log('中奖：',res.data)
              }
            }
          })
        }else{
          network.ajax({
            url:network.cancelDianzan,
            method:"POST",
            data:{
              commentFirstLevelId:plId
            },
            success(res){
              console.log("*********取消点赞**************");
              console.log(arr[index].praiseNumber)
              arr[index].praiseNumber=arr[index].praiseNumber-1;
              console.log(arr[index].praiseNumber)
              arr[index].isPraise=(that.data.plData[index].isPraise==0)?1:0;
              that.setData({
                plData:arr
              })
            }
          })
        }
  },
  selectHot(){//热度排序选择框出现
    this.setData({
      hotItem:true
    })
  },
  selectReason(e){//选择排序条件
    // console.log(e.target.dataset.sort)
    this.setData({
      hotSortArrIndex:e.target.dataset.sort,
      hotItem:false,
      boxLunchIsFire:e.target.dataset.sort
    })
    this.getCommentList(this.data.PL_select_btn,0,this.data.boxLunchIsFire);
  },
  pinglunInput(e){//用户输入评论
    console.log(e)
    var plId=e.currentTarget.dataset.plid;
    var index=e.currentTarget.dataset.index;
    this.setData({
      pinglunInputStatus:true,
      secondPinglunId:plId,
      secondPinglunIndex:index
    })
  },
  send(e){
    // console.log(App.globalData.userInfo)
    var that=this;
    network.ajax({
      url:network.addSecondPinglun,
      method:"POST",
      data:{
        commentDetail:e.detail.value,
        isAnonymous:0,
        commentFirstLevelId:that.data.secondPinglunId
      },
      success(res){
        if(res.msg=="success"){
          var arr=that.data.plData;
          var d=new Date();
          arr[that.data.secondPinglunIndex].commentSecondLevelList.push({
            commentDetail:e.detail.value,
            seondUserName:App.globalData.userInfo.nickName,
            userAvatarUrl:App.globalData.userInfo.avatarUrl
          })
          arr[that.data.secondPinglunIndex].sumCommentNumber=arr[that.data.secondPinglunIndex].sumCommentNumber+1;
          that.setData({
            plData:arr
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
    this.cancelInput()
  },
  cancelInput(){
     this.setData({
      pinglunInputStatus:false
    })
  },
  loadmore(){//加载更多
    if(this.data.isLoad){
      var arr=this.data.pinglunBtns;
        arr[this.data.PL_select_btn_index].offset=arr[this.data.PL_select_btn_index].offset+1;
        this.setData({
          pinglunBtns:arr
        })
        if(arr[this.data.PL_select_btn_index].offset*10<arr[this.data.PL_select_btn_index].sumNumber){
          this.getCommentList(this.data.PL_select_btn,arr[this.data.PL_select_btn_index].offset*10,this.data.boxLunchIsFire);
          this.setData({
            isLoad:true
          })
        }else{
          this.setData({
            isLoad:false
          })
          return;
        }
    }
    
    
  },
  selectBigImg(e){
    console.log(e);
    var src=e.target.dataset.src;
    var list=e.target.dataset.list;
    wx.previewImage({
      current: src, // 当前显示图片的http链接
      urls: list // 需要预览的图片http链接列表
    })
  }
})