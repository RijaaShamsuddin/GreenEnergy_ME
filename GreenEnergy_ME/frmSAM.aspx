<%@ Page Title="" Language="C#" MasterPageFile="~/CIIRS_MasterPage.master" AutoEventWireup="true" CodeFile="frmSAM.aspx.cs" Inherits="frmSAM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script src="Scripts/ckeditor/ckeditor.js" type="text/javascript"></script>
    
    <style type="text/css">
        .table1 {
         width:100%;
         border:1px solid black;
        }
        .td1 {
        width:5%;
        border:1px solid #f2f2f2;
        }
        .td {
        width:5%;
        }
        
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="width:100%; border:1px solid black; text-align:center;">
        <asp:Label ID="lblcustomername" runat="server" Text="Customer Name :"></asp:Label>
        <asp:Label ID="lblcustomer_name" runat="server" Text=""></asp:Label>
    </div>

    <div  style="width:100%; border:1px solid black; ">
        <table >
            <tr>
                <td  colspan="5" style="color:red; font-weight:bold; font-size: 130%;">Approval Note for :</td>
            </tr>
            <tr>
                <td  colspan="5" class="auto-style1">
                    <asp:CheckBox ID="chkbsettlement" runat="server" Text="Settlement" Font-Bold="true" AutoPostBack="true" OnCheckedChanged="chkbsettlement_CheckedChanged"/></td>
            </tr>
            <tr>
                
                <td   style="text-align:center;">
                    <asp:RadioButton ID="rdbpartial" runat="server" Text="Partial" AutoPostBack="True" Enabled="False" OnCheckedChanged="rdbpartial_CheckedChanged" /></td>
                <td   style="text-align:left;">
                    <asp:RadioButton ID="rdbfullfinal" runat="server" Text="Full And Final" AutoPostBack="True" Enabled="False" OnCheckedChanged="rdbfullfinal_CheckedChanged" /></td>
                </td>
                <td style="width:10%;" ></td>
                <td  class="td1"></td>
                <td  class="td1"></td>
            </tr>

             <tr>
                <td style="width:10%;">
                    <asp:CheckBox ID="ckbChanges_approval" runat="server" Text=" Changes in terms of last approval" AutoPostBack="True" OnCheckedChanged="ckbChanges_approval_CheckedChanged" /></td>
                <td style="width:10%;">
                    <asp:CheckBox ID="ckbLegal_Expense" runat="server" Text=" Legal Expense" AutoPostBack="True" OnCheckedChanged="ckbLegal_Expense_CheckedChanged" /></td>
                <td style="border:1px solid black;"> <asp:CheckBox ID="ckbMarkup" runat="server" text=" Markup/ COF waiver" AutoPostBack="True" OnCheckedChanged="ckbMarkup_CheckedChanged"/></td>
                <td class="td1"></td>
                <td class="td1"></td>
            </tr>
            <td style="width:10%;">
                <asp:CheckBox ID="ckbother" runat="server" Text=" Others (please specify)" AutoPostBack="True" OnCheckedChanged="ckbother_CheckedChanged" />
            </td>
            <td style="width:10%;">
                <asp:TextBox ID="txtbother" runat="server" Visible="false" Width="250px"></asp:TextBox>
                
            </td>
           
        </table>

    </div>
     <div  style="width:100%; border:1px solid black; ">
     <table >
            <tr>
                <td  colspan="5" style="color:red; font-weight:bold; font-size: 130%;">Through:  tick if not applicable</td>
            </tr>
            <tr>
                <td style="width:10%;">
                    <asp:CheckBox ID="CkbAmicable" runat="server" Text="Amicable mode" Font-Bold="true" AutoPostBack="true" OnCheckedChanged="CkbAmicable_CheckedChanged" />
                    <br />
                    <div style="padding-left:10%;">
                        <asp:CheckBox   ID="ckbRestructuring"   runat="server" Text="Restructuring of facilities"   Enabled="False" /><br />
                        <asp:CheckBox   ID="ckbRescheduling"    runat="server" Text="Rescheduling of facilities"    Enabled="False"/><br />
                         <asp:CheckBox  ID="ckbSale"            runat="server" Text="Sale of Security"              Enabled="False" /><br />
                         <asp:CheckBox  ID="ckbCompromise"      runat="server" Text="Compromise Agreement"          Enabled="False"/><br />
                         <asp:CheckBox  ID="ckbConsent"         runat="server" Text="Consent Decree"                Enabled="False" /><br />
                         <asp:CheckBox  ID="ckbSine"            runat="server" text="Sine die Adjournment"          Enabled="False"/><br />
                         <asp:CheckBox  ID="ckbDebt"            runat="server" Text="Debt Swap mode"                Enabled="False" /><br />
                    </div>


                </td>
                <td style="width:10%; vertical-align:top;"> <asp:CheckBox ID="ckbthroughother" runat="server" Text="Others (please specify)"  AutoPostBack="true" OnCheckedChanged="ckbthroughother_CheckedChanged"/>
                    <asp:TextBox ID="txtbthroughother" runat="server" Visible="false" Width="257px"></asp:TextBox>
                </td>
            </tr>
         </table>
     </div>
     <div  style="width:100%; border:1px solid black; ">
     <table >
            <tr>
                <td  colspan="5" style="color:red; font-weight:bold; font-size: 130%;">Brief Summary of Present Requests:</td>
            </tr>
         <tr>
             <td colspan="5">
                 
                     <asp:TextBox ID="txtbBSOPR" runat="server" class="ckeditor" TextMode="MultiLine"></asp:TextBox>
                    
             </td>
         </tr>
     </table>
         </div>

    <div  style="width:100%; border:1px solid black; ">
     <table >
            <tr>
                <td  colspan="5" style="color:red; font-weight:bold; font-size: 130%;">Account Strategy:</td>
            </tr>
         <tr>
             <td>
                 <div style="padding-left:10%;">
                 <asp:CheckBox ID="ckbExisting" runat="server" Text="Existing Level" AutoPostBack="true" OnCheckedChanged="ckbExisting_CheckedChanged" />
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:CheckBox ID="ckbIncrease" runat="server" Text="Increase" AutoPostBack="true" OnCheckedChanged="ckbIncrease_CheckedChanged" />
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:CheckBox ID="ckbReduce" runat="server"  Text="Reduce" AutoPostBack="true" OnCheckedChanged="ckbReduce_CheckedChanged"/>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:CheckBox ID="ckbExit" runat="server" Text="Exit" AutoPostBack="true" OnCheckedChanged="ckbExit_CheckedChanged" />
                 </div>
             </td>
         </tr>
     </table>
    </div>

    <div  style="width:100%; border:1px solid black; ">
     <table >
            <tr>
                <td  colspan="5" style="color:red; font-weight:bold; font-size: 130%;">Customer History:</td>
            </tr>
         <tr>
             <td colspan="5">
                 
                     <asp:TextBox ID="txtbCustomerHistory" runat="server" class="ckeditor" TextMode="MultiLine"></asp:TextBox>
                    
             </td>
         </tr>
     </table>
         </div>



    <div  style="width:100%; border:1px solid black; ">
     <table >
            <tr>
                <td  colspan="5" style="color:red; font-weight:bold; font-size: 130%;">Remarks:</td>
            </tr>
         <tr>
             <td colspan="5">
                 
                     <asp:TextBox ID="txtbremarks" runat="server" class="ckeditor" TextMode="MultiLine"></asp:TextBox>
                    
             </td>
         </tr>
     </table>
         </div>


</asp:Content>

