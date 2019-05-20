function reload(url){
	alert(url);
    $("#dh").action=url;
    $("#dh").submit();
	//window.location.reload();

}
function help(msg){
	alert('��ӭʹ��'+msg);
}

function to(url){
	alert(url);
	window.location.href=url;
}
function back(){
	history.go(-1);
}
function save(url){
    alert(url);
    var json={
    	"chcId":$("#chcId").val(),
        "chcSource":$("#chcSource").val(),
        "chcCustName":$("#chcCustName").val(),
        "chcTitle":$("#chcTitle").val(),
        "chcRate":$("#chcRate").val(),
        "chcLinkman":$("#chcLinkman").val(),
        "chcTel":$("#chcTel").val(),
        "chcDesc":$("#chcDesc").val(),
        "chcCreateBy":$("#chcCreateBy").val(),
        "chcCreateDate":$("#chcCreateDate").val(),
        "chcDueTo":$("#chcDueTo").val(),
        "chcDueDate":$("#chcDueDate").val(),
        "datestring":$("#t11").val()
    }
        $.ajax({
            url:url,
            type: "post",
            data: json,
            dataType:"json",
            success: function (data) {
                if(data.status==1){
                    alert(data.message);
                    window.location.href="http://localhost:8080/crm/sale/salChanceList";
                }
                else {//如果验证失败,则 显示错误信息
                    alert(data.message);
                    window.location.reload( );
                    window.location.href="http://localhost:8080/crm/sale/salChanceList";
                }
            }

        })
}

function update(url,id){
    alert(url);
    var chcStatus=2;
    var da=$("#chcDueTo").val();
    alert(da);
    var json={
        "chcId":id,
        "chcDueTo":$("#chcDueTo").val(),
        "chcStatus":chcStatus,
        "datestring":$("#t10").val(),
        "chcStatus":2


    }
    $.ajax({
        url:url,
        type: "post",
        data: json,
        dataType:"json",
        success: function (data) {
            if(data.status==1){
                alert(data.message);
                window.location.href="http://localhost:8080/crm/sale/salChanceList";
            }
            else {//如果验证失败,则 显示错误信息
                alert(data.message);
                window.location.reload( );
                //window.location.href="http://localhost:8080/crm/sale/salChanceList";
            }
        }

    })
}

function del(url,chcId){
    $.ajax({
        url:url,
        type: "post",
        data: {chcId:chcId},
        success: function (data) {
            if(data.status==1){
                alert(data.message);
                window.location.href="http://localhost:8080/crm/sale/salChanceList";
            }
            else {//如果验证失败,则 显示错误信息
                alert(data.message);
                window.location.href="http://localhost:8080/crm/sale/salChanceList";
            }
        }
    })


}

function addSalPlan(url,id,chcId) {
    alert(url);
    var json={
        "plaChcId":id,
        "plaTodo":$("#plaTodo").val()
    }
    $.ajax({
        url:url,
        type: "post",
        data: json,
        dataType:"json",
        success: function (data) {
            if(data.status==1){
                alert(data.message);
                window.location.href="http://localhost:8080/crm/sale/loadSalPlan?plaChcId="+chcId;
                $("#plaResult").val("");
            }
            else {//如果验证失败,则 显示错误信息
                alert(data.message);
                window.location.reload( );
                window.location.href="http://localhost:8080/crm/sale/loadSalPlan?plaChcId="+chcId;
                $("#plaResult").val("");
            }
        }

    })

}

function updateSalPlan(url,plaId,chcId) {
    alert(url);
    alert(plaId);
    var json={
        "plaId":plaId,
        "plaTodo":$("#plaTodo1").val()
    }
    $.ajax({
        url:url,
        type: "post",
        data: json,
        dataType:"json",
        success: function (data) {
            if(data.status==1){
                alert(data.message);
                var uriid="http://localhost:8080/crm/sale/loadSalPlan?plaChcId="+chcId;
                alert(uriid);
                to(uriid);
            }
            else {//如果验证失败,则 显示错误信息
                alert(data.message);
                window.location.reload( );
            }
        }

    })
    
}
function delSalPlan(url,plaId,chcId) {
    $.ajax({
        url:url,
        type: "post",
        data: {plaId:plaId},
        success: function (data) {
            if(data.status==1){
                alert(data.message);
                window.location.href="http://localhost:8080/crm/sale/loadSalPlan?plaChcId="+chcId;
            }
            else {//如果验证失败,则 显示错误信息
                alert(data.message);
                window.location.href="http://localhost:8080/crm/sale/loadSalPlan?plaChcId="+chcId;
            }
        }
    })
}

function updateplaResult(url,plaId,plaChcId) {
    alert($("#plaResult").val());
    var json={
        "plaId":plaId,
        "plaResult":$("#plaResult").val()
    }
    alert(json.plaResult);
    $.ajax({
        url:url,
        type: "post",
        data:json,
        dataType:"json",
        success: function (data) {
            if(data.status==1){
                alert(data.message);
                window.location.href="http://localhost:8080/crm/sale/loadSalPlan1?plaChcId="+plaChcId;
            }
            else {//如果验证失败,则 显示错误信息
                alert(data.message);
                window.location.href="http://localhost:8080/crm/sale/loadSalPlan1?plaChcId="+plaChcId;
            }
        }
    })
    
}


function setCurTime(oid){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var day=now.getDate();
	var hours=now.getHours();
	var minutes=now.getMinutes();
	var seconds=now.getSeconds();
	var timeString = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
	var oCtl = document.getElementById(oid);
	oCtl.value = timeString;
}