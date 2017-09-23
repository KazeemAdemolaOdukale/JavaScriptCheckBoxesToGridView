<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="JavaScriptCheckBoxesToGridView.WebForm1" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/app.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-4 col-md-4" style="margin-top:80px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None"
                     CssClass="table table-bordered">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Check All" onclick="HeaderCheckBoxClick(this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" onclick="ChildCheckBoxClick(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JavaScriptCheckBoxDBConnectionString %>" DeleteCommand="DELETE FROM [Staffs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Staffs] ([Gender], [Name]) VALUES (@Gender, @Name)" SelectCommand="SELECT * FROM [Staffs]" UpdateCommand="UPDATE [Staffs] SET [Gender] = @Gender, [Name] = @Name WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            </div>
        </div>
    
    </div>
    </form>
    <script type="text/javascript" language="javascript">
    function HeaderCheckBoxClick(checkbox)
    {
        var gridView = document.getElementById("GridView1");
        for (i = 1; i < gridView.rows.length; i++)
        {
            gridView.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked
                = checkbox.checked;
        }
    }

    function ChildCheckBoxClick(checkbox)
    {
        var atleastOneCheckBoxUnchecked = false;
        var gridView = document.getElementById("GridView1");

        for (i = 1; i < gridView.rows.length; i++)
        {
            if (gridView.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked
                    == false)
            {
                atleastOneCheckBoxUnchecked = true;
                break;
            }
        }

        gridView.rows[0].cells[0].getElementsByTagName("INPUT")[0].checked
            = !atleastOneCheckBoxUnchecked;
    }
    </script>

</body>
</html>
