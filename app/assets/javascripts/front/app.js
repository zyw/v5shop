/**
 * Created by ZYW on 2015/1/12.
 */
;(function($){
    $.fn.datepicker.dates['zh-CN'] = {
        days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
        daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
        months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        today: "今日",
        format: "yyyy年mm月dd日",
        weekStart: 1,
        clear: "清空"
    };
}(jQuery));

(function($,window){

    v5shop = {};

    v5shop.initAddress = function(){
        $(".address").on("click",function(){
            $(".address").each(function(){
                $(this).removeClass("selected");
                $(this).find('.edit-btn').css('display','none')
            });
            $(this).addClass("selected");
            $(this).find('.edit-btn').css('display','block')
        });
    };

    v5shop.initCart = function(){
        function changeNum(key,value){
            $.ajax({
                url:change_num_url,
                dataType:'json',
                type:'POST',
                data:{key:key,value:value,authenticity_token:authenticity_token},
                success:function(data){
                    $("#total").text(data.total);
                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    toastr.error("改变购物车服务数量失败！");
                }
            })
        }
        $('.spinner').spinner({value:1, min: 1, max: 200});
        $('.spinner').on("changed",function(event, value){
            var key = $(this).data("pid");
            changeNum(key,value);
        })
        $(".select_num").on("change",function(){
            var key = $(this).data("pid");
            var value = $(this).val();
            changeNum(key,value);
        })
        $(".cart-btn").click(function(){
            var $remove = $(this);
            var pid = $(this).data("pid");
            swal({
                title: "温馨提示",
                text: "确定要移除该服务吗？",
                type: "info", 
                showCancelButton: true,
                confirmButtonText: "确认删除",
                confirmButtonColor: "#DD6B55",
                cancelButtonText: "取消"},
                    function(){
                        $.ajax({
                            url:cart_remove_url,
                            dataType:'json',
                            data:{id:pid},
                            success:function(data){
                                if(data.status === 2){
                                    location.reload();
                                }else{
                                    $("#total").text(data.total);
                                    $remove.parent().parent().detach();
                                }
                            },
                            error:function (XMLHttpRequest, textStatus, errorThrown) {
                                toastr.error("购物车移除服务失败！");
                            }
                        })
                    }
                );
        });
    }

    v5shop.initConfirmOrder = function(){
        function find_ad(adpid,flag){
            $.ajax({
                url:find_ad_url,
                dataType:'json',
                type:'GET',
                data:{adpid:adpid},
                success:function(data){
                    $("#"+flag).empty();
                    if(flag === 'city'){
                        $("#"+flag).append("<option value='0'>城市/地区/自治州</option>");
                    }else{
                        $("#"+flag).append("<option value='0'>区/县</option>");
                    }
                    $.each(data,function(i,item){
                        $("#"+flag).append("<option value='"+item.id+"'>"+item.name+"</option>");
                    });
                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    toastr.error("省市二级联动失败！");
                }
            })
        }

        $(".datepicker").datepicker({
            language: "zh-CN",
            todayHighlight: true,
            startDate: '+1d',
            endDate: '+10d'
        });
        $('#timepicker2').timepicker({
            minuteStep: 30,
            showSeconds: false,
            showMeridian: false
        });
        $.v5shop.initAddress();

        $("#province").on('change',function(){
            var province = $(this).val();
            if(province != 0){
                find_ad(province,'city');
            }
        });
        $("#city").on('change',function(){
            var city = $(this).val();
            if(city != 0){
                find_ad(city,'county');
            }
        });
        $("#finishOrder").on('click',function(){
            $("#orderForm").submit();
        });
    }

    $.v5shop = v5shop;

}(jQuery,window));