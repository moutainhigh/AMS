<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="员工表不合规数据维护">
<@CommonQueryMacro.CommonQuery id="EAST_YGB_TMP" init="true" submitMode="current" navigate="false">
<table align="left" width="1000px">
   
   <tr>
		<td colspan="2">
			<@CommonQueryMacro.DataTable id="datatable1"  fieldStr="gh,nbjgh,yxjgdm,jrxkzh,yxjgmc,xm,sfzh,lxdh,wdh,ssbm,zw,ygzt,gwbh,cjrq,errmsg,opr"  width="100%" hasFrame="true"/>
		</td>
	</tr>
      <tr>
      		<td colspan="2">
      		<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      			<div align="center">
      				<@CommonQueryMacro.Group id="group1" label="员工表不合规数据维护"
        			  fieldStr="gh,nbjgh,yxjgdm,jrxkzh,yxjgmc,xm,sfzh,lxdh,wdh,ssbm,zw,ygzt,gwbh,cjrq" colNm=4/>
        			 </br>
      				<@CommonQueryMacro.Button id= "btSave"/>
      			</div>
     		 </@CommonQueryMacro.FloatWindow>
        			
  			</td>
  		</tr>
  		<tr style="display:none">
					<td colspan="2">
						<@CommonQueryMacro.Button id= "btMod"/>&nbsp;&nbsp;
					</td>
		</tr>
	
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	//定位一条记录
	function locate(id) {
		var record = EAST_YGB_TMP_dataset.find(["id"],[id]);
		if (record) {
			EAST_YGB_TMP_dataset.setRecord(record); 
		}
	}
	//刷新
		function datatable1_opr_onRefresh(cell, value, record)
	  {
		if (record) {//当存在记录时
			var id = record.getValue("id");
			if(null != id){
				cell.innerHTML="<center><a href=\"JavaScript:doModify('"+id+"')\">修改</a> ";
			} else {//当不存在记录时
		    cell.innerHTML="&nbsp;";
		    }
		} 
	}
	

//修改
	function doModify(id) {
		locate(id);
		subwindow_signWindow.show();
	}


      function btSave_postSubmit(button)
      {
			button.url="#";
        	//alert("保存成功");
        	subwindow_signWindow.hide();
        	EAST_YGB_TMP_dataset.flushData(EAST_YGB_TMP_dataset.pageIndex);
      }
      
  	
	function signWindow_floatWindow_beforeClose(subwindow){
		EAST_YGB_TMP_dataset.cancelRecord();
		return true;
	}
	function signWindow_floatWindow_beforeHide(subwindow){
		return signWindow_floatWindow_beforeClose(subwindow);
	}
  

</script>
</@CommonQueryMacro.page>