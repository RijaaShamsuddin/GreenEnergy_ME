<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loan_GreenEnergy_Ind.aspx.cs" Inherits="GreenEnergy_ME.Loan_GreenEnergy_Ind" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>
    <!--<link rel="stylesheet"  href="Styles/ScorecardTables.css" id="Table" runat="server" type="text/css" />-->
    <link rel="stylesheet" href="Styles/Table.css" id="Link1" runat="server" type="text/css" />

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <!--<link href="~/Content/css/sb-admin-2.min.css" rel="stylesheet">-->

    <!-- Bootstrap core CSS -->
    <link href="~/Content/bootstrap.min.css" rel="stylesheet">

    <script src="js/jquery.min.js"></script>


    <!-- Page CSS -->
    <style type="text/css">
        .table td {
            word-wrap: break-word;
            white-space: normal !important;
            padding: 1px 5px;
            vertical-align: text-bottom;

        }

        .Table td, .Table2 td {
            padding: 1px 5px;
            text-align: inherit;
        }

        .italic {
            font-style:italic;
        }

        .Table td center {
            text-align:center;
        }

        .whitespace  
        {
            white-space: normal !important;
        }

        #outer_table {
            /*table-layout: fixed;*/
            padding-right: 30px;
        }

        #outer_table table {
             table-layout: fixed;
        }

        .inarow {
            float: left;
            width:27%;
            padding-right: 40px;
        }
        .auto-style1 {
            height: 22px;
        }
        .headings {
            font-size: large;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">


      <div class="container-fluid" id="container">
          <img src="img/image002_new.jpg" alt="www.bankalfalah.com"  style="width: 136px; height: 25px"/>
            <br />
          <br />
          <div class="whitespace">
              <h6>I/We Hereby apply to avail financing (new/rollover/enhancement) at your branch. Our particulars are provided as below:</h6>
          </div>
          <br />
                <asp:Repeater ID="dir_details" runat="server" OnItemCommand="Repeater_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <table runat="server" id="Table1" class="Table" style="width: 100%; border-collapse: inherit">
                                <tr>
                                    <th colspan="12" class="headings">GREEN ENERGY INDIVIDUAL</th>
                                </tr>
                                 <tr>
                                    <td rowspan="1" colspan="12" class="row_heading headings">1. Personal Details</td></tr>
                                <tr>
                                    <td class="td">Full Name:</td>
                                    <td colspan="6">
                                        <label><%# Eval("Director") %>&nbsp;</label></td>
                                </tr>
                                <tr>                                   
                                    <td class="td">Date of Birth:</td>
                                    <td colspan="6">
                                        <label><%# Eval("DOB") %>&nbsp;</label></td>                                  
                                </tr>
                                <tr>
                                    <td class="td">Phone No:</td>
                                    <td colspan="6">
                                        <label><%# Eval("tel_no") %>&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td class="td">Cell No:</td>
                                    <td colspan="6">
                                        <label><%# Eval("cell_no") %>&nbsp;</label></td>
                                    
                                </tr>
                                <tr>
                                    <td class="td">Email Address:</td>
                                    <td colspan="6">
                                        <label><%# Eval("email") %>&nbsp;</label></td>
                                </tr>
                                <tr>  
                                    <td class="td">Address:</td>
                                    <td colspan="6">
                                        <label><%# Eval("Address") %>&nbsp;</label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

                <asp:Repeater ID="Repeater" runat="server" OnItemCommand="Repeater_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <table runat="server" id="Table2" class="Table" style="width: 100%; border-collapse: inherit">
                                <tr>
                                    <td class="td">Premises</td>
                                    <td colspan="6">
                                        <label><%# Eval("premises") %>&nbsp;</label></td> 
                                </tr>
                                <tr>
                                    <td class="td">Bank Name</td>
                                    <td colspan="6" class="auto-style8">
                                        <label>Bank Alfalah</label></td>
                                </tr>
                                <tr>
                                    <td class="td">Account No.</td>
                                    <td colspan="6">
                                        <label><%# Eval("account_num") %>&nbsp;</label></td>
                                </tr>
                                <tr>
                                    <td class="td">Date of A/C opening</td>
                                    <td colspan="6" class="auto-style8">
                                        <label><%# Eval("accnt_op_date") %>&nbsp;</label></td>
                                    
                                </tr>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

          <br />

          <div class ="row" style="margin-top: 15px;">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
           <table id="Table5" class="Table" style="width: 100%;">
                <tr><td colspan="12" class="row_heading headings">6. Faciliy(ies)</td></tr>
                  <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" OnDataBound="GridView1_DataBound" OnPreRender="GridView1_PreRender" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="Line No."><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Sno") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Facility"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("facility_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FRR"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("FRR") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("fac_status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="O/s" Visible="false"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("outstanding") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approved Limit"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("AppLimit") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Proposed Limit"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ProposedLimit") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Repayment Frequency"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("repayment_freq") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tenor" Visible="false"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Tenor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Security"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("coll_name") + " --- " + Eval("coll_type")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Value"><HeaderStyle CssClass="row_heading whitespace" BorderStyle="Solid"/>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("coll_value") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle CssClass="Footer1" ></FooterStyle>
        </asp:GridView>
        </table>
              
          </div>

          <br />

              <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <table id="Table32" class="Table" style="width: 100%;table-layout: fixed;">
                
                      <tr>
                         <td rowspan="1" colspan="12" class="row_heading headings">
                           10. Net Metering Required</td></tr>
                      <tr>
                          <td colspan="12" class="whitespace">
                             <%=metering%>
                          </td>
                      </tr>
                    </table>
              </div>
           </div>

              <br />

            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <h5 style="font-weight:bold;text-decoration: underline;">Undertaking</h5>
                  
                      <ul class="whitespace">
                          <li>
                              I/We certify and undertake that the information furnished above is true to the best of my knowledge.
                          </li>
                          <li>
                              I/We hereby authorize the bank to obtain information/data regarding my/our Allied Concern's financial
                              and personal details from any credut bureau, agent, financial institution, companies or from any other 
                              sources for the purposes of processing my/our loan application form and to monitor my/our facilities/accounts.
                          </li>
                          <li>
                              I/We agree that the submission of above information and loan application form is not the approval of finance
                              and I shall have no right to clain for finance before any forum, if my request of those finance declined by 
                              bank for any reason.
                          </li>
                          <li>
                              I/We undertake that the loan will be utilized for the same purpose as specified above in the loan.
                          </li>
                          <li>
                              I/We agree that thecost of any electrical or contruction work to be carried out as a preparation to install 
                              solar equipmet shall be borne by us and shall not be a part of financing provided by the bank.
                          </li>
                      </ul>
                  
              </div>
          </div>

              <br />

          <div class ="row" style="margin-top: 15px;">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
              <asp:Button ID="Button2" CssClass="btn btn-secondary btn-sm" runat="server" Text="Next" onClick ="Next" style ="width:150px;"/>
            </div>
            </div>
          <br />
          <br />

      
        </div>

    <!-- Bootstrap core JavaScript -->
    <script src="~/Content/vendor/jquery/jquery.min.js"></script>
    <script src="~/Scripts/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="~/Content/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="~/Scripts/js/sb-admin-2.min.js"></script>
    <script src="~/Content/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- htmlToCanvas script-->
    <script src="Scripts/htmlToCanvas.min.js"></script>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>


    </form>

</body>
</html>

