<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Time_Bound.aspx.cs" Inherits="Time_Bound_Condition.Edit_Time_Bound" %>

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

    <!--<link rel="stylesheet"  href="Styles/ScorecardTables.css" id="Table" runat="server" type="text/css" />-->
    <link rel="stylesheet" href="Styles/Table.css" id="Link1" runat="server" type="text/css" />

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <script src="https://kit.fontawesome.com/10592dee2b.js" crossorigin="anonymous"></script>
    <!--<link href="~/Content/css/sb-admin-2.min.css" rel="stylesheet">-->

    <!-- Bootstrap core CSS -->
    <link href="~/Content/bootstrap.min.css" rel="stylesheet">

    <!-- Date Picker -->
    <link href="plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="js/jquery.min.js"></script>
    <script src="js/jszip.min.js"></script>

<%--    <script type="text/javascript" language="javascript">
        

         $(document).ready(function () {

             $("#<%= tbcdate.ClientID %>").datepicker({
                 changeMonth: true,
                 changeYear: true,
                 format: "mm/dd/yyyy",
                 language: "tr"
             });
         });



    </script>--%>

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
                width:20%;
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
           

     <div class ="row" style="margin-top: 15px;">
         <div style="width:80%;margin:auto;">        

     <%--<div style="padding-left:50px; margin-bottom:5%; width:50%;">--%>
    
        <table style="width: 100%;">
            <tr><td colspan = "8" class="rpt_header" style="text-align:center;"><h3>Time Bound Condition</h3></td></tr>
            </table>
             <asp:Repeater ID="Repeater" runat="server" OnItemCommand="Repeater_ItemCommand">
                <ItemTemplate>
                    <table style="width: 100%;margin-bottom:25px">
                <tr>
                <td class="rpt_header">CLP No</td>
                <td class="rpt_td">
                    <label><%# Eval("cpno") %>&nbsp;</label></td>
                    <%--<asp:Label ID="lblcpno" runat="server" Font-Size="Medium" Visible="true"></asp:Label>--%>
                
                <td class="rpt_header">Client No</td>
                <td class="rpt_td">
                    <label><%# Eval("client_no") %>&nbsp;</label></td>
                    <%--<asp:Label ID="lblclientno" runat="server" Font-Size="Medium" Visible="true"></asp:Label>--%>
                </tr>

                <tr>
                <td class="rpt_header">Date</td>
                <td class="rpt_td">
                    <label><%# Eval("date") %>&nbsp;</label></td>
                    <%--<asp:TextBox ID="tbcdate" runat="server" Width="221px"></asp:TextBox></td>--%>

                <td class="rpt_header">Condition</td>
                <td class="rpt_td">
                    <label><%# Eval("condition") %>&nbsp;</label></td>
                    <%--<textarea id="TextArea1" cols="20" rows="2"></textarea>--%>
                    <%--<asp:TextBox ID="txtcondition" runat="server" Width="221px" TextMode="MultiLine"></asp:TextBox></td>--%>
                </tr>
                <%--<td style="text-align:center;"><i class="fas fa-plus-circle fa-w-15 fa-fw fa-2x"></i></td>--%>
                <tr>
                    <td><asp:Button ID="btnsavedata" CssClass="btn btn-secondary btn-sm" runat="server" Text="Update" style ="width:150px"/></td>           
                </tr>

                </table>
                    </ItemTemplate>
                 </asp:Repeater>
             <br />
                <div class="text-center" style="margin-top: 15px;">
                <asp:Button ID="btnsavedata" CssClass="btn btn-secondary btn-sm" runat="server" Text="Update" style ="width:150px"/>              
                </div>
                <asp:Label ID="lblmsg" runat="server" Font-Bold="true" Font-Size="Medium" CssClass="align-content-center"></asp:Label>
                    <%--<div style="text-align:right;"> <asp:button runat="server" text="Save" ID="btnsaveuser" OnClick="btnsavecond_Click"   /></div>--%>
                    
                
           

            
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

