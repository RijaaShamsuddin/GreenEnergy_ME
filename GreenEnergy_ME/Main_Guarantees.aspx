<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main_Guarantees.aspx.cs" Inherits="GreenEnergy_ME.Main_Guarantees" %>

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

             function SetTarget() {
                 document.forms[0].target = "_blank";
             }

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

         .center {
            text-align:center;
        }

        .whitespace  
        {
            white-space: normal !important;
        }
        .cssTable td 
        {
            text-align: center; 
            vertical-align: middle;
        }

     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
             
     <div class ="row" style="margin-top: 15px">
         <div style="width:80%;margin:auto;">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="true" Font-Size="Medium" CssClass="align-content-center"></asp:Label>
        <table id="Table1" class="Table cssTable" style="width: 100%;">
                <tr>
                    <td colspan = "10" class="rpt_header"><h3>Market Information</h3></td>
                    <td colspan = "2" class="td center">
                        <asp:LinkButton runat="server" ID="AddTB" class="btn btn-mini" OnClick="OnAdd" OnClientClick="return confirm('Do you want to delete this row?');">
                            <i class="fas fa-plus-circle fa-w-15 fa-fw fa-2x"></i>
                        </asp:LinkButton></td>
                </tr>
            <asp:Repeater ID="guaranteeinfo" runat="server">
               <HeaderTemplate>
                   <tr><td class="td" colspan="2">Id</td>
                       <td class="td" colspan="2">Guarantor(s) Name</td>
                       <td class="td" colspan="2">Guarntee Given To</td>
                       <td class="td" colspan="2">Guarntee Amount</td>
                       <td class="td" colspan="2">Edit</td>
                       <td class="td" colspan="2">Delete</td>
                   </tr>
               </HeaderTemplate>
               <ItemTemplate> 
                   <tr>  <asp:Label ID="lblid" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                       <td colspan="2" class="whitespace center">
                       <asp:Label ID="counter" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("guarantor_name") %>&nbsp;</label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("guarantee_given") %>&nbsp;</label></td>
                       <td colspan="2" class="whitespace">
                       <label><%# Eval("amt_guarantee") %>&nbsp;</label></td>
                       <td colspan = "2" class="td center">
                           <asp:LinkButton runat="server" ID="Edit" class="btn btn-mini" OnClick="OnEdit" OnClientClick = "SetTarget();">
                            <i class="fa fa-pencil fa-fw" aria-hidden="true"></i>
                       </asp:LinkButton></td>
                       <td colspan = "2" class="td center">
                           <asp:LinkButton runat="server" ID="Delete" class="btn btn-mini" OnClick="OnDelete">
                            <i class="fa fa-trash-o fa-fw" aria-hidden="true"></i>
                       </asp:LinkButton></td>
                       <%--<td colspan = "2" class="td center"><i class="fa fa-pencil fa-fw"></i></td>
                       <td colspan = "2" class="td center"><i class="fa fa-trash-o fa-fw"></i></td>--%>  
                   </tr>
               </ItemTemplate>
                </asp:Repeater>
                      </table>

             <asp:HiddenField ID="hdfbrwr_type" runat="server" Visible="False" />
     <div class ="row" style="margin-top: 15px;">
          <%--<div class="text-center">
           <asp:Button ID="btnsavedata" CssClass="btn btn-secondary btn-sm" runat="server" Text="Save" OnClick="btnsavedata_Click" style ="width:150px"/>            
            </div>--%>
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
