﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckList.aspx.cs" Inherits="GreenEnergy_ME.CheckList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!--<link rel="stylesheet"  href="Styles/ScorecardTables.css" id="Table" runat="server" type="text/css" />-->
    <link rel="stylesheet" href="Styles/Table.css" id="Link1" runat="server" type="text/css" />

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <!--<link href="~/Content/css/sb-admin-2.min.css" rel="stylesheet">-->

    <!-- Bootstrap core CSS -->
    <link href="~/Content/bootstrap.min.css" rel="stylesheet">

    <!-- Date Picker -->
    <link href="plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />

    

    <script src="js/jquery.min.js"></script>
    <script src="js/jszip.min.js"></script>

    <script type="text/javascript" language="javascript">

             function numeric(evt) {
             var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && ((charCode >= 48 && charCode <= 57) || charCode == 46))
                 return true;
             else {
                 alert('Please Enter Numeric values.');
                 return false;
             }
        }

        $(document).ready(function () {

             $("#vddate").datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd/mm/yyyy",
                language: "tr"
            });
        });


   </script>

    <style type="text/css">
        
          .rpt_table {
             border-collapse:collapse;
             border: 1px solid black;
             width:100%;
             font-family:Arial; 
             font-size:12px;
         }

         .rpt_header {

                background-color:#B30000;
                border: 1px solid black;
                padding:5px;
                text-align:left;
                width:100%;
                color:white;
                
           
         }

         .rpt_td {
             padding:5px;
             border: 1px solid black;
             width: 20%;
             text-align:left;
         }


     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
        
            <h2>
                CheckList
          </h2>        
        

     <div class ="row" style="margin-top: 15px">
         <div style="width:80%;margin:auto;">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="true" Font-Size="Medium" CssClass="align-content-center"></asp:Label>
             <table id="Table5" class="Table" style="width: 100%;">
                <%--<tr><td colspan="12" class="row_heading">Check List of Supporting Documents - For Medium Enterprises</td></tr>--%>
                  <asp:GridView ID="Check_list" Width="100%" runat="server" AutoGenerateColumns="False" ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="Check List of Supporting Documents - For Medium Enterprises"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="lblmasterid" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lbllist" runat="server" Text='<%# Eval("list") %>'></asp:Label>
                            <td>
                                <asp:RadioButton ID="Yes" Text="YES" GroupName="group" runat="server" />
                            </td>
                            <td >
                                <asp:RadioButton ID="No" Text="NO" GroupName="group" runat="server" />
                            </td>
                            <td >
                                <asp:RadioButton ID="NA" Text="N/A" GroupName="group" runat="server" />
                            </td>
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
            <FooterStyle CssClass="Footer1" ></FooterStyle>
        </asp:GridView>
        </table>
        </div>
             <%--<asp:Repeater ID="Check_list" runat="server" OnItemCommand="Repeater_ItemCommand">
                <HeaderTemplate>
                     <table id="Table11" class="Table" style="width: 100%;">
                        <tr>
                            <td  class="row_heading">Check List of Supporting Documents - For Medium Enterprises</td>
                            <td  class="row_heading"></td>
                            <td  class="row_heading"></td>
                            <td  class="row_heading"></td>
                        </tr>
                 </HeaderTemplate>
                    <ItemTemplate> 
                        <table id="Table11" class="Table" style="width: 100%;">
                        <tr><td class="td" colspan="1"><%# Eval("list") %></td>
                            <td >
                                <asp:RadioButton ID="cnic_y" Text="YES" GroupName="cnic" runat="server" />
                            </td>
                            <td >
                                <asp:RadioButton ID="cnic_n" Text="NO" GroupName="cnic" runat="server" />
                            </td>
                            <td >
                                <asp:RadioButton ID="cnic_na" Text="N/A" GroupName="cnic" runat="server" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
             </asp:Repeater>--%>

             <asp:HiddenField ID="hdfbrwr_type" runat="server" Visible="False" />
     <%--<div class ="row" style="margin-top: 15px;">--%>
          <div class="text-center" style="margin-top: 15px;">
            <asp:Button ID="btnsavedata" CssClass="btn btn-secondary btn-sm" runat="server" Text="Save" OnClick="btnsavedata_Click" style ="width:150px"/>              
            <%--</div>--%>
            </div>
          <br />
          <br />
        </div>
         </div>
        </div>

    <!-- daterangepicker -->
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>

    <script src="js/fullcalendar.min.js"></script>
    <!-- https://fullcalendar.io/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    </form>

   
</body>
</html>
