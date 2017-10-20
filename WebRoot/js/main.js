function getDateDiff(dateTimeStamp){
	var minute = 1000 * 60;
	var hour = minute * 60;
	var day = hour * 24;
	var halfamonth = day * 15;
	var month = day * 30;
	var now = new Date().getTime();
	var diffValue = now - dateTimeStamp;
	if(diffValue < 0){return;}
	var monthC =diffValue/month;
	var weekC =diffValue/(7*day);
	var dayC =diffValue/day;
	var hourC =diffValue/hour;
	var minC =diffValue/minute;
	if(monthC>=1){
		result="" + parseInt(monthC) + "月前";
	}
	else if(weekC>=1){
		result="" + parseInt(weekC) + "周前";
	}
	else if(dayC>=1){
		result=""+ parseInt(dayC) +"天前";
	}
	else if(hourC>=1){
		result=""+ parseInt(hourC) +"小时前";
	}
	else if(minC>=1){
		result=""+ parseInt(minC) +"分钟前";
	}else
	result="刚刚";
	return result;
}

function getTimeGreat(){
	var h = (new Date()).getHours();
	if (h >= 15  && h < 19)
		return "下午好";
	if (h >= 11 && h < 15)
		return "中午好";
	if (h >= 19 && h < 22)
		return "晚上好";
	if (h >= 22 && h <= 24 || h >=0 && h < 6)
		return "深夜好";
	if (h >= 6 && h < 11)
		return "早上好";
}

//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function (fmt) { //author: meizz 
 var o = {
     "M+": this.getMonth() + 1, //月份 
     "d+": this.getDate(), //日 
     "H+": this.getHours(), //小时 
     "m+": this.getMinutes(), //分 
     "s+": this.getSeconds(), //秒 
     "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
     "S": this.getMilliseconds() //毫秒 
 };
 if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
 for (var k in o)
 if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
 return fmt;
}

var time1 = new Date().Format("yyyy-MM-dd");
var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss"); 


var minute = 60 * 1000;// 1分钟
var hour = 60 * minute;// 1小时
var day= 24 * hour;// 1天
var month = 31 * day;// 月
var year = 12 * month;// 年


	/**
	 * 返回文字描述的日期
	 * 
	 * @param date
	 * @return
	 */
	function getTimeFormatText(date) {
		if (date == null) {
			return null;
		}
		var diff = new Date().getTime() - (new Date(date)).getTime();
		var r = 0;
/*		if (diff > year) {
			r = Math.round(diff / year);
			return r + "年前";
		}
		if (diff > month) {
			r = Math.round(diff / month);
			return r + "个月前";
		}*/
		if (diff > day) {
			/*r = Math.round(diff / day);*/
			//return r + "天前";
			var d = (new Date(date));
			
			return d.Format("yyyy-MM-dd HH:mm:ss");
			//return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDay()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
			/*return .Format("yyyy-MM-dd HH:mm:ss");*/
		}
		if (diff > hour) {
			r = Math.round(diff / hour);
			return r + "个小时前";
		}
		if (diff > minute) {
			r = Math.round(diff / minute);
			return r + "分钟前";
		}
		return "刚刚";
	}