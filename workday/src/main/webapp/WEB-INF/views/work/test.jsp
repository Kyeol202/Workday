<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>
<script id="jscode">
        /**
         * Require Files for AXISJ UI Component...
         * Based        : jQuery
         * Javascript    : AXJ.js, AXGrid.js, AXInput.js, AXSelect.js
         * CSS            : AXJ.css, AXGrid.css, AXButton.css, AXInput.css, AXSelect.css
         */
        var pageID = "inline-edit";
        var fnObj = {
                    pageStart: function () {
                        fnObj.grid.bind();
                    },
                    grid: {
                        target: new AXGrid(),
                        bind: function () {
                            window.myGrid = fnObj.grid.target;

                            myGrid.setConfig({
                                        targetID: "AXGridTarget",
                                        sort: false,
                                        fixedColSeq: 3,
                                        colGroup: [
                                            {key: "no", label: "번호", width: "50", align: "center", formatter: "checkbox"},
                                            {
                                                key: "_CUD", label: "상태", width: "50", align: "center"
                                            },
                                            {
                                                key: "string", label: "String", width: "200",
                                                formatter: function (val) {
                                                    if (Object.isObject(this.value)) {
                                                        return this.value.NM;
                                                    }
                                                    else {
                                                        return this.value;
                                                    }
                                                },
                                                editor: {
                                                    type: "AXSelector",
                                                    config: {
                                                        reserveKeys: {
                                                            options: "list",
                                                            optionValue: "CD",
                                                            optionText: "NM"
                                                        },
                                                        ajaxUrl: "selectData-01.php",
                                                        ajaxPars: "",
                                                        onchange: function () {
                                                            // inline editor 에 선언한 onchange함수는 AXGrid내부에서 사용하는 onchange 함수로 변경되어 사용할 수 없습니다.
                                                        }
                                                    },
                                                    beforeUpdate: function (val) { // 수정이 되기전 value를 처리 할 수 있음.
                                                        // 선택된 값은
                                                        console.log(val);
                                                        return val;
                                                    },
                                                    afterUpdate: function (val) { // 수정이 처리된 후
                                                        // 수정이 된 후 액션.
                                                        console.log(this);
                                                    },

                                                    /*
                                                     type: "text",
                                                     //textType: "password",
                                                     //maxLength: 5,
                                                     */
                                                    updateWith: ["_CUD"]

                                                }
                                            },
                                            {
                                                key: "combobox", label: "combobox", width: "100",
                                                editor: {
                                                    type: "select",
                                                    optionValue: "CD",
                                                    optionText: "NM",
                                                    options: [
                                                        {CD: 1, NM: "김기영"},
                                                        {CD: 2, NM: "장기영"},
                                                        {CD: 3, NM: "장서우"}
                                                    ],
                                                    beforeUpdate: function (val) { // 수정이 되기전 value를 처리 할 수 있음.
                                                        // 선택된 값은
                                                        console.log(val);
                                                        return val;
                                                    },
                                                    afterUpdate: function (val) { // 수정이 처리된 후
                                                        // 수정이 된 후 액션.
                                                        console.log(this);
                                                    }
                                                }
                                            },
                                            {
                                                key: "combobox1", label: "combobox1", width: "100",
                                                formatter: function () {
                                                    return this.value.NM;
                                                },
                                                editor: {
                                                    type: "select",
                                                    optionValue: "CD",
                                                    optionText: "NM",
                                                    options: function () {
                                                        return this.value.options;
                                                    },
                                                    beforeUpdate: function (val) { // 수정이 되기전 value를 처리 할 수 있음.
                                                        // 선택된 값은
                                                        var NM = "";
                                                        for(var oi = 0, l = this.value.options.length;oi < l;oi++){
                                                            if(this.value.options[oi].CD == val){
                                                                NM = this.value.options[oi].NM;
                                                                break;
                                                            }
                                                        }
                                                        this.value.CD = val;
                                                        this.value.NM = NM;
                                                        return this.value;
                                                    },
                                                    afterUpdate: function (val) { // 수정이 처리된 후
                                                        // 수정이 된 후 액션.
                                                        console.log(this);
                                                    }
                                                }
                                            },
                                            {
                                                key: "combobox2", label: "combobox2", width: "100",
                                                formatter: function (val) {
                                                    if (Object.isObject(this.value)) {
                                                        return this.value.NM;
                                                    }
                                                    else {
                                                        return this.value;
                                                    }
                                                },
                                                editor: {
                                                    type: "AXSelect",
                                                    config: {
                                                        reserveKeys: {
                                                            options: "list",
                                                            optionValue: "CD",
                                                            optionText: "NM"
                                                        }
                                                        ,
                                                        ajaxUrl: "selectData-01.php",
                                                        ajaxPars: "",
                                                        onchange: function () {
                                                            // inline editor 에 선언한 onchange함수는 AXGrid내부에서 사용하는 onchange 함수로 변경되어 사용할 수 없습니다.
                                                        }
                                                    }
                                                    ,
                                                    beforeUpdate: function (val) { // 수정이 되기전 value를 처리 할 수 있음.
                                                        // 선택된 값은
                                                        console.log(val);
                                                        return val;
                                                    }
                                                    ,
                                                    afterUpdate: function (val) { // 수정이 처리된 후
                                                        // 수정이 된 후 액션.
                                                        //console.log(this);
                                                    }
                                                }
                                            },
                                            {
                                                key: "date", label: "date", width: "105", align: "center",
                                                editor: {
                                                    type: "calendar",
                                                    config: {
                                                        separator: "-"
                                                    },
                                                    disabled: function(){
                                                        return this.item._CUD != "C";
                                                    },
                                                    updateWith: ["_CUD"]
                                                }
                                            },
                                            {
                                                key: "money", label: "money", width: "100", align: "right",
                                                formatter: "money",
                                                editor: {
                                                    type: "money",
                                                    updateWith: ["number", "_CUD"]
                                                }
                                            },
                                            {
                                                key: "number", label: "number", width: "80", align: "right",
                                                formatter: "money",
                                                editor: {
                                                    type: "number",
                                                    updateWith: ["money", "_CUD"]
                                                }
                                            },
                                            {
                                                key: "checkbox", label: "checkbox", width: "50", align: "center",
                                                editor: {
                                                    type: "checkbox",
                                                    beforeUpdate: function (val) {
                                                        return (val == true) ? "Y" : "N";
                                                    }
                                                }
                                            },
                                            {
                                                key: "radio", label: "radio", width: "50", align: "center",
                                                editor: {
                                                    type: "radio"
                                                }
                                            },
                                            {
                                                key: "finder", label: "finder", width: "100", align: "center",
                                                editor: {
                                                    type: "finder",
                                                    formatter: function () {
                                                        return (this.item.finder || "");
                                                    }

                                                    ,
                                                    finder: {
                                                        onclick: function () {
                                                            alert("새창 열기");
                                                        }
                                                    }
                                                }
                                            }
                                        ],
                                        colHeadAlign: "center", // 헤드의 기본 정렬 값 ( colHeadAlign 을 지정하면 colGroup 에서 정의한 정렬이 무시되고 colHeadAlign : false 이거나 없으면 colGroup 에서 정의한 속성이 적용됩니다.
                                        body: {
                                            onclick: function () {
                                                //trace(this.index);
                                            }
                                        }
                                        ,
                                        page: {
                                            paging: false
                                        }
                                    }
                            );

                            var list = [
                                {
                                    no: 1,
                                    string: "AXGrid 첫번째 줄 입니다.",
                                    combobox: 1,
                                    combobox1: {CD: '1', NM: '김기영', options: [{CD: 1, NM: "김기영"}, {CD: 2, NM: "장기영"}, {CD: 3, NM: "장서우"}]},
                                    combobox2: {CD: 1, NM: "김기영"},
                                    date: "2013-01-18",
                                    money: 1709401,
                                    number: 10,
                                    checkbox: 1,
                                    radio: 1,
                                    finder: "선택"
                                },
                                {
                                    no: 2,
                                    string: "AXGrid 첫번째 줄 입니다.",
                                    combobox: 2,
                                    combobox1: {CD: '1', NM: '황인서', options: [{CD: 1, NM: "황인서"}, {CD: 2, NM: "장인서"}, {CD: 3, NM: "김인서"}]},
                                    combobox2: {CD: 1, NM: "김기영"},
                                    date: "2013-01-18",
                                    money: 1709401,
                                    number: 10,
                                    checkbox: 1,
                                    radio: 1,
                                    finder: "선택"
                                },
                                {
                                    no: 3,
                                    string: "AXGrid 첫번째 줄 입니다.",
                                    combobox: 3,
                                    combobox1: {CD: '1', NM: '김동근', options: [{CD: 1, NM: "김동근"}, {CD: 2, NM: "박동근"}, {CD: 3, NM: "장동근"}]},
                                    combobox2: {CD: 1, NM: "김기영"},
                                    date: "2013-01-18",
                                    money: 1709401,
                                    number: 10,
                                    checkbox: 1,
                                    radio: 1,
                                    finder: "선택"
                                }
                            ];
                            myGrid.setList(list);
                            //trace(myGrid.getSortParam());

                        },
                        getExcel: function (type) {
                            var obj = myGrid.getExcelFormat(type, function () {
                                return this.key != "no" && this.key != "finder";
                            });
                            $("#printout").html(obj);
                        }
                        ,
                        getSelectedItem: function () {
                            trace(this.target.getSelectedItem());
                            toast.push('콘솔창에 데이터를 출력하였습니다.');
                        }
                        ,
                        append: function () {
                            this.target.pushList(
                                    {
                                        no: this.target.list.length,
                                        string: "",
                                        combobox: {optionValue: 1, optionText: "김기영"},
                                        combobox1: {CD: '1', NM: '김동근', options: [{CD: 1, NM: "김동근"}, {CD: 2, NM: "박동근"}, {CD: 3, NM: "장동근"}]},
                                        combobox2: {CD: 1, NM: "김기영"},
                                        date: "2013-01-18",
                                        money: 1709401,
                                        number: 10,
                                        checkbox: 1,
                                        radio: 1,
                                        finder: "선택"
                                    }
                            );
                            this.target.setFocus(this.target.list.length - 1);
                        }
                        ,
                        remove: function () {
                            var checkedList = myGrid.getCheckedListWithIndex(0);// colSeq
                            if (checkedList.length == 0) {
                                alert("선택된 목록이 없습니다. 삭제하시려는 목록을 체크하세요");
                                return;
                            }
                            this.target.removeListIndex(checkedList);
                            // 전달한 개체와 비교하여 일치하는 대상을 제거 합니다. 이때 고유한 값이 아닌 항목을 전달 할 때에는 에러가 발생 할 수 있습니다.
                        }
                    }
                };

        jQuery(document.body).ready(function () {
            fnObj.pageStart();
        });
    </script>



