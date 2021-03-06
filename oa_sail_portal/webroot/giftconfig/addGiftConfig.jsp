<%@ page contentType="text/html;charset=UTF-8" language="java"
	errorPage="../common/error.jsp"%>
<%@include file="../common/common.jsp"%>
<html>
<head>
<p:link title="增加赠品配置" />
<script language="JavaScript" src="../js/JCheck.js"></script>
<script language="JavaScript" src="../js/common.js"></script>
<script language="JavaScript" src="../js/public.js"></script>
<script language="JavaScript" src="../js/math.js"></script>
<script language="javascript">
    var index = -1;
function addBean()
{
	submit('确定增加赠品配置?', null, null);
}

function selectProduct(idx)
{
//    console.log(idx);
    index = idx;
    window.common.modal('../product/product.do?method=rptQueryProduct&load=1&selectMode=1');
}

//refer to rptQueryProduct.jsp, this is callback function for selectProduct()
function getProduct(oos)
{
//    console.log("getProduct now");
    var obj = oos[0];
//    console.log(obj);
//    console.log(index);
    if (index === 1){
        $O('productName').value = obj.pname;
        $O('productId').value = obj.value;
    } else if (index === 2){
        $O('giftProductName').value = obj.pname;
        $O('giftProductId').value = obj.value;
    }  else if (index === 22){
        $O('giftProductName2').value = obj.pname;
        $O('giftProductId2').value = obj.value;
    }   else if (index === 3){
        $O('giftProductName3').value = obj.pname;
        $O('giftProductId3').value = obj.value;
    }
}

function clears(idx)
{
    if (idx === 1){
        $O('productId').value = '';
        $O('productName').value = '公共';
    } else if (idx === 2){
        $O('giftProductId').value = '';
        $O('giftProductName').value = '公共';
    } else if (idx === 22){
        $O('giftProductId22').value = '';
        $O('giftProductName22').value = '公共';
    } else if (idx === 3){
        $O('giftProductId3').value = '';
        $O('giftProductName3').value = '公共';
    }
}

</script>

</head>
<body class="body_class">
<form name="formEntry" action="../sail/giftconfig.do" method="post">
<input type="hidden" name="method" value="addGiftConfig">
<input type="hidden" name="productId" value="0">
<input type="hidden" name="giftProductId" value="0">
<input type="hidden" name="giftProductId2" value="0">
<input type="hidden" name="giftProductId3" value="0">


<p:navigation
	height="22">
	<td width="550" class="navigation"><span style="cursor: pointer;"
		onclick="javascript:history.go(-1)">赠品配置</span> &gt;&gt; 增加赠品配置</td>
	<td width="85"></td>
	
</p:navigation> <br>

<p:body width="98%">

	<p:title>
		<td class="caption"><strong>赠品配置基本信息：</strong></td>
	</p:title>

	<p:line flag="0" />

	<p:subBody width="100%">
		<p:class value="com.china.center.oa.product.bean.ProductVSGiftBean" />

		<p:table cells="1">

            <p:cell title="活动描述">
                <input type="text" name="activity" id="activity">
            </p:cell>

            <p:cell title="适用银行">
                <input type="text" name="bank" id="bank" placeholder="可多选，以分号;分割" size="100">
            </p:cell>

            <p:cell title="事业部">
                <input type="text" name="industryName" id="industryName" placeholder="可多选，以分号;分割" size="100">
            </p:cell>

            <p:cell title="大区">
                <input type="text" name="industryName2" id="industryName2" placeholder="可多选，以分号;分割" size="100">
            </p:cell>

            <p:cell title="部门">
                <input type="text" name="industryName3" id="industryName3" placeholder="可多选，以分号;分割" size="100">
            </p:cell>

            <p:cell title="人员">
                <input type="text" name="stafferName" id="stafferName" placeholder="可多选，以分号;分割" size="100">
            </p:cell>

            <p:cell title="省份">
                <input type="text" name="province" id="province" placeholder="可多选，以分号;分割" size="100">
            </p:cell>

            <p:cell title="城市">
                <input type="text" name="city" id="city" placeholder="可多选，以分号;分割" size="100">
            </p:cell>

            <p:pro field="beginDate" />

            <p:pro field="endDate" />

			<p:pro field="productId" value="销售商品品名" innerString="size=60">
			     <input type="button" value="&nbsp;选择产品&nbsp;" name="qout1" id="qout1"
                    class="button_class" onclick="selectProduct(1)">&nbsp;
                 <input type="button" value="&nbsp;清 空&nbsp;" name="qout" id="qout"
                        class="button_class" onclick="clears(1)">&nbsp;&nbsp;
			</p:pro>

            <p:pro field="sailAmount" value="0" innerString="oncheck='isMathNumber'"/>

            <p:pro field="giftProductId" value="赠送商品品名1" innerString="size=60">
                <input type="button" value="&nbsp;选择产品&nbsp;" name="qout1" id="qout1"
                       class="button_class" onclick="selectProduct(2)">&nbsp;
                <input type="button" value="&nbsp;清 空&nbsp;" name="qout" id="qout"
                       class="button_class" onclick="clears(2)">&nbsp;&nbsp;
            </p:pro>

            <p:pro field="amount" value="0" innerString="oncheck='isMathNumber'"/>

            <p:pro field="giftProductId2" value="赠送商品品名2" innerString="size=60">
                <input type="button" value="&nbsp;选择产品&nbsp;" name="qout1" id="qout1"
                       class="button_class" onclick="selectProduct(22)">&nbsp;
                <input type="button" value="&nbsp;清 空&nbsp;" name="qout" id="qout"
                       class="button_class" onclick="clears(22)">&nbsp;&nbsp;
            </p:pro>

            <p:pro field="amount2" value="0" innerString="oncheck='isMathNumber'"/>

            <p:pro field="giftProductId3" value="赠送商品品名3" innerString="size=60">
                <input type="button" value="&nbsp;选择产品&nbsp;" name="qout1" id="qout1"
                       class="button_class" onclick="selectProduct(3)">&nbsp;
                <input type="button" value="&nbsp;清 空&nbsp;" name="qout" id="qout"
                       class="button_class" onclick="clears(3)">&nbsp;&nbsp;
            </p:pro>

            <p:pro field="amount3" value="0" innerString="oncheck='isMathNumber'"/>
			
			<p:pro field="description" cell="0" innerString="rows=3 cols=55" />

		</p:table>
	</p:subBody>

	<p:line flag="1" />

	<p:button leftWidth="100%" rightWidth="0%">
		<div align="right"><input type="button" class="button_class" id="ok_b"
			style="cursor: pointer" value="&nbsp;&nbsp;确 定&nbsp;&nbsp;"
			onclick="addBean()"></div>
	</p:button>

	<p:message2/>
</p:body></form>
</body>
</html>

