<%@ page contentType="text/html;charset=UTF-8" language="java"
    errorPage="../common/error.jsp"%>
<%@include file="../common/common.jsp"%>
<html>
<head>
<p:link title="办公采购申请" guid="true"/>
<script language="JavaScript" src="../js/common.js"></script>
<script language="JavaScript" src="../js/key.js"></script>
<script language="JavaScript" src="../tcp_js/travelApply.js"></script>
<script language="javascript">
function load()
{

}

</script>
</head>

<body class="body_class" onload="load()">
<form name="formEntry" action="../tcp/apply.do"  method="post">
<input type="hidden" name="oprType" value="0"> 
<input type="hidden" name="stafferId" value="${g_stafferBean.id}"> 
<input type="hidden" name="departmentId" value="${g_stafferBean.principalshipId}"> 

<p:navigation height="22">
    <td width="550" class="navigation">办公采购申请明细</td>
    <td width="85"></td>
</p:navigation> <br>

<p:body width="100%">

    <p:title>
        <td class="caption">
         <strong>办公采购</strong>
        </td>
    </p:title>

    <p:line flag="0" />

    <p:subBody width="98%">
    
        <p:class value="com.china.center.oa.tcp.bean.TravelApplyBean" opr="2"/>
        
        <p:table cells="2">
            <p:cell title="处理流程" width="8" end="true">
            ${bean.flowDescription}
            </p:cell>

            <p:pro field="id" cell="0"/>
            
            <p:pro field="stafferId" value="${bean.stafferName}"/>
            <p:pro field="departmentId" value="${bean.departmentName}"/>
            
            <p:pro field="stype">
                <p:option type="tcpStype" empty="true"/>
            </p:pro>
            
            <p:pro field="dutyId">
                <p:option type="$dutyList" empty="true"/>
            </p:pro>
            
            <p:pro field="name"/>
            
            <p:pro field="status">
                <p:option type="tcpStatus"></p:option>
            </p:pro>
            
            <p:pro field="beginDate" cell="0"/>
            
            <p:pro field="borrow" innerString="onchange='borrowChange()'">
                <p:option type="travelApplyBorrow"></p:option>
            </p:pro>
            
            <p:cell title="借款人">
            ${bean.borrowStafferName}
            </p:cell>
            
            <p:pro field="showTotal"/>
            <p:pro field="showBorrowTotal"/>
            
            <p:cell title="报销关联"end="true">
            ${my:get('tcpApplyFeedback', bean.feedback)}
            </p:cell>

            <p:pro field="description" cell="0" innerString="rows=4 cols=55" />
            
            <p:cell title="附件" width="8" end="true">
            <c:forEach items="${bean.attachmentList}" var="item">
            <a href="../tcp/apply.do?method=downAttachmentFile&id=${item.id}" title="点击下载附件">${item.name}</a>
            <br>
            <br>
            </c:forEach>
            </p:cell>
            
                 
            <p:cell title="处理人" width="8" end="true">
            ${bean.processer}
            </p:cell>
            
            <p:cell title="关联报销单" end="true">
	          <a href="../tcp/expense.do?method=findExpense&id=${bean.refId}">${bean.refId}</a>
            </p:cell>
            
            <p:cell title="关联收付款单" width="8" end="true">
                <c:forEach items="${billList}" var="item">
                <a href="../finance/bill.do?method=findBill&id=${item.id}">${item.id}</a>&nbsp;&nbsp;
                </c:forEach>
            </p:cell>
            
            <p:cell title="关联凭证" width="8" end="true">
                <c:forEach items="${financeList}" var="item">
                <a href="../finance/finance.do?method=findFinance&id=${item.id}">${item.id}</a>&nbsp;&nbsp;
                </c:forEach>
            </p:cell>

            <p:pro field="compliance" cell="0">
            	<p:option type="tcpComplianceType" empty="true"/>
            </p:pro>

        </p:table>
    </p:subBody>
    
        
    <p:title>
        <td class="caption">
         <strong>申请费用明细</strong>
        </td>
    </p:title>

    <p:line flag="0" />
    
    <tr>
        <td colspan='2' align='center'>
        <table width="98%" border="0" cellpadding="0" cellspacing="0"
            class="border">
            <tr>
                <td>
                <table width="100%" border="0" cellspacing='1' id="tables">
                    <tr align="center" class="content0">
                        <td width="15%" align="center">采购品名</td>
                        <td width="15%" align="center">采购数量</td>
                        <td width="15%" align="center">预估单价</td>
                        <td width="10%" align="center">采购单价</td>
                        <td width="15%" align="center">预算项</td>
                        <td width="10%" align="center">总价</td>
                        <td width="25%" align="center">备注</td>
                    </tr>
                    <c:forEach items="${bean.itemVOList}" var="item">
                    <tr align="center" class="content1">
                        <td width="15%" align="center">${item.productName}</td>
                        <td width="15%" align="center">${item.amount}</td>
                        <td width="15%" align="center">${my:formatNum(item.prices / 100.0)}</td>
                        <td width="15%" align="center">${my:formatNum(item.checkPrices / 100.0)}</td>
                        <td width="15%" align="center">${item.feeItemName}</td>
                        <td width="10%" align="center">${my:formatNum(item.moneys / 100.0)}</td>
                        <td width="40%" align="center"><c:out value="${item.description}"/></td>
                    </tr>
                    </c:forEach>
                </table>
                </td>
            </tr>
        </table>
        </td>
    </tr>

    <p:title>
        <td class="caption">
         <strong>收款明细</strong>
        </td>
    </p:title>

    <p:line flag="0" />
    
    <tr id="pay_main_tr">
        <td colspan='2' align='center'>
        <table width="98%" border="0" cellpadding="0" cellspacing="0"
            class="border">
            <tr>
                <td>
                <table width="100%" border="0" cellspacing='1' id="tables_pay">
                    <tr align="center" class="content0">
                        <td width="10%" align="center">收款方式</td>
                        <td width="15%" align="center">开户银行</td>
                        <td width="15%" align="center">户名</td>
                        <td width="20%" align="center">收款帐号</td>
                        <td width="10%" align="center">收款金额</td>
                        <td width="10%" align="center">稽核金额</td>
                        <td width="25%" align="center">稽核备注</td>
                    </tr>
                    <c:forEach items="${bean.payList}" var="item">
                    <tr align="center" class="content1">
                        <td align="center">${my:get('travelApplyReceiveType', item.receiveType)}</td>
                        <td align="center">${item.bankName}</td>
                        <td align="center">${item.userName}</td>
                        <td align="center">${item.bankNo}</td>
                        <td align="center" title='<c:out value="${item.description}"/>'>${my:formatNum(item.moneys / 100.0)}</td>
                        <td align="center">${my:formatNum(item.cmoneys / 100.0)}</td>
                        <td align="center"><c:out value="${item.cdescription}"/></td>
                    </tr>
                    </c:forEach>
                </table>
                </td>
            </tr>
        </table>

        </td>
    </tr>
    
    <%@include file="share_detail.jsp"%>
    
    <p:title>
        <td class="caption">
         <strong>流程日志</strong>
        </td>
    </p:title>

    <p:line flag="0" />
    
    <tr id="flowLog">
        <td colspan='2' align='center'>
        <table width="98%" border="0" cellpadding="0" cellspacing="0"
            class="border">
            <tr>
                <td>
                <table width="100%" border="0" cellspacing='1' id="tables">
                    <tr align="center" class="content0">
                        <td width="10%" align="center">审批人</td>
                        <td width="10%" align="center">审批动作</td>
                        <td width="10%" align="center">前状态</td>
                        <td width="10%" align="center">后状态</td>
                        <td width="45%" align="center">意见</td>
                        <td width="15%" align="center">时间</td>
                    </tr>

                    <c:forEach items="${logList}" var="item" varStatus="vs">
                        <tr class='${vs.index % 2 == 0 ? "content1" : "content2"}'>
                            <td align="center">${item.actor}</td>

                            <td  align="center">${item.oprModeName}</td>

                            <td  align="center">${item.preStatusName}</td>

                            <td  align="center">${item.afterStatusName}</td>

                            <td  align="center">${item.description}</td>

                            <td  align="center">${item.logTime}</td>

                        </tr>
                    </c:forEach>
                </table>
                </td>
            </tr>
        </table>

        </td>
    </tr>
    
    <p:line flag="1" />
    
    <p:button leftWidth="98%" rightWidth="0%">
        <div align="right">
         <input type="button" name="pr"
            class="button_class" onclick="pagePrint()"
            value="&nbsp;&nbsp;打 印&nbsp;&nbsp;">&nbsp;&nbsp;
        <input type="button" class="button_class"
            id="ok_b" style="cursor: pointer" value="&nbsp;&nbsp;返 回&nbsp;&nbsp;"
            onclick="javaScript:window.history.go(-1);"></div>
    </p:button>
    
    <p:message2/>
</p:body>
</form>
</body>
</html>