</script>

<!-- <!-- <script type="text/javascript">  --> -->
<!-- //         $(document).ready(function () { -->
			
<!-- //             $("#jqGrid").jqGrid({ -->
<!-- //                 url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders', -->
<!-- //                 mtype: "GET", -->
<!-- // 				styleUI : 'Bootstrap', -->
<!-- //                 datatype: "jsonp", -->
<!-- //                 colModel: [ -->
<!-- //                     { label: 'OrderID', name: 'OrderID', key: true, width: 75 }, -->
<!-- //                     { label: 'Customer ID', name: 'CustomerID', width: 150 }, -->
<!-- //                     { label: 'Order Date', name: 'OrderDate', width: 150 }, -->
<!-- //                     { label: 'Freight', name: 'Freight', width: 150 }, -->
<!-- //                     { label:'Ship Name', name: 'ShipName', width: 150 } -->
<!-- //                 ], -->
<!-- // 				viewrecords: true, -->
<!-- //                 height: 250, -->
<!-- //                 rowNum: 20, -->
<!-- //                 pager: "#jqGridPager" -->
<!-- //             }); -->
<!-- //         }); -->
 
<!-- <!--    </script> --> -->







<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../user/common/user_main_header.jsp" %>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../user/common/user_left_column.jsp" %>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<div class="row">
									<div class="col flexBox" style="justify-content: flex-start; padding: 0 16px;">
										<h3 class="box-title">근태관리</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
									</div>
								</div>
							</div>

        <div class="AXdemoPageContent">

            <div id="grid0">
                <h2>타이틀 미정</h2>
                <div id="AXGridTarget" style="height:300px;"><div class="AXGrid" id="AXGridTarget_AX_grid" style="overflow:hidden;height:300px;">	<div class="AXgridScrollBody" id="AXGridTarget_AX_gridScrollBody" style="z-index: 2; height: 267px;">		<div class="AXGridColHead AXUserSelectNone" id="AXGridTarget_AX_gridColHead" onselectstart="return false;" style="width: 1096px; left: 0px;"><table cellpadding="0" cellspacing="0" class="colHeadTable" style="width:1085px;"><colgroup><col width="50" style="" id="AXGridTarget_AX_col_AX_0_AX_CH"><col width="50" style="" id="AXGridTarget_AX_col_AX_1_AX_CH"><col width="200" style="" id="AXGridTarget_AX_col_AX_2_AX_CH"><col width="100" style="" id="AXGridTarget_AX_col_AX_3_AX_CH"><col width="100" style="" id="AXGridTarget_AX_col_AX_4_AX_CH"><col width="100" style="" id="AXGridTarget_AX_col_AX_5_AX_CH"><col width="105" style="" id="AXGridTarget_AX_col_AX_6_AX_CH"><col width="100" style="" id="AXGridTarget_AX_col_AX_7_AX_CH"><col width="80" style="" id="AXGridTarget_AX_col_AX_8_AX_CH"><col width="50" style="" id="AXGridTarget_AX_col_AX_9_AX_CH"><col width="50" style="" id="AXGridTarget_AX_col_AX_10_AX_CH"><col width="100" style="" id="AXGridTarget_AX_col_AX_11_AX_CH"></colgroup><tbody><tr><td valign="bottom" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdCheck" align="center"><label><input type="checkbox" name="checkAll" class="gridCheckBox gridCheckBox_colHead_colSeq0" id="AXGridTarget_AX_checkAll_AX_0_AX_0"></label></div></div></td><td valign="bottom" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center">상태</div></div></td><td valign="bottom" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center">String</div></div></td><td valign="bottom" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center">combobox</div></div></td><td valign="bottom" id="AXGridTarget_AX_colHead_AX_0_AX_4" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadText_AX_0_AX_4" style="padding-top: 5px;">combobox1</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadTool_AX_0_AX_4" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizer_AX_0_AX_4" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHead_AX_0_AX_5" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadText_AX_0_AX_5" style="padding-top: 5px;">combobox2</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadTool_AX_0_AX_5" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizer_AX_0_AX_5" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHead_AX_0_AX_6" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadText_AX_0_AX_6" style="padding-top: 5px;">date</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadTool_AX_0_AX_6" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizer_AX_0_AX_6" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHead_AX_0_AX_7" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadText_AX_0_AX_7" style="padding-top: 5px;">money</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadTool_AX_0_AX_7" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizer_AX_0_AX_7" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHead_AX_0_AX_8" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadText_AX_0_AX_8" style="padding-top: 5px;">number</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadTool_AX_0_AX_8" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizer_AX_0_AX_8" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHead_AX_0_AX_9" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadText_AX_0_AX_9" style="padding-top: 5px;">checkbox</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadTool_AX_0_AX_9" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizer_AX_0_AX_9" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHead_AX_0_AX_10" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadText_AX_0_AX_10" style="padding-top: 5px;">radio</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadTool_AX_0_AX_10" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizer_AX_0_AX_10" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHead_AX_0_AX_11" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadText_AX_0_AX_11" style="padding-top: 5px;">finder</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadTool_AX_0_AX_11" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizer_AX_0_AX_11" style="height: 30px;"></div></div></td></tr></tbody></table></div><div class="AXGridColHead fixedColHead" id="AXGridTarget_AX_fixedColHead" style="width:400px;"><table cellpadding="0" cellspacing="0" class="colHeadTable" style="width:400px;"><colgroup><col width="50" style="" id="AXGridTarget_AX_col_AX_0_AX_FC"><col width="50" style="" id="AXGridTarget_AX_col_AX_1_AX_FC"><col width="200" style="" id="AXGridTarget_AX_col_AX_2_AX_FC"><col width="100" style="" id="AXGridTarget_AX_col_AX_3_AX_FC"></colgroup><tbody><tr><td valign="bottom" id="AXGridTarget_AX_colHeadFC_AX_0_AX_0" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdCheck" align="center" id="AXGridTarget_AX_colHeadTextFC_AX_0_AX_0" style="padding-top: 5px;"><label><input type="checkbox" name="checkAll" class="gridCheckBox gridCheckBox_colHead_colSeq0" id="AXGridTarget_AX_checkAll_AX_0_AX_0"></label></div><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizerFC_AX_0_AX_0" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHeadFC_AX_0_AX_1" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadTextFC_AX_0_AX_1" style="padding-top: 5px;">상태</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadToolFC_AX_0_AX_1" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizerFC_AX_0_AX_1" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHeadFC_AX_0_AX_2" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadTextFC_AX_0_AX_2" style="padding-top: 5px;">String</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadToolFC_AX_0_AX_2" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizerFC_AX_0_AX_2" style="height: 30px;"></div></div></td><td valign="bottom" id="AXGridTarget_AX_colHeadFC_AX_0_AX_3" class="colHeadTd" style="height:30px;"><div class="tdRelBlock" style="height:30px;"><div class="colHeadNode colHeadTdText" align="center" id="AXGridTarget_AX_colHeadTextFC_AX_0_AX_3" style="padding-top: 5px;">combobox</div><a href="#AXexec" class="colHeadTool" id="AXGridTarget_AX_colHeadToolFC_AX_0_AX_3" style="top: 0px;">T</a><div class="colHeadResizer" id="AXGridTarget_AX_colHeadResizerFC_AX_0_AX_3" style="height: 30px;"></div></div></td></tr></tbody></table></div>		<div class="AXGridToolGroup top" id="AXGridTarget_AX_gridToolGroupTop"></div>		<div class="AXGridBody" id="AXGridTarget_AX_gridBody" style="top: 31px; height: 224px;"><div id="AXGridTarget_AX_scrollContent" class="gridScrollContent" style="top: 0px; width: 1096px; left: 0px;"><table cellpadding="0" cellspacing="0" class="gridBodyTable" id="AXGridTarget_AX_gridBodyTable"><colgroup><col width="50" style="" id="AXGridTarget_AX_col_AX_0_AX_CB"><col width="50" style="" id="AXGridTarget_AX_col_AX_1_AX_CB"><col width="200" style="" id="AXGridTarget_AX_col_AX_2_AX_CB"><col width="100" style="" id="AXGridTarget_AX_col_AX_3_AX_CB"><col width="100" style="" id="AXGridTarget_AX_col_AX_4_AX_CB"><col width="100" style="" id="AXGridTarget_AX_col_AX_5_AX_CB"><col width="105" style="" id="AXGridTarget_AX_col_AX_6_AX_CB"><col width="100" style="" id="AXGridTarget_AX_col_AX_7_AX_CB"><col width="80" style="" id="AXGridTarget_AX_col_AX_8_AX_CB"><col width="50" style="" id="AXGridTarget_AX_col_AX_9_AX_CB"><col width="50" style="" id="AXGridTarget_AX_col_AX_10_AX_CB"><col width="100" style="" id="AXGridTarget_AX_col_AX_11_AX_CB"><col></colgroup><thead id="AXGridTarget_AX_thead"></thead><tbody id="AXGridTarget_AX_hpadding"><tr class="thpadding"><td colspan="13" style="height: 0px;"></td></tr></tbody><tbody id="AXGridTarget_AX_tbody"><tr class="gridBodyTr gridBodyTr_0 line0 " id="AXGridTarget_AX_tr_0_AX_n_AX_0"><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_0_AX_0" class="bodyTd bodyTd_0 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_1_AX_0" class="bodyTd bodyTd_1 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_2_AX_0" class="bodyTd bodyTd_2 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_3_AX_0" class="bodyTd bodyTd_3 bodyTdr_0  fixedLine"></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_4_AX_0" class="bodyTd bodyTd_4 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_4_AX_0" title="">김기영</div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_5_AX_0" class="bodyTd bodyTd_5 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_5_AX_0" title="">김기영</div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_6_AX_0" class="bodyTd bodyTd_6 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_6_AX_0" title="">2013-01-18</div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_7_AX_0" class="bodyTd bodyTd_7 bodyTdr_0 "><div class="bodyNode bodyTdText" align="right" id="AXGridTarget_AX_bodyText_AX_0_AX_7_AX_0" title="">1,709,401</div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_8_AX_0" class="bodyTd bodyTd_8 bodyTdr_0 "><div class="bodyNode bodyTdText" align="right" id="AXGridTarget_AX_bodyText_AX_0_AX_8_AX_0" title="">10</div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_9_AX_0" class="bodyTd bodyTd_9 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_9_AX_0" title=""><input type="checkbox" name="checkbox" data-editor-key="0,9" style="margin:0px;" class="inline-editor-checkbox" checked="checked" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_10_AX_0" class="bodyTd bodyTd_10 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_10_AX_0" title=""><input type="radio" name="radio" data-editor-key="0,10" style="margin:0px;" class="inline-editor-checkbox" checked="checked" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_nbody_AX_0_AX_11_AX_0" class="bodyTd bodyTd_11 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_11_AX_0" title="">선택</div></td><td style="vertical-align:middle;height:30px;" class="bodyNullTd" id="AXGridTarget_AX_null_AX_0" rowspan="1"><div class="tdRelBlock" id="AXGridTarget_AX_tdRelBlock_AX_0">&nbsp;</div></td></tr><tr class="gridBodyTr gridBodyTr_1 line1 " id="AXGridTarget_AX_tr_0_AX_n_AX_1"><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_0_AX_1" class="bodyTd bodyTd_0 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_1_AX_1" class="bodyTd bodyTd_1 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_2_AX_1" class="bodyTd bodyTd_2 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_3_AX_1" class="bodyTd bodyTd_3 bodyTdr_0  fixedLine"></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_4_AX_1" class="bodyTd bodyTd_4 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_4_AX_1" title="">황인서</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_5_AX_1" class="bodyTd bodyTd_5 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_5_AX_1" title="">김기영</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_6_AX_1" class="bodyTd bodyTd_6 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_6_AX_1" title="">2013-01-18</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_7_AX_1" class="bodyTd bodyTd_7 bodyTdr_0 "><div class="bodyNode bodyTdText" align="right" id="AXGridTarget_AX_bodyText_AX_0_AX_7_AX_1" title="">1,709,401</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_8_AX_1" class="bodyTd bodyTd_8 bodyTdr_0 "><div class="bodyNode bodyTdText" align="right" id="AXGridTarget_AX_bodyText_AX_0_AX_8_AX_1" title="">10</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_9_AX_1" class="bodyTd bodyTd_9 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_9_AX_1" title=""><input type="checkbox" name="checkbox" data-editor-key="1,9" style="margin:0px;" class="inline-editor-checkbox" checked="checked" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_10_AX_1" class="bodyTd bodyTd_10 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_10_AX_1" title=""><input type="radio" name="radio" data-editor-key="1,10" style="margin:0px;" class="inline-editor-checkbox" checked="checked" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_11_AX_1" class="bodyTd bodyTd_11 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_11_AX_1" title="">선택</div></td><td style="vertical-align:middle;" class="bodyNullTd" id="AXGridTarget_AX_null_AX_1" rowspan="1"><div class="tdRelBlock" id="AXGridTarget_AX_tdRelBlock_AX_1">&nbsp;</div></td></tr><tr class="gridBodyTr gridBodyTr_2 line0 " id="AXGridTarget_AX_tr_0_AX_n_AX_2"><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_0_AX_2" class="bodyTd bodyTd_0 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_1_AX_2" class="bodyTd bodyTd_1 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_2_AX_2" class="bodyTd bodyTd_2 bodyTdr_0 "></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_3_AX_2" class="bodyTd bodyTd_3 bodyTdr_0  fixedLine"></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_4_AX_2" class="bodyTd bodyTd_4 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_4_AX_2" title="">김동근</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_5_AX_2" class="bodyTd bodyTd_5 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_5_AX_2" title="">김기영</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_6_AX_2" class="bodyTd bodyTd_6 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_6_AX_2" title="">2013-01-18</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_7_AX_2" class="bodyTd bodyTd_7 bodyTdr_0 "><div class="bodyNode bodyTdText" align="right" id="AXGridTarget_AX_bodyText_AX_0_AX_7_AX_2" title="">1,709,401</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_8_AX_2" class="bodyTd bodyTd_8 bodyTdr_0 "><div class="bodyNode bodyTdText" align="right" id="AXGridTarget_AX_bodyText_AX_0_AX_8_AX_2" title="">10</div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_9_AX_2" class="bodyTd bodyTd_9 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_9_AX_2" title=""><input type="checkbox" name="checkbox" data-editor-key="2,9" style="margin:0px;" class="inline-editor-checkbox" checked="checked" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_10_AX_2" class="bodyTd bodyTd_10 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_10_AX_2" title=""><input type="radio" name="radio" data-editor-key="2,10" style="margin:0px;" class="inline-editor-checkbox" checked="checked" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;" id="AXGridTarget_AX_nbody_AX_0_AX_11_AX_2" class="bodyTd bodyTd_11 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_11_AX_2" title="">선택</div></td><td style="vertical-align:middle;" class="bodyNullTd" id="AXGridTarget_AX_null_AX_2" rowspan="1"><div class="tdRelBlock" id="AXGridTarget_AX_tdRelBlock_AX_2">&nbsp;</div></td></tr></tbody><tbody id="AXGridTarget_AX_tfoot"></tbody><tbody id="AXGridTarget_AX_fpadding"><tr class="tfpadding"><td colspan="13" style="height: 2px;"></td></tr></tbody></table></div><div id="AXGridTarget_AX_fixedScrollContent" class="gridFixedScrollContent" style="width: 400px; top: 0px;"><table cellpadding="0" cellspacing="0" class="gridFixedBodyTable" style="width:400px;"><colgroup><col width="50" style="" id="AXGridTarget_AX_col_AX_0_AX_FB"><col width="50" style="" id="AXGridTarget_AX_col_AX_1_AX_FB"><col width="200" style="" id="AXGridTarget_AX_col_AX_2_AX_FB"><col width="100" style="" id="AXGridTarget_AX_col_AX_3_AX_FB"></colgroup><thead id="AXGridTarget_AX_fixedThead"></thead><tbody id="AXGridTarget_AX_fhpadding"><tr class="thpadding"><td colspan="4" style="height: 0px;"></td></tr></tbody><tbody id="AXGridTarget_AX_fixedTbody"><tr class="gridBodyTr gridBodyTr_0 line0 " id="AXGridTarget_AX_tr_0_AX_fix_AX_0"><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_0_AX_0" class="bodyTd bodyTd_0 bodyTdr_0 "><div class="bodyNode bodyTdText bodyTdCheckBox" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_0_AX_0" title=""><input type="checkbox" name="번호" class="gridCheckBox_body_colSeq0" id="AXGridTarget_AX_checkboxItem_AX_0_AX_0" value="1" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_1_AX_0" class="bodyTd bodyTd_1 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_1_AX_0" title=""></div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_2_AX_0" class="bodyTd bodyTd_2 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_2_AX_0" title="">AXGrid 첫번째 줄 입니다.</div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_3_AX_0" class="bodyTd bodyTd_3 bodyTdr_0  fixedLine"><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_3_AX_0" title="">김기영</div></td></tr><tr class="gridBodyTr gridBodyTr_1 line1 " id="AXGridTarget_AX_tr_0_AX_fix_AX_1"><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_0_AX_1" class="bodyTd bodyTd_0 bodyTdr_0 "><div class="bodyNode bodyTdText bodyTdCheckBox" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_0_AX_1" title=""><input type="checkbox" name="번호" class="gridCheckBox_body_colSeq0" id="AXGridTarget_AX_checkboxItem_AX_0_AX_1" value="2" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_1_AX_1" class="bodyTd bodyTd_1 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_1_AX_1" title=""></div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_2_AX_1" class="bodyTd bodyTd_2 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_2_AX_1" title="">AXGrid 첫번째 줄 입니다.</div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_3_AX_1" class="bodyTd bodyTd_3 bodyTdr_0  fixedLine"><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_3_AX_1" title="">장기영</div></td></tr><tr class="gridBodyTr gridBodyTr_2 line0 " id="AXGridTarget_AX_tr_0_AX_fix_AX_2"><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_0_AX_2" class="bodyTd bodyTd_0 bodyTdr_0 "><div class="bodyNode bodyTdText bodyTdCheckBox" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_0_AX_2" title=""><input type="checkbox" name="번호" class="gridCheckBox_body_colSeq0" id="AXGridTarget_AX_checkboxItem_AX_0_AX_2" value="3" onfocus="this.blur();"></div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_1_AX_2" class="bodyTd bodyTd_1 bodyTdr_0 "><div class="bodyNode bodyTdText" align="center" id="AXGridTarget_AX_bodyText_AX_0_AX_1_AX_2" title=""></div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_2_AX_2" class="bodyTd bodyTd_2 bodyTdr_0 "><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_2_AX_2" title="">AXGrid 첫번째 줄 입니다.</div></td><td valign="middle" style="vertical-align:middle;height:30px;" id="AXGridTarget_AX_fixbody_AX_0_AX_3_AX_2" class="bodyTd bodyTd_3 bodyTdr_0  fixedLine"><div class="bodyNode bodyTdText" align="left" id="AXGridTarget_AX_bodyText_AX_0_AX_3_AX_2" title="">장서우</div></td></tr></tbody><tbody id="AXGridTarget_AX_fixedTfoot"></tbody><tbody id="AXGridTarget_AX_ffpadding"><tr class="tfpadding"><td colspan="4" style="height: 2px;"></td></tr></tbody></table></div><div class="AXGridFoot" id="AXGridTarget_AX_gridFoot"></div></div>		<div class="AXGridToolGroup bottom" id="AXGridTarget_AX_gridToolGroupBottom"></div><div id="AXGridTarget_AX_scrollTrackY" class="gridScrollTrackY" style="top: 31px; height: 224px; display: none;"><div id="AXGridTarget_AX_scrollYHandle" class="gridScrollHandle" style="top: 0px;"></div><div id="AXGridTarget_AX_scrollY_AX_tip" class="gridScroll-tip"><span></span></div></div><div id="AXGridTarget_AX_scrollTrackX" class="gridScrollTrackX" style="display: block; width: 295px;"><div id="AXGridTarget_AX_scrollXHandle" class="gridScrollHandle" style="left: 0px; width: 79.4024px;"></div></div>	</div>   <div class="AXgridEditor" id="AXGridTarget_AX_gridEditor" style="z-index: 2; display: none;"></div>	<div class="AXgridPageBody" id="AXGridTarget_AX_gridPageBody" style="z-index:1;">		<div class="AXgridPagingUnit" id="AXGridTarget_AX_gridPagingUnit" style="display: none;">			<a class="AXgridPagingPrev">PREV</a>			<div class="AXgridPageNumber"><select id="AXGridTarget_AX_gridPageNo" class="AXgridPageNo"><option value="">&nbsp;&nbsp;</option></select></div>			<div class="AXgridPageNumberCount" id="AXGridTarget_AX_gridPageCount">/ ...</div>			<a class="AXgridPagingNext">NEXT</a>		</div>		<div class="AXgridStatus" id="AXGridTarget_AX_gridStatus"><b>3</b> count(s)</div>	</div></div></div>
                <div style="padding:10px;">
                    <input type="button" value="getSelectedItem" class="AXButton" onclick="fnObj.grid.getSelectedItem();">
                    <input type="button" value="추가하기" class="AXButton Red" onclick="fnObj.grid.append();">
                    <input type="button" value="삭제하기" class="AXButton Red" onclick="fnObj.grid.remove();">
                </div>
                <div style="padding:10px;">
                    <input type="button" value="forExcel html with filter" class="AXButton" onclick="fnObj.grid.getExcel('html');">
                </div>

            </div>

            <pre id="pretty" class="prettyprint linenums"></pre>

        </div>
    </div><div style="text-align: center;margin: 20px auto;"><a href="http://axboot.com/" target="_blank" title="AXBOOT Full Stack Framework"><img src="/samples/_img/banner-axboot.png" height="75" alt="AXBOOT Full Stack Framework"></a><a href="http://ax5.io/" target="_blank" title="jQuery &amp; Bootstrap UI Plugins"><img src="/samples/_img/banner-ax5ui.png" height="75" alt="jQuery &amp; Bootstrap UI Plugins"></a></div>

</div>
			


			
			
			
<!-- 							<div style="margin-left:20px"> -->
<!--     <table id="jqGrid"></table> -->
<!--     <div id="jqGridPager"></div> -->
<!-- </div> -->





								

			</section>
			<!-- /.content -->



		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../user/common/user_main_footer.jsp" %>
	</div>
	<!-- ./wrapper -->

</body>

</html>